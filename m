Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC1BCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 23:32:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web01.16535.1761780757005080290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 16:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YW/FhSBB;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CLVQCN4e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TGID604155120
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A2Bb5jwYcqlFL+yfhJKXBfUm/HaxYEPgduk
	+f/A6hFk=; b=YW/FhSBB6bgj/B3rgSxxKt/5mnRvWaKqa5F7Fo70uvUWW3ALv6N
	sy+TIddH5vEKG/Q106pamk7afurBVSy5YeOATcFWQlkxxjLkj3+yrOc3UVK0xHnm
	uG6yTI6NsgmuHng9dGSbSfBWRUs/wjmNo3NIPXKMGb7hxqGO2519sYpQ7QIV6wif
	5/KfspDeVFbiQjjvQqZDqkuzwu/FkV6tTnbup2QaFWWE/MI9RMD4nqW2HSPpRwzi
	maUrRveHKIVNpBoruY80Z5c7J0F60sibD5/ZODuKqMccFSE5TWakC3rnKRIh+Sa9
	A2LoMtnXwqp7KisgzV+leRimjEkEFtmhRyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0tm4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8aafb21d6so10610581cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761780755; x=1762385555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2Bb5jwYcqlFL+yfhJKXBfUm/HaxYEPgduk+f/A6hFk=;
        b=CLVQCN4eiXtY64sNg2kbGgGk54RIXOdGT5bwFRZ0zxLcJTefIbEURttMZPBORIP86H
         wnf8euVkQFzrJA3+tLwCFwEichjLpT9ycGNgx1J8hn736YYtSn5cPPQCi2tfd5iwUlyW
         V/XcwNC/2aIfUjG1vMe4QbGsymrng1mdEXy21DRNuZ2Fz7N1a33Ob3LlZgdC5w3sjLFf
         dWZ9ARHKFutpCxTVBO8xP+ISlKeF5tL2gT4H+JDjq7Ua5WqPygY5VPtZdHlUBykGE9H1
         EPma/Q5HCpKk3I6PyS836t+5s3KAq5TRP2WUvj7CSoj6PPGvEMAmly5GPfsE1/Yl73et
         bTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761780755; x=1762385555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2Bb5jwYcqlFL+yfhJKXBfUm/HaxYEPgduk+f/A6hFk=;
        b=hjLWf7Wd0qqCeprfWgmWHVHuatUYsSGVjwsnm2OIjHgn0n69k250PNQ9JElI7LpqiX
         Z/E3uZxQDp6/NeUcJbJYM8oRplYNgKxS5b5bf+BcOKWkXpuu279saCZq0LsCNQfyMmHn
         IS9ovDtyMShLD3cO4LfXldldtrajsgm4u4+kYVUXkFbYFVAfd6llO02wYCy8sjNT1zoK
         vfKltD0JUcE10vXo9iIuCVeXJVVNniILsUcHcCKHgM3NL0O2J5CPrMhzl9f84uZj+Fse
         l04VpeZCigdewv4Ore0qQFzNVhV6BZuYlrmjLSkcVsporSRJ1YxIVRtMmwawZMiy+dUB
         Dj8A==
X-Gm-Message-State: AOJu0Yx0l4YwBOdGHIL9t91Ia6t3QoRhWZEUYBkHeMdVNku2n67zxmkX
	CK1OLnAhB1u0c25vCXdFKL6KUQUldd6C2D/oernHpGU54dLqIMmgfTJvy+YiE13HZynYWi6fGCp
	dAd7jrrtbek2t75VH1TZGn1jg7oO5NdRgG++uur9eFMr7qkJy6gMLuqCl8dpmoVcfjBEHP0bSm7
	XK9bNH/sUjAcNe3/c=
X-Gm-Gg: ASbGnctAj21kFxoo/UVrrj+GZlRgKERlX8/NOh7zYwA+PdgMq9POMerQxZDQM9MdZg1
	FGK/iYmBRBn8WC+LRoVJ8pXt+8Njk4dNfVjsRtnonV3tVwK42ssETzZnEn9V9nVnrGuAoAtUNkt
	GXSCmsa5iTNas8ccYn+k/McuVHYjDoU/n6DH7SrOECjLyoRiJ+ogclLfhmIbOZvSJDA34wEdN/1
	7tNdFvNEbEnYx2rwIfnzQYw50H7oIe6q48nlGCs6TMC6f49ChWaYfdl35DzbMYt9JStDqfLCZwr
	t1blQWFdbVt2b4caYom+IVSzL9/tGlgjL8Ey6qNuV7A2Dio7QsMT2/REoWAgjre8J8G8xg/6c6+
	UPhWYqedLTlkZdbOv7OqP80MRRSPOIQR8cvvG9LoHYDyGT7SwG6GU6qu8kearRuW9rNvrOPwSR2
	LQJQZJsXDii5+k
