Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD85C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:32:51 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.105616.1747236762471314931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9T2xiHA;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-603f54a6cb5so3724017eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747236761; x=1747841561; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQaTkXTVn9dVAxqJzUKAiWsWSYyuJrSfbioVmpALUhc=;
        b=V9T2xiHAJ09Uw4gTNKdg4V1LxN3Fl/hE9WDL+2uyyUfDBMv8Ym6JC/oO65OXBDaIBB
         39N6xTAE+aRh3rEsi+bvovem7kYTC1DqMwJVd80V0BmIFK5Qn+uwlmplLHUrCQ288caV
         8Y+5bbe4bA/2/uAgcaZssYdmrq0KRr8KOKVdQe/ZFIjZ0Q7DF+lYRTN97TXrZNOlu2hP
         ld/mbQdcWDhwbZ+4Od04yJEd27MNwE1WTh2RAMtGRq/okUpJM7GALSG20Vcc2wm/FaYj
         HuDmZ7gnAP4o1D/f93ApudYApUn+73EVs6ThsSlA5QYb9MTO1FYtawVA/1aco6xEc2Hs
         7rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236761; x=1747841561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQaTkXTVn9dVAxqJzUKAiWsWSYyuJrSfbioVmpALUhc=;
        b=wHyLa6FgwEDAuYviojzIAo74gEgDL+t5d5wKsRDeNZQgPer0YHBN229oBtYVs3vm6a
         sPpuWXQnbgTXpWnf1YSWvnwf9mSpqUZ2lGlUyv7+FFbM40SXzSVdIhK8ql2VLwTQOVNS
         NX6kUppy+WxWEGS5fj5PtPcpVbnHPLhB3qNJ3VXl8fQkps3/fBAFUGz5hyn2saEliyf7
         NdoEobrWZe1FIQN5LKTb646NhE5KYXbxsdcs2SrHQc0zEIsHkC0O5JQJ1byOkYO9BDhN
         rY0SZno249kH9aTwZkA9ZrE9/gGfYiaF08GkD9V/lxbv4eJEMUnYK8jOjQJrFwh68Bl0
         R/Fw==
X-Gm-Message-State: AOJu0YwGqHgHOsz+q1g5JcIAEG3n/I8xzc1Uxsr1ld+SgyE2ey2Nt4f3
	2gnXfq4MBdM+RSi2+/WR0DJlCmlQxLIL3KHJWiiF+32GruvFPpjLkH11hCo/F6X6eHGPrBpEArV
	gFVMbaagPhLXmZhyFbwOc9JI0Wwg=
X-Gm-Gg: ASbGncsKDMadlW3BPEThnXCrESdoKhzYaCGGb7zkp9CT6Dll7UPN5OUQ4nKbl2IvFFe
	+x0a2tARlpDb7NuOWMw7t8lQvZLgv9POYwCGR3KMWiyUdJNqOc/0Ulq4q69YhwXjte8GEjwNHzj
	UqeRUpLKZipoCRFvX2dXR/LHLfV1TWuz3kqNu83xeU2a0=
X-Google-Smtp-Source: AGHT+IEKmzlkYobaAbceOT6J3VfI/itOIzLz6A3LouLYKZMbBvY+fRNzW+Hp7enKzwc74KyqqJTwU9mkp0DDXk7Yffc=
X-Received: by 2002:a05:6820:4cca:b0:606:462:5d1a with SMTP id
 006d021491bc7-609df158b5amr1944402eaf.2.1747236761563; Wed, 14 May 2025
 08:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250514151718.1495233-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250514151718.1495233-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 May 2025 08:32:15 -0700
X-Gm-Features: AX0GCFuez3Nwfk8wpLzG3C2_YjF2zg0IbNBvrEEsjotjkGdk5cgnXYFPohmP0L4
Message-ID: <CAMKF1soFWL9+SntQjv_JOPWLmAiNRxvc5nyqPAQ_ed1cHXyNfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix riscv multilib issues in plain toolchains
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216499

