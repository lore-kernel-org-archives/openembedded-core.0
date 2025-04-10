Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68228C369A1
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25741.1744253717576541902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hP+mUuod;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HHmLs015876
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpyCRGtcHT9u2f9zoR5Gemn8nTvD6XpU8NqkpILzHCA=; b=hP+mUuod411lL+1L
	aJnpnhUd5i28jpk/idFzqC8dXB182luuw1Xh1ZGSi84FCCahJ5DlYIR1NbD5ixoG
	5rbiiMcE9ROxfIBUXKZwP8P87TjRyCDCKULFD6lZ8catUVwxmtByCF6KH7cPJiJj
	X/rY2yhx2jGJaUsU4YGfsPKm3eW7eewTzFD/SQOnJ4aEwMwmA1cJcWe4zjA/0GhL
	GaLR4OImLRwGBaiEPO6STuUNCmJoGKDtZEzuCRn5a9iDBJM6gCrisnLKfip1vUxR
	zn5pVKnovfjjRYw1Ih5XEnZtRogIBJPgmy8ExO37+rzdDKVXgtVulAwaCDkZOiSa
	3y9qLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2wc54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c793d573b2so68361885a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253715; x=1744858515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpyCRGtcHT9u2f9zoR5Gemn8nTvD6XpU8NqkpILzHCA=;
        b=xHiaNIik0B8ZMYKz4XBT41M2BGle77s0hmm0bb5FdXm4x8x1z07F3HliGTLpT4Q3CS
         zLswPvzP4kM831j37bczFasS9whtEf6XpvestN4YUL3U5C087IffyRSR/ulBY0AOqUgQ
         cf6xDN3e3Q6fZYtElCjQZ94l/QINMT7iIKMxrvStM9yalnat3BBwiN0+rTIp4knig8mM
         RAEbjWH4ar2LF8nVDdU2rnVqrtdf5WWHWrcyBcDjv6pKOdLcsn25SSI/FINS5u9HBaRZ
         79fk/WZ2tDK1O8cLIxLMyCgeU++onQKyxeHBChbVt4WYufDQcUmY08IgvRnTY5tUwLKD
         1syg==
X-Gm-Message-State: AOJu0YxhCOtNnPX3EadaXlcb56xWWaJlG6/rZd577t+KUXd7zRl4buDd
	G3gJBbgXjttPRNTmGX156POB23QjvqYVO0i4gFeGGuBpc14Q6cuSEZ210y9vcnxcGlSobgnmIBH
	sUsIswzU1txhnB26AqEH/4bppElSWS/S2AZ/2zp4YS/LBUt+Jzo4rqREApEmGEStVSJtMb5/GVy
	TacAuLzEilW4A=
X-Gm-Gg: ASbGnctu1Hc12DnuBo/ebDJlImIP+zLY8PrfGknZd+TReuRcIZO4qkd4R162WtTfdMA
	KdmAU4QKaFG+f3sCaPxqeI/GY6Qtt3cgrdlD/ivCZH40pF0h/IkscR1UdI9i2ClRT7/dZHPN/g/
	Ct56Htvm1dGydR665v5v58a/BkZQhbMOHE8ILnt8v+Bmk0A+vPKmJubi0966XeuZkizCuGhYTw6
	RNPY4LtQxeS78J58isXeahydPxmt4djfBqh/bUZD23dkAjZb+y4U1i3umsJlzlcVbR/+WGdUysz
	U1jEMYQPOfeliDIqVdwE6xrifCrdF0bUiPlfD0leK16nYn0HLDkDGtfyJMvzyB28+a9XWLhTQIi
	wMqTVG1TvK3fxWasxYljQMYsG
X-Received: by 2002:a05:620a:d8c:b0:7c5:4de8:bf71 with SMTP id af79cd13be357-7c7a76cfd8dmr173703385a.50.1744253715521;
        Wed, 09 Apr 2025 19:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rE2cD9PhrNwvJ1INRabwY5/clVc67CuffmDYBGO4cV0NwKNku21rCFx9cFBfXJE61WNqNw==
X-Received: by 2002:a05:620a:d8c:b0:7c5:4de8:bf71 with SMTP id af79cd13be357-7c7a76cfd8dmr173701285a.50.1744253715110;
        Wed, 09 Apr 2025 19:55:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:55:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:48 +0300
Subject: [PATCH v7 09/12] llvm: enable more targets to build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-9-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gf/klTJAuzqFxvlsmmSlxYEaZncPTBvpqRvuJlWP4CQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLy/NWH+FWCEZ+GiYdfRfu/zYV9x/8+VcvWG
 NTiU5XZHmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8gAKCRCLPIo+Aiko
 1btPCACgCYjk3KiI3zQkP5xrev7GPO7FN546XxQNFZULhIVkMGZlRxHYHHxuEPi+tKXuT++oVv9
 4vEOkg2aIroIJ4S8O3EHLXx6w8ThVzd411RwYN1jJU3WFr9r1U86TBXDbrEicFGVinWuvAeu3aS
 ykXDEy2WZEZXI8Wh57f3TFnXi6CRoEpjutvFxo68A/qbGSXN0DjpZEvIY9LlksNaphN0ZelSlwa
 YXWnzxcPqat4zaEGl9GnOdcQzXWR+PW9bqSgNtrvJ5cdGbkVQUMABoIo4IJF0w6iX/NxPqot+WC
 tRZd9bqK332vQ0oqjGouw+avMb/Cjyg36SmB8QV1F4yC0Hir
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BIl7MqgHMtBmPM1Bwz1gu7iurX9YE5jC
X-Proofpoint-GUID: BIl7MqgHMtBmPM1Bwz1gu7iurX9YE5jC
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f73315 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4hFqx4qmI6RFarhmnyUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=914 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214611

Pull in the list of targets being enabled by meta-clang in order to
make the libllvm from OE-Core runtime compatible with the one built by
the clang recipe inside meta-clang.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index d1a7d8d7e9144beda8f6195aff096521632c466c..f837f1b2896e3252a32e3ca76ce6add3544c33a1 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -54,24 +54,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-def get_llvm_arch(bb, d, arch_var):
-    import re
-    a = d.getVar(arch_var)
-    if   re.match(r'(i.86|athlon|x86.64)$', a):         return 'X86'
-    elif re.match(r'arm$', a):                          return 'ARM'
-    elif re.match(r'armeb$', a):                        return 'ARM'
-    elif re.match(r'aarch64$', a):                      return 'AArch64'
-    elif re.match(r'aarch64_be$', a):                   return 'AArch64'
-    elif re.match(r'loongarch(32|64|)$', a):            return 'LoongArch'
-    elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match(r'riscv(32|64)(eb|)$', a):            return 'RISCV'
-    elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    else:
-        raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
-
-def get_llvm_host_arch(bb, d):
-    return get_llvm_arch(bb, d, 'HOST_ARCH')
-
 PACKAGECONFIG ??= "libllvm libclc spirv-llvm-translator"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
@@ -82,7 +64,7 @@ PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"

-- 
2.39.5


