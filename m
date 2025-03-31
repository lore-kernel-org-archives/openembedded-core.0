Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2447AC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50728.1743423737042365665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=owx3V0It;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6l5Ao014789
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BSexOko/5StJuFC2m9cvS9JrIelUROENlLEunw+ajo=; b=owx3V0Itgsj//qPP
	HLUdf99ofcyTcOnVjFZ1Fwr2Hjg2i3wy1gZzwKY34YrlB0TpRQIUffFKjEL/+M4d
	Kh0nWA2GOCpUW5P7j2z4egFscw8bb2OxzqWI7kSn+B/oZ2rErFrDbp5oorjeDz4q
	crpQ5JmSdMSK2kgNp1VtW4KrlFmWch96pELXMXPWR3+NGntsRdRak5Ia3+mn6Gix
	5PCy1R5Y82r5ohK5AP0fFDiKmE5ttuvzhyF+we7wjzIbZp3zHbbPMh6fGXjVNXNE
	8Ul6ljCPAoLiLkhyNi82L7SQkJdD/1nbhTdR1bIyGXq7vDEttgoCNlhtmM+SDZtb
	WzvAOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nvbxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so677710685a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423735; x=1744028535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BSexOko/5StJuFC2m9cvS9JrIelUROENlLEunw+ajo=;
        b=DQ0za3Z4jGcv57Z3mEQl6l5aYBOhBR/PVcWqeslGaXfRACL4Y20kbLsvmsHX4ELgax
         0Y9BUaMaKxsltSCWJHZTSBhlE6NIWQcWXByOqIzBz4PacDfpuFuDGkHcl4oQjo58Y99P
         BjHVinc9me6VQNOhnTvQlquBO0nwmuMgeglsE8ZjJNfvWifKHswcUrPWN3iZVK4BNPVJ
         0kP9BrsaVeiB1RBfiOToSA75eyM9tnFVgdceQ6xWD6VMvpoCd57HL4lf+O8wksfLp/0p
         nkTj6urc4IYwr/sEnCtWhcOhpAyn32CuOKR4RCHqgDoz/eeeWhjF3zhxqeUTrhbVcJrg
         I7XA==
X-Gm-Message-State: AOJu0YymwVv2RL/zRUQj7h+NX7/dUcnwLGDfwhU/+dE1oK+ZggtVRW4r
	ZCI/lXBd963CWjgtdZZyGMEm5EleKYNSYbpeUwRu8mL0P9vAyM82rmyY3k81qmI5u9LIqKKK5OS
	ism7t2gKErGxYcLxXM7ZiWEkXDNXrFY8S88PmauTpsJEUFManXJFMIvrKi8sidnZMVc7gKeyxrM
	DNW7u72u963hXSGGWb
X-Gm-Gg: ASbGnctvEv+8QkU6pUUzhKswNjxAuNFHKGYGZdTqQXqGzz87+2dYO5+Z8ZWT8XbYaI7
	qe92gcp/Ld1yMYturaB/BvK3QYjvUe8oMt6uDnTPOUeWpfZb2/3c2yV8a0t7tTGaRusKRMg2vsf
	LNjUhXcIqajZ8I6BBwM91nWxL1aB1sQsiBoLDJsbr0DBsrz6tNoJnLObjXUdoAw1PuXuaSHUnJ2
	WZ/RTUxN9cs2lSySZAuWrQ+7xYkY+Md4Gv3QtQWe4/ZNO0ZCEvGGxhfBTZL2KJgIhQJNJqY4jXe
	zhSgTVNSpzgABDc5vMEQqE0Q4MJjfmrFVqA6+02wA1/7Z3lfQMs2rS4p1JecDjlW9yHq5DjFob9
	GlnkmWSgd0j6VltdXV9Be2cCH2AXC
X-Received: by 2002:a05:620a:40d4:b0:7c5:cd94:adc with SMTP id af79cd13be357-7c68e988f11mr1297253785a.21.1743423734828;
        Mon, 31 Mar 2025 05:22:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIoPhXA4f0LA/RO5Wzuvsd6LE6xSs7SkGKVDd3uVAprQDlmGbb4rGCAzJhLHFb+EEcojdUYw==
X-Received: by 2002:a05:620a:40d4:b0:7c5:cd94:adc with SMTP id af79cd13be357-7c68e988f11mr1297249585a.21.1743423734390;
        Mon, 31 Mar 2025 05:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:22:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:42 +0300
