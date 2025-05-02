Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29836C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:29:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1004.1746224939329854006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 15:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k/r8opsn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBLbn009638
	for <openembedded-core@lists.openembedded.org>; Fri, 2 May 2025 22:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j0JnWnAMX6isWsXrTtu463EdaU+U/hBjWwZ
	bJvA/dck=; b=k/r8opsn2H/50StavdH77K4nVTSuwbgpz6E1ELg1pdmwaR4YPIk
	ZJRyUjulzxaTTsB3gmZDCXBKMJfmpzgigikCM6Ii+pEPnkYJjZaLTfbhrFWPvW23
	jkcIcZxsLDtaM63YnsL5yUZWxjqc/TDNPWWlx+wrtjjbQ2oDgl7rovnpU4rR6fZ6
	abC7g1pt6BwFZ3Ltu5vQpZZZaOV+DbSQIVpbTmX5W5aSEm4rva+Uj3ekNyErFw8Z
	zXOe+JcmFZ5FDF/EhXwMdgBL4PlDFp4bIroH0tOECGz+gqQL1a4W07GZEK2xcRfv
	JfPStpvtpzsvplf+qvrnykm7p/bikckt5TA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21j75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 22:28:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47685de2945so42248111cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 15:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746224937; x=1746829737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0JnWnAMX6isWsXrTtu463EdaU+U/hBjWwZbJvA/dck=;
        b=qSEQLf0U4+tEEAreOTbXXgEsC2UzWvm8er4vnnVS7OioF6+H5BIXarwlZ8Zj9ow0Xd
         FZuObM1uMR03K1OdJT2242ODYmNTUMcjQJsFiEzS9N59yZ4CgWBC/GPdDH5u58x8+l+x
         Xp1ZDq11Jspo7ZxP+xhH0xGq8zPq5Z+m+QpDdiGOodAGD4K6l0UNVNtATcicBgzvPDah
         tWtRQJYCrRns3dIPK9uQqzPqrwnCNyg4kUY65MrtzbIk2VTBfC+nDgTMDVUDZUpQ6bI1
         cyuuJxJd7C3OzpN2LkV/4dijn6n1yzpdK/WBpexaY+aG9ePoT4ymiVfibaf9duP/Qz0K
         tDWA==
X-Gm-Message-State: AOJu0YzngVcsC3lQUDd6H968CJ0K137WWYBGoVNiD8BwRwYipZvhXPBK
	kQl60tjbIlyGavK5FcB+0te11MfrC2yepd65HZaqYtdIvNgtHe+3xJG3W1oAhfMhrd0efwVL6yd
	JxNrcQVQ328vCbQlMWSj3tAo17tWrhAzNC9weG9tV9k0xMChIivHqoB3KOYXKtXBtiYiom/phFn
	3JP8Jkl8HWEcISmA==
X-Gm-Gg: ASbGnct016mhOzZTjGTi6H2U4Hq6ylxbHM0fML6dmVGp3ps9Sz6mCWR45IpWV/q99KH
	BSmQYXwIG8KBS4j+dzVyxiHPxeRzo7DUeZgjbfuk9bK8wJSubTEyD++XnhOwH8+Ysml42bOUFza
	IC0fjayVDnqA7qof0bb2HhnNV/PX7g7KLy7EORQkNiW2tGHMzvkSwY7vFxyOmln6UDOGdAEUktU
	vEoKT1Qlfm7xPHGvm/Oisg9Dd/s7oXyBXrTm+DK2KEbZa3wcvm3Ahbs/3sbjXMledlfYChvCfeQ
	dwze3axJ9RjR4iuox1ZRUOVDjVcuNF9cWxtuWPwTVscROweb/M1mbZJjLKqNbvKnf56F9c39+lk
	KZQ0nn8NgQ6iayt2Qwffri3Hg
X-Received: by 2002:a05:622a:17c5:b0:47a:e616:caba with SMTP id d75a77b69052e-48c3163d6e1mr85512751cf.14.1746224937003;
        Fri, 02 May 2025 15:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUnAmWAjr9/BNA6WfjmTUDB6JxSmJvzTYQYRpp7AP0qSAfw1e6TCWe+fHMnIvUyKyYbibYZQ==
