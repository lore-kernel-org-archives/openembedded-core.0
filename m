Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005CFCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:29:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.24420.1761697765508964630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OLQH3S+V;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BcHTx8bm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJleGp2610318
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NV/KuyBxwGH6F3oD1rpGO8tWAeDp2BgtEUO
	kYRc3xaw=; b=OLQH3S+VuzYReLvQleIySTONnLBld2QB1SRMf2N6+qFXfwSrBc9
	1TdPhxVeFEf/d7LdZY2vtTionQR9GpDxD/3ObLE/pu2u3q3AUT3wl+00fO9smAxg
	UQMkE/KaCMmaO6AnefLs9qgswM0CzWIOh418/8S31Im/NUrs3vr7CqsPVAHyhIij
	C+YtAUkizblon1I8WscpGl45xRjL80fwtK0SdzhzwFZ518A9W2hr2dQFiedUKfSB
	FtRW0QNKjxwPLYwxAB0FSSokojXWkJsARGpmtENx78YwkT3L8Q5NtVvbXPaXpzkg
	NjN9N38V2H/oL4m3KhkhejEjEzUkjFytTpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a00nu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf2adbd3bso24079561cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697763; x=1762302563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NV/KuyBxwGH6F3oD1rpGO8tWAeDp2BgtEUOkYRc3xaw=;
        b=BcHTx8bm6sZcLffhxOH8Rh6tFNX/ZB5L/O5Ln/t91rECqAS6BEF68MTS5K30UM+AKe
         7tUkRnEW7nGr9wW1D2EcL+Um3w+cMXCdajKsLB5wbfzk6DRp0Ox2ODetsD+dv4YiAf+d
         nW42Y55avkM8BLpyLF9hzFAILQjLF9GOtVW525qfMr/ZPXuZA5T7FroI6yTVUgXkVnVu
         G3KhrYWpMQ20OALw1ALlSaKJLWd9RPUttoxkY4EeNn9IIELV1DB7Sa+oijHpJ3vlkMQU
         zpT1vkZNRmG/7gs+BEaf4RioMn8aXdBB1iDqUSRCyX8deDP2VF+zfr+8zh1mtYmiZvjL
         0S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697763; x=1762302563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NV/KuyBxwGH6F3oD1rpGO8tWAeDp2BgtEUOkYRc3xaw=;
        b=Fw/vXS0rmJOK3qnr+d2GYwKfEMvHPUCHMNAz67G9Q32rLjRtJ5+0PGYAUhOXj3h7zR
         GlAE3QLmJIUWODC+o8VFx/mvbmq+jgjh/TKANbhoHnYVjFx/eNF/85L+UY949iHiTSsD
         QiWYZg5yM2LCsEYu8syxt7Gd3oiuh3882gjMelZa+t8S8FE4/8fy6UkzR2kEDz5VnrrW
         E5Ur0FSQfCDVF67EN+hS5jBudktILfREXyiaOWDZJt7BR6upFvGIq7AoOfxJklZnwbI+
         S1ESaGlXjbZb1TXThm6mJbAw6WhT60D/nQVJpH1HJomt6fmXoAK4KFUn0rUzErcDPHdW
         VZeg==
X-Gm-Message-State: AOJu0YyPqjb7X6xuU2bT29L54ZODxfKiiBFv+rWTbUzZcGdrZQyxGNne
	SWuYCmptg66C0VBQ6BzyqAsHQ93VobH46Pux7bSy5uNL2rySpSavKjtKUc2GjukPnTEkqgRcO0m
	vIWhW052Cw0jHvjIRdoJXfJTAsGQCJhLSJ5PEu6IYWVuMwNOoD6kIcLIiymRSllrYf1UQp20mWY
	F1GShIONZJ+shbaWQ=
X-Gm-Gg: ASbGncsV0jSAbKRzZY2a2t4/9y84SgrkmyU822QndhymaSC9Kobi/Uc9aUl5TGVF3lI
	50F8Tnx8cfNZAcECDiUeTlXJ0dmoKVkR6Rtv8mqkSotx+iyfcvKS+ir33q+poZXC5Ml+DtzoNsC
	xj+HyGNDt8y56XdyQxkdAJDWb9DRg1NvF4KEpOHrrspq/F2loMc9TZrzi8m88jWtSfy1Vb9tedN
	c+ncsHv9Fev0MrAtbEha2MU4WyyRhKMx++GxmdK8QZAJ0Zm6Zrqia5pyM8Qz+OHY90EWRd81f0z
	q7VHUgM1yTW/6xO6jTQoFWduhlHPpf/uPBi8dmCbbABEaoQ4qRi3MvndtLGYH5ltdSsV6R6G+j+
	zLD5MZ5ywIycy0Ui8p5YjwCfc6bTAGaCn1yRWaiHyaXFquVWpImEqlZX6E2CsKho3iWDXkXzaff
	PI2h4e5FaQ9Lvr