On Wed, May 14, 2025 at 8:17=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> RISC-V multilib currently doesn't work at all. We could disable multilib =
for
> the riscv platform but that would then behave differently to all our othe=
rs.
> Instead, copy the non-multilib config over the multilib config for now fo=
r
> riscv, meaning we can keep the platforms similar.
>
> This isn't quite enough as the triplet specific c++ headers are in the wr=
ong
> place leading to compiler issues and testimage failures. Work around that=
 too
> until someone adds full multilib support for the platform (if desired).
>

This is in-line with what we have done so far so I am good that way.
The multilib mapping
makes me nervous though, it just keeps growing and it might not be
sufficient for bare metal
multilib cases. I think we need some re-doing to accommodate it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc | 6 ++++++
>  meta/recipes-devtools/gcc/gcc-runtime.inc         | 5 +++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/rec=
ipes-devtools/gcc/gcc-multilib-config.inc
> index 2dbbc23c940..d9959364c3a 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -34,6 +34,7 @@ python gcc_multilib_setup() {
>                  '%s/aarch64/aarch64-linux.h' % src_conf_dir,
>                  '%s/aarch64/aarch64-cores.def' % src_conf_dir,
>                  '%s/arm/linux-eabi.h' % src_conf_dir,
> +                '%s/riscv/t-linux*' % src_conf_dir,
>                  '%s/*/linux.h' % src_conf_dir,
>                  '%s/linux.h' % src_conf_dir)
>
> @@ -45,6 +46,9 @@ python gcc_multilib_setup() {
>              bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
>              bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
>
> +    # For now, force the riscv multilib view to our own meaning we can a=
lways enable multilib
> +    bb.utils.copyfile('%s/riscv/t-linux' % src_conf_dir, '%s/riscv/t-lin=
ux-multilib' % build_conf_dir)
> +
>      pn =3D d.getVar('PN')
>      multilibs =3D (d.getVar('MULTILIB_VARIANTS') or '').split()
>      if not multilibs and pn !=3D "nativesdk-gcc":
> @@ -145,6 +149,7 @@ python gcc_multilib_setup() {
>          'i686'      : ['gcc/config/i386/t-linux64'],
>          'mips'      : ['gcc/config/mips/t-linux64'],
>          'mips64'    : ['gcc/config/mips/t-linux64'],
> +        'riscv64'     : ['gcc/config/riscv/t-linux-multilib'],
>          'powerpc'   : ['gcc/config/rs6000/t-linux64'],
>          'powerpc64' : ['gcc/config/rs6000/t-linux64'],
>          'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
> @@ -161,6 +166,7 @@ python gcc_multilib_setup() {
>          'powerpc64' : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.=
h'],
>          'aarch64'   : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64=
-linux.h', 'gcc/config/arm/linux-eabi.h'],
>          'arm'       : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64=
-linux.h', 'gcc/config/arm/linux-eabi.h'],
> +        'riscv64'     : ['gcc/config/linux.h'],
>      }
>
>      libdir32 =3D 'SYSTEMLIBS_DIR'
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index afcc13a310c..fe1f43b2fd7 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -144,6 +144,11 @@ do_install:append:class-target () {
>                 ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}$=
{includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
>         fi
>
> +       if [ "${TARGET_ARCH}" =3D "riscv64" -a "${MULTILIB_VARIANTS}" =3D=
 "" ]; then
> +               mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/* ${D=
}${includedir}/c++/${BINV}/bits
> +               mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/ext/* ${D}=
${includedir}/c++/${BINV}/ext
> +       fi
> +
>         if [ "${TCLIBC}" !=3D "glibc" ]; then
>                 case "${TARGET_OS}" in
>                         "linux-musl" | "linux-*spe") extra_target_os=3D"l=
inux";;
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216497): https://lists.openembedded.org/g/openembedde=
d-core/message/216497
> Mute This Topic: https://lists.openembedded.org/mt/113110028/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

