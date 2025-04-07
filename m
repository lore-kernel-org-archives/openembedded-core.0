Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5553C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42855.1744019309328803360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=StGYA2EY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378drg4016216
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/t3tViSIDVIvvYVCxTFZGLk8Rd+dHOa5r622ZL1d3Bc=; b=StGYA2EY8ZhVLzgm
	rsMBdNzC9GN/kjhV9OGorGLPctuZbOk+Hzg4/durF0Jos/kVRK95eicoP7re9WlH
	5szCdOcH2bRG07PG+USAE5Qhx1fS2WbvX8td6UzUH24xyWGPJhjJwBFFVawwpzRV
	QXYDIMC3+xhP4rg1A5isV/VaEH4+YFJ9NkWCBRt1m2dwwU7YixqqXpKuXpqOJ7me
	0Il4yhnk6LXeR/on+4GwLNmjf1PEZ8HJxt7eMbiNEOZ0I1muCh0WSLVJkjMsgC9D
	H4pT8QQchDkrNXWdYVVHfIR8/sBY2Wv40eKcj/QN7t4XLLC9x2Lx9ftfCOOKSoVr
	hRnjKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgbtmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so928825885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019307; x=1744624107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t3tViSIDVIvvYVCxTFZGLk8Rd+dHOa5r622ZL1d3Bc=;
        b=LlXn+8WILd6nTeEJuCteAlgfuyVxPmQN8SkrYukDKb0yhoARUqe0iZqxvuvePtWIa7
         NunYpRadRrcfz+pKgzwUhorlZxCt1thoOsYoKH5zLUBiA1gTFA3CJkfeZoyWwL/k/2FI
         fMywqwfaPgev0uNCs3yNkQ1WVA/hyZ0SHG8FhdOffPjLEEPg9NuQ2AjfI4/DG2I1ewod
         Ju9cLmMzIefVq6A7d8qc/osk+CA7k5/ZJuMrSimKWzKqCGYmIF0j9v1em7B6wTdq79f7
         fakJq4ycunB4aA6V9nACIeUrSZTqQ7CBMwFZGcpndvuEvzNr41lPsPtwcDepwNfcp4+y
         40PQ==
X-Gm-Message-State: AOJu0YzCMHGcVwr3CumPq2N1CF1CTgLzvLhcM31RO3Gn7v6psdPD83R0
	zAZ7ZDwtLPW0+Ealf1olS3piXufuL1Mcv441ITfmNolGbBdsAu3twau21L5uc1weueIyYh2Yyeu
	xqk3WR7QY7rBZSUjJhSGxVp48JgCmrS4itFreWN8Rzik5ecmQ19eyOF8tAp9WJyHHeyRblDHdYV
	xhITz5BtO6azw=
X-Gm-Gg: ASbGncsa53PRcANzYISko3yDxEacdvbaGTYcM4sdvieJ4GjyyN2VdrbFJqTC62XJTRS
	c0VIRpEHaelTgG9VOskgwDmjV+cUVjIwp6alVT/RIKRST0hAjvVuohxiwa/bs7ix/BI0bk5SHHE
	mtP2FizYuzvtMrWUJOrcL2juVMnglZa9B2PrRoJtzG0div5RpwMxWXoifGwnitqbvSUxYOx/8Qr
	uefJFNSwc5QrBhIFnDTVmhGIIN7zNxYQA4w9TLxcttIhEavy93xc6M/FT3V4gjqozGZ65ToZ+XR
	TKJGlJGxV83cOYgNmO31TtKrhPC65m9XLc+RMcBYrPEStow+r2ItQ7+PcoPh6yS9bO1KBlYPJL4
	yRohA3RkiOA4oj9xmKw5KemDyEAXI
X-Received: by 2002:a05:620a:25cb:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c774d272cemr1479287085a.4.1744019307396;
        Mon, 07 Apr 2025 02:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+lGWPmcz5NRtYCCnivNmg1eWtDA5AuSVpN6FNFJghl0ktm/qkvtMQW02BR9SwCF4XDnGaw==
X-Received: by 2002:a05:620a:25cb:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c774d272cemr1479285585a.4.1744019306994;
        Mon, 07 Apr 2025 02:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:15 +0300
Subject: [PATCH v6 10/13] llvm: enable more targets to build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-10-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6AolG7VyDHWhXWxFoG4CMbI9qXas8lK/IvnEgNGGIJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859YQ7wGVUVz/vI1GU0uwEkjUNz6BmeaOQDHM
 qoCcu5YXjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfWAAKCRCLPIo+Aiko
 1Y1IB/9mMIJ8VpJBttFbYXYsCat6GjQ1KpumURbgkDMgdCS5bKs6pdpVl/SxepEqUXHjEkJ8kx4
 kdPtoznNZ3pk5q6jMB+ejaLsUg2z138qrKloDnlTK0lTVoa7cEb7T8eBIxAJb/VXnUuMuFMWpzV
 +yAl4zNmzmAH8EPAp2/4H7IAe5UF1T0oKcQ7mgIiEl55uLJvM9iRmIqP7gEFJXkrFCJAuF0e879
 2i/BN6uLVU3iH7uAZQPzReXv0KXPgakWqB/XmQmFyBYNW3X//8t8hJrifymd/b5uFQMvqt5tpbP
 e5z0FsUFKecizjjQ2EMmrRE1Oqa5eywSmDlZuBvQVWHP5MxO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f39f6c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4hFqx4qmI6RFarhmnyUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -F4Co1YsTCaUEInNxXwZVjoG6y3ak8dT
X-Proofpoint-GUID: -F4Co1YsTCaUEInNxXwZVjoG6y3ak8dT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=856 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214439

Pull in the list of targets being enabled by meta-clang in order to
make the libllvm from OE-Core runtime compatible with the one built by
the clang recipe inside meta-clang.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 027de04bdd6d340792d1a9ca303dcd508a6d87c4..1c6e9bc48fb832fe67c14ca6d8f93410cb268c00 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -51,24 +51,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 
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
@@ -79,7 +61,7 @@ PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"

-- 
2.39.5


