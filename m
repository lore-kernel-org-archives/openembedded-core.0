Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8871FC3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.11444.1743607121666986947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eNP4TjMj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532A5cEp027462
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGzKGdWsXCIEoMfx0xDXW8YGQ1FxQ9ybqswkWOYoie4=; b=eNP4TjMjVU8asUC3
	2XmNjfi4fUBCpr+0JXTnLYii+H6CzIPp5GjN+/LdENlCkykWbctFuvmHzlyNgy9k
	xLkP0nFQqowZOnlt9fJNBif49duPZ3J6NqJpOJW3eUmMf92bueHBwR6V7ToDMaxa
	LowVqz+EYrmwB2exGgc9GXySlLDAI00RKGs7eUrYRZrj9fv5stRX5mCPii2na/+m
	tIxM9IzglrLdRZt6T1RMLvhlVA/juXeuyAziOnctu3vO07Mt1X23JU++AbLpFFQ1
	8Ai5MxQsof2rOIING4TE4GFkrMMYEqtNkIxKkj8D3J6dAiCYvubs1RdhBt/d+DDc
	vZft5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a0tyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c548e16909so636024785a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607119; x=1744211919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGzKGdWsXCIEoMfx0xDXW8YGQ1FxQ9ybqswkWOYoie4=;
        b=QtDAuUs8Qo91HreeTBJfiaoSTH3D6dMHTAWZoWnMSikkr/vIrvenDUDRUERgd23S04
         PCGFqNj3F2DbWi7qWwh0m4cS+LXfmYMIVjYwnseo+/BGb/9C1s9rA+7pqNYyoHObZop9
         CdS7pXekI9TIgZtmxRHQq7E4aaMrFyZcTNxyaeVFnR3DyR51xLbodTn3864vSerLCh/l
         leKcI0chih/DwXC4bWpUuex9UO61oiRXQBIDdpvqdobXMyXn4XD2lWnvDWeV/aBsvkzC
         1inQk0EKz7AXNScvKPoUbkbSZ0WvKbu/lAqLP3RlCijSLcG34PKAEq0hBNbMvfRGkUv9
         SL/Q==
X-Gm-Message-State: AOJu0YxxsoVgRwhdJkDG/n5rg7PQS7cfNOPHGfUyCC5quiKPJhCOQdru
	1XP2tbLnOI7uLtwM0skAjN94stvGdITR2yTrHo1crqEwKCBvDRGyx2Qy+or+QGf1gIqexrRS5fg
	lpj7V85OnKZmRpwHHKRhNlCumthTp9G2/iEe9neWOpFq9pPPJ0ceZ196m2kEF3nneVuEr7kE+LQ
	8+7aZMRI7RD00=
X-Gm-Gg: ASbGncsz8wMQR0Wi/ytQGMz22FIMSepj2R3dCH+337JQTKW6ecxmciPknJQRvyQ2QYL
	V3gtVFJc5T7fLICC3lg/KbxFLHsy6E8K+eJdnQRlDACKmPbIogyBsxD/FKHxPSrAItEtnB/Osli
	W506vsqIORZeByaAkQOH9mQr3+/Gvq5lYYzdwgBicmzurd88N2t2H9zuKxonW+f02vV92kxv/O0
	i5tb0g+kM/B98IO4OCEHb96FyluIzWx/G1xXLr95Z0XA8D0avHC3B4k6Nr+R3mKhTae0YtpgFgC
	ILaXv2gAVajlrEupxBF9iBofez4zAh9gGtmXuFL1B2Zgk/IADjPNwRQNDE0GBPAupLOJCAmW38f
	LN8c26kQlRJ6sy6y1+7X6NCHWyJmf
X-Received: by 2002:a05:620a:408b:b0:7c5:3b8d:9f37 with SMTP id af79cd13be357-7c69072f366mr2491941185a.30.1743607118834;
        Wed, 02 Apr 2025 08:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoEiJii0eIz4lg6GjO8gGXhc2pt9p2BoI4AawHAPUpRG8GGdfkaHdkZkrU1H7mjExCJ6EeLA==
X-Received: by 2002:a05:620a:408b:b0:7c5:3b8d:9f37 with SMTP id af79cd13be357-7c69072f366mr2491937685a.30.1743607118383;
        Wed, 02 Apr 2025 08:18:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:29 +0300
