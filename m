Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C856C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:41:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18436.1702546864682813899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lNq/yLpY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07120609ca=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE9R7Md009789
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4I+7u
	xi+f/PG0g+KQJMcil/5f57t4J0Fk41EriNZP2I=; b=lNq/yLpY2OsuivoFvxt0c
	LJkLSfe/YRNwmeVUe8B4IdzmVC+AqGOIINDmzu4OXZ5UvQQmK7On8FJHHNwbJxMf
	gcmPeMFulKyQLQVBI3Z1QtiRP7RlFUOB0ssAU1iGh0XyCIO3yRRE7DLfcKH74JSt
	pjUPl22it3slbcSZdgTFadFDSD5BfQeNbdZB+Lhjod9VZ6LV1Cop+OPI8kVs8WGp
	8NUYHEi73fmch76Ipc47D72uBS84p/Tar6y0sawpOiBupazzcrA6DzFMMAWo1dFt
	gh9H3rXc+dGJv3b+LbJHfpkQmPfVzM8GGLJbX+hICjeoQI5lYCQE25iiogxKGKsa
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqr9e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:41:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 01:41:07 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 01:41:07 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] rxvt-unicode: set correct outdir for tic
Date: Thu, 14 Dec 2023 17:41:01 +0800
Message-ID: <20231214094101.3010549-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XFt0dnSgwXrb_TK-U5e_ETM0YcjTxxeq
X-Proofpoint-GUID: XFt0dnSgwXrb_TK-U5e_ETM0YcjTxxeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=818 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192340

From: Changqing Li <changqing.li@windriver.com>

tic is from ncurses-native, and set TERMINFO as
${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
rxvt-unicode terminfo will be wrongly installed in there.  set the
outdir explicitly to install them to correct dir.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             |  5 +--
 .../0001-Makefile.in-set-outdir-for-tic.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index e7d520ebef..2f01f54305 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,7 +11,8 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+	   file://0001-Makefile.in-set-outdir-for-tic.patch "
 
 inherit autotools pkgconfig update-alternatives
 
@@ -55,4 +56,4 @@ do_install:append () {
 	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
 }
 
-FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
+FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png ${datadir}/terminfo"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set-outdir-for-tic.patch
new file mode 100644
index 0000000000..7ba0e668dc
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


