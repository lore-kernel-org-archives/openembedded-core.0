Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000CDC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:50:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17523.1709794234540088669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 22:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WjE4rx7/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3796ab1ae3=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4276A2Hh013588
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 06:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Sj0yN
	krpIjD+iNOpS9hc6KihBJCXCyYTZIs6wGk8rsQ=; b=WjE4rx7/B72PV6iE+TWry
	oisCHaHXz9csN5aRrz3lVzTdBvV5jcTcM6nmR3oT7+kwK8dUDPr7+a3ym8Fn7bZF
	oVi9KLgMj9YHtdHh3XRn1AHrJlixrgIBO1U7TXi0QQVlU6EhPowcFu3mBYEfmsKf
	qL4z/emmPPAlUGdXhxhFXn5bABr3N8kVf17JmJilC/+OE3nzfUCfWuITirhNNXi9
	4621eZJYlBOL3f6m4YliX0gHmHiUqu08QvFTNKXL0/+cVBzVMuL0zdt9woy1VpTn
	wkH3NKmf6ax+qv1TfAPlbIybFP9M1uL50zyv7U4wGGqjqT2BQuysgmz6ea3cE96b
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36cseh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:50:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 22:50:32 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 22:50:31 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V7] rxvt-unicode: Fix installing of terminfo
Date: Thu, 7 Mar 2024 14:50:30 +0800
Message-ID: <20240307065030.962191-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: B8ywXi0_2pVSOqNmgFeTYb-Zv5JHlgLU
X-Proofpoint-GUID: B8ywXi0_2pVSOqNmgFeTYb-Zv5JHlgLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=833 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196772

From: Changqing Li <changqing.li@windriver.com>

For cross compile, TIC will be native tic in recipe-sysroot-native, and
the terminfo path will be native path, the rxvt-unicode terminfo will be
wrongly installed to native path.

install terminfo to correct path in do_install

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index e7d520ebef..016614b19c 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -6,7 +6,7 @@ terminal emulator rxvt, modified to store text in Unicode \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 HOMEPAGE = "https://rxvt.org/"
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-native"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
@@ -53,6 +53,9 @@ do_install:append () {
 
 	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
 	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
+
+	${STAGING_BINDIR_NATIVE}/tic -x ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo || \
+	${STAGING_BINDIR_NATIVE}/tic ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo
 }
 
-FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
+FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png ${datadir}/terminfo"
-- 
2.25.1