Subject: [PATCH v5 07/11] llvm: support building libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-7-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C+xYrmK/8CodNbx2KvQadx/2wtw+OyF48z2wnluwEHo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVBMmIqsdj0nnKBgS0XY1CoHq2lePe45jmbm
 Bcwx6ldOs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQQAKCRCLPIo+Aiko
 1VQiB/4nS8gcLv7iMgxcH6r0iwrgbpPhpeV5/rCORa34JxQON+btny+VJcpId6WZEfHcYd0fmJT
 kRd/rww0MpC6NFeND6E4ZRe6EhKCmXCtIuXQ1U2fhwCsCxJ3RlgYc+wmagW6ytRDZ1BFpjl6lqW
 klsJSttGiiPmsEvRlgv598bxbZrwvu066a6TPufiq4ncyAxWlVev+HdM4Yo41urOdOrtDecVSi3
 N5rBW3nlqNyXaIeM9njgDcnVA4XjDoya3Aaq5D5NPY4DokqIOsP18XmCWwuJ+hJlTvdKi/Fe4+d
 b78/XQD++me0rMbXU9ijjYdO+OpYqH7kS57W3NHKptTaPD63
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ed5550 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=-uxSO3zEkdLPsdym20oA:9 a=QEXdDO2ut3YA:10 a=a97rIl97qucA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-ORIG-GUID: DmoNloOowyn0RuJX6UNlKfWPMFxBl6qO
X-Proofpoint-GUID: DmoNloOowyn0RuJX6UNlKfWPMFxBl6qO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=611 mlxscore=0 bulkscore=18 spamscore=0
 priorityscore=1501 lowpriorityscore=18 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214275

Current Mesa requires libclc in order to build Intel Gallium (iris) or
Vulkan drivers. In order to unblock Mesa updates, build libclc as a part
of the LLVM build process.

The libclc requires Clang for building, so enable Clang too via
LLVM_PROJECTS. Remove clang from the DESTDIR, so that it is only used
during the build process. Proper handling of Clang as a toolchain is a
separate and much more complicated topic. Clang is enabled for all kinds
of builds as it is a requirement for libclc to build.

Cleaning of ${datadir} has been moved to happen at the end of do_install
to be performed after do clang removal and made not to fail if
${datadir} is not empty, as libclc install files into that location.

NVPTX and SPIRV targets are enabled since they are required for the
libclc to link.

LLVM_NATIVE_TOOL_DIR is used to pass a path to the native tools built
via llvm-native instead of building them during the target and/or
nativesdk build.

The llvm-clc package is set to RPROVIDE libclc (and the recipe also
PROVIDEs libclc) in order to be compatible with the meta-clang packages
(and to be future-compatible with the split package after proper Clang
support is introduced to OE-Core).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 40 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index e164dc54f4cb7cec92689b3c646aef83c0f0bbd6..df486d6502b7ce11d1db0b48a3936097c289f18a 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -58,19 +58,22 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= "libllvm"
+PACKAGECONFIG ??= "libllvm libclc"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
+PACKAGECONFIG[libclc] = ""
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
+LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
@@ -84,6 +87,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                  "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -91,6 +95,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -98,6 +103,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 # patch out build host paths for reproducibility
@@ -126,17 +132,39 @@ do_install() {
 
         # Remove opt-viewer: https://llvm.org/docs/Remarks.html
         rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
 
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
     fi
+
+    # Remove clang bits from target packages, we are not providing it for the system
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
+        rm -f  ${D}${bindir}/clang*
+        rm -fr ${D}${libdir}/clang
+        rm -fr ${D}${datadir}/clang
+
+        rm -f  ${D}${bindir}/scan*
+        rm -fr ${D}${libdir}/libscanbuild
+        rm -fr ${D}${datadir}/scan-build
+        rm -fr ${D}${datadir}/scan-view
+
+        rm -fr ${D}${libdir}/libear
+    fi
+
+    # Try to clean up datadir if it is empty, but don't fail if there are
+    # libclc files there
+    rmdir ${D}${datadir} || true
 }
 
 do_install:append:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
 	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} ; then
+            install -D -m 0755 ${B}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
+        fi
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
@@ -148,9 +176,11 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
+RPROVIDES:${PN}-clc += "libclc"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -183,6 +213,8 @@ FILES:${PN}-staticdev += "\
     ${libdir}/*.a \
 "
 
+FILES:${PN}-clc += "${datadir}/clc"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.39.5


