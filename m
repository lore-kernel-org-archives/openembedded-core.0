Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5946C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 18:58:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2566.1679165895162324238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 11:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyjN4CFE;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id q16so7068724wrw.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679165893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKAa2wpeZGVA0Zu3+h4UcvYOZ8x/d1EN6mdKz3QEIVs=;
        b=QyjN4CFE5rNBBfpl/Mc7pucdhC2KT5xBXBINWxOqoIOZYs+YfXV5Ask9WIgNmR+4oF
         wLOhfU1a3PwRih6TNA+d0AHhJeE4LOzd60on8rrCA67/Y6KFYG2B5zYxSGjf2fz3x6NE
         M6dfWF6/8mqeXgZ2MiyE1mi/YO3mg6R325GcWAYKwmLcyOpCjw0AmqqcFzbyBezs7dP/
         09k8c6rzWYmLW60l/E1OHNTRmNtuKefMb5OUTA6yv5Hi+1d/jRQq86GulaU7sG/rdzKr
         oeYEg4HEVNdJOmE2VyLc8lTS2YsE5q4+FVwXGo/ZnkExEFr+2QyMKPC+h6Wj24QS0aqr
         rpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679165893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKAa2wpeZGVA0Zu3+h4UcvYOZ8x/d1EN6mdKz3QEIVs=;
        b=2afcAQlbgsoUXg0/JWs2UdZzGEMyyTTaakfg2Erb6JVYNGJIQk3igjpMQlLlOmGDff
         i/BYYHGiT+qwGqovqjBqbyu438ctiCWhNglJ8GdXcSUXbqXurkzvYF65IWVnRQQJD/WB
         mkCR8NscUDHQSilzW+XE7mSsjp5HUJLsMmB2gSLYtWH+vv1BVBTdqV2vaeI+08eqmcOx
         0Gi4sIgoRhlxt622YL7LDjtrxPvIjyI9iUvoNhh7y+of/uIoka79VjyBcgR2tHXzGCXA
         BEpvyrp6YgMS593iYnp/nU3Am0oECFm9QEVKeE4TAZfilDHcZAp1Am7H1Shk1qAFUTNS
         7CIw==
X-Gm-Message-State: AO0yUKW/KNBdRg98h0JW4SgO1+poiOc6/2yhKbibI7jxbLp/RuT8RCDH
	oL0RbhB0QEfzxbFNABxo6NUIkzmd2q7tTbgqQYU=
X-Google-Smtp-Source: AK7set+hGeI+1mVbpwCbUCioxT3r5D27gruQGzs8+3LVAxUZshsPmyhK4Hl4OJrJPBmsGasZ2Okil+0twa03gAf0zf4=
X-Received: by 2002:a5d:534e:0:b0:2ce:a0c2:d9ee with SMTP id
 t14-20020a5d534e000000b002cea0c2d9eemr2338275wrv.1.1679165893312; Sat, 18 Mar
 2023 11:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-6-alex@linutronix.de>
 <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
 <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com> <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
In-Reply-To: <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 18 Mar 2023 19:57:51 +0100
Message-ID: <CA+chaQc7HF-K=JFV3gSsNs6erVXckcbniEDWzBVYSW_QcQjLAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin <alex@linutronix.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097046b05f7314635"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 18:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178792

--00000000000097046b05f7314635
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 7:38=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Sat, Mar 18, 2023 at 1:02=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Ubuntu 18.04 goes EOL next month, so it should perhaps be dropped from
> the builders and supported distro list?
> >
>
> Perhaps in the next cycle yes and definitely for the next LTS it
> should be dropped.
>
> Its stll supported via Extended Security Maintenance (ESM)  and users
> maybe still be using it.
>
> mesa needs gcc > 8 as per
> https://docs.mesa3d.org/install.html?highlight=3Dgcc+version#compiler
> so 7.5 default on ubuntu 18.04 is falling under unsupported compilers
> for mesa. So we should be recommending
> buildtools-tarball-extra and also installing it on ubuntu 18.04 workers.
>

