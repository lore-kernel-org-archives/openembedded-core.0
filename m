Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF17C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:38:38 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49622.1782923907644611951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=qxg2v4ps;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id D3D91388AF
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:38:25 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wexx7-0piIG90; Wed, 1 Jul 2026 18:38:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][Patch] mesa.inc: add a workaround for rusticl build
Date: Wed,  1 Jul 2026 18:38:14 +0200
Message-ID: <20260701163814.1290027-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TOI-EXPURGATEID: 150726::1782923901-B5FF8BD7-EBEE1230/0/0 CLEAN NORMAL
X-TOI-MSGID: bc66d428-575b-48db-aa57-64ad66cd3734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782923905; i=f_l_k@t-online.de;
	bh=b9jU+0OaF8MAuo9zXj8o3Z4Za0bCB9ErpoYQ4+tP2pE=;
	h=From:To:Subject:Date;
	b=qxg2v4psiDMIl7oCgxVzQGXwksQXVyOBYOz+fkPrNVrcnXqSRIWc66zgwUtYExKhk
	 2lhD83BwRE6BnjyFwuUPUsEMY78d9/k5n2/Zpyi6FpwHikvq0vdKF2laiqguKco/rK
	 c+9peoZkWoo5IYMago59VUD2eRl8N027cs9nLyb7AR44YReF0NwFtukC135DMGmM6T
	 ngkfDNAmH9QKIEqDrKOSXEO3KD/SmbT6qMCGZajpI4b5vx1UL3vbaih5VsQ8gDDMOu
	 0WNCmqIY3Fu1Xq/lFRdQnP7yhTMaf6D7RY0m97lFwZo1xmzpagj1YuPKrbhtGeY/kS
	 HTCUpdF7OlLoA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240000

Build checks if ${STAGING_BINDIR}/clang-22 is available and runnable

| FAILED: [code=3D101] src/gallium/frontends/rusticl/rusticl_mesa_bindings.=
rs src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
| /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.2/src/g=
allium/frontends/rusticl/rusticl_mesa_bindings.h --output /home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/=
gallium/frontends/rusticl/rusticl_mesa_bindings.rs --wrap-unsafe-ops --raw-=
line '#![allow(clippy::all)]' --raw-line '#![allow(improper_ctypes)]' --raw=
-line '#![allow(unused_unsafe)]' --raw-line '#![allow(non_camel_case_types)=
]' --raw-line '#![allow(non_snake_case)]' --raw-line '#![allow(non_upper_ca=
se_globals)]' --raw-line '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line '#!=
[allow(unnecessary_transmutes)]' --raw-line '#![allow(warnings)]' --no-conv=
ert-floats --default-enum-style rust --with-derive-partialeq --with-derive-=
eq --with-derive-partialord --with-derive-ord --with-derive-hash --with-der=
ive-default --anon-fields-prefix anon_ --use-array-pointers-in-arguments --=
allowlist-function 'blob_.*' --allowlist-function 'disk_cache_.*' --allowli=
st-type float_controls --allowlist-function 'mesa_.*' --allowlist-var 'OS_.=
*' --allowlist-function 'rz?alloc_.*' --allowlist-var 'BLAKE3_.*' --allowli=
st-function '_mesa_blake3_.*' --allowlist-function 'u_.*' --allowlist-funct=
ion 'util_format_.*' --allowlist-function 'util_queue_.*' --allowlist-funct=
ion 'util_vma_.*' --allowlist-function util_get_cpu_caps --no-copy util_vma=
_heap --no-copy util_queue --no-copy util_queue_fence --allowlist-type 'cl_=
sampler_.*_mode' --constified-enum-module 'cl_sampler_.*_mode' --allowlist-=
function 'clc_.*' --allowlist-type clc_kernel_arg_access_qualifier --bitfie=
ld-enum clc_kernel_arg_access_qualifier --allowlist-type clc_kernel_arg_typ=
e_qualifier --bitfield-enum clc_kernel_arg_type_qualifier --allowlist-type =
gl_access_qualifier --bitfield-enum gl_access_qualifier --allowlist-functio=
n 'glsl_.*' --allowlist-function 'nir_.*' --allowlist-var nir_debug --allow=
list-var 'NIR_DEBUG_.*' --bitfield-enum nir_lower_int64_options --bitfield-=
enum nir_opt_if_options --bitfield-enum nir_variable_mode --allowlist-funct=
ion 'should_.*_nir' --allowlist-function 'spirv_.*' --allowlist-function 'p=
ipe_.*' --allowlist-var 'PIPE_.*' --allowlist-type pipe_endian --bitfield-e=
num pipe_map_flags --allowlist-type pipe_query_type --constified-enum-modul=
e pipe_query_type --allowlist-type pipe_resource_usage --bitfield-enum pipe=
_resource_usage --allowlist-type pipe_tex_filter --constified-enum-module p=
ipe_tex_filter --allowlist-type pipe_tex_wrap --constified-enum-module pipe=
_tex_wrap --allowlist-type pipe_swizzle --constified-enum-module pipe_swizz=
le --allowlist-function 'rusticl_.*' --allowlist-function 'std(err|out)_ptr=
' --allowlist-function mmap --allowlist-function munmap --allowlist-var 'MA=
P_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS_HANDLE_TYPE_.*' --e=
xperimental --wrap-static-fns --wrap-static-fns-path /home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/galli=
um/frontends/rusticl/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-ed=
ition 2021 -- -fno-builtin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_=
MACROS -D__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGR=
EPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=
=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I91=
5 -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE=
_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAS=
T -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_V=
C1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC=
_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_COD=
EC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_=
CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM=
 -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_=
