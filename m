Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FD7CCA470
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:43:59 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.1535.1759365830816121836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QgWF/eiW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.179, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-43f5dbebf02so194720b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 17:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759365830; x=1759970630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmquxOes98ePH+tuOoVVz8sCm0p7xxv8sBz8c8nCEcg=;
        b=QgWF/eiWcQYQSDoi2ZHj/XJKGtU7WYyq3XhwwNSmMGYszIGkvlrn2xQ3uzeZcPcN3V
         U4ec7IcW1+HW+Ljd3Dlftui/zGxQ3wMKPsnidtCdfmU+gj3d/cDhou16J6UtTVxTh9gv
         FdNB6CwWmYQnDTWvM2bPDK3qArx5Jt0VNmazVn2GOWQBqRKrmFpZb7YkbH+fAwI0ppEN
         jFajkiisIujuTwcnqa1cxwMh0dDCpBmez6m7p5BHcy+oKBRbJBJsbg8IndX+DofMZnRD
         Ju6tCXOf2xMjSrcV/QjeocYdJxETYxOHrS2ZWwE/XoISNFEEcV51Do4L11mLMIqlu97z
         GdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759365830; x=1759970630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmquxOes98ePH+tuOoVVz8sCm0p7xxv8sBz8c8nCEcg=;
        b=eST8O6wvpJjC8JS1d0ZCSXufokIzr86SGCYKQlV/Dez4tsBOxKPYUP5Vjs1dqK4sM+
         8oUQ7B7pWlhdPe0vEJ8ZX5QXmp5WxTN3UtDFalwSKxSNQXKZvDDC5oXE1W37SV4xavQ4
         BKU1OOenazOuVfpaqs1+VZ5VsXooi+RT8iYCy46wz09PX5gbTWdEbK+dJrb0RTlIQ9KV
         qR2n34Neh8vowbmsluR+meCTagNQAn+Wz6r6SY4rVylOhbHytxHpPNg/0HZFKXTMMWC0
         uUG71FSWXPAjMlVsC88amuQcXl43SoizGfSm8sJdLh+NL4Z4FZxCiSDOiJiZALlw3p13
         DczQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcx2rMN4a615bnFO+KB3p1lCXA8SmdDLqd0xRddpkQ37fM7yIwWAIWzXZXhZVRfTNEMz/R/h2/cxCa78BS81L+Ow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiBY9/5hb8cm0m7j+HYKUf/tHrWAs5JsdqphjJkR+vubnJwXo7
	XO3cH48OJovPUIQAp34x3k4L0piH4W4mTjzrfhrkxUA3Natb+CFPnU6J3HJxS4fPslf7pAQf2Ei
	W8TzU/cqvfFimAmMwcnMcZxEC1Q2B04xSVgMZudH5
X-Gm-Gg: ASbGncuAUULIoRJL+Z+cm35dWwLXNv/RJYM4S9wpje/gPeTNgIcjNa+JZZf1pbSy2VX
	haitBYXOqc6OddWskEL3g5DIebaOp5jurYNXY0TQ4JvpoA0Vaz6BxgdMErOvUnp/i4Bwdj81koH
	5zxJBiQKvBIO29SMvR02GNsVw/+4r5vLjsggvMvE1cVsFO3vrxSjIc6By5exCteuccXFCj82JbT
	L6x3kUUfHsKpVtlKUwTjbFwzOEV1P+G
X-Google-Smtp-Source: AGHT+IFp2nBxqfABYoaoPSl5mFIuVO6Dn6iNGy26xIeOwMnBw25Q/R7SAEfy32h6LdjYUk6jpWe3v0baEwXlB3TpIo4=
X-Received: by 2002:a05:6808:189d:b0:43f:5c61:448c with SMTP id
 5614622812f47-43fa431d9e8mr2684094b6e.39.1759365829948; Wed, 01 Oct 2025
 17:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251001175814.62654-1-jon.mason@arm.com> <CAMKF1spNLy87m4tKzxwctbj3MhmXiCp4-e7cNWdg2D+kzZ1wzw@mail.gmail.com>
In-Reply-To: <CAMKF1spNLy87m4tKzxwctbj3MhmXiCp4-e7cNWdg2D+kzZ1wzw@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 1 Oct 2025 20:43:39 -0400
X-Gm-Features: AS18NWAzjdGv-tMY1PhOdim2umIHyketESJ4uhbJIOoS5CKXtN3nnn0uLsuojCI
Message-ID: <CAPoiz9xyAK8zzCkDc_qWKjSun2B0s7uBh08by-z8dgtoEmzJHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tunes/arm: add support for newer arm64 cores
To: raj.khem@gmail.com
Cc: jon.mason@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224340

On Wed, Oct 1, 2025 at 2:10=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Oct 1, 2025 at 10:58=E2=80=AFAM Jon Mason via lists.openembedded.=
org
> <jon.mason=3Darm.com@lists.openembedded.org> wrote:
> >
> > Add tunes for cores that have been present since GCC 14.1.0.
> > These have been present in meta-arm since mid-July, and have all been
> > verified with fvp-base and testimage.  Of those present in meta-arm,
> > arch-armv8-9a.inc, arch-armv9-4a.inc, and arch-armv9-5a.inc have been
> > excluded from this commit, as there are currently issues compiling some
> > packages (but still present in meta-arm for those that want to use them
> > despite those issues).
> >
>
> I checked that these options are also available in clang 20+ as well. So
> these changes are ok. It will be good to verify some builds with clang
> as TOOLCHAIN
> and see all holds

