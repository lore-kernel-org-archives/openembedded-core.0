Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFE4D65C57
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 08:25:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33171.1731572722771146336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 00:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1048b8e1cd=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6o0bw030582;
	Thu, 14 Nov 2024 00:25:19 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppbgd3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 Nov 2024 00:25:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 00:25:18 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 00:25:18 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v2 1/1] bootchart2: Several fixes
Date: Thu, 14 Nov 2024 00:25:17 -0800
Message-ID: <cfbc483721d4dc7cd442e8cbc344b0c05160cad8.1731571498.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1731571498.git.liezhi.yang@windriver.com>
References: <cover.1731571498.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KX3cOwMMXP38Z0qeuHBA-btqprawS-UM
X-Proofpoint-GUID: KX3cOwMMXP38Z0qeuHBA-btqprawS-UM
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6735b3ee cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=yMHSDizd4NqxNeh2qG0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411140063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 08:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207144

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
 .../bootchart2/bootchart2_0.14.9.bb           |  7 ++--
 3 files changed, 71 insertions(+), 3 deletions(-)
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
index 8a211366bf..ce030cec98 100644
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
@@ -129,6 +131,8 @@ do_install () {
     export DESTDIR="${D}"
     export LIBDIR="/${baselib}"
     export EARLY_PREFIX="${root_prefix}"
+    export MANDIR="${mandir}/man1"
+    export DOCDIR="${docdir}"
 
     oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
@@ -138,9 +142,6 @@ do_install () {
 
    # Use python 3 instead of python 2
    sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/pybootchartgui
-
-    # The timestamps embedded in compressed man pages is not reproducible
-    gzip -d ${D}${mandir}/man1/*.gz
 }
 
 PACKAGES =+ "pybootchartgui"
-- 
2.25.1


