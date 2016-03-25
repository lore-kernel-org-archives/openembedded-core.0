Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E4D6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:18:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2P2Ipib031271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 19:18:51 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Mar 2016 19:18:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2016 10:19:10 +0800
Message-ID: <d145ba21d26a3836940b8b3a3ab2ffa835b1c4e2.1458872261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458872261.git.Qi.Chen@windriver.com>
References: <cover.1458872261.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libgcc: ensure gnueabi suffix is added when necessary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Mar 2016 02:18:58 -0000
Content-Type: text/plain

The '32' symlink in aarch64 multilib is broken. An example configuration to
reproduce the bug is as follows.

MACHINE = qemuarm64
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

Build and install SDK, then we would find the following symlink is broken.

  ./sysroots/aarch64-poky-linux/usr/lib64/aarch64-poky-linux/5.3.0/32

The patch fixes the above problem.

[YOCTO #8642]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 30a0dbb..7bbdb18 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -111,9 +111,18 @@ fakeroot python do_multilib_install() {
         if not tune_bitness:
             tune_bitness = '32' # /lib => 32bit lib
 
+        suffix = ""
+        localdata = bb.data.createCopy(d)
+        override = ":virtclass-multilib-" + ml
+        localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+        bb.data.update_data(localdata)
+        tarch = localdata.getVar('TARGET_ARCH', True)
+        if tarch == "arm" or tarch == "armeb":
+            suffix = "-gnueabi"
+
         src = '../../../' + tune_baselib + '/' + \
             tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
-            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
+            '-' + d.getVar('TARGET_OS', True) + suffix + '/' + binv + '/'
 
         dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
             d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
-- 
1.9.1


