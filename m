Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C808C36018
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.48796.1743079049716837604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=b/tjw9MC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5ja2J012658
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R408BpbNP8yU6VNZxLumx3rlFUhr7aYowf+OKNehUzA=; b=b/tjw9MCa+2jCXkm
	CpN36qpR2+jQPr5/h+lYcga6Z3onpBdSxP8iqswCfGUzxKOXe7z8tDbman5UU1ep
	FL1tmOlKjL4QxDVzHrAcRnVKLggFm32ZhT3WJv8IOOXa83jG8uD1xeu5WtTnL6t9
	ESh1VATntMUBGoS+7O/pCHsDFNdKpOdiuvf3xXZAKtdz6lk7LGJDnnrSpgaGZ0Fm
	L52e9GBMpgL323043Klpclrf1zMCt5KnkL2Teb9FV4cj0rTKj8x57dZNTgeS8RPZ
	V675kcaQGqAnj5scqT6XNzu7m+Q4dYDNgKewaT7pJCtLDmwRjVp/Mq4pHCjjxkCI
	leccsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj4wns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7bb849aa5fbso200743385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079048; x=1743683848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R408BpbNP8yU6VNZxLumx3rlFUhr7aYowf+OKNehUzA=;
        b=IMaxoM8e67ToCJwR+hkekaS9zAe0+bL/AJ2ARzaZzwvYFiZ0WeN80NpPJpN9xmvUHC
         SxURRotF9doBdXqxoZIGBMDA40+/umx8pjJsztoVuQgDAC7oNaYGoQ1Wo8j1qAf0d74E
         fqPcaEOc6cJbBdC6QgRi+meWn6bIoBqnxcwjlQNRpc8SDavmn3POmn1wLulFRIUHwH5D
         fchISEbkK2xZ2W6QVaCDMadHH0Eyxs8lCuwL/wGcZZGdbA4/FabmXrvmS0Z9YfsRZBKY
         n1EyB87t/ejO/s8ZNI+mlqHaX9w3vTLlZ6kaZJTtpZzvxJFQPHOiNnxJR0Y5eEOegdno
         /kRg==
X-Gm-Message-State: AOJu0Yz4E7ozwW66R5jQXf/QIbdSQD46pYu0h2QDN/NUEG6XtE5xoBNT
	RAToDYvOTXq/ikpT6Ikf9L8RWxPymp6HkeOeiuoUT1aGteLx1LSH46Zm810P+Al2It9DJKRk8+V
	koZLAQe/jbf4rN8ot4RpwPWy8PIqr4MfO+ZCGT4SeS6N/pKybmO0E+AagucmZWDHoB1+0dusAEA
	VvtJmXfgiVHPw=
X-Gm-Gg: ASbGnctOgqWpzyead54x1jajU4XcLc/37NnV73doyxhfkZiER2AJwWZMJzI6unuRMrg
	EyDt8YyNt9Zs/N/xvvsQSmt7T0EXhea5ObrU9vxRHFi1yahqSim3ZcPN5+MFfJOd3PqkK9SEWgm
	YhJUGirhZY3VCNg1g4nt77NJbzhglzdlb34lW+DQBp622+z18kYk4B8H9sO/bXpjnxU2jn+/QPT
	vVtCCxy+Vftax7iSF3sqnUHXYgtOFI4X3Z5u3aP6wLJk4hd/z3sDFKz5SEzO5deKuvrQlTg6Z27
	GtP0EJUEnLDXFVFBEDtzDw6O4ROReuZqnAFQaiZ2eplzkOwtXUeW8N7YR0+dJFW9zNPCZhL7dpD
	FSO59Pw3PNHmdj46a6sIK1ymA5IkE
X-Received: by 2002:a05:620a:40c4:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7c5eda8001amr473906985a.43.1743079047593;
        Thu, 27 Mar 2025 05:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgHC0x0S3skNR/K45SU9fpxMwhULH55X/AHn0qMWYMynfuNsJDujP7WBClMqEY/S/lvN9JNw==
X-Received: by 2002:a05:620a:40c4:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7c5eda8001amr473902485a.43.1743079047042;
        Thu, 27 Mar 2025 05:37:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 8/8] mesa: add support for RustiCL under PACKAGECONFIG "opencl"
