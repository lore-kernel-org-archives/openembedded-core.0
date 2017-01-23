Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 653F471A0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 03:48:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0N3mAn2005297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 19:48:11 -0800 (PST)
Received: from pek-yhuang1-d1.wrs.com (128.224.162.157) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Sun, 22 Jan 2017 19:48:10 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jan 2017 11:48:08 +0800
Message-ID: <20170123034808.6311-1-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 1/1] libgcc-common.inc: Fix symbol link to mutilib directories
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
X-List-Received-Date: Mon, 23 Jan 2017 03:48:11 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

The multilib symbol links are created for gcc to locate libgcc files.
Its source path contains TARGET_SYS of multilib libgcc. However, a
multilib's TARGET_SYS is not generated correctly all the time now.
For example,

  MACHINE = "qemumips64"
  DEFAULTTUNE = "mips64-n32"
  MULTILIBS = "multilib:lib64"
  DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

In N32 libgcc, the symbol link for N64 is created as:

  64 -> ../../../lib64/mips64-wrsmllib64-linux-gnun32/5.2.0/

while it should be:

  64 -> ../../../lib64/mips64-wrsmllib64-linux/5.2.0/

This issue sometimes won't break compiler, since gcc also searches paths
calculated with OS multilib directories beside multilib directories .

This patch resolve the problem by reading TARGET_SYS from a localdata
environment with proper multilib overrides.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index a8a3f0d..69eeb26 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -106,20 +106,19 @@ fakeroot python do_multilib_install() {
             bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
             continue
 
-        tune_arch = tune_parameters['arch']
         tune_bitness = tune_baselib.replace('lib', '')
         if not tune_bitness:
             tune_bitness = '32' # /lib => 32bit lib
 
-        tune_abiextension = tune_parameters['abiextension']
-        if tune_abiextension:
-            libcextension = '-gnu' + tune_abiextension
-        else:
-            libcextension = ''
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + ml
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", ml + "-")
+        bb.data.update_data(localdata)
+        ml_target_sys = localdata.getVar('TARGET_SYS', True) or ''
 
         src = '../../../' + tune_baselib + '/' + \
-            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
-            '-' + d.getVar('TARGET_OS', True) + libcextension +  '/' + binv + '/'
+            ml_target_sys + '/' + binv + '/'
 
         dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
             d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
-- 
2.9.3