Subject: [PATCH v4 9/9] mesa: add support for RustiCL under PACKAGECONFIG
 "opencl"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250331-mesa-25-v4-9-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7665;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZzUi2ZKE0ttzGjoSROzlRIsSxV878nok71c1sxPp/k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojXfQQCAocXo9/qkYrpJjuXiDjh/m8ky+fCc
 +klRr9QCy6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1wAKCRCLPIo+Aiko
 1SDmCACpUZBqt/FhjlyhooD9WddnlbJBVMuOT0LRgaYwS3VXw1iWFxl7Wapa8NrBaHLT75oAftb
 WAMqlShavF2eHhDm5VrDGHef6RKL4pnGHgagmPo4T62h18uy72r3C9CFR7KVBH7UzS58ajLnRFC
 qe3k4lREQR9a8j8QQt8kJ6OD5ONqeMmAFC6Han3+v8cvIZd5f5/SpFce5KqIsdX/VZX0dysYaPT
 R8AH7nTmem9NBh9IuCCR5+DLWqeZjLkOf1zPqrsCnXcweCJLdnRdmwqp0RPKv3fCNaroCZ+NX/e
 plIMn4hs01JmGpJYgcHIHLVwRSj2b8DdKdITDlTXEUXXQxO5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IaIabJROFkXdnncy5tCY_uMzfWKc1yLM
X-Proofpoint-GUID: IaIabJROFkXdnncy5tCY_uMzfWKc1yLM
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67ea88f8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NIk5LsUNV1RiDaC6tVwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52V6l5Ao014789
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213978

From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>

Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
(newer one). Extend the "opencl" package config to include both
implementations into the libopencl-mesa (-dev) packages. As the Clover
implementation is in maintenance mode and is expected to be removed at
Mesa 25.2, it doesn't make sense to split the packages or to provide
two config options.

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
[DB: merged "rusticl" and "clover" back to "opencl", reworked rust inheri=
tance]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ++++++++++++++++=
++++++
 meta/recipes-graphics/mesa/mesa.inc                | 20 +++++--
 2 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..9506a43376857afdf271aed3e=
08b8f0e3b54081b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compila=
tion-arguments-to-LLVM-.patch
@@ -0,0 +1,67 @@
+From b9cf34f39ca7e7546508ce2ab1f053edef5fc201 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 26 Mar 2025 17:47:09 +0200
+Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bi=
ndgen
+ invocation
+
+Correctly generating LLVM bindings requires several croos-compilation
+arguments. Provide them to rust.bindgen(). Karol Herbst on IRC suggested
+that a proper fix should be to fix meson's rust.bindgen() to support
+cross-compilation. Carry this patch until meson is fixed.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Link: https://github.com/mesonbuild/meson/issues/13591
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ meson_options.txt                         | 14 ++++++++++++++
+ src/gallium/frontends/rusticl/meson.build |  8 ++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 0147cafcb146..f73e83fded18 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -796,3 +796,17 @@ option(
+   value : false,
+   description : 'Install the drivers internal shader compilers (if need=
ed for cross builds).'
+ )
++
++option(
++  'bindgen-includedir',
++  type : 'string',
++  value : '',
++  description : 'system-wide include directory for cross-generating LLV=
M bindings'
++  )
++
++option(
++  'bindgen-target',
++  type : 'string',
++  value : '',
++  description : 'Clang target for cross-generating LLVM bindings'
++  )
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/fro=
ntends/rusticl/meson.build
+index a5d1dcf3abb9..480c220b7f5f 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -180,13 +180,21 @@ rusticl_opencl_gen =3D static_library(
+   ],
+ )
+=20
++bindgen_c_args =3D []
++bindgen_target =3D get_option('bindgen-target')
++if bindgen_target !=3D ''
++  bindgen_c_args +=3D [ '-target', bindgen_target ]
++endif
++
+ rusticl_llvm_bindings_rs =3D rust.bindgen(
+   input : 'rusticl_llvm_bindings.hpp',
+   output : 'rusticl_llvm_bindings.rs',
+   c_args : [
+     rusticl_bindgen_c_args,
+     pre_args,
++    bindgen_c_args,
+   ],
++  include_directories : get_option('bindgen-includedir'),
+   dependencies : [
+     dep_clang,
+     dep_llvm,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 3518ac488d46012652b62094b913e5ae8ce9b111..4db08530bac9fd27a62ad9b8a=
336cfe072b0c20f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE =3D "2"
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
+           file://0001-rusticl-provide-cross-compilation-arguments-to-LL=
VM-.patch \
 "
=20
 SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
@@ -45,7 +46,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -84,6 +85,9 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', '', '1', d)}"
+
 PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm r600"
@@ -139,9 +143,15 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${@['-gnu', ''][d.getVar(=
'LIBCEXTENSION') !=3D '']}"
+
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCON=
FIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd,-Dgallium-opencl=3Ddis=
abled,"
+PACKAGECONFIG[opencl] =3D " \
+    -Dgallium-opencl=3Dicd -Dgallium-rusticl=3Dtrue -Dbindgen-includedir=
=3D${STAGING_INCDIR} -Dbindgen-target=3D${BINDGEN_TARGET},\
+    -Dgallium-opencl=3Ddisabled -Dgallium-rusticl=3Dfalse, \
+    bindgen-cli-native \
+"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
@@ -241,7 +251,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
 RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
 ALLOW_EMPTY:libgles3-mesa =3D "1"
=20
-RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -347,7 +357,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium=
-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pi=
pe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi =3D "${libdir}/libglapi.so.*"
 FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
 FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
@@ -361,7 +371,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES $=
{libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
-FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-mesa-dev =3D "${libdir}/lib*OpenCL.so"
 FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \

--=20
2.39.5


