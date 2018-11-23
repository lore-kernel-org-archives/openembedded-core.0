Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C47636C645
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:20:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN2Kw1j010876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:20:58 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:20:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:37:56 +0800
Message-ID: <2d2bfab3f76f729e2651b5a7f5b5ca670ef763a5.1542940552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542940552.git.liezhi.yang@windriver.com>
References: <cover.1542940552.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] sstate.bbclass: Only remove sstate file when task is existed
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
X-List-Received-Date: Fri, 23 Nov 2018 02:20:57 -0000
Content-Type: text/plain

This can improve the performance a lot for "bitbake <recipe-native/cross/crosssdk>
-ccleansstate" when there are a lot of sstate files.

For example:
* Before
  $ bitbake quilt-native -ccleansstate
  - Check log.do_cleansstate:
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_package.tgz*
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_package_qa.tgz*
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_package_write_rpm.tgz*
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_packagedata.tgz*
  Removing /sstate-cache/*/sstate:quilt-native::0.65:r0::3:*_populate_lic.tgz*
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*

  There are no package tasks for quilt-native, so the first 4 lines doesn't
  make any sense, but the glob pattern "sstate-cache/*/*" is very time
  consuming when there are no disk caches. E.g., I have more than 600,000
  sstate files:
  - Without disk caches
  # echo 3 >/proc/sys/vm/drop_caches
  $ time python3 -c 'import glob; glob.glob("/sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_package.tgz*")'
    real    4m32.583s
    user    0m5.768s
    sys     0m12.892s

  - With disk caches (e.g., run it in the second time)
  $ time python3 -c 'import glob; glob.glob("/sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_package.tgz*")'
    real    0m5.128s
    user    0m2.772s
    sys     0m2.308s

  So the 4 removing *package* commands cost more than 20s or 272s in theory.

* After
  $ bitbake quilt-native -ccleansstate
  - Check log.do_cleansstate:
  Removing /sstate-cache/*/sstate:quilt-native::0.65:r0::3:*_populate_lic.tgz*
  Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*

  We can see that it saved 20s or 272s in theory.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index efb0096..9f059a0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -423,8 +423,9 @@ def sstate_clean_cachefile(ss, d):
     import oe.path
 
     sstatepkgfile = d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + ".tgz*"
-    bb.note("Removing %s" % sstatepkgfile)
-    oe.path.remove(sstatepkgfile)
+    if d.getVarFlag('do_%s' % ss['task'], 'task'):
+        bb.note("Removing %s" % sstatepkgfile)
+        oe.path.remove(sstatepkgfile)
 
 def sstate_clean_cachefiles(d):
     for task in (d.getVar('SSTATETASKS') or "").split():
-- 
2.7.4


