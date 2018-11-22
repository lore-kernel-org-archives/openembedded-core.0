Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00C826B3D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 11:34:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAMBYis8015660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 03:34:45 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 03:34:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2018 19:51:58 +0800
Message-ID: <e1fef41e951d281c3d0f2eb99abbb6a13afff8de.1542887170.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542887170.git.liezhi.yang@windriver.com>
References: <cover.1542887170.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] nopackages.bbclass: improve performance for cleansstate
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
X-List-Received-Date: Thu, 22 Nov 2018 11:34:44 -0000
Content-Type: text/plain

Leave the task in SSTATETASKS doesn't make sense when it is removed, so also
remove it from SSTATETASKS.

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

  Now the package tasks are gone when cleanssate for native recipes, which
  saved 20s or 272s in theory.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/nopackages.bbclass | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f507..66e4936 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,12 +1,23 @@
-deltask do_package
-deltask do_package_write_rpm
-deltask do_package_write_ipk
-deltask do_package_write_deb
-deltask do_package_qa
-deltask do_packagedata
-deltask do_package_setscene
-deltask do_package_write_rpm_setscene
-deltask do_package_write_ipk_setscene
-deltask do_package_write_deb_setscene
-deltask do_package_qa_setscene
-deltask do_packagedata_setscene
+NO_PACKAGES_TASKS = " \
+    do_package \
+    do_package_write_rpm \
+    do_package_write_ipk \
+    do_package_write_deb \
+    do_package_qa \
+    do_packagedata \
+"
+
+python() {
+    sstatetasks = (d.getVar('SSTATETASKS') or '').split()
+    for task in d.getVar('NO_PACKAGES_TASKS').split():
+        setscene_task = '%s_setscene' % task
+        tasks = (task, setscene_task)
+        for t in tasks:
+            bb.build.deltask(t, d)
+
+        if task in sstatetasks:
+            bb.debug(2, 'Removing sstate task %s from SSTATETASKS' % task)
+            sstatetasks.remove(task)
+    d.setVar('SSTATETASKS', ' '.join(sstatetasks))
+
+}
-- 
2.7.4


