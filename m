Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74033F4487A
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 09:44:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.234632.1775987049473044177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 02:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LjtWZZwS;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2b636b944so3788419e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775987048; cv=none;
        d=google.com; s=arc-20240605;
        b=YP+AAaBjP7sFdrdQ22cM/KOlRPSY8ckEYe5K+XenbRtvVddjNJHQTZruVbrAIWDeB9
         aVHht0IdywiSIkGdJWtlid1rwamSWrChp3ZdL+mSfmAGlOZYv/kyPJPzTGnyG7CFKrRq
         Dt6R9YifiNnU7J+VaqLNGMcQOFIU+kapL48CaxB8sTpulvnpf36ZzNl98n87OrhbeiBs
         qfgkDbPOl0Is7pM3OkLmpuYBq+AJLlKJmC9bypRA44FK/Dl0RKDbOe5zVxqPI6Xph6kJ
         rGe15x+pLxxXKMVR8YlJQGwZcj5quRU6AfVYZCXOm43allkx9VtqHn6Wrli/r7dB0dGV
         /4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NKbm4GeKYHW0ZoOCEeToa8aiBLYPWxeLmwN4QoTDsgo=;
        fh=ZFDqbXjYaOFEj+ucwXDGIj93QRTs/hfttca+8o6mnT4=;
        b=FGUTamCvoialZySZ8vbi50jsg6jwZ1KixZcgRhKAzM9Ltkp02bnQyOn5F2CtrSgNwu
         1V6pdK0qEQZKmnQrbBtApfH6Ullp6v7NXcVhbFhIaPY4vY+7GJmUHqyH2DWWzBwcNXzh
         PoGypEkBjdAWU8sXvMboKy6AAxRIMNR4oCM4rMDciMKx78EXzWlWdtttLFi833nYiWb2
         Cs7ZeRYg+cr7Od3KLBykzjJhO9iilVqYrLHoCMz32y5Nls78YoWIVSfLvEFKLpkAcBAg
         qL6lFGFQKO7ri5zYHQgDTVY5mxDhgNL1Rwl0wnZg25XuiMA95ZQXCO98U+/+ly1dyjGI
         OAMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775987048; x=1776591848; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKbm4GeKYHW0ZoOCEeToa8aiBLYPWxeLmwN4QoTDsgo=;
        b=LjtWZZwSqwoofFxwl8vDBlMZ7B/duyd+QMKAkyT17buuLHjDcRHnuN/6vKE17jnRav
         c1NDR0D/KMCIF8VrcHSxFvuRIWiKHe5bNNWJISDtMZmlALiM0D9njN/3C9v4wOCT/+zu
         XLAy6VwgcMqVio2Yfu3TmVnO+ksTXk4fF1XqyfLkiWfqrom1kcTBAlCSmneZ7WrGNGVM
         1bOv7tOP7vb87Vk4BVOqrQHto0xzVVFNkFV6fIlWkmfxRgi99da1IVaxPMdJV5wt4RQa
         k66aDPvbvZi+MHkLepgRbSXrbCn/6QdE38REprLznQcp9iBp8o2u1wA45lI6tgn53YvB
         4jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775987048; x=1776591848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKbm4GeKYHW0ZoOCEeToa8aiBLYPWxeLmwN4QoTDsgo=;
        b=HUQnFtHjW9wfj6QWpuqOg+poJ0tyvGFDjM8kbn/qePMDzIf2LSDjHplUNMy6o13Mcj
         tRI92m7N3rPgZKpnvoUEtqYMP3PedPQ855quG8Kby+ub33RdgPoTUcOaQKr+tmY+VqYM
         gKKONTHSLysci2cd8I75+SY59CwqHh/qGKz4Ic+2NvVEBStPf54lAe6VmlQM5FZ5bgE1
         D484qfe4luIdOhUT7tyf5WeKCUb0a0inwnHnTEBe2bGKPR6dLX318KMg/gzZERTtOMom
         uA8Ymv4uXD0WOGEI0h9yVh+rn0oyiI8sEEXzqfuBi0mUutsbhbk3NVAiUnXbrO1ziT4R
         0Vhg==
X-Gm-Message-State: AOJu0YzXDMlIU729TwJaB7JdEFuz0zzwvNEkRJeFJKB41JM2iy4obmjY
	rr6jzmOqdzTujI/bdh3TDDi2uOeJb72erKad11Tll+HNpnwuPekHvQVbpteDNigbRLsH7hdp8h+
	8aNHbmX671qgoWFvyMKkfDoyNQpuryac=
X-Gm-Gg: AeBDietVQ9u0Zreoh5FOAt+Pum/NPmZz2osL+uPBLlGg3gJW+imH290W/S2445S8hx4
	YLz+6KuVHnWKbow5+QrxO9yeoSLJSmY9tGSzPjQOLnVnibe3BBm3/HHMHT/0SZv1O/Ka/UpmQ7p
	c4rNWb12FJVYqfZDLo8jDbm3Ed/6ksYA6x8Hvyj361brK7wBSGln+eR9IRb3wwq8aD9rmyC1pwQ
	wAKhZdLePYgkLy2QigfZr6gE364tXgTfn+tECr4MmqU/U97Lw+Yy9adM2B/YwIpbaFMfPzuiJHI
	e49ENOEr1HFezMnXMqSK5nMNifTD+m1JiYSgWp9q57SvXMMPo2MGtlGOqoWZEX/XjSxs4VLPzdN
	R
