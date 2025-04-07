Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23FEC369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.43388.1744019304481931018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MRQQMrnv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dn4g003209
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXA9MOQ5JJrnt3ym7vy+gGNtTfZlDLEeNmw9+KkYJAk=; b=MRQQMrnvJ9KyptDN
	O99T9AZQPhT2It8jLIkl5GfsVt2pkfk3s+51xPcEPF0o74S9XzKoa6LDcVg4C0Je
	VDpkbRcoUULscwEwxFqSJHf+0ReqP3aWlfAwpKCstZggrWMwOaA441Monn0lElcC
	kUx/aIA/s0RBVN2f1pJAqIHAVOPkPNO5G3T9CoWG7Mt06zHiFvJ4+wj8m9vgHcBa
	SwaBBr/AhwL45FUTe4JvXVW6G2vyLdHke7zbM7FzkwSUC17BpIoPSFXZWUQcwv+r
	OI3RFU4y72fqwJVLJUuFS4vYoTzqQT8jSr2RuM0R01veMNYm4c2EdSiyfR4UZJZZ
	4lvFyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftbrsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f7210995so742793585a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019302; x=1744624102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXA9MOQ5JJrnt3ym7vy+gGNtTfZlDLEeNmw9+KkYJAk=;
        b=bDxnvg9ayAgFyishCbdm0zFrP0cKNlElfutZEs6J3I9xBfrwD6ZzFcha8AhO8AtsNG
         /GZlsBeU81P01N+uYFAmdvLt4SezDwD/NB9D+pDDgdPX7o+XgPg+X8faf0X/GxpDEjBK
         hmQja6v/4hFDw1mM+6/vvtDYTLPyBv1CJ2NgiZGKOIyCB1a1ET9fPIxkYA3Rvb4clhFO
         YUWKOZ2H8lbXn9lSaBTLgCdcZ2KrGrdXmx+yE48m6h7qHdZ7U65ady8jWvHAKnjPgRT8
         D5qISpieCZ0r+BP1NqMPLInQ9c18mmembn5xh6DPTOKSTP8nHKZ1BrBs/JT9REn2bTp0
         glUA==
X-Gm-Message-State: AOJu0Yy5sZVNq6TPX+lS6nr0EqO+o9SBDFpXrOGSZRI9X0TR3yujDlOc
	d55MDM0X5yIK/mazvCEr+RkJYiaWcCBESwYA/7ALJg06blA0dV39rIN9XApMHVxkbxjIN1nb1IC
	HzfCYIFp+tcaIwp3VfJ/ID5M7M0uCgtazp5HQMa/9RCUNfIRZmiJ7zg28cHVKaEcTkHI2itrfo/
	BK5dO5FjdF22E=
X-Gm-Gg: ASbGnctf42ufricewbJ+DZIV+Fv6CIn6tn+7Yf8CSpisErNeFFAkGwuMmhKdIMthNVN
	h02tjLaTVpOmk/SQOwl8McnhtcM56B2TzAnc/waK9u5RMOdfEXuc6NntnFjYLA5lninQ1mXxak7
	X2s18XJIOOGeevDOfEWIWWcAsRSPf5Xi/5XkrVaw6O4dJQ1MDFX9FugCFMu+8Ji0bkwA91QZQuy
	B/b8UpYdtGhs0wGCFKG0rdRyaIQCRUDnOygVtgmi0kHi1z0UHyIvwK0pHPYQtOftNmx/ICJQY98
	5AFFgNsEEG6JKTf5otgbWDfcb1jYVImQVaj2gYoFZyli4nflDrqwgjbZ82k0qMrpSMngowFicgB
	XlPVI9Piv1cbCXqdjrENMEsS6pIn5
X-Received: by 2002:a05:620a:44c5:b0:7ac:bc66:5efb with SMTP id af79cd13be357-7c76c9d7073mr2383380385a.27.1744019302238;
        Mon, 07 Apr 2025 02:48:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN7yUjBxkDgbIPp+otE+iFtX8dexPo/wO9tfk+PrGlzknXXGxwloGUKPE5GXjNdHNYP6s6Vw==
X-Received: by 2002:a05:620a:44c5:b0:7ac:bc66:5efb with SMTP id af79cd13be357-7c76c9d7073mr2383378785a.27.1744019301922;
        Mon, 07 Apr 2025 02:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:12 +0300
Subject: [PATCH v6 07/13] llvm: forcibly disable __isoc23_strtol usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-7-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RoeDgrXWbl0DWU+ZsZnz55B4wR12rhBupFa3dHD2qU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859XP4zyvyTM11IhaTAzJYbxIC2OmoBHeazVK
 4lX48cVC6SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVwAKCRCLPIo+Aiko
 1V9KB/9bDazRoKilKRQzKMr/2XJ9c4sSJb8MiJ1SLk7i1hBcMDY2KjmGtgfnjrBfipxopCCPTGS
 P7UnY2QZsuPX/NAuXabKbq6rieHdPE0VZGAEFha1oUAVpgcPq9LCfaxrAYQjiSvDfx57ozIPkSx
 ZJfPHJtXnbtbkOE/TVGjZoxGsg9hgIMHQHgDGXJCRfzcc1R+/4x4xyW//QU89fUla00muPxIpzT
 3vFoDidrcGVFOz2fx7JSr1UECNKOwdHuW1eTeLyCo69eiO1YgjSvm5+rXJO0KuRFLrHCfwYqCxX
 Oujg8nImkKUEqU49s3481tHBocby5o+tOaeDEyykT8ZKWXfk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f39f67 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=veAX93dYt0YcDQAWncMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Qiz2l_711ltAvJjld9dZD8Q62EQSD6q6
X-Proofpoint-ORIG-GUID: Qiz2l_711ltAvJjld9dZD8Q62EQSD6q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=569
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214436

In the multiconfig builds the llvm-native build can get reused from the
sstate cache with uninative being bypassed. This can result in the
undefined __isoc23_strtol symbols (which are supported by the uninative,
but not by the host library).

In order to prevent such link issues, forcibly disable usage of C23
strtol functions inside the native LLVM build.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm/isoc23.h  | 11 +++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm/isoc23.h b/meta/recipes-devtools/llvm/llvm/isoc23.h
new file mode 100644
index 0000000000000000000000000000000000000000..b6738b6aaeb4e140aebad37ba0efb48a29cfac9b
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/isoc23.h
@@ -0,0 +1,11 @@
+/*
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ * SPDX-License-Identifier: Apache-2.0-with-LLVM-exception
+ */
+#include <features.h>
+
+#undef __GLIBC_USE_C23_STRTOL
+#define __GLIBC_USE_C23_STRTOL 0
+
+#undef __GLIBC_USE_C2X_STRTOL
+#define __GLIBC_USE_C2X_STRTOL 0
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index b95473c88b64961cb6ae2f4ace14aac4600cf98e..69f19aee59388f92c254c1f049622845713f4e94 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
+           file://isoc23.h \
            "
 SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
@@ -71,6 +72,9 @@ LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
+
+BUILD_CPPFLAGS += "-include ${UNPACKDIR}/isoc23.h"
+
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
                   -DLLVM_ENABLE_PIC=ON \

-- 
2.39.5


