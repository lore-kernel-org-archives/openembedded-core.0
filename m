Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14132D75BA6
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 03:08:50 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.2573.1732158524006140588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 19:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PULgITkK;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-718119fc061so184736a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732158523; x=1732763323; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVceaAFCJlE8qsWIWcBOvElGxf6mdkdegEydRIvjun4=;
        b=PULgITkKBEUGstHKRLZiEX3Yslj3kXAvuke75Pizs0oOlqBHrP3dS20tJPD+8zlr5P
         vEnOt6gb3acTcgTiV/7oqIwfFKBMBX/cjbRvdNHVM6b5S2USIkOktozyg72pbvBDag/3
         gbLR7KrpTZQlO9dYW9jGLxVNMPuK/uC2UI/G7yeF/kKm2tRYfOEJvpw29tQ+8WpwryyP
         CBa94nCDyBm5eQB5UNN7PMiT6Z2ChPZ4eY/GSeidrRlmvJ8B7GEyqH2+CGMl10ksk2KW
         WE7Qt71Lbu8vCBiqwNSJAB4Z3PbY462RTYFsQhWGx6XUD3ul5X4ZGwKytiK6hELbgDAl
         2bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732158523; x=1732763323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVceaAFCJlE8qsWIWcBOvElGxf6mdkdegEydRIvjun4=;
        b=DjWovrfbSThrh1Ok7GvjIH7uVm5q0MzdMgnzLmdeKp55g3wEhBse9bGNF+wpEnzwlw
         dkl3fZIVvRGZSUUiZO/kqJ8z2AlCPBAf1uYoUyRM45gaac3OOJzFtKefOQRUT5/B3Hzc
         ClWRAlkO1JgoH+PycnFTN3X6FxuFYOkbHwUUSfj8mcpPp8lK9AJHjvubcCJ/lgzvpygK
         u551lf4BjMd/GgwlCSSLSadiKD5vL68Gc5r49kGMIS+HPvGtsP9LDvMz7cgAGkCNZvl3
         Xe6HVgiUp61mWe0I4MfkTEnZIUdp7uypMOIA3n1y9dxC7j+DELFjD6CzUOCzNrqTMrS+
         m1TQ==
X-Gm-Message-State: AOJu0YyiyoHz1KHUusRTJQ8D6rVtvb0BjNBuSpq9pMCkxhHMD73Y11RT
	NulPYN9lvJjiQwns26sLqr42xHg3p9OXl+nOcxV10mii2rb/grEKU9750IwjegVOz1Wx0D5GKUO
	iS4cVwM2WTZpjlVnqzbGxC1lmHQqmFQ==
X-Google-Smtp-Source: AGHT+IFQUGoxiIRnBKYKNxqrlJyEmr6lsFgnlkGEfI5M4NVhLeW91iQaxeQ/hvz+3TE6wh5DMEzfUVrKt0IQWMDLfT0=
X-Received: by 2002:a9d:590b:0:b0:715:4a9c:a7f2 with SMTP id
 46e09a7af769-71ab31c4083mr4118590a34.24.1732158523191; Wed, 20 Nov 2024
 19:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20241120213329.2482150-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20241120213329.2482150-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 19:08:17 -0800
Message-ID: <CAMKF1soj2TtPX5KTrO2Hk5YUySYZ9-mDzK6=SbJtej=uYFnDNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] qemu/testimage: Ensure GNU tar is in test images
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207498

On Wed, Nov 20, 2024 at 1:33=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> We've seen cases where a ptest (strace) has a 43GB sparse file in the tes=
t
> directory. busybox tar doesn't work well with this. The resulting 1.4GB a=
rchive
> takes hours to extract too.
>
> Ensure tar is added to our full images and use the sparse option to colle=
ct
> files for debugging. This stops crazy build hangs.
>
> Since tar is GPLv3, we have to exclude it from that test code. We don't b=
oot
> any of those images so the debug collection code is safe there, at least =
for now.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/no-gplv3.inc            | 2 ++
>  meta/conf/machine/include/qemu.inc               | 3 +++
>  meta/lib/oeqa/selftest/cases/incompatible_lic.py | 1 +
>  meta/lib/oeqa/utils/postactions.py               | 3 ++-
>  4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/inc=
lude/no-gplv3.inc
> index b3eb936d94f..705e05319af 100644
> --- a/meta/conf/distro/include/no-gplv3.inc
> +++ b/meta/conf/distro/include/no-gplv3.inc
> @@ -28,3 +28,5 @@ CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D=
 "matchbox-terminal"
>  # Some python-tests use bash outside of ptest
>  RDEPENDS:${PN}-tests:remove:class-target:pn-python3 =3D "${MLPREFIX}bash=
"
>  INSANE_SKIP:${PN}-tests:pn-python3 =3D "file-rdeps"
> +
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove =3D "tar"
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index bb7aec76750..d7392d47623 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -28,3 +28,6 @@ KERNEL_FEATURES:append:pn-linux-yocto =3D " features/nf=
sd/nfsd-enable.scc"
>  KERNEL_FEATURES:append:pn-linux-yocto-rt =3D " features/nfsd/nfsd-enable=
.scc"
>
>  IMAGE_CLASSES +=3D "qemuboot"
> +
> +# Use gnu tar so we can handle sparse files in testimage debug archives
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "tar"

I would suggest adding it where it makes a difference intead of adding
it to all qemu images.
many real world images may not want/have gtar in image and they do use
qemu for testing images
doing this means they will be testing something else on qemu as
compared to real target.

> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/=
oeqa/selftest/cases/incompatible_lic.py
> index be5484bca49..e6b871ebc82 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -102,6 +102,7 @@ class IncompatibleLicensePerImageTests(OESelftestTest=
Case):
>          return """
>  IMAGE_INSTALL:append =3D " bash"
>  INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D "GPL-3.0* LGPL-3.0*"
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove =3D "tar"
>  """
>
>      def test_bash_default(self):
> diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/pos=
tactions.py
> index 8f787838b9d..c69481db6cb 100644
> --- a/meta/lib/oeqa/utils/postactions.py
> +++ b/meta/lib/oeqa/utils/postactions.py
> @@ -64,7 +64,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifa=
cts_list, outputdir):
>          bb.warn("Could not load artifacts list, skip artifacts retrieval=
")
>          return
>      try:
> -        cmd =3D "tar zcf - " + " ".join(artifacts_list)
> +        # We need gnu tar for sparse files, not busybox
> +        cmd =3D "tar --sparse -zcf - " + " ".join(artifacts_list)
>          (status, output) =3D tc.target.run(cmd, raw =3D True)
>          if status !=3D 0 or not output:
>              raise Exception("Error while fetching compressed artifacts")
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207484): https://lists.openembedded.org/g/openembedde=
d-core/message/207484
> Mute This Topic: https://lists.openembedded.org/mt/109692964/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

