Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C9C54FD2
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 12:14:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36338.1772972075433865904
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 05:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KY9NtyRY;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a142464316so1290913e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 05:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772972073; cv=none;
        d=google.com; s=arc-20240605;
        b=VaMZgUZ0pta+uWiGMCqTOChHN8vrBueEdkTNSki/PtbLyDmFpohu9kkm0JgJ4DMBYR
         NdxZ2PAcrxyRwc73v8CP2V4sWT7YsyvKueJAzsJOUrb8hI1gqOLIe5sek2hsW9A4FBKf
         zHQRsIeDVt2AG1N3qgbGuVwuV1Y9xRh4wizKGi94VbcPZSvoK5++lI9h88W2yU+Xjost
         cDWkGWOXlFihllHVq9D2mwHOwHbDot6PU/W7HoLjyax8h6nLQw8oPwqSybl4YP9EcDfV
         Vn0EFr7XqtERtTETxIGdSYvx22AUdZGp78A/fTep68TQXLZCSJxVGfbSG2INIDB1AFXl
         55rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W1zikRHqLg2WZeL/ULOV5UOj9ydEKCwpJI/kGlRhRGw=;
        fh=cG6Ad2t1LCD169UEVWHNgP0ONi2UYGXe/FpTonbWJGA=;
        b=Cf/56XthSF26gVzuNSBbAVoJvVZv5WKQqMU0/2Al5D5HhqH6pWS9NXNwUiFvxtix6j
         b5R06c22vL5bPU2wYJLBTmP7badtUWIQCVnCOn72cHaUDK9/ka0gz1LfGn5abTiHBCDB
         5UCwv2eMmwdwT4xoFBBVMZHj0SPR4A1iTyLH0NWNW1BcuU15MaNOTHnzPdFHMu6X5RWj
         O5BrDwoA5aQPMcEb1ZZjROTV2+K3aF34WMQJ72Z2elayGFt4ohaozqksStAah1uV2unr
         t72ZeccNmt0ne05jCrNOErPwSOmCfQrDdAFH5hL4hau+g62wqwyprVpG+7SWHOY38Fwi
         ATOw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772972073; x=1773576873; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1zikRHqLg2WZeL/ULOV5UOj9ydEKCwpJI/kGlRhRGw=;
        b=KY9NtyRY3XqJAgyJngEUN1c/ekcL6o5e8My4aV8Sw5+ULjPMaZudOYNS+zlx/Wir8M
         LgDGyH1aT0rxAHK2KrtKLIb9TVTbhEUcnknG+3ccDvfZDfzUObkQFwDD15F1JI1Y45Q3
         7GinSTsUhjqKIhfpagKMWSBTHxWV1wiYWNfzhUvSBVWxmSZeJFSGSEozouerjTkoP6ct
         qkzQEnswW0WfuR/YU9bgH2murvqVNW+RfMiDF86eQgxqnx4bRh8NCqT5bGpZzSWZv+Ca
         3msjfGZlzCEcZRqrZ7KSaI/Go5OfJ/drV3I1A0OYk9Ci793dmtJaazOEf907aAh0CF5Z
         BSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772972073; x=1773576873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1zikRHqLg2WZeL/ULOV5UOj9ydEKCwpJI/kGlRhRGw=;
        b=u9WTnvUqBzHSahRKrYF2XDZVhAg8bJ/DU1ismR3xN8GI5SbXHGY7T7Gezjt1H5mPp2
         2N4oDw5XPFEWfOkiB3XhyJ/oiO8o6hVtqhhFdJPAir9mUUPP+9Dca6G1wziwyiD+jbgI
         pS1Zxia47SqFEXalqfXxQqTtYIjHT39We6KiMm3DbEgIR4ZopHmh4UV+Z1CfOu6BaS3/
         Z3FLXQ9Hc4YiVCx5vyvpPvRO/snfTI6O3O8SXhKjUszgHN29g2WI4cEEdVOVprKqdRqT
         FQoiXVRqoYdddFzYp4rP2VsWn/ofpRpZ4poMaP+3HmJnnn+AGoZNacgQhIFWeGYB8pmm
         fE7w==
X-Gm-Message-State: AOJu0YyydRPASIfs1xRFlRqLiRGZq2qFYjEJ5JUWofS9YE3GKJrQRcJD
	U+AQ3HIyO/5YT5lh8X//XQ5KZiBPlMRqP9x+wMD+k5pmY7Qv5d3geX7ygGyjpBFp/3p4PN3JRIj
	L+sUppQRSFexRN/T1HJH3Y+RhT5QhF04=
X-Gm-Gg: ATEYQzyhYb3VL94j5CdiQ1PiH562H6/2XlT+oADgOuVXN1FkExCo4CxVEJ1D8RRCBE6
	+nbWkW9tBsvGci1hVpECcSYdBEINgcQ2Xuf5y2TKRJeekkO/xrtsx3KpNDE1BGeSgBqBV8JTK1O
	PyJ3+c5ZxDxYs6Su8k2sxjIBo/GANxSg4MnfvobSB7Pg4/qzVkkWHX/DCtX0Owaipz3uBslN3q5
	KupmOIYv397iM7rxuinbW8MZTzQxuRqDylzlYmldHCEUE5bFfSrV0z8G9kVVItnQfpWbGWpRCNi
	jFDCIrleYw==
