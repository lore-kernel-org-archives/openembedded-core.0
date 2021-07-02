Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.7716.1625221231972327117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tNCh/6zU;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id hp26so2612450ejc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8QzDWz7Bs0KEQuHMCySbBSeZ403iFj+VizT1WVwxYQc=;
        b=tNCh/6zUw6UPAEmPA4slQ1F68q4pW9dHG2DzjoH9sKJE6ZzYQlX4zqoq2vgEoocMxY
         eST29K/qLWBMdHcMXISOANwPLv7E1h7/Ku0WZuKUEHAIeljXbUvQ0A+5NzN+Z9f8VcU6
         I9oGS9xQBmOYwNVPTpqu+UobQr/u4tohQOPM1UvGUSmPfe9bXpKmwG2470T5xQ2bkvb8
         h30O3j8SYRaRA0fdrY7eziOtyB0unEoBP8gBNQrE7xYCzfaCsdgrYoULpk1iA+Iq/Zwg
         mTl0BzDashiB3aveAuHl0pGI0B4Y6ysKw2352qVNtm/+i+q7nsvF7tyO2Y//VAjffNio
         cJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8QzDWz7Bs0KEQuHMCySbBSeZ403iFj+VizT1WVwxYQc=;
        b=SH22qKPoDNIxgEqDBPuzNDqqNbEJrQUpr+qEmOCCQTtFPweySZBlIweXuhflopsSeP
         8BVX/olMNkB2KBvxew7RwI7xMj4Y7W8MSmSO5n4dFYIY4Kmh5+Nibae8z4C5IZDNVgL5
         F4T59Ys2N4pNF84y6D9x4Lq4HXt2DZeCMl9fXhkEO1ZSa52Z5PgtWbjcDYzlT8C49jSw
         p8n+4+InHegate9aCvbcqVxmvs3r6jFEWPuhye2XEzS+Hw7dIRN2dOqoItSyybLpNXbt
         x34lcHFA2ZdtAOhTaDNnjTZCUUEAjCWWC+32z1x20XlUxRbcTtjt66xqD8/Ir30eHX/f
         U1+w==
X-Gm-Message-State: AOAM531D7YB4HfI2q4NKnse5MZ+pxAzv3lcrWIzRT8TGaonqHNG4vHBf
	nvgptd95uNrb/HIO8iHQoc8XcUxSBip0aYeIjlY=
X-Google-Smtp-Source: ABdhPJwuND/xwfmuBH74kLI2Nzb7SiyUcl3kZ95NHyUxROQBA9K0qVNtR2Fe0xsJlGRjNlwLfYFnkW9v2IMnmpsUQxA=
X-Received: by 2002:a17:907:3f92:: with SMTP id hr18mr4634694ejc.462.1625221230404;
 Fri, 02 Jul 2021 03:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <afabe035831b1987521868bfda74a6dc43298aa7.camel@linuxfoundation.org>
 <20210702080951.7938-1-mingli.yu@windriver.com>
In-Reply-To: <20210702080951.7938-1-mingli.yu@windriver.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Fri, 2 Jul 2021 12:20:19 +0200
Message-ID: <CAAQYJAu5i-X-GWsns0-ozMWWg_pKHM_K4jm3nRGnrLxf4Y2JVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pulseaudio: check if NEON code can be compiled on arm
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, tanuk@iki.fi, 
	Andre McCurdy <armccurdy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 2, 2021 at 10:11 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Backport a patch to check if NEON code can be compiled on arm to
> fix below issue:
>  | /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recip=
e-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10=
.2.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available =
with the soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3D=
hard"
>  |  31 | #error "NEON intrinsics not available with the soft-float ABI. =
 Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
>       |  ^~~~~
>  | ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_=
s16ne_neon':
>  | ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type=
 name 'int32x4_t'; did you mean 'int32_t'?