X-Received: by 2002:a05:622a:17c5:b0:47a:e616:caba with SMTP id d75a77b69052e-48c3163d6e1mr85512321cf.14.1746224936507;
        Fri, 02 May 2025 15:28:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee383sm513746e87.153.2025.05.02.15.28.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:28:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 25.0.2 -> 25.0.5
Date: Sat,  3 May 2025 01:28:53 +0300
Message-Id: <20250502222853.934114-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6815472a cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=aR16PxjQAAAA:8 a=Q2HGajxlxAiZkNxsxRMA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NCBTYWx0ZWRfX8kgdxGKDrkmE 8sLO2RLhfXcaTDtOCazEbX2+p56bWCaIHjEmwcu+0AhqIEDcTcB0nPEf8dliyIJOp6Xx5bDeEvN y2WLCq4KAZvignwYMR+uC+yx0SBBhkAtRdPYasxsZIi8jZw+yNFxJrZjPjIpO/zwQYaNy1hPKqN
 c0HU+s4YHPZ8FmTUiFBBIuy9cvrIf9ImUQmStKr/5a7rvPWOoVEDr3D/8XUtw9nOATlg/7z8aky iE0Mq2aY3mZBZHWafgJPKZKeWt9bPFa8P0FdQ4DPm17aE9lusg0ct8TxLRajNBmJmyZIQOCWwlQ BorHtnVQnGg/lUnBmQrAUml3grje+fma7LCNcZpojzlGn/B0DSXpqt7Lxg+i9aNC29Ds6KbN0hk
 DTZk8tdmk9lDWBObGEPldIvG48NjrFmAShJCt2CeHktgBFnycM7lNSNLXw1wC+ha2sX1p4Vv
X-Proofpoint-GUID: Wa7wu4-yANQsOLemiHR7oOSTAGyn2M2o
X-Proofpoint-ORIG-GUID: Wa7wu4-yANQsOLemiHR7oOSTAGyn2M2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 22:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215929

Several fixes, mostly targeting AMD and Qualcomm platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...SIMD-blake-optimisations-on-x32-host.patch | 28 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  7 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch b/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch
deleted file mode 100644
index f8af2bafb433..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f3c34b8da2662643089b33be8b93e56a4da8703d Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 2 Apr 2025 15:30:20 +0300
-Subject: [PATCH] meson: disable SIMD blake optimisations on x32 host
-
-On X.org startup libgallium crashes on x32 hosts inside
-blake3_hash_many_sse41(), most likely because of the different pointer
-size. Disable SIMD blake implementation if x32 is detected.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/b9c6afd3a7c7ac302b47e70b5c745b84cb35f188]
----
- src/util/blake3/meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
-index 6b53daab6b32..ce6dd85ac1ea 100644
---- a/src/util/blake3/meson.build
-+++ b/src/util/blake3/meson.build
-@@ -24,6 +24,8 @@ if cpu_family == 'x86_64'
-     else
-       files_blake3 += ['blake3_sse2_x86-64_windows_gnu.S', 'blake3_sse41_x86-64_windows_gnu.S', 'blake3_avx2_x86-64_windows_gnu.S', 'blake3_avx512_x86-64_windows_gnu.S']
-     endif
-+  elif meson.get_compiler('c').sizeof('void *') == 4
-+    blake3_defs += blake3_x86_no_simd_defs
-   else
-     files_blake3 += ['blake3_sse2_x86-64_unix.S', 'blake3_sse41_x86-64_unix.S', 'blake3_avx2_x86-64_unix.S', 'blake3_avx512_x86-64_unix.S']
-   endif
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 49b3de1ba796..66fb896676ac 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,15 +16,14 @@ PE = "2"
 
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch \
-           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
+           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch \
            file://0001-clover-Don-t-include-libclc-headers.patch \
            file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch \
 "
 
-SRC_URI[sha256sum] = "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6d4c45638627fdc97"
-PV = "25.0.2"
+SRC_URI[sha256sum] = "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d676c69f650ad4378d0"
+PV = "25.0.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.5


