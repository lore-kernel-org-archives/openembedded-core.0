Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8FCCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:52:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web01.20720.1761825152032956957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cK6yrseM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=i/m2uVsB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9SU2c1994626
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xBJhjDhxoXqnATkTi095hXzzE3HFrhiwRUa
	DpP10xDs=; b=cK6yrseMe8iNfTzomJz4BKh98zuW4OQs7rx5BgkHGHMB5TpJJB7
	Jc/FGQLvnW9+vy9jMNSxWQcAGmbFJ6UXQ6trXX5OqTpufQeFZGKu58bXIok4lF52
	XcnFtkZhsaXaKXRXQMNpxB6oUUpM2D3pTu4uIFjRVY3nMaxbxZhcxEW9I9FtC0xC
	/UxCdIbbzafqbG0pZdgxObarzv6Fi/v5yHJmN8MBSlQqsGUR463XIApsLPX+3bqT
	i2rPPQOERUu2566N7gAy9rvbw7Z1UL0zIVRUasFZVpINxVkkGAmKHMI1f5MNoGFt
	KMV3BphLtI+3mLSeMPnLNWqYCbEuieO7U9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr71qcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba930d6ecso22412491cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761825150; x=1762429950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xBJhjDhxoXqnATkTi095hXzzE3HFrhiwRUaDpP10xDs=;
        b=i/m2uVsBHRS9w6Gq8+AJxFiY/VCe/yzZ3mTQyK69RzQXaw0TEhrbuaD43Z7xv9XPNP
         5AjY9uB/VZXqO/h3Vfv95jAn0Am3Lm+4pZMSqyV6NC2wbnr1HZ9g61Yl49VkHAuKuu+h
         sZNbHMgzhrcIxwBICrTM7ukhn4vK5XjHDrNCOzETt4EVqDbf37+vqs87pE12m40mTwwc
         b1HgQ3XjKoxum271QIMAsAeAqN8Gr49F4lxI+pUig1CSU4iXZi1nX3lS2KP6kNpGfRJ0
         i3gmE9PfxAuPpzoOaDUCsA7T/hTLeAl8HBDfUfz/4mqVMZA2d7Bsn44hOaTJCy8Rdkki
         THTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825150; x=1762429950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBJhjDhxoXqnATkTi095hXzzE3HFrhiwRUaDpP10xDs=;
        b=o91DOMGO6cmaqcROYOH8Z1IwNBCHxyO22hL7YEU3e4hWPwjdPdhSKjho6E3Pnv89/y
         +Kd6SHq0r3ii8VZqCo7NrI5EAIw3ep93Dp9LRyZfjJ3Ieg1CiVz1r1BZkdyLAVZwQ1po
         XRb0yhqYbxeUwnishWozIAzPd35g7JYesaTAW8y+Qns2thRs2x+CGELRqmLdBK9ADVmU
         K1lcAEhU5GwtseaALtq71ADQt/Q2gXxGCFaxgJHHSkq/uTgeA4P9Om6Vu7qXfh3ATELf
         ihiD6Jq0gqAvexFB9Vsjfj2gFm5LTe6+ciIRCbBCSyYx3rNfmRMaPQzq438bQfH8XdRl
         X3dQ==
X-Gm-Message-State: AOJu0YwDUIbo9P3cei6lOO2ta9N0ia3kpVeOBRG7d0NZsb1Jx9ymJHB5
	Zm1B/LX65FZl/bOjsDZWqXo87rQF0NI970z4zL3ojoS7XTGzN3ICNFtVMUKHDNQ6TzCs9bfjK53
	HI3UjPbcKt1Jubs34gM8f4hZC2yMUUMwCvgJlNK1msNXAT2Obx+hH4Px78qDDtlKJGnYgpdXJOE
	rPBRSs6BZ7DV771AY=