X-Received: by 2002:a05:622a:1a21:b0:4e8:8934:6df1 with SMTP id d75a77b69052e-4ed15cb5114mr64700331cf.79.1761780754868;
        Wed, 29 Oct 2025 16:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG4hf6mzH+Y3XiqQa/sZrjVtNNQwN3HjpPz3RdOZbclBt9lzHOE3IQBWEHYM94N25EwZkuDw==
X-Received: by 2002:a05:622a:1a21:b0:4e8:8934:6df1 with SMTP id d75a77b69052e-4ed15cb5114mr64699971cf.79.1761780754120;
        Wed, 29 Oct 2025 16:32:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5f98esm4151024e87.57.2025.10.29.16.32.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 16:32:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] libconfig: import recipe from meta-oe
Date: Thu, 30 Oct 2025 01:32:29 +0200
Message-ID: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6902a413 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=jn5mJRsBAAAA:8
 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=7cpx2DdFTwL2J7Kn4CIA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=0flEoihKdI8QF1_aUImP:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uCSXFHLys93vLW5PjgO_:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-GUID: EQrsWv0PRzYnZs7iIFYhIknPqFDNuWoZ
X-Proofpoint-ORIG-GUID: EQrsWv0PRzYnZs7iIFYhIknPqFDNuWoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE5MCBTYWx0ZWRfX4xS94LdwQRYo
 R14u6uRBoLtiobnA0x+Y1Q8ly6xGEubDE/Go1oMTq4ghLrHTBFpDtJary5vvpG/AELBHV/7wllt
 Lq992c2PIvP2n5Fg0deO0BXMhPS7OJ9uwlCSqr49jB6nuTAB3sOiqvKVvCxqLiDUur/IldpEdIc
 6Dgk1vYeYj+ZfARr4xb+OBImV9VLSYUX9V3XujboosEYwhREPWkhyQmEGiCt1AKNb0aM1B9zwVt
 n35BePO7Z8gZDKsRtImXxEVYpI8pw6fwcL/ES1TO6vSLxMl2+Ng1hwb7zp/uqGAe4hogWavECJ+
 VobmxuC5h7JxXJkEk2w+XGHSkFAkqGhxt9qYKaHdqx4tj5+qWj1AtTfHch3fnswPD2FyHPk0MQA
 9L/76dRMisrDiCWW3TnwX0XnqJhz2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225475

One of the freedreno tools in the Mesa package depends on libconfig.
Recipes from other layers also depend on libconfig. It makes sense to
move libconfig to OE-Core in order to reduce inter-layer dependencies.

Changes between meta-oe and this recipe:
- Upgraded to 1.8.1
- Switched to UPSTREAM_CHECK_GITTAGREGEX
- Switched from autotools-brokensep to autotools
- Added a patch fixing reproducibility issues

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...Add-missing-dependency-for-scanner.h.patch | 33 +++++++++++++++++++
 .../libconfig/libconfig_1.8.1.bb              | 24 ++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
 create mode 100644 meta/recipes-extended/libconfig/libconfig_1.8.1.bb

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
diff --git a/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch b/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
new file mode 100644
index 000000000000..6e6a9419aeb1
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
@@ -0,0 +1,33 @@
+From b9afffcee8809e47d0564f3d6376de724ae820ae Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 29 Oct 2025 22:26:16 +0200
+Subject: [PATCH] Add missing dependency for scanner.h
+
+Automake doesn't handle the header -> source dependency for lex
+scanners. This might result in the out-of-date header or it not being
+rebuilt in time. Provide a rule to make sure that the header is built
+properly.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Submitted [https://github.com/hyperrealm/libconfig/pull/277]
+---
+ lib/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 9ef984323af3..bd5d3dbe5aa3 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -36,6 +36,9 @@ libinc_cpp =  libconfig.h++
+ 
+ BUILT_SOURCES = scanner.c scanner.h grammar.c grammar.h
+ 
++scanner.h: scanner.c
++	@if test ! -f $@; then rm -f scanner.c; $(MAKE) $(AM_MAKEFLAGS) scanner.c; else :; fi
++
+ ## Build mode: C-only or C & C++
+ lib_LTLIBRARIES = libconfig.la
+ 
+-- 
+2.51.0
+
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.1.bb b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
new file mode 100644
index 000000000000..591aedef4371
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "Library for manipulating structured configuration files"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig/"
+BUGTRACKER = "https://github.com/hyperrealm/libconfig/issues"
+SECTION = "libs"
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac"
+
+SRC_URI = " \
+    git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
+    file://0001-Add-missing-dependency-for-scanner.h.patch \
+"
+SRCREV = "47ec93c588f534d20f6ee8704d2a2cec339db7b7"
+
+# needed when we modify grammar.y with patches
+DEPENDS += "bison-native flex-native"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+inherit autotools pkgconfig
+
+PACKAGE_BEFORE_PN = "${PN}++"
+FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.47.3