I checked armv8-8a and armv9-3a with fvp-base and clang, and it passes
testimage.

Thanks,
Jon

>
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv8-7a.inc | 14 ++++++++++++++
> >  meta/conf/machine/include/arm/arch-armv8-8a.inc | 14 ++++++++++++++
> >  meta/conf/machine/include/arm/arch-armv9-1a.inc | 13 +++++++++++++
> >  meta/conf/machine/include/arm/arch-armv9-2a.inc | 13 +++++++++++++
> >  meta/conf/machine/include/arm/arch-armv9-3a.inc | 13 +++++++++++++
> >  5 files changed, 67 insertions(+)
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv8-7a.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv8-8a.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv9-1a.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv9-2a.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv9-3a.inc
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv8-7a.inc b/meta/con=
f/machine/include/arm/arch-armv8-7a.inc
> > new file mode 100644
> > index 000000000000..6039baca3568
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv8-7a.inc
> > @@ -0,0 +1,14 @@
> > +DEFAULTTUNE ?=3D "armv8-7a"
> > +
> > +TUNEVALID[armv8-7a] =3D "Enable instructions for ARMv8.7-a"
> > +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7=
a', ' -march=3Darmv8.7-a', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a=
', 'armv8-7a:', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES +=3D "armv8-7a"
> > +ARMPKGARCH:tune-armv8-7a                    ?=3D "armv8-7a"
> > +TUNE_FEATURES:tune-armv8-7a                  =3D "aarch64 armv8-7a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-7a            =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv8a} armv8-7a"
> > +BASE_LIB:tune-armv8-7a                       =3D "lib64"
> > diff --git a/meta/conf/machine/include/arm/arch-armv8-8a.inc b/meta/con=
f/machine/include/arm/arch-armv8-8a.inc
> > new file mode 100644
> > index 000000000000..5694330a1d22
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv8-8a.inc
> > @@ -0,0 +1,14 @@
> > +DEFAULTTUNE ?=3D "armv8-8a"
> > +
> > +TUNEVALID[armv8-8a] =3D "Enable instructions for ARMv8.8-a"
> > +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8=
a', ' -march=3Darmv8.8-a', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a=
', 'armv8-8a:', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES +=3D "armv8-8a"
> > +ARMPKGARCH:tune-armv8-8a                    ?=3D "armv8-8a"
> > +TUNE_FEATURES:tune-armv8-8a                  =3D "aarch64 armv8-8a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-8a            =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv8a} armv8-8a"
> > +BASE_LIB:tune-armv8-8a                       =3D "lib64"
> > diff --git a/meta/conf/machine/include/arm/arch-armv9-1a.inc b/meta/con=
f/machine/include/arm/arch-armv9-1a.inc
> > new file mode 100644
> > index 000000000000..f9e6dce77c82
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv9-1a.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?=3D "armv9-1a"
> > +
> > +TUNEVALID[armv9-1a] =3D "Enable instructions for ARMv9.1-a"
> > +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1=
a', ' -march=3Darmv9.1-a', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a=
', 'armv9-1a:', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv9a.inc
> > +
> > +AVAILTUNES                                  +=3D "armv9-1a"
> > +ARMPKGARCH:tune-armv9-1a                    ?=3D "armv9-1a"
> > +TUNE_FEATURES:tune-armv9-1a                  =3D "aarch64 armv9-1a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv9a} armv9-1a"
> > +BASE_LIB:tune-armv9-1a                       =3D "lib64"
> > diff --git a/meta/conf/machine/include/arm/arch-armv9-2a.inc b/meta/con=
f/machine/include/arm/arch-armv9-2a.inc
> > new file mode 100644
> > index 000000000000..4b5cf3ed156a
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv9-2a.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?=3D "armv9-2a"
> > +
> > +TUNEVALID[armv9-2a] =3D "Enable instructions for ARMv9.2-a"
> > +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2=
a', ' -march=3Darmv9.2-a', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a=
', 'armv9-2a:', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv9a.inc
> > +
> > +AVAILTUNES                                  +=3D "armv9-2a"
> > +ARMPKGARCH:tune-armv9-2a                    ?=3D "armv9-2a"
> > +TUNE_FEATURES:tune-armv9-2a                  =3D "aarch64 armv9-2a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv9a} armv9-2a"
> > +BASE_LIB:tune-armv9-2a                       =3D "lib64"
> > diff --git a/meta/conf/machine/include/arm/arch-armv9-3a.inc b/meta/con=
f/machine/include/arm/arch-armv9-3a.inc
> > new file mode 100644
> > index 000000000000..c345f1532c48
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv9-3a.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?=3D "armv9-3a"
> > +
> > +TUNEVALID[armv9-3a] =3D "Enable instructions for ARMv9.3-a"
> > +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3=
a', ' -march=3Darmv9.3-a', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a=
', 'armv9-3a:', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv9a.inc
> > +
> > +AVAILTUNES                                  +=3D "armv9-3a"
> > +ARMPKGARCH:tune-armv9-3a                    ?=3D "armv9-3a"
> > +TUNE_FEATURES:tune-armv9-3a                  =3D "aarch64 armv9-3a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv9a} armv9-3a"
> > +BASE_LIB:tune-armv9-3a                       =3D "lib64"
> > --
> > 2.50.1 (Apple Git-155)
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224318): https://lists.openembedded.org/g/openembedde=
d-core/message/224318
> Mute This Topic: https://lists.openembedded.org/mt/115538599/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

