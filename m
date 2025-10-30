Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DF9CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:54:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.24026.1761825258890957601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LC3Q6z7b;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=A55NHziV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7QneB1501736
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0eklQbaySDc7B5blBvVGzh8gF5C4LfpX3mP
	bDddq0Ic=; b=LC3Q6z7bBhUAg4ALLdYd6fnnCVolgQnGc6zuyb5QX+8TVda9IGj
	lL+RNDPO+QwqMMYto9JdB++PlrMuJl2KFIEhK4odRYHwhWToWqOyYrJx49rDRX8p
	CuUwW8bvLX/j+a3+GnsXwKSlZ7HBG1i1KAPm5/4bWBXHyIx7aTOF9zK6Aqzc/Bo/
	JMCYXR6a/ZiR/D/Ea7h04EZlNUGt6V95S39/LS0qcbwuHAOTygEh4vrd1hzOPbwm
	Bq9SPaPJTYWIxUDU8GWjoiws+z4oK40jKKAzPN+DivnzrcHNTawbcOPhGbK638oD
	gEwEpHYb292NSrfB5ebQe2JrKp7nMaVNJmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jtbdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf72a45f5so25456141cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761825257; x=1762430057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eklQbaySDc7B5blBvVGzh8gF5C4LfpX3mPbDddq0Ic=;
        b=A55NHziV2VdTJPjcc4LnfDo9C94UpLAc+HhAQYoSG8aFy/+KWoY1onnf2sUdtiI0iV
         CFzVQLWnADq9o/j3thTc6629WrrMRSmanYWRtVZaE4xM5tAJQfNEU+07XkJ8oiCNdTS3
         qNeOn2aveFrzEL22sw45Gjaug+Ip4sTMFdlcUU6EZ2bWk6nWwLYMqPz5cW4exDI1ntl2
         W+Jw8LMRtVA+xr0bUrqa2fCmWkhQq06+8/K4cS9JjJCMPFvy2rWgKNOI03xlgjZG2ju4
         7e/GzQAjip39u06YCaYf+95EQDrnMyKlnKenz7PuqiD4DBdgTgbMQUpwXGvg1h/eMylP
         nl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825257; x=1762430057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eklQbaySDc7B5blBvVGzh8gF5C4LfpX3mPbDddq0Ic=;
        b=Fw2Ps/VMHOeVCjDjxWQcJSz1Ra3dNW2r6Q6zFI7Ro5R2Z0IKF9Mc7SnhSSaBpDmfKT
         Z2MPIs2z9TSn+B3mbSCBOodstIPOqz2vSuOu+9diGmE92zTHtn/4hnUHbFNrtgJAmDrq
         DUGLTzGwMVse8b+hkfEv0IcIDvGAYAnWC+/004aqj7pEJCB/WTgGgpwRtMZyjJHusxNH
         MhWKaCMRZowrecq5BWdjuBhViYIAEuGbEa0XJjxyVoGB8vXoxu/sbFKUav+25N/o2la5
         5i9sDJgg4XLjie+9IX1mgiqtIZFjZtkTBLvzJ5LbG/3IF/x/XudXKYfwzf1H4PhKO8fa
         iSyw==
X-Gm-Message-State: AOJu0Yy1iA6xdQyJAApOCSdC0cRKNGyj8079hcrBWnrAH8okFbQRllLD
	gesjQH9X0qQPYzNwv++azy96qjrQg+eXswgucAyQ3as0zlwCPnt2fptV5hsfz7alT/tKmK3q5AA
	aADuTh3CYKwLoLvVXIf47E2eX9+vjYvbyKlJVY1HqH2C/120ASRJUvQ2M8RjSu6NMnkJ8EPOhJZ
	VdFITmx90ljLCnr7w=
X-Gm-Gg: ASbGncvayffmlfUZ2fYvoX7ajho2HJ9Rx1EZeM0rpXzMp6EwtiLNfnT3v179Mq6fsZs
	TjfzYHUCyqujoiDRKt1kSJHHWFVzYAf6qXKDgMZ0h11MlobCf3mdke+LxtcENz0+70S4g83AQ5v
	YUG1jsKZyVzgpQQOoa3L0Dj4V6xZP9YQLvoO1XsqHmDuGz9sogUBpf074XUTsCbhOtN2i4Sf0fQ
	dWlegP7ERE0UqlLngQjHgacBueW5TBMui7PbpG+RGRLG9/pMy/1DPljbsUkNszVEQVZSF7RvJBU
	uOrQsoja5uWlsw8HACrS1FHUcms9wFzwB6E1452jvwcMw1l1XrrHUMbZA392XNDpb6dz7wU3hex
	TObCKzUv0G8N+dkgFCB9edLvNrmtatvOQlTP5Trmc+bWJsRNtcQLKSodYr+D0T8ukgHqRDHhBDU
	C8GDDj3v7SwrAu
X-Received: by 2002:a05:622a:8c17:b0:4ed:1ac6:aef9 with SMTP id d75a77b69052e-4ed1ac6c1b1mr53885381cf.65.1761825256921;
        Thu, 30 Oct 2025 04:54:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTVF7MVLledzoluSqNf8QuYMOB4uqNBlxyeVIPQDV1uYYdDLRulYnRqWLdTLoqEXW+Hof2Ww==
X-Received: by 2002:a05:622a:8c17:b0:4ed:1ac6:aef9 with SMTP id d75a77b69052e-4ed1ac6c1b1mr53885111cf.65.1761825256337;
        Thu, 30 Oct 2025 04:54:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-593097eb2d4sm2909130e87.66.2025.10.30.04.54.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:54:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/2] libconfig: import recipe from meta-oe
Date: Thu, 30 Oct 2025 13:54:14 +0200
Message-ID: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fvPkRI96sk1Iu0YOL9-wbpR-cGN4Z6Tg
X-Proofpoint-ORIG-GUID: fvPkRI96sk1Iu0YOL9-wbpR-cGN4Z6Tg
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=690351ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=jn5mJRsBAAAA:8
 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=7cpx2DdFTwL2J7Kn4CIA:9 a=a_PwQJl-kcHnX1M80qC6:22
 a=0flEoihKdI8QF1_aUImP:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uCSXFHLys93vLW5PjgO_:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5NiBTYWx0ZWRfX+0UtKSo5zE/V
 sZ/54stdoWfDlFQ8jTGdHj1MJlEs1zQ8NglXW+P0gjEsjE+TiDOn27oIFM6THi3fMOHuyCYrxAy
 Nd9QiGZ73ywt6OU6J5PMZMaYQbeBshlzqqswl38kFYXABnohjEKre0jHkgzIat2v93Ul8p8euhk
 S+4jYJgax86Lzf6Cse5P0j8Ha2koB2V7gwyDMos2bZCrrGoL4vAz7QIfB656CEr2pVlJ1AQxyYg
 AjXRpX3K/d0uAdy/V00i9kEoHwsyjHj7CJ9EAjj2mjsy8phsuULDRb/sqxiEdVW79y85gG+CJRc
 rK3+DZj1ld9zvrlTYCHuBCD9gHKhJpRSKsrZ5752mIRhZ3P8EsUpQ2m3D1CyF0hD4gouhM6Wdly
 iOgshAj03EinlXN+9nBC0Nkzn2ZX2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225491

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
index 000000000000..37c2504b0168
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
+do_compile:prepend() {
+    rm -f ${S}/lib/grammar.[ch]
+    rm -f ${S}/lib/scanner.[ch]
+}
-- 
2.47.3