X-Received: by 2002:a05:6512:3d0e:b0:5a1:2e0c:86ee with SMTP id
 2adb3069b0e04-5a13cd2f4c6mr3308514e87.36.1772972072689; Sun, 08 Mar 2026
 05:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260305180333.306176-1-martin.jansa@gmail.com> <f9600ac4-c65f-4cf3-8b50-7c6e90563538@windriver.com>
In-Reply-To: <f9600ac4-c65f-4cf3-8b50-7c6e90563538@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 8 Mar 2026 13:14:21 +0100
X-Gm-Features: AaiRm50TspUYHb0NLJ6EOSJpOWbOeqVOX_IFLgb7SFkvICfrmmlniln6atN-e8E
Message-ID: <CA+chaQcR9wFdqBCq0GP580-CcfakqM06gadzb=d6m0EseC75qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] m4: upgrade to 1.4.21
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 12:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232641

On Sat, Mar 7, 2026 at 4:00=E2=80=AFPM Robert Yang <liezhi.yang@windriver.c=
om> wrote:
>
> Hi Martin,

Hi Robert,


> On 3/6/26 02:03, Martin Jansa via lists.openembedded.org wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
> > This release is being made mainly to cater to recent glibc changes in
> > light of the C23 language standard.  However, it also includes fixes
> > for some corner-case bugs in eval and when using the defn macro on
> > builtins.
> >
> > Fixes m4-native builds on hosts with glibc-2.43 like:
> > ./stdlib.h:827:20: error: expected identifier or '(' before '_Generic'
> > ./string.h:777:20: error: expected identifier or '(' before '_Generic'
> >
> > Remove 0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
> > which is included in gnulib revision used by m4 since:
> > https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dcommit;h=3Db=
eee8d26382460010338c37f9dd9f823aa9f4ee8
> >
> > LIC_FILES_CHKSUM was updated for barem4.m4 and testbarem4.m4 from:
> > https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dblobdiff;f=
=3Dexamples/COPYING;h=3De623b2b9394cbd1784a4964bbac105050296f33b;hp=3D7e73a=
1219b542fa035facc47cdb3dd81132e6373;hb=3D900a90f624cee4a8c1c02c4d6a61ef1ed2=
6a17d1;hpb=3Dc7b96d682958532c4eb2d5c2d81bb6ac342fd410
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >   .../m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc}       |   5 +-
> >   ...4-native_1.4.20.bb =3D> m4-native_1.4.21.bb} |   0
> >   ...gcc-Wformat-security-warnings-with-d.patch | 133 -----------------=
-
> >   .../m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb}         |   0
> >   4 files changed, 2 insertions(+), 136 deletions(-)
> >   rename meta/recipes-devtools/m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc} (9=
0%)
> >   rename meta/recipes-devtools/m4/{m4-native_1.4.20.bb =3D> m4-native_1=
.4.21.bb} (100%)
> >   delete mode 100644 meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-g=
cc-Wformat-security-warnings-with-d.patch
> >   rename meta/recipes-devtools/m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb} (100=
%)
> >
> > diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devt=
ools/m4/m4-1.4.21.inc
> > similarity index 90%
> > rename from meta/recipes-devtools/m4/m4-1.4.20.inc
> > rename to meta/recipes-devtools/m4/m4-1.4.21.inc
> > index 5c4ba09288..ce9fe2be8e 100644
> > --- a/meta/recipes-devtools/m4/m4-1.4.20.inc
> > +++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
> > @@ -7,19 +7,18 @@ GNU M4 also has built-in functions for including file=
s, running shell commands,
> >   inherit autotools texinfo ptest gettext
> >
> >   SRC_URI =3D "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
> > -           file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-w=
ith-d.patch \
> >              "
> >   SRC_URI:append:class-target =3D " file://run-ptest \
> >                                   file://0001-test-c32ispunct-Check-for=
-musl-along-with-glibc.patch \
> >                                   file://serial-tests-config.patch \
> >                                 "
> >
> > -SRC_URI[sha256sum] =3D "6ac4fc31ce440debe63987c2ebbf9d7b6634e67a7c3279=
257dc7361de8bdb3ef"
> > +SRC_URI[sha256sum] =3D "38ae59f7a30bf9c108193cc5c25fbb06014f21e230c7ed=
e2eff614f7b7c37ed8"
> >
> >   LICENSE =3D "GPL-3.0-only"
> >
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e=
440464\
> > -                 file://examples/COPYING;md5=3D4031593b2166d6c47cae282=
d944a7ede"
> > +                 file://examples/COPYING;md5=3D005f2e201a0526c1d1d79dd=
6303ecf23"
>
> There are new license in the example files barem4.m4 and testbarem4.m4, i=
t just
> says "This program is distributed under a Creative Commons Share-alike li=
cense",
> but not version is specified, I guess we should use CC-BY-SA-4.0.

Is there an option to install the examples? I've checked the build and
image directories and the examples aren't built nor installed.

