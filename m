Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3703C7702B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:20:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA58KqM3016872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Nov 2015 00:20:53 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 5 Nov 2015 00:20:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Nov 2015 00:20:51 -0800
Message-ID: <88477fa50093b85e65b17c746a637c7259b87018.1446711613.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1446711613.git.liezhi.yang@windriver.com>
References: <cover.1446711613.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc-multilib-config: make aarch64 support multilib
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
X-List-Received-Date: Thu, 05 Nov 2015 08:20:57 -0000
Content-Type: text/plain

Fixed:
MACHINE = qemuarm64
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

$ bitbake core-image-minimal -cpopulate_sdk

WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64

[YOCTO #8638]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 1c0a45a..a0a2ac0 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -29,6 +29,9 @@ python gcc_multilib_setup() {
     bb.utils.remove(build_conf_dir, True)
     ml_globs = ('%s/*/t-linux64' % src_conf_dir,
                 '%s/*/linux64.h' % src_conf_dir,
+                '%s/aarch64/t-aarch64' % src_conf_dir,
+                '%s/aarch64/aarch64.h' % src_conf_dir,
+                '%s/aarch64/aarch64-cores.def' % src_conf_dir,
                 '%s/*/linux.h' % src_conf_dir,
                 '%s/linux.h' % src_conf_dir)
 
@@ -130,6 +133,8 @@ python gcc_multilib_setup() {
         'mips64'    : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
+        'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
+        'arm'       : ['gcc/config/aarch64/t-aarch64'],
     }
 
     gcc_header_config_files = {
@@ -140,6 +145,8 @@ python gcc_multilib_setup() {
         'mips64'    : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
+        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
+        'arm'       : ['gcc/config/aarch64/aarch64.h'],
     }
 
     libdir32 = 'SYSTEMLIBS_DIR'
-- 
1.7.9.5


