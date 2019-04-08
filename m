Return-Path: <prvs=5001fba815=alejandro.delcastillo@ni.com>
X-Greylist: delayed 7248 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Apr 2019 19:02:42 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 552CD7D53B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 19:02:42 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x38H1C6L011503 for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2019 12:01:55 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2rr81ygfwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 12:01:54 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x38H1s88021890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2019 12:01:54 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 8 Apr 2019 12:01:53 -0500
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Mon, 8 Apr 2019 12:01:53 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Apr 2019 12:01:52 -0500
Message-ID: <20190408170152.13583-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-08_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] opkg: add ptest
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
X-List-Received-Date: Mon, 08 Apr 2019 19:02:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ....py-resolve-paths-before-comparision.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg/run-ptest     |  3 ++
 meta/recipes-devtools/opkg/opkg_0.4.0.bb      | 15 ++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/run-ptest

diff --git a/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
new file mode 100644
index 0000000000..75ecb5fb42
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
@@ -0,0 +1,31 @@
+From 5f005830eea7d03c02107a3a3fc58907b0a037bf Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Mon, 8 Apr 2019 11:14:56 -0500
+Subject: [PATCH] regress/issue72.py: resolve paths before comparision
+
+In systems that have a volatile /tmp, the test incorrectly fails since
+it doesn't resolve the real path in all cases.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+Upstream-Status: Submitted
+
+ tests/regress/issue72.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/regress/issue72.py b/tests/regress/issue72.py
+index 1626877..2f24dec 100755
+--- a/tests/regress/issue72.py
++++ b/tests/regress/issue72.py
+@@ -56,7 +56,7 @@ if not os.path.lexists("{}/{}".format(cfg.offline_root, long_filename2)):
+ 				"not created.")
+ 
+ linky = os.path.realpath("{}/{}".format(cfg.offline_root, long_filename2))
+-linky_dst = "{}/{}".format(cfg.offline_root, long_filename)
++linky_dst = os.path.realpath("{}/{}".format(cfg.offline_root, long_filename))
+ if linky != linky_dst:
+ 	opk.fail("symlink path truncated.")
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devtools/opkg/opkg/run-ptest
new file mode 100644
index 0000000000..23189c976f
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make run-tests
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
index a2329d3e71..9bb37d9e09 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
@@ -15,12 +15,15 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0001-libopkg-add-add-ignore-recommends-option.patch \
+           file://0001-regress-issue72.py-resolve-paths-before-comparision.patch \
+           file://run-ptest \
 "
 
+
 SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
 SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd ptest
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
@@ -37,6 +40,15 @@ PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
 EXTRA_OECONF_class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}
+	install -m 755 ${WORKDIR}/run-ptest ${D}/${PTEST_PATH}/run-ptest
+	install -m 755 ${B}/Makefile ${D}${PTEST_PATH}/Makefile
+	sed -i -e 's,^Makefile:,_Makefile:,' ${D}/${PTEST_PATH}/Makefile
+	cp -r ${S}/tests ${D}${PTEST_PATH}
+	sed -i -e 's,^opkgcl = os.path.realpath("../src/opkg"),opkgcl="${bindir}/opkg",' ${D}/${PTEST_PATH}/tests/cfg.py
+}
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
@@ -49,6 +61,7 @@ do_install_append () {
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
+RDEPENDS_${PN}-ptest += "make binutils python3-core python3-compression"
 RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS_${PN} = "opkg-collateral"
 RPROVIDES_${PN} = "opkg-collateral"
-- 
2.20.1