X-Gm-Gg: ASbGnct5l67XRVpWCtLxxzguKoEEc/a4fyYLdg4uOmJfn7U0/qWMY60dTsPcU/BR4as
	RCSjBfYTFlsxjgc7iMd2eQyYu8+8RNVz0tzCm7k/Jxwbziz6yWdmBsYnfRIYNb7UPl7f+rBi3+d
	ZoGeyKJqIs6zGk00TqKQX9w19KK6FOhk2Gv+C+QxLK0VoyUe8adH4Zo/+rNVU7/ftkJ5TA6S1dN
	ZDFIyWpis56va8GFZqNOCzoC0kGUe8L6nwFRBSbivcln/5Zm7jOliq44vANorv/u2LwdpUSurvt
	d2Kwd3mOGx7CEgIez+U8NGR6BO5w1KE1Mg8MEWgI9D2Q/tBlb0HaBgD/AGPeuCuNTzRXzMr8X/F
	21t5PPexh5WLjF+8rfP/FO24FOTt7lvvLh7BY0gYhbZPGscLPDPRVM0Puhxcg9cYhyFk5O4QlIj
	WA4jE5p2mVZiKT
X-Received: by 2002:a05:622a:1:b0:4ed:d5d:e8ab with SMTP id d75a77b69052e-4ed2e15c44amr2325691cf.32.1761825149920;
        Thu, 30 Oct 2025 04:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzI1ZS3fWb/aBCgwYEgvCq8QZpfOw+HL8VTVfm7wI7M1iN2Ek0YKQIAPXlgglWQZ7jdwDQVA==
X-Received: by 2002:a05:622a:1:b0:4ed:d5d:e8ab with SMTP id d75a77b69052e-4ed2e15c44amr2325381cf.32.1761825149298;
        Thu, 30 Oct 2025 04:52:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6e644sm4599182e87.79.2025.10.30.04.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] libconfig: import recipe from meta-oe
Date: Thu, 30 Oct 2025 13:52:26 +0200
Message-ID: <20251030115227.2559731-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5NiBTYWx0ZWRfX3ZI/R7GPWOXs
 5WTr5f7XDLeqsc3tyum+OYLxz4WDgOkWBfW9/yarH/2exQRfinmGkw7rw0LV/FEpOOu877YygQQ
 3qHdrDgmXI/Ua2XdZYf6uBILfzoH1FpM8DDVl9KwsRMBhp3raVA20xFj+auKZEY+RWwaWZu68oo
 ebiFe8gSvXCPIVZlS2ZGzRSFNAZty9+JV4pWUbyDcCJP7lhxHV/kccFzAOa5cpb5GG4y4mHHWz9
 eX2depu6v6svy3dp6hKMK+CRUsw6DZaFBzwVl2DL8pyLjy2tdaJGFM2lrX1M60VU9fuvXx/0KsS
 4brVMLUtWBQY7RPgWS6lBektE9natF5sDwtaW7MzB+FKcDtoBiPEOejoVUQ/9al43ouf9VYa9WR
 jZsWjsilSzKAHFHc6BRM5SuFNOZcAw==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903517e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=jn5mJRsBAAAA:8
 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=7cpx2DdFTwL2J7Kn4CIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
 a=0flEoihKdI8QF1_aUImP:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uCSXFHLys93vLW5PjgO_:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-ORIG-GUID: i51xCwqIclW1jIph0t_A-U-pSkhg-Tc1
X-Proofpoint-GUID: i51xCwqIclW1jIph0t_A-U-pSkhg-Tc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225489

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
 .../libconfig/libconfig_1.8.1.bb              | 30 +++++++++++++++++
 3 files changed, 64 insertions(+)
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
index 000000000000..d389d6f68e49
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
@@ -0,0 +1,30 @@
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
+
+# remove autogenerated files which seem to trigger reproducibility issues
+do_build:prepend() {
+    rm -f ${S}/lib/grammar.[ch]
+    rm -f ${S}/lib/scanner.[ch]
+}
-- 
2.47.3


