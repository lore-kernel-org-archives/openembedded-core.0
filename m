Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA92D1CDB5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 00:49:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31724.1764809376077262411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 16:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eLommvDw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LGlj6Eo0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B40Oe4o4034766
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 00:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z3AvKdrthac8+J53tCe0QT4sjHz8eDnpTeL
	qKj04S80=; b=eLommvDwSOcBSrjHm69ZZ1xtIF8bZgx6EAC7ef/0B4K3P0axJ3U
	b7cPmTiSuAUmS+TBapvZeO8VYnj8EjWn7q5BshVgVFM+FyU6c7LCZV3XNXkerMBM
	8E8ZeGTFHpyduNS/r/zW2hVigc3xs38AZ+Ow2eEKzU1ajCvoyRBUYQC5pqNSgO6+
	/REHhzzSCGuOGKiMl3uRRXWoH0RshVz9PGB/tHxlc0Di6e0L25vgI7HcFObJHqUu
	yOuza/oK4wdc5dvMR0NsMiRRZUCwYBwQr62ih04DHprKcIy2s+KUklATuYZWJ0oU
	Mju1YdWqhTzZRaCrh3vV4PB1um61wOLrK9w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmh8wd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:49:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88239fa9ec9so8691576d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 16:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764809374; x=1765414174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3AvKdrthac8+J53tCe0QT4sjHz8eDnpTeLqKj04S80=;
        b=LGlj6Eo0JWspJ2MfiGMEFv1k/c3WBGVcG7+CCmTl3sya35uZyCY1tEZlE6ormCARDP
         XdoBAkhGtjuVemo/CQQcmhH0msvHR2IOYZEQMd16CZmzNfBDcmivAy2wtlAXInUgtabf
         9IVaCwSpkOc7f7TXviK0OufIFj0MfnQYXSze3eZ0oHIn8OpnLntkxZqJgJm+ZcEIr2YZ
         rv6kjtKYPA2tEt26ejwlppUmL+hBqUvL5aJaS5fsPDx5BNxyJ1OTFFIKx+ophdZKkWi2
         TSfIwrhDXkigI7gC8dzY7WVobapfcF+nvQkZek+k8MA7fv6hcdodvaVXWdW5wN+i6mYf
         476Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809374; x=1765414174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3AvKdrthac8+J53tCe0QT4sjHz8eDnpTeLqKj04S80=;
        b=OdVSaNY55hRm7Dd1Fhirxnr9AWNL+VpKA8x30rn/H4WCq7/gS21B03U+xzPlBNJhW2
         Mv7Oe/xvQEUInaaoctu3X6u/KNVhJmV7pZetr5xQ1jZTb3nk8OLykt9NqTn/xQYzSUn6
         c7Dza05rwQyervrmSTOaZJ0w5BaVPqW9Oov4r5EsJyNTFlydLKSY/ysjr05GpmIwy1z9
         3yJ72p2kMlme78eNo4I4fszLNqgomPQvU3KrNrOSdy3TKrXO/O3CRdsHc8CqgCSQO6ZV
         GpOh1cG00FY6I04Tws2d02xqUf9jYB8wLcDEQ4dHg2VMt1SYl7KPpF81AHT5o+nv0/4t
         HwgA==
X-Gm-Message-State: AOJu0YxfsuvUdRQ7oBVWlyiYO10tzFOfj5TfltsmWuyaAIIx+FnanTKf
	iZxQ5kkKHo/3avXnkduzKAyIgjv3n99XKtdxcgA3l+rniDjAhrf7LVJboDXUqYaLBL3BrikIKU7
	leWnuD0fD5RgrUmg5H40H5IDVIyi+O23Ks+ZCp5zkc1jP5R/wHSoeOG+o272t02B9ZTnTrh+4ig
	/VwsGZy2wPJvRUTfA=
X-Gm-Gg: ASbGncvEyKj9h1Kj1+ti9motgPQPF9iQnNTiAbjWwWdMByKn/hpCDNVwRDPMHmeQc6p
	AtQTQbBNJKRl/GsuQVCQmSLedkz7EfrQSNb8B8dh423kdkKpEoE/KAKqTjx31qnEcKS0KQdNQjD
	tRYg078D9xN8tYSxRGisKJgLJXhHqYWMKkPcTpbotfJemxidwapa1hMVSmHVt+MPBZ3IS7xNA6g
	1mogG5/XBXeHE82I/sKrmVOpAhGfI9ORw8y7wHF/Zj+dbWynxRnmTV0pF1Lif0dZcb0M1c7FrQ8
	QllYlp+dXvWRxzllp5DgRKCvH9w+OXDB/n5oJH6IzsU72zQgSLIJJtrgwe4+57IgaQ6UDV4JI6k
	bDx2YH6HReSZpDInc8TggOyCU+6ZfYKmvdKi2wrFSmwM5qSY8LeKyH9rVf6Hiz+R+yKaxmfQylP
	tWNEKwTvkUG4gvEGRBd1AW+Qw=
X-Received: by 2002:a05:620a:7010:b0:8a4:4156:17b with SMTP id af79cd13be357-8b5e6f7ce2emr638558285a.70.1764809373896;
        Wed, 03 Dec 2025 16:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMKSHz9vTpK+rWNzDexAixGRFKrwzvk4TrmMCOvQYYDFESWi0SwY1OAWFZ/b9jEmv8T6KwvA==
X-Received: by 2002:a05:620a:7010:b0:8a4:4156:17b with SMTP id af79cd13be357-8b5e6f7ce2emr638556085a.70.1764809373278;
        Wed, 03 Dec 2025 16:49:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70674a60sm392761fa.49.2025.12.03.16.49.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 16:49:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 1/2] libconfig: import recipe from meta-oe
Date: Thu,  4 Dec 2025 02:49:28 +0200
Message-ID: <20251204004929.2617318-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cApPtNS-ZJuLoD68jxJtp3ctXZAZI8Fm
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=6930da9e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=jn5mJRsBAAAA:8
 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=7cpx2DdFTwL2J7Kn4CIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=0flEoihKdI8QF1_aUImP:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAwMyBTYWx0ZWRfX4jRrifNxGVsE
 BODxaJLMi+gm7hyCvAhq25PUWEPicotVh6J7Ol38gFy94gDoCo16jeKcTMh1g5nvmwDUNupBdyQ
 umGfzzbjrAKxiXGyPyfajbsPQqAoJ0CggVMg+HJ1u6RaDpGxaynbZoWJcwOZ1lDtkAtOuRYWY/B
 pPGQap8Cc3bC7W+EGTW31KiOWH/kmWEQiS0yfVmZj4+z2XyR9CDg0/LnAF2tZbqKzU9mCgiczNa
 4M0FfLFBYyf7cqwULyadLjIfkdOAcAYNlumdOnb3dHF3ownqHVVKmhIZnClnP+DW9GdNJwweCKX
 zaHYBFfYGqoU5kM6L7mzlLG2i1XNACmBfJBm8ehyd8ayv5LBEan/YevlulFcSMMMnX74l6te/DB
 uyxzODkaCYuD/cHBCNzeOO6sG2uBfA==
X-Proofpoint-ORIG-GUID: cApPtNS-ZJuLoD68jxJtp3ctXZAZI8Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227244

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
index 9f4e5e2df899..b5031b55af30 100644
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
index 000000000000..76769eb2cff1
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
+Upstream-Status: Backport [https://github.com/hyperrealm/libconfig/commit/41c6be5bdffc49f9151b67c46dd75b51876f676d]
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


