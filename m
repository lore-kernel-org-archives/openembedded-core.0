Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9903EC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 08:43:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16339.1707295424737390378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 00:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KrI2F4z5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2767a3df65=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4176eQVe004855
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 00:43:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=2uo4Q
	Lae1rBw+telXc2eOR2UMtl8lfR7wLWYNrXkQN4=; b=KrI2F4z5+Brw6YXeOeTiN
	8g2Gj+cH58GL9wprGlO/wf23H3Gq530QyYCElQj1GGGGkv0sXkuTcCCJcZX7fpjY
	Bomi9t9BfQ2k7bKYWixGTZ+GTFyA+bGyDTeU431FxdkcA273Y7jqkjprKk9lvuSJ
	VoA0YzAt/A96Q1YSlqZZTV8bhjpzXWbGu1zUee0UwtAMNV8QD2YDAxM7wYC+tM/S
	Ur5ak+kE3swzl1n61cWmFSRRBk4I8zj4Ybf7ykwzSs4mHTo8lzmNziyvy0qMFSPe
	BnMG+JWei8my6Wl/SNUKvlMjOV5fYN/s1xp0dewgiLlAG/dX05mX0EB3TR3ZDTvL
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm3gpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 00:43:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 00:43:43 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 00:43:42 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V5] rxvt-unicode: install terminfo on target env
Date: Wed, 7 Feb 2024 16:43:41 +0800
Message-ID: <20240207084341.2196110-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 74qSWZGiM9QddlJaFRp3u9NB2_6IB1HL
X-Proofpoint-ORIG-GUID: 74qSWZGiM9QddlJaFRp3u9NB2_6IB1HL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=714 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195044

From: Changqing Li <changqing.li@windriver.com>

For cross compile, TIC will be native tic in recipe-sysroot-native, and
the terminfo path will be native path, the rxvt-unicode terminfo will be
installed to native path.

disable the terminfo installation by setting TIC to :, and install
terminfo on target env to make sure ncurses on target env use the
correct terminfo

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             | 16 +++++++-
 ...ble-the-terminfo-installation-by-set.patch | 37 +++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index e7d520ebef..988e8c7404 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,7 +11,9 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+	   file://0001-Makefile.in-disable-the-terminfo-installation-by-set.patch \
+"
 
 inherit autotools pkgconfig update-alternatives
 
@@ -53,6 +55,18 @@ do_install:append () {
 
 	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
 	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
+
+	install -d ${D}/${sysconfdir}
+	install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysconfdir}/rxvt-unicode.terminfo
+}
+
+RDEPENDS:${PN} = "ncurses-tools"
+
+pkg_postinst_ontarget:${PN} () {
+	if test -x ${bindir}/tic
+	then
+		${bindir}/tic -x ${sysconfdir}/rxvt-unicode.terminfo
+	fi
 }
 
 FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
new file mode 100644
index 0000000000..6bdbedb3c4
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-disable-the-terminfo-installation-by-set.patch
@@ -0,0 +1,37 @@
+From ff5c75995485ee9c5331e52bb9bf3aa5db6d8837 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 7 Feb 2024 10:35:23 +0800
+Subject: [PATCH] Makefile.in: disable the terminfo installation by setting TIC
+ to :
+
+For cross compile, TIC will be native tic in recipe-sysroot-native, and
+the terminfo path will be native path, the rxvt-unicode terminfo will be
+installed to native path.
+
+disable the terminfo installation by setting TIC to :
+
+Upstream-Status: Inappropriate [ oe specific ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index e3d1fe8..1961c93 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -100,8 +100,8 @@ install: all
+ 	$(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
+ 	$(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
+ 	$(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
+-	@TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
+-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
++	: -x $(srcdir)/etc/rxvt-unicode.terminfo || \
++           : $(srcdir)/etc/rxvt-unicode.terminfo
+ 
+ distdepend: alldoc
+ 
+-- 
+2.25.1
+
-- 
2.25.1


