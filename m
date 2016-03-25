Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98A45605FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:29:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2P8SxPf007317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 25 Mar 2016 01:28:59 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 25 Mar 2016 01:28:58 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <tudor.florea@enea.com>
Date: Fri, 25 Mar 2016 04:28:54 -0400
Message-ID: <fd0548b7b60220ca68bce43e6c27bfbf26a12c38.1458893281.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458893281.git.dengke.du@windriver.com>
References: <cover.1458893281.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] quilt: run ptest as normal user
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
X-List-Received-Date: Fri, 25 Mar 2016 08:29:13 -0000
Content-Type: text/plain

When the user is root, run quilt ptest, the faildiff.test failed.
Because in the faildiff.test, we drop the read permission of the
file test.txt, we can't "quilt refresh" as normal user, so we got
the following:
	>~ .*diff:test\.txt: Permission denied
	> Diff failed on file 'test.txt', aborting
But when the user is root, we can access the file, so we got the
following:
	> Nothing in patch patchs/test.diff
So the faildiff.test was failed. We should create a normal user
to run the ptest in the run-ptest scripts to slove the problem.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-devtools/quilt/quilt.inc       | 4 +++-
 meta/recipes-devtools/quilt/quilt/run-ptest | 5 ++++-
 meta/recipes-devtools/quilt/quilt/test.sh   | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/quilt/quilt/test.sh

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 837b36b..4e393c4 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -8,6 +8,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://install.patch \
         file://run-ptest \
         file://Makefile \
+	file://test.sh \
 "
 
 SRC_URI[md5sum] = "fc0310db5868a0873d602d4332a76d43"
@@ -50,8 +51,9 @@ do_install_ptest() {
 	tar -cf - bin/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	tar -cf - compat/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	tar -cf - quilt/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
 	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
+	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
 }
 
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
index 958a9df..4b808ae 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -1,5 +1,8 @@
 #!/bin/sh
 
+THIS_SH=/bin/sh
 ln -sf /bin/ed /usr/bin/ed
-for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
+/usr/sbin/adduser --disabled-password quilttest
+su -c "${THIS_SH} ./test.sh" quilttest
+/usr/sbin/deluser quilttest
 rm -f /usr/bin/ed
diff --git a/meta/recipes-devtools/quilt/quilt/test.sh b/meta/recipes-devtools/quilt/quilt/test.sh
new file mode 100755
index 0000000..6563e4a
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/test.sh
@@ -0,0 +1 @@
+for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
-- 
1.9.1