Date: Thu, 27 Mar 2025 14:37:01 +0200
Message-Id: <20250327123701.3906604-9-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: vGqninUlRR1lzZ3UcIyfVhhoQ30xHkPg
X-Proofpoint-ORIG-GUID: vGqninUlRR1lzZ3UcIyfVhhoQ30xHkPg
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e54688 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dgon86aGx0aU30rBFdEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52R5ja2J012658
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213748

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
 ...son-use-target-path-for-Clang-libdir.patch | 18 +++++-
 ...cross-compilation-arguments-to-LLVM-.patch | 64 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 21 ++++--
 3 files changed, 96 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-provide=
-cross-compilation-arguments-to-LLVM-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-use-target-path-=
for-Clang-libdir.patch b/meta/recipes-graphics/mesa/files/0001-meson-use-=
target-path-for-Clang-libdir.patch
index ef7ae8942e33..e2f9562ea64e 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-use-target-path-for-Cla=
ng-libdir.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-use-target-path-for-Cla=
ng-libdir.patch
@@ -1,4 +1,4 @@
-From ecea6fe0d250c3026c22a60ac5420528cc3632d8 Mon Sep 17 00:00:00 2001
+From 11b93f72936ce367306ae299549c39fc21ef21c3 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 26 Mar 2025 12:19:10 +0200
 Subject: [PATCH] meson: use target path for Clang libdir
@@ -10,9 +10,23 @@ options. Clang is known to use the same libdir in OE b=
uild environment.
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 ---
+ src/compiler/clc/meson.build             | 2 +-
  src/gallium/frontends/clover/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 743cd236bb5c..af36dae3dde9 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -8,7 +8,7 @@ files_libmesaclc =3D files(
+ )
+=20
+ _libmesaclc_c_args =3D []
+-_libmesaclc_cpp_args =3D ['-DLLVM_LIB_DIR=3D"@0@"'.format(llvm_libdir)]
++_libmesaclc_cpp_args =3D ['-DLLVM_LIB_DIR=3D"@0@"'.format(get_option('l=
ibdir'))]
+ _libmesaclc_sources =3D []
+=20
+ if not _shared_llvm
 diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/fron=
tends/clover/meson.build
 index e569b86a1bea..2fc30ffe1ac2 100644
 --- a/src/gallium/frontends/clover/meson.build
diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 000000000000..c9213fbe4eec
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compila=
tion-arguments-to-LLVM-.patch
@@ -0,0 +1,64 @@
+From b9cf34f39ca7e7546508ce2ab1f053edef5fc201 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 26 Mar 2025 17:47:09 +0200
+Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bi=
ndgen
+ invocation
+
+Correctly generating LLVM bindings requires several croos-compilation
+arguments. Provide them to rust.bindgen().
+
+Upstream-Status: Inappropriate [OE-Specific]
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
index 9d71cd7917e2..105df1eaf347 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
            file://0001-meson-use-target-path-for-Clang-libdir.patch \
+           file://0001-rusticl-provide-cross-compilation-arguments-to-LL=
VM-.patch \
 "
=20
 SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
@@ -46,7 +47,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -85,6 +86,9 @@ PACKAGECONFIG =3D " \
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
@@ -147,9 +151,16 @@ INSTALL_MESA_CLC:class-native =3D "true"
 MESA_NATIVE =3D "mesa-native"
 MESA_NATIVE:class-native =3D ""
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${LIBCEXTENSION}${@['-gnu=
', ''][d.getVar('LIBCEXTENSION') !=3D '']}"
+
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCON=
FIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dmesa-clc=3D${MESA_CL=
C} -Dinstall-mesa-clc=3D${INSTALL_MESA_CLC},-Dgallium-opencl=3Ddisabled,$=
{MESA_NATIVE}"
+PACKAGECONFIG[opencl] =3D " \
+    -Dgallium-opencl=3Dicd -Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-clc=3D=
${INSTALL_MESA_CLC} \
+    -Dgallium-rusticl=3Dtrue -Dbindgen-includedir=3D${STAGING_INCDIR} -D=
bindgen-target=3D${BINDGEN_TARGET},\
+    -Dgallium-opencl=3Ddisabled -Dgallium-rusticl=3Dfalse, \
+    ${MESA_NATIVE} bindgen-cli-native \
+"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
@@ -242,7 +253,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
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
@@ -348,7 +359,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
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
@@ -362,7 +373,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
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