LIBGLVND=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPU=
TE -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EX=
PORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_C=
ACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ=
 -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE=
___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BU=
ILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPAT=
IBLE_P -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE=
___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE=
_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUN=
C_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATT=
RIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAV=
E_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_AT=
TRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD =
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_=
FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_G=
CC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINI=
TY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DH=
AVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_=
STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DH=
AVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -=
DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVO=
CATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -=
DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRA=
TED_GPUS -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_P=
THREAD_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=
=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAI=
LABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD=
_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE=
_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_D=
RI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE=
_RENDERDOC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=
=3Dsse -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat=
 -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/flk/bitbake/=
bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysr=
oot --target=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64 -I/home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/me=
sa-26.1.2/src/gallium/include -I/home/flk/bitbake/bitbake-builds/oe/build/t=
mp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/include -I/home/fl=
k/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/s=
ources/mesa-26.1.2/src/gallium/auxiliary -I/home/flk/bitbake/bitbake-builds=
/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/auxilia=
ry -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/include/. -I/home/flk/bitbake/bitbake-build=
s/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/. -I/home/=
flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2=
/sources/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/=
work/corei7-64-oe-linux/mesa/26.1.2/build/src/. -DNDEBUG -I/home/flk/bitbak=
e/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/m=
esa-26.1.2/src/compiler/nir/. -I/home/flk/bitbake/bitbake-builds/oe/build/t=
mp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/nir/. -I/home/flk=
/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/so=
urces/mesa-26.1.2/src/compiler/. -I/home/flk/bitbake/bitbake-builds/oe/buil=
d/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/. -I/home/flk/=
bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sou=
rces/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work=
/corei7-64-oe-linux/mesa/26.1.2/build/src/. -I/home/flk/bitbake/bitbake-bui=
lds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/in=
clude/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-l=
inux/mesa/26.1.2/build/include/. -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_M=
ACROS -D__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGRE=
PORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=
=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I91=
5 -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE=
_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAS=
T -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_V=
C1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC=
_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_COD=
EC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_=
CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM=
 -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_=
LIBGLVND=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPU=
TE -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EX=
PORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_C=
ACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ=
 -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE=
___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BU=
ILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPAT=
IBLE_P -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE=
___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE=
_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUN=
C_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATT=
RIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAV=
E_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_AT=
TRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD =
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_=
FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_G=
CC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINI=
TY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DH=
AVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_=
STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DH=
AVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -=
DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVO=
CATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -=
DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRA=
TED_GPUS -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_P=
THREAD_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=
=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAI=
LABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD=
_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE=
_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_D=
RI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE=
_RENDERDOC_INTEGRATION=3D1 -std=3Dc11 -MD -MQ ../sources/mesa-26.1.2/src/ga=
llium/frontends/rusticl/rusticl_mesa_bindings.h -MF src/gallium/frontends/r=
usticl/rusticl_mesa_bindings.h.d
| panicked at /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/b=
itbake/clang-sys-1.8.1/src/support.rs:189:45:
| called `Result::unwrap()` on an `Err` value: "could not run executable `/=
home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/2=
6.1.2/recipe-sysroot/usr/bin/clang-22`: No such file or directory (os error=
 2)"

Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to ach=
ieve this.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index f8e294076a..ed95a29446 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -63,6 +63,7 @@ replace_llvm_config_path() {
=20
 do_configure:prepend:class-target() {
     replace_llvm_config_path
+    ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/clang-22
 }
=20
 do_configure:prepend:class-nativesdk() {
--=20
2.54.0


