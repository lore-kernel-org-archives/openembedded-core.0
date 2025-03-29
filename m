Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672E6C36011
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17859.1743278857156151411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d9fmXAYD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJw22O020929
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCYuqQAwm+qvuFDecmbrJ/S6B3psnZkne+2Zb7bVK1k=; b=d9fmXAYDYxWhv0G4
	7lqY84HznJxHZIsIiHZmDKS2asdqhZkOPAL/8ikDzchJCvHnjFnCjAAE434FJHC9
	7nnhfHXqybscH8XM0+k05aSDeGiY7E42IHbWAWo3JZQvDxWqsFWeBaj4jsiBXepo
	RWUroNwV0kW0gc7qLvAT6dWnXLcJzUPi1QF9wWCeBtjetjGXD1aG9HLwn7Nm5ZTE
	BdnUlFZPQyj365nlxB1xyEVaJZvKRPwjRGjY7aaPGq/HHy0/lDU2dr5tUsWT1vYc
	AXsehLBHlgd7UTbx+7lstoH/1nhumwSrlXg6nwiZsz4ZbXq+wUc9RNVkC2zDCwoJ
	+Io8QQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p98917rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so871653985a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278855; x=1743883655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCYuqQAwm+qvuFDecmbrJ/S6B3psnZkne+2Zb7bVK1k=;
        b=Sfbm+bd0mRBiCgof2EfwcMkxlQVBUluheeC8bMVV8fBFip7lDPLfxVm9XL/gFQ9oyv
         FdZI4dAsOgnNqUVjBb8RV3M2qY5Swr2LCQ/g/fExv2bloBPcGdoHyEzyRMMBa8LQ1Mmh
         9rAlsaar8UfjWMpUjIbBfQMIUN5aTzjNcyJKNaeuKwra9QSnFPWh2rHr+37QkdJiXSs/
         7xQCADZcVxhpV6Qz28JDf/pkrL/4uVNUa5cmaohOjfRTCX7ihv72yNmsW5y4XjuXm8FK
         qbc5DJkb66CTuiLRY8eNvamNyHammyoBXJscbe046KuQFGrCrqOodNxTNPwFbjTCPylJ
         vhRw==
X-Gm-Message-State: AOJu0Yy+VdKg7BCIQevfmebJ5WLTXaWhuXeRRsHzfdpW5eBBRQd69N2M
	nYBWSd1rVmkBy6ogeVPaV864MMFQ/VlK31M7Xjp+EwU+CIBoLDnezSbltyrvLxyUsI8xAlYWy6Y
	XsX6DvIwi3NMSAouWmyf0CsskwUu16aCbwd1GuhOCHW/EsxQNKlzdDEQJwGRtjHI/zoYiUZlO0m
	gPK/VpJvX5Tjs=
X-Gm-Gg: ASbGncv4c2YHPKyQCcfzFqbvU5+4n/E8SWsJFU9vlr+wyGQbQ6LW9pOW49vWQH2TXow
	4h73jGC/5AKBQIdFNuMomwc/JobotMCV9EoAZcBH3z6DhMNkCNfPTMNMQH73fkOKJiWwhr4ROpp
	73jfqhmDmt6Yaw/6hOu1NIHXYIS9eZCyiqUbcnmr48gKknntHoUuCrZq3w9b4vEeGjZf4K/tq24
	H7j3zBY+qIt7firCCzB5vjaf4vCIUZBkqn8QGghT7VAsrFAno6PZFSVfnbE+AsmvDEyRCW+Y+ng
	rb5l82T8iv8P2G+yo7to0lU7a/E4coc5LBq77LPZmDuF5jqj23wM2it57OCW2B3mcNVFaUASaBG
	PD9SNittEHyiCcffSHmEk9MD/2u2t
X-Received: by 2002:a05:620a:4555:b0:7c5:49b7:2372 with SMTP id af79cd13be357-7c6865e89edmr460006985a.18.1743278855292;
        Sat, 29 Mar 2025 13:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5QmLwBP1mut0pbUOIRMse+CQs4OyWeiOj9oOivpBuQMP9KBKTzftUJ9zF/O8dWb7JXNXU2g==
X-Received: by 2002:a05:620a:4555:b0:7c5:49b7:2372 with SMTP id af79cd13be357-7c6865e89edmr460004685a.18.1743278854865;
        Sat, 29 Mar 2025 13:07:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:16 +0200
Subject: [PATCH v3 5/9] llvm: support building libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-5-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6314;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8xUkgvS1f0bc0MUhvxud8dSetE86Xzem5jHgjAcagvg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL02FhDKS6ELItLL4JalDq3HYGspa7134MeN
 khaiicUE92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1VLBCACzuBgwKkQLvHNSDXVj5+k5S+oIEWQnnFiyNH0JH8izEmZ2mKVGVwfVTbK/SVwRqDjT+Cf
 W6eqb6ip3acZnrNWRX7n2gOmBjP0IPYFTl1d1XUAteemePdBDKBU7cYtUi2KYBq0vIoeeiZgFct
 9VhF5C21WVWjeOz7OpYBNUYPnDP3aou1e6ShiGba62bOnn4uoy5WcxDT3eannMEKJ4p3RZgA5qr
 coxS+zNav439gcY5Ha8ZRpEVkK/PZEG8wrzpDbnrO9leZU6Oa7e65ULTFQrO9rIoY78wrHbwIiI
 ks6/SGv/aKg+/ZKR3UVAflk2kVRirN0ejFXo7l+R9ZHB7sUd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e85308 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=-uxSO3zEkdLPsdym20oA:9 a=QEXdDO2ut3YA:10 a=a97rIl97qucA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-GUID: rQW6ou-GXpOutq6Mriz4tSUoNOKzr2F3
X-Proofpoint-ORIG-GUID: rQW6ou-GXpOutq6Mriz4tSUoNOKzr2F3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=609 clxscore=1015 lowpriorityscore=51 spamscore=0
 priorityscore=1501 bulkscore=51 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213899

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
index c1c4138e8cc16b8b4ddfa3355a6141b5fede569d..84345531714baa308077ff55b90d015f6fa167e6 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -56,19 +56,22 @@ def get_llvm_arch(bb, d, arch_var):
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
@@ -82,6 +85,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                  "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -89,6 +93,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -96,6 +101,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 # patch out build host paths for reproducibility
@@ -124,17 +130,39 @@ do_install() {
 
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
@@ -146,9 +174,11 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
+PROVIDES = "libclc"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
+RPROVIDES:${PN}-clc += "libclc"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -181,6 +211,8 @@ FILES:${PN}-staticdev += "\
     ${libdir}/*.a \
 "
 
+FILES:${PN}-clc += "${datadir}/clc"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.39.5