X-Received: by 2002:a05:622a:59cc:b0:4eb:a291:fbfd with SMTP id d75a77b69052e-4ed15b42232mr20474551cf.12.1761697763409;
        Tue, 28 Oct 2025 17:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAp58CuoaXifGdPgxPOxDFrtOPSo1GZEWrLfPz7gK6lVPY6Dgtb6AQla4k+9IINIIRoNG+3w==
X-Received: by 2002:a05:622a:59cc:b0:4eb:a291:fbfd with SMTP id d75a77b69052e-4ed15b42232mr20474181cf.12.1761697762738;
        Tue, 28 Oct 2025 17:29:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm32212511fa.8.2025.10.28.17.29.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:29:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libconfig: import recipe from meta-oe
Date: Wed, 29 Oct 2025 02:29:16 +0200
Message-ID: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfXx1wNzkaoZ7hF
 rJSKjUnQ7myeSM2aEjDB6sG9hkY77V5LOwwqPPkOngw/kFyq3/cVuTTUn0ZhS/Yp/Etcww7wPFy
 pwh0mPgk/RuWdWlHjN0x79f7zM1mOzesb1VrSJNIIJy8CKcs5KW5fBjAoEZVUpSuNSvDPwbnCza
 TvMavWFObOfTMXfia87R5bRf0iHNHKSUeccUduxLaaGn5OzpPXnZMU7AKkyISY3c5hWsZQhxCN2
 PZy+Lk9GtKVXk5IAUpgw+ICIJUQlCqo8LleMd7pKxs5b1h++CcMlKFcEKUrg1QyA6QXhnzBmb3o
 gJm80+HJ4LgK4thsWOf8UDcR1I9lgHlon8DdcfH5m7f9KBkVjHVKgDWFClIIBds2Oz7rnDULVHn
 k9x5w97wh4vPw0YdRO05BKRv6rTBNg==
X-Proofpoint-GUID: tWcQWw2Pmn_IaDkZScb_1Xa0a2eQLLrP
X-Proofpoint-ORIG-GUID: tWcQWw2Pmn_IaDkZScb_1Xa0a2eQLLrP
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69015fe5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jn5mJRsBAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=cmWlzMUdAAAA:8 a=mFR-GSDXT-mRu9J0_PwA:9
 a=dawVfQjAaf238kedN5IG:22 a=0flEoihKdI8QF1_aUImP:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22 a=93ApFmx_MQ_BoSUK457J:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225418

One of the freedreno tools in the Mesa package depends on libconfig.
Recipes from other layers also depend on libconfig. It makes sense to
move libconfig to OE-Core in order to reduce inter-layer dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...larations-to-allow-build-with-gcc-15.patch | 38 +++++++++++++++++++
 .../libconfig/libconfig_1.7.3.bb              | 24 ++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
 create mode 100644 meta/recipes-extended/libconfig/libconfig_1.7.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c4142e2b7215..d4ec0ddcc852 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -329,6 +329,7 @@ RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libclc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch b/meta/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
new file mode 100644
index 000000000000..00ceadb10d6c
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 0511e285f3c886a388b8e9c6a4829752d60ab44c Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 5 Dec 2024 06:47:40 +0000
+Subject: [PATCH] Fix declarations to allow build with gcc 15
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Upstream-Status: Backport [690342b Fix declarations to allow build with gcc 15]
+---
+ lib/grammar.y | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/grammar.y b/lib/grammar.y
+index 87dac00..0e9d0bb 100644
+--- a/lib/grammar.y
++++ b/lib/grammar.y
+@@ -40,8 +40,7 @@
+ #include "wincompat.h"
+ 
+ /* These declarations are provided to suppress compiler warnings. */
+-extern int libconfig_yylex();
+-extern int libconfig_yyget_lineno();
++extern int libconfig_yyget_lineno(void *);
+ 
+ static const char *err_array_elem_type = "mismatched element type in array";
+ static const char *err_duplicate_setting = "duplicate setting name";
+@@ -80,6 +79,11 @@ void libconfig_yyerror(void *scanner, struct parse_context *ctx,
+   char *sval;
+ }
+ 
++%{
++/* These declarations are provided to suppress compiler warnings. */
++extern int libconfig_yylex(YYSTYPE *, void *);
++%}
++
+ %token <ival> TOK_BOOLEAN TOK_INTEGER TOK_HEX
+ %token <llval> TOK_INTEGER64 TOK_HEX64
+ %token <fval> TOK_FLOAT
diff --git a/meta/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta/recipes-extended/libconfig/libconfig_1.7.3.bb
new file mode 100644
index 000000000000..bd7d7e64b889
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -0,0 +1,24 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "Library for manipulating structured configuration files"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig/"
+BUGTRACKER = "https://github.com/hyperrealm/libconfig/issues"
+SECTION = "libs"
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
+    file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
+"
+SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
+
+# needed when we modify grammar.y with above patch
+DEPENDS += "bison-native"
+
+UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
+UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
+
+inherit autotools-brokensep pkgconfig
+
+PACKAGE_BEFORE_PN = "${PN}++"
+FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.47.3