X-Received: by 2002:a05:6512:2308:b0:5a2:b2f5:a2aa with SMTP id
 2adb3069b0e04-5a3efb3c2a0mr2827077e87.29.1775987047211; Sun, 12 Apr 2026
 02:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260410061205.1473776-1-martin.jansa@gmail.com> <DHQC912RAJRW.1MLR6Y2ATF68X@smile.fr>
In-Reply-To: <DHQC912RAJRW.1MLR6Y2ATF68X@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 12 Apr 2026 11:43:54 +0200
X-Gm-Features: AQROBzBI3YIGs4K-wyBeIjFbeia0FyGoq7ik_tnDRfOsXIq_BpI0wQJOyzl_Ufw
Message-ID: <CA+chaQcCr+_uFN+ZYXN=MZzb9dxhGzO3zMiB3NctV2rs94mfJw@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH] virglrenderer: Fix build with glibc 2.43+
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 09:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235060

On Sat, Apr 11, 2026 at 2:52=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Fri Apr 10, 2026 at 8:12 AM CEST, Martin Jansa via lists.openembedded.=
org wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > ---
>
> Thanks Martin,
>
> With this patch, the build progress further but, now, ovmf-native fails t=
o build:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/25/st=
eps/25/logs/stdio (line 16662).
> (I could reproduce that locally with my ubuntu26.04 container)
>
> There is a patch for master[0] but the patches inside it do not apply cle=
anly on the whinlatter version.
>
> [0]: https://lore.kernel.org/openembedded-core/20260409122225.1069828-1-z=
boszor@gmail.com/
>
> Can you send the backport?

Hi,

I've sent fix for all 3, the same upstream patches worked for me in
whinlatter and scarthgap (which needed one more backport), but make
sure to apply them with --keep-cr, because the source uses windows
line endings and git am will remove them by default from the ovmf
.patch file embedded in the .patch for oe-core. Or you can cherry-pick
them from my jansa/scarthgap, jansa/whinlatter, jansa/master in
contrib repo (currently top commit in each).

wrynose: https://lore.kernel.org/openembedded-core/20260412093610.805271-1-=
martin.jansa@gmail.com/T/#u
whinlatter: https://lore.kernel.org/openembedded-core/20260412093637.819659=
-1-martin.jansa@gmail.com/T/#u
scarthgap: https://lore.kernel.org/openembedded-core/20260412093629.816730-=
1-martin.jansa@gmail.com/T/#u

I should have read master[0] before doing my own.. lack of coffee on
Sunday morning..

Cheers,
>
> Regards,
>
> >  ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
> >  .../virglrenderer/virglrenderer_1.1.1.bb      |  1 +
> >  2 files changed, 56 insertions(+)
> >  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0=
001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
> >
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11=
-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-grap=
hics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_I=
NIT-when-presen.patch
> > new file mode 100644
> > index 0000000000..1740d7605f
> > --- /dev/null
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-gl=
ibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
> > @@ -0,0 +1,55 @@
> > +From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
> > +From: Dave Airlie <airlied@redhat.com>
> > +Date: Fri, 7 Nov 2025 13:14:56 +1000
> > +Subject: [PATCH] c11/threads: fix build on c23
> > +
> > +C23/glibc is now including once_init in stdlib.h
> > +
> > +https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c4=
5-107b-5a8a15521083@redhat.com/#213088
> > +
> > +Just fix up our use of it.
> > +
> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virgl=
renderer/-/merge_requests/1567]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
> > + 2 files changed, 4 insertions(+), 1 deletion(-)
> > +
> > +--- a/src/mesa/compat/c11/threads_posix.h
> > ++++ b/src/mesa/compat/c11/threads_posix.h
> > +@@ -51,7 +51,9 @@ Configuration macro:
> > + #include <pthread.h>
> > +
> > + /*---------------------------- macros ----------------------------*/
> > ++#ifndef __once_flag_defined
> > + #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
> > ++#endif
> > + #ifdef INIT_ONCE_STATIC_INIT
> > + #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
> > + #else
> > +@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
> > + typedef pthread_t       thrd_t;
> > + typedef pthread_key_t   tss_t;
> > + typedef pthread_mutex_t mtx_t;
> > ++#ifndef __once_flag_defined
> > + typedef pthread_once_t  once_flag;
> > +-
> > ++#endif
> > +
> > + /*
> > + Implementation limits:
> > +@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
> > +
> > + /*--------------- 7.25.2 Initialization functions ---------------*/
> > + // 7.25.2.1
> > ++#ifndef __once_flag_defined
> > + static inline void
> > + call_once(once_flag *flag, void (*func)(void))
> > + {
> > +     pthread_once(flag, func);
> > + }
> > +-
> > ++#endif
> > +
> > + /*------------- 7.25.3 Condition variable functions -------------*/
> > + // 7.25.3.1
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb=
 b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> > index 89dd25de70..be4385ada6 100644
> > --- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> > @@ -12,6 +12,7 @@ DEPENDS =3D "libdrm libepoxy python3-pyyaml-native vi=
rtual/egl virtual/libgbm"
> >  SRCREV =3D "0f1f43929724a6a414c01a29bc51feccb445c2f0"
> >  SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;bran=
ch=3Dmain;protocol=3Dhttps;tag=3D${PV} \
> >             file://0001-meson.build-use-python3-directly-for-python.pat=
ch \
> > +           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-p=
resen.patch \
> >             "
> >
> >  inherit meson pkgconfig features_check
>
>
> --
> Yoann Congal
> Smile ECS
>

