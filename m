Return-Path: <prvs=50038b4f16=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5B89E7D797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 20:54:36 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3AKkEs1011280 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:54:37 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2rs5ph3kqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:54:37 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x3AKsaGv027791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:54:36 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 10 Apr 2019 15:54:36 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 10 Apr 2019 15:54:36 -0500
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 10 Apr 2019 15:54:36 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2019 15:54:23 -0500
Message-ID: <20190410205423.27558-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAJTo0Lb=jVx++oA6GAdF3-ARSkZb=grkZ8r3Urx-a9btTBvK=g@mail.gmail.com>
References: <CAJTo0Lb=jVx++oA6GAdF3-ARSkZb=grkZ8r3Urx-a9btTBvK=g@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-10_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v2] opkg: add ptest
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
X-List-Received-Date: Wed, 10 Apr 2019 20:54:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Install opkg test suite and run it as ptest.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...dd-target-for-testsuite-installation.patch | 43 +++++++++++++++++++
 ....py-resolve-paths-before-comparision.patch | 31 +++++++++++++
 meta/recipes-devtools/opkg/opkg/run-ptest     |  5 +++
 meta/recipes-devtools/opkg/opkg_0.4.0.bb      |  6 ++-
 4 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/run-ptest

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
new file mode 100644
index 0000000000..951c186767
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
@@ -0,0 +1,43 @@
+From 8fb0364bd0e19f35c20616dd1ab10aa00e08fa8f Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Wed, 10 Apr 2019 14:49:43 -0500
+Subject: [PATCH] opkg: add target for testsuite installation
+
+- Add target to install testsuite
+- Add override of opkg binary used during test via OPKG_PATH environment
+variable.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+Upstream-Status: Submitted
+
+ Makefile.am  | 5 +++++
+ tests/cfg.py | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 90cfcae..1f6a784 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,3 +18,8 @@ run-tests:
+ 	$(MAKE) -C tests DATADIR=@datadir@ SYSCONFDIR=@sysconfdir@ VARDIR=@localstatedir@
+ 
+ check: run-tests
++
++install-ptest:
++	cp -r $(srcdir)/tests $(DESTDIR)
++	cp Makefile $(DESTDIR)
++	sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
+diff --git a/tests/cfg.py b/tests/cfg.py
+index 4efaff6..ca59d03 100644
+--- a/tests/cfg.py
++++ b/tests/cfg.py
+@@ -2,4 +2,4 @@ import os
+ 
+ opkdir = "/tmp/opk"
+ offline_root = "/tmp/opkg"
+-opkgcl = os.path.realpath("../src/opkg")
++opkgcl = os.getenv('OPKG_PATH', os.path.realpath("../src/opkg"))
+-- 
+2.20.1
+
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
index 0000000000..5fb7077eec
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+OPKG_PATH=$(which opkg)
+
+make OPKG_PATH=$OPKG_PATH run-tests
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
index a2329d3e71..20c2e0b72a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
@@ -15,12 +15,15 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0001-libopkg-add-add-ignore-recommends-option.patch \
+           file://0001-regress-issue72.py-resolve-paths-before-comparision.patch \
+           file://0001-opkg-add-target-for-testsuite-installation.patch \
+           file://run-ptest \
 "
 
 SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
 SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd ptest
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
@@ -49,6 +52,7 @@ do_install_append () {
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
+RDEPENDS_${PN}-ptest += "make binutils python3-core python3-compression"
 RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS_${PN} = "opkg-collateral"
 RPROVIDES_${PN} = "opkg-collateral"
-- 
2.20.1


