Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5240E668A8
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:14:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.65833.1732450444010927627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105836f25f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOC4Cem015355;
	Sun, 24 Nov 2024 12:14:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43361890hq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 24 Nov 2024 12:14:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 24 Nov 2024 04:13:59 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 24 Nov 2024 04:13:59 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v3 1/1] bootchart2: Several fixes
Date: Sun, 24 Nov 2024 04:13:58 -0800
Message-ID: <7fd91720745c24009cef54139d6f69e330230719.1732450236.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1732450236.git.liezhi.yang@windriver.com>
References: <cover.1732450236.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZInVB2sv22ZeXh1KsnOZJ0uzDU0BOVFI
X-Proofpoint-GUID: ZInVB2sv22ZeXh1KsnOZJ0uzDU0BOVFI
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=67431888 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=yMHSDizd4NqxNeh2qG0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-24_10,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411240107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207695

From: Robert Yang <liezhi.yang@windriver.com>

Fixed Ross' comments:
* Add -n to gzip to make the resulting files reproducible, so we don't need to
  decompress them.

* Makefile: Let bootchartd.conf use EARLY_PREFIX, so that bootchartd.conf can
  install to correct location.

* Set MANDIR and DOCDIR to make the files install to correct location for
  bootchart2-native.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...efile-Let-bootchartd.conf-use-EARLY_.patch | 30 +++++++++++++++
 .../0002-Makefile-Add-n-to-gzip.patch         | 37 +++++++++++++++++++
 .../bootchart2/bootchart2_0.14.9.bb           | 12 ++++--
 3 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0002-Makefile-Add-n-to-gzip.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch
new file mode 100644
index 0000000000..8209a776ba
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch
@@ -0,0 +1,30 @@
+From 0ba0986f1ebc5ac1ad0a3d51e8039dbdccb31c25 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Nov 2024 07:33:56 +0000
+Subject: [PATCH 1/2] Makefile: Let bootchartd.conf use EARLY_PREFIX
+
+So that bootchartd.conf can install to correct location when cross build.
+
+Upstream-Status: Submitted [https://github.com/xrmx/bootchart/pull/105]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b99b141..99a3ec7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -100,7 +100,7 @@ install-chroot:
+ 
+ install-collector: all install-chroot
+ 	install -m 755 -D bootchartd $(DESTDIR)$(EARLY_PREFIX)/sbin/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX)
+-	install -m 644 -D bootchartd.conf $(DESTDIR)/etc/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).conf
++	install -m 644 -D bootchartd.conf $(DESTDIR)$(EARLY_PREFIX)/etc/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).conf
+ 	install -m 755 -D bootchart-collector $(DESTDIR)$(PKGLIBDIR)/$(PROGRAM_PREFIX)bootchart$(PROGRAM_SUFFIX)-collector
+ 
+ install-docs:
+-- 
+2.44.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0002-Makefile-Add-n-to-gzip.patch b/meta/recipes-devtools/bootchart2/bootchart2/0002-Makefile-Add-n-to-gzip.patch
new file mode 100644
index 0000000000..baa338759b
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0002-Makefile-Add-n-to-gzip.patch
@@ -0,0 +1,37 @@
+From aec8c971e09a28a5f8cd655ccd2f0cf1b057d756 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Nov 2024 07:35:11 +0000
+Subject: [PATCH 2/2] Makefile: Add -n to gzip
+
+To make the resulting files reproducible.
+
+-n --no-name
+    When compressing, do not save the original file name and timestamp by default.
+
+Upstream-Status: Submitted [https://github.com/xrmx/bootchart/pull/106]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 99a3ec7..87de486 100644
+--- a/Makefile
++++ b/Makefile
+@@ -107,9 +107,9 @@ install-docs:
+ 	install -m 644 -D README $(DESTDIR)$(DOCDIR)/README
+ 	install -m 644 -D README.pybootchart $(DESTDIR)$(DOCDIR)/README.pybootchart
+ 	mkdir -p $(DESTDIR)$(MANDIR)
+-	gzip -c bootchart2.1 > $(DESTDIR)$(MANDIR)/bootchart2.1.gz
+-	gzip -c bootchartd.1 > $(DESTDIR)$(MANDIR)/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).1.gz
+-	gzip -c pybootchartgui.1 > $(DESTDIR)$(MANDIR)/pybootchartgui.1.gz
++	gzip -n -c bootchart2.1 > $(DESTDIR)$(MANDIR)/bootchart2.1.gz
++	gzip -n -c bootchartd.1 > $(DESTDIR)$(MANDIR)/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).1.gz
++	gzip -n -c pybootchartgui.1 > $(DESTDIR)$(MANDIR)/pybootchartgui.1.gz
+ 
+ install-service:
+ 	mkdir -p $(DESTDIR)$(SYSTEMD_UNIT_DIR)
+-- 
+2.44.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 8a211366bf..06625d099e 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -94,6 +94,8 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
            file://0001-Do-not-include-linux-fs.h.patch \
+           file://0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch \
+           file://0002-Makefile-Add-n-to-gzip.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -129,18 +131,22 @@ do_install () {
     export DESTDIR="${D}"
     export LIBDIR="/${baselib}"
     export EARLY_PREFIX="${root_prefix}"
+    export MANDIR="${mandir}/man1"
+    export DOCDIR="${docdir}"
 
     oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${UNPACKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        mv ${D}${EARLY_PREFIX}${sysconfdir}/bootchartd.conf ${D}${sysconfdir}/bootchartd.conf
+        rmdir ${D}${EARLY_PREFIX}${sysconfdir}
+    fi
+
     echo 'EXIT_PROC="$EXIT_PROC matchbox-window-manager"' >> ${D}${sysconfdir}/bootchartd.conf
 
    # Use python 3 instead of python 2
    sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/pybootchartgui
-
-    # The timestamps embedded in compressed man pages is not reproducible
-    gzip -d ${D}${mandir}/man1/*.gz
 }
 
 PACKAGES =+ "pybootchartgui"
-- 
2.44.1


