Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE23C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.43393.1744019314933365463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=cJgRDJRU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378duHl010872
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KQIIe767gx02h7gn+eKAyNhGwqbUK7oPiNw70ce/ek=; b=cJgRDJRUYAReeiTy
	xgJ+xHgiw85Z0P9kuazYOamlzvr4cMqjcK+5GpTo7qTc4edogM/c4LGwflNFvDCW
	zuJbN4JoWVhPkuxjZHajpZj9T1rx1bYVaPzWvJ/eyiSNWHn7XjT4W1+qE+nd6x6X
	m3bkrOGlVwemsV1nhJxbXpwVNCGtOLKKING4JBgkGc1A5XeHGHSDtvPWm0khwm1y
	zJpC0C7eRlNPwHCixPW/4Z5K8pcGgeEjhXwo4PwPu6wBiExpNhzMlqs5mDlcMPJT
	oV8J0utyUBD40SXb3vRiHbgQd6rVBtdkNMbKVJDyOcnZQ9294+quhWao1ysHGXRw
	uuR2eg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2ku0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so674088085a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019313; x=1744624113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KQIIe767gx02h7gn+eKAyNhGwqbUK7oPiNw70ce/ek=;
        b=h9zJaeqUK9CQ3HVAvqjYPWa01/vCQ4N3C4NoEqmfo4sqyLxixHGynLsmpo5abXMfBJ
         XexWZN5K2UUb4Kj5fQHs2Ybmrpz31Tqjfb+P+oV0N/UNn/HcRzMA1r7GQ8MhnzcLM+4Y
         A8HcS6imTemPi96SD7qOU6KzXwztkyVB9kA7OMeejSa4jH+YLFzv1Y49ufi9/Y6QF/bh
         3g8QhfHT6e0XU9X+fb3sUxpnrrIF+3IMCY1f6tJGeW0YgVSZKHDhRrBg5Nsc123U6G6N
         GnnKoGizl+fG3rGpYEVaMb1jrvtcOdRmcX/jChWIq8CYfAPboPalCxYtyGxnxL/vqaJ0
         uMZA==
X-Gm-Message-State: AOJu0Yz7quUVGNQlw2jNYa3fJXivzv3Wk3gGdzoruOXzI5a32Yn3r43C
	lZu0fR3R7iKuRiQ9kRVSKC55pisJ1tou3bIM8zrnTNvpeBYei1D/aM38RbDITySV3MldDpr+IZl
	Cqhf6BvWG6Bys2fuTS+pzxGlAkwbVyixi6e/Hsb0FI3n0MJDt/orLaQOp9D+aJt0Bq3XDWzLUHU
	LkPDs=
X-Gm-Gg: ASbGnctP4eYtxWqQPjyZbJGC8KCQxzWMmaFFeZos8omuTugMiAEmdTVQhvrsPeS0CQ3
	SX1uWFxN3j0dxddoOes8D9UvNBOGdtz/y0dYwDdkJnAo2MTsk651K0afEhuxdd/DIiW58HNW2Ql
	H9pf4lbhqAAUfuQR0DJRKPpDdfqmXAEBWOBNidUoI6Hm8DhrA4U+fbZr/1/hHlBMalR2+IfRCGE
	YvN4nVLFIdGA41xw2G8CD1B75Jzura2GXJWeaBBpCi+k8AD2zCqi4bY6LNzGdSE9KRdWIEojtZ9
	h945VAxxXoMD5/O0kzb04NzEJSzv4CdXtoMQ2EPPoqRvVPuic029CXRJK/vqhip68WkFhThD0LK
	gQUawIxhPi2c870ZcTL46k3aFj2nO
X-Received: by 2002:a05:620a:4245:b0:7c5:43c2:a8fc with SMTP id af79cd13be357-7c77ddeb2a9mr1130384485a.38.1744019312909;
        Mon, 07 Apr 2025 02:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVeyunym0iMBAmGtgDL0Fs2GqQrnyCldlLHdBhjjKcyq28nnclx39kCfEeX+wTAjTdcrVhgg==
X-Received: by 2002:a05:620a:4245:b0:7c5:43c2:a8fc with SMTP id af79cd13be357-7c77ddeb2a9mr1130382585a.38.1744019312496;
        Mon, 07 Apr 2025 02:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:18 +0300
Subject: [PATCH v6 13/13] mesa: add support for RustiCL under PACKAGECONFIG
 "opencl"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250407-mesa-25-v6-13-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7772;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fZAgKJI7SWq8PzgWSpG663vL/fDTTwBSP4YJ4EAiFUU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859YcXQ9H7VT9Y2tSZ8F87qoI9FxuuwjLH7B3
 OVyCDng97yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfWAAKCRCLPIo+Aiko
 1XpDB/9q4PHdZZKO5rnfN6T9rOZ0b2lMWjEpRTJRuOKtYSZtMJaTvC84hDxFBHZigoNLR+Ng/QK
 YhCk7xDlR4dNj1ab9sAd8io6eVaOLuNhmM1yZLmgcn2ejKkky3YRO8x+5EUCX5HysvsqJS/Qjr4
 V/33BN9ZePop4ON9foqyKvsbl8J3IlzcW1/jIuAZ7WH/OLI8MXYSPGkNrkxQASrdwgo7M8/226D
 BBYf1J7vyhT9hOcXu0fLIHYt4BbIOqUFJzBIcL9bjgHaurPeuZQ6W3cetO9IS5JamUFYM5FxkBL
 eTN2uIWbVk90WDQBbIZySJeyI9/smgT8bNeQ1VcrnEUyJCCG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pwmc_Z9VoEbGd0L8iaU3EA4ktkPAz31I
X-Proofpoint-GUID: pwmc_Z9VoEbGd0L8iaU3EA4ktkPAz31I
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f39f72 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NIk5LsUNV1RiDaC6tVwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5378duHl010872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214442

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
 meta/recipes-graphics/mesa/mesa.inc                | 21 +++++--
 2 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..d527b3408734dfa0aa756053c=
1b0f3ea3a59563b
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
+@@ -115,6 +115,11 @@ rusticl_bindgen_c_args =3D [
+   '-fno-builtin-malloc',
+ ]
+=20
++bindgen_target =3D get_option('bindgen-target')
++if bindgen_target !=3D ''
++  rusticl_bindgen_c_args +=3D [ '-target', bindgen_target ]
++endif
++
+ cl_c_args =3D [
+   '-DCL_USE_DEPRECATED_OPENCL_1_0_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_1_1_APIS',
+@@ -187,6 +192,9 @@ rusticl_llvm_bindings_rs =3D rust.bindgen(
+     rusticl_bindgen_c_args,
+     pre_args,
+   ],
++  include_directories : [
++    get_option('bindgen-includedir'),
++  ],
+   dependencies : [
+     dep_clang,
+     dep_llvm,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 9edce6b2281c2e33e6fe20819f0f4998cceba60b..aca34983e97ca684d662987d3=
a1d0b61ba44029a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-hos=
t.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
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
 PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm"
@@ -144,9 +148,16 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${@['-gnu', ''][d.getVar(=
'LIBCEXTENSION') !=3D '']}"
+BINDGEN_TARGET:class-native =3D ""
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
@@ -249,7 +260,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
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
@@ -355,7 +366,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
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
@@ -369,7 +380,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
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