>  |   38 |         int32x4_t sum0, sum1;
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...check-if-NEON-code-can-be-compiled-o.patch | 71 +++++++++++++++++++
>  .../pulseaudio/pulseaudio_14.2.bb             |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-b=
uild-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sy=
s-meson-check-if-NEON-code-can-be-compiled-o.patch b/meta/recipes-multimedi=
a/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-comp=
iled-o.patch
> new file mode 100644
> index 0000000000..5d9370fb16
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson=
-check-if-NEON-code-can-be-compiled-o.patch
> @@ -0,0 +1,71 @@
> +From 09f846fbdeb19193e778ce51baa77bd03c38372e Mon Sep 17 00:00:00 2001
> +From: garrison <garrison@qemu15.qemu-network>
> +Date: Fri, 4 Jun 2021 22:13:02 +0000
> +Subject: [PATCH] build-sys: meson: check if NEON code can be compiled o=
n arm
> +
> +When Meson SIMD module returns HAVE_NEON=3D1 on arm host, do extra comp=
ile check
> +to verify compiler can actually handle NEON code.
> +
> +Related Meson issue #6361 https://github.com/mesonbuild/meson/issues/63=
61
> +
> +Part-of: <https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_=
requests/574>
> +
> +Upstream-Status: Backport[https://gitlab.freedesktop.org/pulseaudio/pul=
seaudio/-/commit/6d2a49a6a1eacc2096d0d9473a074421c181ab56]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/pulsecore/meson.build | 41 +++++++++++++++++++++++++++++----------
> + 1 file changed, 31 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/pulsecore/meson.build b/src/pulsecore/meson.build
> +index 99a702e..d0b7990 100644
> +--- a/src/pulsecore/meson.build
> ++++ b/src/pulsecore/meson.build
> +@@ -172,16 +172,37 @@ endif
> +
> + # FIXME: SIMD support (ORC)
> + simd =3D import('unstable-simd')
> +-libpulsecore_simd =3D simd.check('libpulsecore_simd',
> +-  mmx : ['remap_mmx.c', 'svolume_mmx.c'],
> +-  sse : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'],
> +-  neon : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'],
> +-  c_args : [pa_c_args],
> +-  include_directories : [configinc, topinc],
> +-  implicit_include_directories : false,
> +-  compiler : cc)
> +-libpulsecore_simd_lib =3D libpulsecore_simd[0]
> +-cdata.merge_from(libpulsecore_simd[1])
> ++simd_variants =3D [
> ++  { 'mmx' : ['remap_mmx.c', 'svolume_mmx.c'] },
> ++  { 'sse' : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'] },
> ++  { 'neon' : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'] },
> ++]
> ++
> ++libpulsecore_simd_lib =3D []
> ++
> ++foreach simd_kwargs : simd_variants
> ++
> ++  if host_machine.cpu_family() =3D=3D 'arm' and 'neon' in simd_kwargs
> ++    if not cc.compiles('''
> ++        #include <arm_neon.h>
> ++        int main() {
> ++            return sizeof(uint8x8_t) + sizeof(int32x4_t) + sizeof(floa=
t32x4_t);
> ++        }
> ++        ''', name : 'neon code')
> ++      continue
> ++    endif
> ++  endif
> ++
> ++  libpulsecore_simd =3D simd.check('libpulsecore_simd',
> ++    kwargs : simd_kwargs,
> ++    c_args : [pa_c_args],
> ++    include_directories : [configinc, topinc],
> ++    implicit_include_directories : false,
> ++    compiler : cc)
> ++
> ++  libpulsecore_simd_lib +=3D libpulsecore_simd[0]
> ++  cdata.merge_from(libpulsecore_simd[1])
> ++endforeach
> +
> + # FIXME: Implement Windows support
> + #'mutex-win32.c',
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb b/met=
a/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
> index 9b8338a665..a7ea8caccb 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
> @@ -7,6 +7,7 @@ SRC_URI =3D "http://freedesktop.org/software/pulseaudio/=
releases/${BP}.tar.xz \
>             file://0001-meson-Check-for-__get_cpuid.patch \
>             file://volatiles.04_pulse \
>             file://0001-doxygen-meson.build-remove-dependency-on-doxygen=
-bin.patch \
> +           file://0001-build-sys-meson-check-if-NEON-code-can-be-compil=
ed-o.patch \
>             "
>  SRC_URI[md5sum] =3D "1efc916251910f1e9d4df7810e3e69f8"
>  SRC_URI[sha256sum] =3D "75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f=
3488a2562a9ff66f1"
> --
> 2.29.2
>
>
>=20
>

Successfully built pulseaudio for armv4 / collie. Thanks.

Tested-by: Andrea Adami <andrea.adami@gmail.com>
