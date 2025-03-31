Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DFAC36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50718.1743423725183468529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VPyBP00R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kdrh014217
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IjqSc+Fk83D4RwHkQFBr/9eJ7T+XtKJ/BfYvy6m2K9M=; b=VPyBP00R2rUnHdrl
	G8Tf+FxVSFFrCeNpBIu57bBOHeR/ti7+ipT71Co+pfZGL6GFTOnTgQLo7Fgt090S
	O/NHvwUz43n3S/P6qvQPVCe1gzPeY2CCDekeS422nR9R60T28iTiWj5HjHTgdWLm
	sI3835CxPGRhu8rb4kkH/f23UMM2huj1ZGJIvQknggoZImyX/gIjaM7nSZlN5cDH
	8JwO3AI+FDpVK/BdxPAh7VIPJ7XXbQklY+MQbuNuIKQ0Wy9dJRu22OPtEHqhlQHf
	QS8c0ASijk61+qVgBpIEAXjAi+/aUGEI9f2V6qlCI8KcIgJBCNXXkcIaBjn+l7tV
	+WEwow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nvbxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d9d8890fso979889085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423723; x=1744028523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjqSc+Fk83D4RwHkQFBr/9eJ7T+XtKJ/BfYvy6m2K9M=;
        b=Y34L26WQaLLqbEM7jdfczlnB6ZIC9Gyt5gWqZx2a8k6T/18FYnKAvBKZrJWhIws/I+
         f7VfFMzMzW20/enDqoc5gzjdy4TDVxjAS8pcWB+KB3oGWV50JR0KpjUhQagbjTA6kxOk
         VlDv02FGB1jwgdGrhBCKrK3kme7X8GBQgI4nYwe2dx7CVYM/gMhv7sCAI9RKeMn6HVAS
         gKUzrw63kgDET7Da26FkIvQgol2zQ9JpMa+2+LdOuB6Fhj297UERUZd7z7GvAJjXvBRf
         v2y9s2pbYvqD4lpjroIq5IPecgRqPFYrRF0u8aJqEgl8SYTF3iIfYiPTAwnWrI+3FnIe
         f8aw==
X-Gm-Message-State: AOJu0YyJXHHqje8XYSFIAnVdVT65cGu4OkYPl8tHXXh9Db8jcglA+k2t
	7xQ84mw7THXM1NZtREMd+zkgkpQGMMn4SPZwhO5ZbqFVenQZSjoTk1Er1UorVv8YpLh+66zRtYA
	Utp1+Mj0QTqUzn+yWnFpEubhUa6UhtCoLF2rkEX0I83I/KMoZli0JCpz9ezAcqGJs24ApMvna7Q
	wmdDFjEmGA8rEK+4PI
X-Gm-Gg: ASbGncst5qoGtR7/73elXQMan72kQa2rCZ4hgtjhrGP00Ry/X6nRXo8KYPXalyIaxja
	cKqpVXW18OoyCYeQMrBWkXPonPTNWi92e551mO1ksEX5YhgjboAaiEKBmO2n8U++D56NKe9Rans
	rbvIUnxCK7/pk15L1lsb9pp51MZ/EYwRrtngbSs7+x5Drdv25BUt2t3rN4r9pNtjtAkXS6wRSWM
	g67lc0mTdNLl4vBu+Q+3ry+HE0aqNFJq6CdMyW5iNGKlisC/PHxo0414AxPdEgVIJAj7lC5Q7/X
	m79C0HybRtMfoUxrKRIvUdWMbftYJ/dlXWhfmdUKpxNcIVoR5xXSO7aKoe+zcOSafrUq2AeYWQp
	rsJJXDcCZH5o6waN1JqU7u+efzW25
X-Received: by 2002:a05:620a:244e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c5f9b5fda5mr1793337085a.3.1743423722827;
        Mon, 31 Mar 2025 05:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFyOUJ19infZMTQDVFVl99nH/u3wttJikrvIqGRvmxgInVLDeXKRbg+lD8NLkG5UD1wMbj9A==
X-Received: by 2002:a05:620a:244e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c5f9b5fda5mr1793334885a.3.1743423722478;
        Mon, 31 Mar 2025 05:22:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:38 +0300
Subject: [PATCH v4 5/9] llvm: support building libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-5-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0ZJXg2kNIZBkrk7jkVjK5Iy/0e7Ebj4o/NmdEADcNBk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojXOpTXqSEpLtP+ctA3o7EClQ7UFl2ZrUW1e
 0JlZfRX0+uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1wAKCRCLPIo+Aiko
 1SucB/93skNrrnIUkXhyV/BR2u7uG2m7Q7CBHWo7DEGqzht/qre0XYKHdJT+hwP5qc5G/Y/gy4d
 fSVogiwnetmEuzlAsphsBEmPJ1fubyaGJpovNayDygbCI0uYDI5pPldY3AoGdKJh/NaCoPYPn4h
 6U9CmK2eEMcbN/CYF1EOjpFv0yZqd+nOqjPoOVYl+By0f0YjJqiqXgLgVnC/vbttLFM65U/w2QH
 iVmUB8YAhv5qeZ4qZvfbB0jYz9478d2cN9EEGBR93oKFUEK8mJJcgGZbZyLS4qgpe0RGsF7b+vC
 tJjy9HajiQWtkFErM4DDvw2D/tN62Y6AE5P4NA9wItg/Rsw1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ctUhwRUUhtPdkv5ARylo84Pb6AyKRVLg
X-Proofpoint-GUID: ctUhwRUUhtPdkv5ARylo84Pb6AyKRVLg
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67ea88ec cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=-uxSO3zEkdLPsdym20oA:9 a=QEXdDO2ut3YA:10 a=a97rIl97qucA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=39
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=39 mlxlogscore=638 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213974

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
index c1c4138e8cc16b8b4ddfa3355a6141b5fede569d..3ae920122248c1aa33b53bc34ecb8b5adc3b1c90 100644
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
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
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


