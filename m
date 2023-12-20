Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1412BC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 08:36:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17644.1703061398980969959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 00:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jr0/lVeG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07181c88e8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BK6LLvd009322
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 00:36:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=DaRPz
	OJrYQNXKDCCuqmOOfmVq7wnzxz0WvGRnt6Iz48=; b=Jr0/lVeG4OsY8S3QysFib
	0RbR9cZvd+LMvtqAZuZzOS38TWivYWU8qKU20QwW/CXTS8J0QC7PwG9XqoL2o4zY
	tA8ug9riPMZceO6470lju7LnCSkFl116SUw4lWA4LPJqeCq8qK5ODTgILudnehg1
	szYAamjXdy8HRK0aXSFaKl85n0SvW1AdmLvaGWMT7GDm6D4EyPJwApEi3+Had5Df
	tctbfBdmupP4bZnCgMhThF1JOzONcpdwRu74kcdmYO7PkvTJWwQDn7Hm9X9ixuCT
	41BedIZyaiHzxmKisrWzZLZd1zN8AY/xsITk+W9KjZbhuTuW5eivrsEGnwzJo1ub
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824m0gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 00:36:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 00:36:44 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 00:36:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] rxvt-unicode: set correct outdir for tic
Date: Wed, 20 Dec 2023 16:36:36 +0800
Message-ID: <20231220083636.3866994-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Va8i89G8ahGe5s09Jq_7ma-siMSF2Kfo
X-Proofpoint-GUID: Va8i89G8ahGe5s09Jq_7ma-siMSF2Kfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 08:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192784

From: Changqing Li <changqing.li@windriver.com>

* tic is from ncurses-native, and set TERMINFO as
${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
rxvt-unicode terminfo will be wrongly installed in there.  set the
outdir explicitly to install them to correct dir.

* Add ncurses-native as DEPENDS to fix reproducible build issue

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             |  9 ++--
 ...ile.in-set-outdir-for-TIC-explicitly.patch | 44 +++++++++++++++++++
 .../0001-Makefile.in-set-outdir-for-tic.patch | 35 +++++++++++++++
 3 files changed, 84 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index e7d520ebef..b8ef0d75e5 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -6,13 +6,14 @@ terminal emulator rxvt, modified to store text in Unicode \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 HOMEPAGE = "https://rxvt.org/"
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-native"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
-
+	   file://rxvt.png \
+	   file://0001-Makefile.in-set-outdir-for-TIC-explicitly.patch \
+"
 inherit autotools pkgconfig update-alternatives
 
 PROVIDES = "virtual/x-terminal-emulator"
@@ -55,4 +56,4 @@ do_install:append () {
 	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
 }
 
-FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
+FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png ${datadir}/terminfo"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
new file mode 100644
index 0000000000..6c582d288e
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
@@ -0,0 +1,44 @@
+From c88c94e629b6aad1609d13f355c52e5a3acc8d2a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 14 Dec 2023 17:33:15 +0800
+Subject: [PATCH] Makefile.in: set outdir for TIC explicitly
+
+When doing cross-compile, native tic's TERMINFO usually
+set as a native dir, which could not the target install dir,
+which will cause rxvt-unicode terminfo will be wrongly installed.
+set the outdir explicitly to install them to correct dir.
+
+Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull/4 ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index e3d1fe8b..3477551a 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -69,7 +69,7 @@ all:
+ 	sed $(SEDREPLACE) <$< | podselect -section "RXVT-UNICODE\/URXVT FREQUENTLY ASKED QUESTIONS" | pod2text >$@
+ 
+ $(srcdir)/etc/rxvt-unicode.termcap: $(srcdir)/etc/rxvt-unicode.terminfo
+-	tic -C $< >$@
++	@TIC@ -C $< >$@
+ 
+ tags allbin:
+ 
+@@ -100,8 +100,8 @@ install: all
+ 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
+ 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
+-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
+-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo || \
++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o -o $(DESTDIR)$(datadir)/terminfo
+ 
+ distdepend: alldoc
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
new file mode 100644
index 0000000000..8fd782b503
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
@@ -0,0 +1,35 @@
+From 1b7d547453fc57806ef86f64c86706530a23e62e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 13 Dec 2023 11:53:18 +0800
+Subject: [PATCH] Makefile.in: set outdir for tic
+
+tic is from ncurses-native, and set TERMINFO as
+${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
+rxvt-unicode terminfo will be wrongly installed in there.  set the
+outdir explicitly to install them to correct dir.
+
+Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull/4 ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index e3d1fe8..1de56d3 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -100,8 +100,8 @@ install: all
+ 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
+ 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
+-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
+-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo || \
++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo
+ 
+ distdepend: alldoc
+ 
+-- 
+2.25.1
+
-- 
2.25.1


