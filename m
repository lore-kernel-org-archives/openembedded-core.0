Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF7C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 06:42:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.7257.1743662540143348361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 23:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=coWziGli;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso689915e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743662538; x=1744267338; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgCfKY6QKjc85swo+2E4bAJeCKHXcFQDlWWC5kGwMOE=;
        b=coWziGlifvZLD3sJbQe95CtbKKWQcbPfYA/U4E9PbViD+H+NAc1YPrBYXSqJ7BWzWG
         TO7u8TPD33gEM7rvG/VhvzYlZkNN9l7JsVE3DlkVjenh+PXGMSCH970gu71u1rGbCJRV
         o7eQX8MJ5GV/RGEioC44g4/PK44SAQ525Vop7+nk4r8rshCqjVK2Emuz0SM1zVAYrEnR
         wMbQwupSXxevxrNwyJUdfuS9zQ39FNfpyFw0SWT0NTMD2Sk3MR53xujsuD8px8hnXVN5
         2mnMVNFLu/V0MkAxQO7kvuuiPM6rElaIg32UoLOsAA9cQir+STwzkLnHiTOC1t6X3VUC
         yy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662538; x=1744267338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgCfKY6QKjc85swo+2E4bAJeCKHXcFQDlWWC5kGwMOE=;
        b=c4xkzjRKEdekCh0gXncADR2PHfak2R+jCfL0aXd2YCePv3Zwj8oaU+57uH8obOSg4g
         H0MfQi9H3QvuiUQOcpGmHgnPQYGWk2V0pAYmfwIn5aqAneGrlbflujfKqb7Eseqgtrfq
         BHI3r1i3ODohbuJPIiY0EU66hIiUbIAAvLvOx2GJGzJZAiwupcgUK25fya4V+XMxa0Jr
         qrIkTCKPzJMOQhrew1jrd+8aLYcTczXbpA61tK/mxyFYj7PwFyhZnHDMPuKYvtN0fUWr
         inHAY3o8Rlk9pbJkK4DWygf+TP2zVsMlp1tGV+YuFXPmt2MXRlFfRVmfflahJ4iFpeOd
         JeYA==
X-Gm-Message-State: AOJu0Ywihz+jMuA0VSfxLLnEpTSFyUM8SBsJ7fu2ENsJ7V0HQZn4Hu9x
	0j7pyrq++CV/I81/Dqje+IneBUIhmX+gvRHBgVs/2Nivw14XzrNbxmNdNHH2kigI3Srk0Z3G+Pa
	JDBrq/hDixW6DRgufRyteV2DhP08=
X-Gm-Gg: ASbGnctfddEL1F/zn/EwY/T8gshURAHgZHpM1UYWT6omrLTuLsgCsxH7IorkP59Gror
	gGd3GFBbY/3aJs69Ohw6sKHK9lm9e7gEaXgL29NpomJ59BN5JKsjYhwpDBjGAhI+pJjQAGcMNVk
	mNhfpyO+V4HQSjN3WbYUUh1Mz8nUj7CkIId0JdIlm2d+IlJuCo1VP8gsg=
X-Google-Smtp-Source: AGHT+IH8tuDwDy1KbOL91HKVI/JtZy68qG3GhAw1N77DdvNQdURLQ4pcAm8bOS7RzgT7GZmb8ofHI24H7H4VTPnwrqM=
X-Received: by 2002:a05:651c:2118:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-30de02cf13dmr68553851fa.25.1743662537676; Wed, 02 Apr 2025
 23:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
In-Reply-To: <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 3 Apr 2025 07:42:06 +0100
X-Gm-Features: AQ5f1Jrcou22MrrvSRLI695OIn6JsG2LD-8xzk01F5wTpzCONVA6GiEbIKf-IBk
Message-ID: <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 06:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214301

On Wed, Apr 2, 2025 at 8:33=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.or=
g wrote:
> > connman has a legacy style, this patch set adds in all the PACKAGECONFI=
G
> > options which the upstream pacakge supports, removes patches which are =
no
> > longer required, explicitly supports operation alongside systemd-resolv=
ed and
> > reworks the packaging so that PACKAGECONFIG and explicit package select=
ion for
> > every VPN is no longer required.
> >
> > Everything up to the final patch should be backward compatible cleanup =
of the
> > existing recipe, with only the final patch reworking the packaging.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > Alex Kiernan (5):
> >       connman: Merge .inc into .bb
> >       connman: Delete patches for gold and MIPS binutils fix
> >       connman: Move ppp from DEPENDS to PACKAGECONFIG
> >       connman: Add all build options as PACKAGECONFIG
> >       connman: Rework to avoid splitting into many single binary packag=
es
> >
> >  meta/recipes-connectivity/connman/connman.inc      | 221 -------------=
--------
> >  ...vice-stop-systemd-resolved-when-we-use-co.patch |  26 ---
> >  ...ange-visibility-to-default-for-debug-symb.patch |  31 ---
> >  .../connman/connman/no-version-scripts.patch       |  47 -----
> >  meta/recipes-connectivity/connman/connman_1.44.bb  | 154 +++++++++++++=
-
> >  5 files changed, 147 insertions(+), 332 deletions(-)
>
> This failed in testing on the first try. I've added:
>
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 03f02d14ae8..c5ddea79005 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>
>  IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-ssh-openssh =
packagegroup-self-hosted \
> -                 kernel-dev kernel-devsrc connman connman-plugin-etherne=
t dhcpcd \
> +                 kernel-dev kernel-devsrc connman dhcpcd \
>                   tzdata python3-pip perl-misc"
>
>  IMAGE_FEATURES +=3D "x11-base package-management splash"

Is keeping all those RPROVIDES (plus doubtless more at this point)
actually useful? I can see it in the traditional distribution world,
but for OE-Core it feels mostly redundant to me.

--=20
Alex Kiernan