IIRC we already need buildtools-tarball (regular was enough, not the
extended one) for 18.04 because of python

Mickledore needs newer python-3.8 (e.g. 3.8.10 in Focal) than 3.6.9 in
Bionic since:
https://git.openembedded.org/openembedded-core/commit/?id=3Dcc05bc04156122f=
d6f918191a9cec7bc0392415e
https://git.openembedded.org/bitbake/commit/?id=3D744310f360d2288ac2ef07745=
abc86852126b5b9

extended is twice as big, but I wouldn't mind switching to it from regular
buildtools if needed (temporarily until we finish upgrade to 22.03. And
people who install newer python to 18.04 can install newer than default gcc
as well.

Cheers,


> > Alex
> >
> > On Sat 18. Mar 2023 at 2.47, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> mesa 23.x fails to build with default gcc ( 7.5.0 ) Ubuntu
> >> 7.5.0-3ubuntu1~18.04, it ends up with
> >>
> >> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function
> >> =E2=80=98int brw_simd_select_for_workgroup_size(const intel_device_inf=
o*,
> >> const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
> >> ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
> >> unimplemented: non-trivial designated initializers not supported
> >>        };
> >>        ^
> >>
> >> see mesa-native failure
> >>
> >> https://errors.yoctoproject.org/Errors/Details/698144/
> >>
> >> I wonder how it works on AB nodes running Ubuntu 18.04. Do we enforce
> >> gcc from buildtools tarball there ?
> >>
> >> On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Drop patches:
> >> > 0001-gbm-backend-fix-gbm-compile-without-dri.patch
> >> > 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
> >> > (backports)
> >> >
> >> > 0001-util-format-Check-for-NEON-before-using-it.patch
> >> > (upstream submission has stalled with unanswered concerns from
> upstream;
> >> > patch no longer applies; issue does not reproduce with
> 'raspberrypi0-wifi' MACHINE)
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > ---
> >> >  ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
> >> >  ...-backend-fix-gbm-compile-without-dri.patch | 65
> -------------------
> >> >  ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
> >> >  .../{mesa-gl_22.3.5.bb =3D> mesa-gl_23.0.0.bb}  |  0
> >> >  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
> >> >  .../mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.bb}   |  0
> >> >  6 files changed, 1 insertion(+), 160 deletions(-)
> >> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-=
of-uint-to-fix-mu.patch
> >> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without=
-dri.patch
> >> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-u=
sing-it.patch
> >> >  rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb =3D>
> mesa-gl_23.0.0.bb} (100%)
> >> >  rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb =3D> mesa_23.0.0.=
bb}
> (100%)
> >> >
> >> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> b/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> >> > deleted file mode 100644
> >> > index 3ab22889bf..0000000000
> >> > ---
> a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instea=
d-of-uint-to-fix-mu.patch
> >> > +++ /dev/null
> >> > @@ -1,44 +0,0 @@
> >> > -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00
> 2001
> >> > -From: Jami Kettunen <jami.kettunen@protonmail.com>
> >> > -Date: Tue, 31 Aug 2021 00:15:58 +0300
> >> > -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix
> musl build
> >> > -
> >> > -Upstream-Status: Backport
> >> > -
> >> > -Fixes the following error I noticed when building against aarch64
> with
> >> > -musl libc:
> >> > -
> >> > -  In file included from ../src/freedreno/decode/crashdec.h:38,
> >> > -                   from ../src/freedreno/decode/crashdec.c:40:
> >> > -  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown
> type name 'uint'
> >> > -    104 | static inline uint
> >> > -        |               ^~~~
> >> > -  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown
> type name 'uint'; did you mean 'int'?
> >> > -    105 | pm4_calc_odd_parity_bit(uint val)
> >> > -        |                         ^~~~
> >> > -        |                         int
> >> > -
> >> > -Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
> >> > -Part-of: <
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19665>
> >> > ----
> >> > - src/freedreno/common/freedreno_pm4.h | 4 ++--
> >> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/src/freedreno/common/freedreno_pm4.h
> b/src/freedreno/common/freedreno_pm4.h
> >> > -index 8f958953d693..091247e709a0 100644
> >> > ---- a/src/freedreno/common/freedreno_pm4.h
> >> > -+++ b/src/freedreno/common/freedreno_pm4.h
> >> > -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
> >> > - #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
> >> > - #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
> >> > -
> >> > --static inline uint
> >> > --pm4_calc_odd_parity_bit(uint val)
> >> > -+static inline unsigned
> >> > -+pm4_calc_odd_parity_bit(unsigned val)
> >> > - {
> >> > -    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
> >> > -                              ((val) >> 12) ^ ((val) >> 16) ^ ((val=
)
> >> 20) ^
> >> > ---
> >> > -2.39.2
> >> > -
> >> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> >> > deleted file mode 100644
> >> > index 6541671b7a..0000000000
> >> > ---
> a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-witho=
ut-dri.patch
> >> > +++ /dev/null
> >> > @@ -1,65 +0,0 @@
> >> > -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00
> 2001
> >> > -From: Vincent Davis Jr <vince@underview.tech>
> >> > -Date: Wed, 28 Dec 2022 16:28:01 -0600
> >> > -Subject: [PATCH] gbm/backend: fix gbm compile without dri
> >> > -
> >> > -Upstream-Status: Backport
> >> > -
> >> > -https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
> >> > -
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e5870674=
1a7d22d67b5088e60
> >> > -
> >> > -At mesa version 22.2.3 patch wasn't introduced until after.
> >> > -
> >> > -Commit introduces a fix that allows for gbm to be built with an emp=
ty
> >> > -backend. There are situation especially in a Yocto/OE cross
> compilation
> >> > -environment where you want to build with an empty backend. The
> particular
> >> > -situation is as such:
> >> > -
> >> > -The mesa-gl recipe is the preferred provider for virtual/libgbm,
> virtual/libgl,
> >> > -virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this
> leads to build
> >> > -errors such as:
> >> > -
> >> > -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in
> function `find_backend':
> >> > -| backend.c:(.text.find_backend+0xa4): undefined reference to
> `gbm_dri_backend'
> >> > -| /../../../ld:
> src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends=
+0x4):
> >> > -                undefined reference to `gbm_dri_backend'
> >> > -| collect2: error: ld returned 1 exit status
> >> > -
> >> > -Issue should be replicable by setting -Ddri3=3Ddisabled and
> -Dgbm=3Denabled
> >> > -
> >> > -Add fix to bypasses compilation issue by excluding gbm dri backend.
> If
> >> > -HAVE_DRI || HAVE_DRIX not specified.
> >> > -
> >> > -Acked-by: David Heidelberg <david.heidelberg@collabora.com>
> >> > -Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> >> > ----
> >> > - src/gbm/main/backend.c | 4 ++++
> >> > - 1 file changed, 4 insertions(+)
> >> > -
> >> > -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
> >> > -index 974d0a76a4e..feee0703495 100644
> >> > ---- a/src/gbm/main/backend.c
> >> > -+++ b/src/gbm/main/backend.c
> >> > -@@ -42,7 +42,9 @@
> >> > - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
> >> > - #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
> >> > -
> >> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> >> > - extern const struct gbm_backend gbm_dri_backend;
> >> > -+#endif
> >> > -
> >> > - struct gbm_backend_desc {
> >> > -    const char *name;
> >> > -@@ -51,7 +53,9 @@ struct gbm_backend_desc {
> >> > - };
> >> > -
> >> > - static const struct gbm_backend_desc builtin_backends[] =3D {
> >> > -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
> >> > -    { "dri", &gbm_dri_backend },
> >> > -+#endif
> >> > - };
> >> > -
> >> > - #define BACKEND_LIB_SUFFIX "_gbm"
> >> > ---
> >> > -2.34.1
> >> > -
> >> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> >> > deleted file mode 100644
> >> > index d22ff3c8a8..0000000000
> >> > ---
> a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before=
-using-it.patch
> >> > +++ /dev/null
> >> > @@ -1,47 +0,0 @@
> >> > -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00
> 2001
> >> > -From: Khem Raj <raj.khem@gmail.com>
> >> > -Date: Thu, 2 Dec 2021 19:57:42 -0800
> >> > -Subject: [PATCH] util/format: Check for NEON before using it
> >> > -
> >> > -This fixes build on rpi0-w and any other machine which does not hav=
e
> >> > -neon unit and is not used as FPU unit
> >> > -
> >> > -Fixes errors e.g.
> >> > -
> >> > -In file included from
> ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
> >> >
> -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mes=
a/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h=
:32:2:
> error: "NEON support not enabled"
> >> > -
> >> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
> >> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > -
> >> > ----
> >> > - src/util/format/u_format.c             | 2 +-
> >> > - src/util/format/u_format_unpack_neon.c | 2 +-
> >> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.=
c
> >> > -index c071250..0880984 100644
> >> > ---- a/src/util/format/u_format.c
> >> > -+++ b/src/util/format/u_format.c
> >> > -@@ -1184,7 +1184,7 @@ static void
> >> > - util_format_unpack_table_init(void)
> >> > - {
> >> > -    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format <
> PIPE_FORMAT_COUNT; format++) {
> >> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> >> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &&
> defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> >> > -       const struct util_format_unpack_description *unpack =3D
> util_format_unpack_description_neon(format);
> >> > -       if (unpack) {
> >> > -          util_format_unpack_table[format] =3D unpack;
> >> > -diff --git a/src/util/format/u_format_unpack_neon.c
> b/src/util/format/u_format_unpack_neon.c
> >> > -index a4a5cb1..1e4f794 100644
> >> > ---- a/src/util/format/u_format_unpack_neon.c
> >> > -+++ b/src/util/format/u_format_unpack_neon.c
> >> > -@@ -23,7 +23,7 @@
> >> > -
> >> > - #include <u_format.h>
> >> > -
> >> > --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> >> > -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &&
> defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
> >> > -
> >> > - /* armhf builds default to vfp, not neon, and refuses to compile
> neon intrinsics
> >> > -  * unless you tell it "no really".
> >> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> b/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
> >> > rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
> >> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> >> > index b082b49400..8f72f25c17 100644
> >> > --- a/meta/recipes-graphics/mesa/mesa.inc
> >> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> > @@ -17,12 +17,9 @@ PE =3D "2"
> >> >  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz=
 \
> >> >
>  file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> >> >
>  file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> >> > -
>  file://0001-util-format-Check-for-NEON-before-using-it.patch \
> >> > -           file://0001-gbm-backend-fix-gbm-compile-without-dri.patc=
h
> \
> >> > -
>  file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
> >> >             "
> >> >
> >> > -SRC_URI[sha256sum] =3D
> "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
> >> > +SRC_URI[sha256sum] =3D
> "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
> >> >
> >> >  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >> >
> >> > diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb
> b/meta/recipes-graphics/mesa/mesa_23.0.0.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
> >> > rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
> >> > --
> >> > 2.30.2
> >> >
> >> >
> >> >
> >> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178791):
> https://lists.openembedded.org/g/openembedded-core/message/178791
> Mute This Topic: https://lists.openembedded.org/mt/97647023/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000097046b05f7314635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Mar 18, 2023 at 7:38=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Sat, Mar 18, 2023 at 1:02=E2=80=AFAM Alexander Kanav=
in<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Ubuntu 18.04 goes EOL next month, so it should perhaps be dropped from=
 the builders and supported distro list?<br>
&gt;<br>
<br>
Perhaps in the next cycle yes and definitely for the next LTS it<br>
should be dropped.<br>
<br>
Its stll supported via Extended Security Maintenance (ESM)=C2=A0 and users<=
br>
maybe still be using it.<br>
<br>
mesa needs gcc &gt; 8 as per<br>
<a href=3D"https://docs.mesa3d.org/install.html?highlight=3Dgcc+version#com=
piler" rel=3D"noreferrer" target=3D"_blank">https://docs.mesa3d.org/install=
.html?highlight=3Dgcc+version#compiler</a><br>
so 7.5 default on ubuntu 18.04 is falling under unsupported compilers<br>
for mesa. So we should be recommending<br>
buildtools-tarball-extra and also installing it on ubuntu 18.04 workers.<br=
></blockquote><div><br></div><div>IIRC we already need buildtools-tarball (=
regular was enough, not the extended one) for 18.04 because of python</div>=
<div><br></div><div>Mickledore needs newer python-3.8 (e.g. 3.8.10 in Focal=
) than 3.6.9 in Bionic since:</div><a href=3D"https://git.openembedded.org/=
openembedded-core/commit/?id=3Dcc05bc04156122fd6f918191a9cec7bc0392415e">ht=
tps://git.openembedded.org/openembedded-core/commit/?id=3Dcc05bc04156122fd6=
f918191a9cec7bc0392415e</a><br><a href=3D"https://git.openembedded.org/bitb=
ake/commit/?id=3D744310f360d2288ac2ef07745abc86852126b5b9">https://git.open=
embedded.org/bitbake/commit/?id=3D744310f360d2288ac2ef07745abc86852126b5b9<=
/a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">ex=
tended is twice as big, but I wouldn&#39;t mind switching to it from regula=
r buildtools if needed (temporarily until we finish upgrade to 22.03. And p=
eople who install newer python to 18.04 can install newer than default gcc =
as well.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">Cheers,</div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sat 18. Mar 2023 at 2.47, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; mesa 23.x fails to build with default gcc ( 7.5.0 ) Ubuntu<br>
&gt;&gt; 7.5.0-3ubuntu1~18.04, it ends up with<br>
&gt;&gt;<br>
&gt;&gt; ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In funct=
ion<br>
&gt;&gt; =E2=80=98int brw_simd_select_for_workgroup_size(const intel_device=
_info*,<br>
&gt;&gt; const brw_cs_prog_data*, const unsigned int*)=E2=80=99:<br>
&gt;&gt; ../mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: so=
rry,<br>
&gt;&gt; unimplemented: non-trivial designated initializers not supported<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;&gt;<br>
&gt;&gt; see mesa-native failure<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/698144/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/698144/</a><br>
&gt;&gt;<br>
&gt;&gt; I wonder how it works on AB nodes running Ubuntu 18.04. Do we enfo=
rce<br>
&gt;&gt; gcc from buildtools tarball there ?<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Mar 16, 2023 at 2:41=E2=80=AFAM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Drop patches:<br>
&gt;&gt; &gt; 0001-gbm-backend-fix-gbm-compile-without-dri.patch<br>
&gt;&gt; &gt; 0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.pat=
ch<br>
&gt;&gt; &gt; (backports)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 0001-util-format-Check-for-NEON-before-using-it.patch<br>
&gt;&gt; &gt; (upstream submission has stalled with unanswered concerns fro=
m upstream;<br>
&gt;&gt; &gt; patch no longer applies; issue does not reproduce with &#39;r=
aspberrypi0-wifi&#39; MACHINE)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 ----=
---------<br>
&gt;&gt; &gt;=C2=A0 ...-backend-fix-gbm-compile-without-dri.patch | 65 ----=
---------------<br>
&gt;&gt; &gt;=C2=A0 ...ormat-Check-for-NEON-before-using-it.patch | 47 ----=
----------<br>
&gt;&gt; &gt;=C2=A0 .../{<a href=3D"http://mesa-gl_22.3.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">mesa-gl_22.3.5.bb</a> =3D&gt; <a href=3D"http://mes=
a-gl_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_23.0.0.bb</a>}=
=C2=A0 |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt;&gt; &gt;=C2=A0 .../mesa/{<a href=3D"http://mesa_22.3.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_22.3.5.bb</a> =3D&gt; <a href=3D"http://mesa=
_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_23.0.0.bb</a>}=C2=A0 =
=C2=A0|=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 6 files changed, 1 insertion(+), 160 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/000=
1-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/000=
1-gbm-backend-fix-gbm-compile-without-dri.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/000=
1-util-format-Check-for-NEON-before-using-it.patch<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://me=
sa-gl_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a>=
 =3D&gt; <a href=3D"http://mesa-gl_23.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">mesa-gl_23.0.0.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://me=
sa_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a> =3D&g=
t; <a href=3D"http://mesa_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa_23.0.0.bb</a>} (100%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-=
pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/me=
sa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch<br=
>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 3ab22889bf..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use=
-unsigned-instead-of-uint-to-fix-mu.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,44 +0,0 @@<br>
&gt;&gt; &gt; -From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Jami Kettunen &lt;<a href=3D"mailto:jami.kettunen@prot=
onmail.com" target=3D"_blank">jami.kettunen@protonmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 31 Aug 2021 00:15:58 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint=
 to fix musl build<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Backport<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Fixes the following error I noticed when building against aa=
rch64 with<br>
&gt;&gt; &gt; -musl libc:<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 In file included from ../src/freedreno/decode/crashde=
c.h:38,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from ../src/freedreno/decode/crashdec.c:40:<br>
&gt;&gt; &gt; -=C2=A0 ../src/freedreno/common/freedreno_pm4.h:104:15: error=
: unknown type name &#39;uint&#39;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 104 | static inline uint<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt;&gt; &gt; -=C2=A0 ../src/freedreno/common/freedreno_pm4.h:105:25: error=
: unknown type name &#39;uint&#39;; did you mean &#39;int&#39;?<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 105 | pm4_calc_odd_parity_bit(uint val)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Jami Kettunen &lt;<a href=3D"mailto:jami.kett=
unen@protonmail.com" target=3D"_blank">jami.kettunen@protonmail.com</a>&gt;=
<br>
&gt;&gt; &gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/19665" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/merge_requests/19665</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - src/freedreno/common/freedreno_pm4.h | 4 ++--<br>
&gt;&gt; &gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/src/freedreno/common/freedreno_pm4.h b/src/free=
dreno/common/freedreno_pm4.h<br>
&gt;&gt; &gt; -index 8f958953d693..091247e709a0 100644<br>
&gt;&gt; &gt; ---- a/src/freedreno/common/freedreno_pm4.h<br>
&gt;&gt; &gt; -+++ b/src/freedreno/common/freedreno_pm4.h<br>
&gt;&gt; &gt; -@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cn=
t)<br>
&gt;&gt; &gt; - #define cp_type3_opcode(pkt) (((pkt) &gt;&gt; 8) &amp; 0xFF=
)<br>
&gt;&gt; &gt; - #define type3_pkt_size(pkt)=C2=A0 ((((pkt) &gt;&gt; 16) &am=
p; 0x3FFF) + 1)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --static inline uint<br>
&gt;&gt; &gt; --pm4_calc_odd_parity_bit(uint val)<br>
&gt;&gt; &gt; -+static inline unsigned<br>
&gt;&gt; &gt; -+pm4_calc_odd_parity_bit(unsigned val)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 return (0x9669 &gt;&gt; (0xf &amp; ((val) ^ ((=
val) &gt;&gt; 4) ^ ((val) &gt;&gt; 8) ^<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((val) &gt;&gt; 12) ^ ((val) =
&gt;&gt; 16) ^ ((val) &gt;&gt; 20) ^<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.39.2<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backen=
d-fix-gbm-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001=
-gbm-backend-fix-gbm-compile-without-dri.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 6541671b7a..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-g=
bm-compile-without-dri.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,65 +0,0 @@<br>
&gt;&gt; &gt; -From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt;&gt; &gt; -Date: Wed, 28 Dec 2022 16:28:01 -0600<br>
&gt;&gt; &gt; -Subject: [PATCH] gbm/backend: fix gbm compile without dri<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Backport<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_=
requests/20447" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/mesa/mesa/-/merge_requests/20447</a><br>
&gt;&gt; &gt; -<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit=
/842ca284650f066e58706741a7d22d67b5088e60" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e5870=
6741a7d22d67b5088e60</a><br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -At mesa version 22.2.3 patch wasn&#39;t introduced until aft=
er.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Commit introduces a fix that allows for gbm to be built with=
 an empty<br>
&gt;&gt; &gt; -backend. There are situation especially in a Yocto/OE cross =
compilation<br>
&gt;&gt; &gt; -environment where you want to build with an empty backend. T=
he particular<br>
&gt;&gt; &gt; -situation is as such:<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -The mesa-gl recipe is the preferred provider for virtual/lib=
gbm, virtual/libgl,<br>
&gt;&gt; &gt; -virtual/mesa, etc... But the x11 DISTRO_FEATURE in&#39;t inc=
luded this leads to build<br>
&gt;&gt; &gt; -errors such as:<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: =
in function `find_backend&#39;:<br>
&gt;&gt; &gt; -| backend.c:(.text.find_backend+0xa4): undefined reference t=
o `gbm_dri_backend&#39;<br>
&gt;&gt; &gt; -| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(=
.data.rel.ro.builtin_backends+0x4):<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unde=
fined reference to `gbm_dri_backend&#39;<br>
&gt;&gt; &gt; -| collect2: error: ld returned 1 exit status<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Issue should be replicable by setting -Ddri3=3Ddisabled and =
-Dgbm=3Denabled<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Add fix to bypasses compilation issue by excluding gbm dri b=
ackend. If<br>
&gt;&gt; &gt; -HAVE_DRI || HAVE_DRIX not specified.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Acked-by: David Heidelberg &lt;<a href=3D"mailto:david.heide=
lberg@collabora.com" target=3D"_blank">david.heidelberg@collabora.com</a>&g=
t;<br>
&gt;&gt; &gt; -Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;=
<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - src/gbm/main/backend.c | 4 ++++<br>
&gt;&gt; &gt; - 1 file changed, 4 insertions(+)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c=
<br>
&gt;&gt; &gt; -index 974d0a76a4e..feee0703495 100644<br>
&gt;&gt; &gt; ---- a/src/gbm/main/backend.c<br>
&gt;&gt; &gt; -+++ b/src/gbm/main/backend.c<br>
&gt;&gt; &gt; -@@ -42,7 +42,9 @@<br>
&gt;&gt; &gt; - #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))<br>
&gt;&gt; &gt; - #define VER_MIN(a, b) ((a) &lt; (b) ? (a) : (b))<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE=
_DRI3)<br>
&gt;&gt; &gt; - extern const struct gbm_backend gbm_dri_backend;<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - struct gbm_backend_desc {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 const char *name;<br>
&gt;&gt; &gt; -@@ -51,7 +53,9 @@ struct gbm_backend_desc {<br>
&gt;&gt; &gt; - };<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static const struct gbm_backend_desc builtin_backends[] =3D=
 {<br>
&gt;&gt; &gt; -+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE=
_DRI3)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 { &quot;dri&quot;, &amp;gbm_dri_backend },<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; - };<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define BACKEND_LIB_SUFFIX &quot;_gbm&quot;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.34.1<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-util-forma=
t-Check-for-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0=
001-util-format-Check-for-NEON-before-using-it.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index d22ff3c8a8..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check=
-for-NEON-before-using-it.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,47 +0,0 @@<br>
&gt;&gt; &gt; -From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Thu, 2 Dec 2021 19:57:42 -0800<br>
&gt;&gt; &gt; -Subject: [PATCH] util/format: Check for NEON before using it=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -This fixes build on rpi0-w and any other machine which does =
not have<br>
&gt;&gt; &gt; -neon unit and is not used as FPU unit<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Fixes errors e.g.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -In file included from ../mesa-21.3.0/src/util/format/u_forma=
t_unpack_neon.c:35:<br>
&gt;&gt; &gt; -/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux=
-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/includ=
e/arm_neon.h:32:2: error: &quot;NEON support not enabled&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freede=
sktop.org/mesa/mesa/-/merge_requests/14032" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032</a>]<=
br>
&gt;&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - src/util/format/u_format.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; &gt; - src/util/format/u_format_unpack_neon.c | 2 +-<br>
&gt;&gt; &gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/src/util/format/u_format.c b/src/util/format/u_=
format.c<br>
&gt;&gt; &gt; -index c071250..0880984 100644<br>
&gt;&gt; &gt; ---- a/src/util/format/u_format.c<br>
&gt;&gt; &gt; -+++ b/src/util/format/u_format.c<br>
&gt;&gt; &gt; -@@ -1184,7 +1184,7 @@ static void<br>
&gt;&gt; &gt; - util_format_unpack_table_init(void)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 for (enum pipe_format format =3D PIPE_FORMAT_N=
ONE; format &lt; PIPE_FORMAT_COUNT; format++) {<br>
&gt;&gt; &gt; --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) =
&amp;&amp; !defined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
&gt;&gt; &gt; -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &am=
p;&amp; defined(PIPE_ARCH_ARM))) &amp;&amp; !defined(NO_FORMAT_ASM)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct util_format_unpack_d=
escription *unpack =3D util_format_unpack_description_neon(format);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unpack) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util_format_unpack_table[=
format] =3D unpack;<br>
&gt;&gt; &gt; -diff --git a/src/util/format/u_format_unpack_neon.c b/src/ut=
il/format/u_format_unpack_neon.c<br>
&gt;&gt; &gt; -index a4a5cb1..1e4f794 100644<br>
&gt;&gt; &gt; ---- a/src/util/format/u_format_unpack_neon.c<br>
&gt;&gt; &gt; -+++ b/src/util/format/u_format_unpack_neon.c<br>
&gt;&gt; &gt; -@@ -23,7 +23,7 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;u_format.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) =
&amp;&amp; !defined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
&gt;&gt; &gt; -+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) &am=
p;&amp; defined(PIPE_ARCH_ARM))) &amp;&amp; !defined(NO_FORMAT_ASM)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - /* armhf builds default to vfp, not neon, and refuses to co=
mpile neon intrinsics<br>
&gt;&gt; &gt; -=C2=A0 * unless you tell it &quot;no really&quot;.<br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mes=
a-gl_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a> =
b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_23.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">mesa-gl_23.0.0.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa=
-gl_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.3.5.bb</a><b=
r>
&gt;&gt; &gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-g=
l_23.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_23.0.0.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recip=
es-graphics/mesa/mesa.inc<br>
&gt;&gt; &gt; index b082b49400..8f72f25c17 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; &gt; @@ -17,12 +17,9 @@ PE =3D &quot;2&quot;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.o=
rg/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http=
s://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-me=
son.build-check-for-all-linux-host_os-combinations.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-me=
son-misdetects-64bit-atomics-on-mips-clang.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-util-fo=
rmat-Check-for-NEON-before-using-it.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gbm-bac=
kend-fix-gbm-compile-without-dri.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freedre=
no-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;3eed2ecae2bc674494566faab9fcc9b=
eb21cd804c7ba2b59a1694f3d7236e6a9&quot;<br>
&gt;&gt; &gt; +SRC_URI[sha256sum] =3D &quot;01f3cff3763f09e0adabcb8011e4aeb=
c6ad48f6a4dd4bae904fe918707d253e4&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&g=
t;\d+(\.\d+)+)&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mes=
a_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a> b/meta=
/recipes-graphics/mesa/<a href=3D"http://mesa_23.0.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">mesa_23.0.0.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa=
_22.3.5.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.3.5.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_2=
3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_23.0.0.bb</a><br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.30.2<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178791): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178791" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178791</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97647023/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97647023/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000097046b05f7314635--

