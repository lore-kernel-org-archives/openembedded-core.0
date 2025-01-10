Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C428E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:52:21 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.25697.1736531539100047937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RIU/svym;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-304d760f0dfso17793011fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736531537; x=1737136337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfwK+S3ZsIdRFWm1AHGw8YmKCFLFIbrzG8n1Zl/CpPc=;
        b=RIU/svymFIzxZnas0rFfdMopKJLuPgsGQmE+XxI5FZHRbwmhZWaW4Z1LIm5EsrSsWD
         /nyVKKSQVh5oV14eytoqfmfXpMUWTrbUBT2qcS+GPjxpZ9siR0MlvJtoas4MW9pl8Pfa
         aE8n/9id6fpNmewHlDtxfjvWdmX7xTTv9eKAgsK3s9BRtd7q29fsebc/TulMXeaujbmm
         3dLuukztdFj1n+tXNDYGwzv0BHrnVp0wmMx5nHXW8pjoCHSj1KMfGEPIDuqmdVSJybNF
         MYQxckYTt0mSPlUZ46uD7Xp08OTL4+C61yv+xHCeeBaH9yItYsxTT5IqR0JU1TN8dzSn
         tNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531537; x=1737136337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfwK+S3ZsIdRFWm1AHGw8YmKCFLFIbrzG8n1Zl/CpPc=;
        b=qKDSQhK22BlOMB7OAwCqFidfgMYyIzzEhw2s7Jqw0n94W4Abu7LPtRlnFOKzL+IvJZ
         R/ADlKIs3AAFy+cM5FDSUwQ0hfdWzSfyFCJQ+sAocC0AySsFWjO26Kl0Bx7L5fwZ9W3D
         CmLqu6qQyijhwIHejuEpHSH38hHkc1zNSJTINFAaV392vijS7zBYIuNjWL8nYRbHn1Lu
         foxU+EblJBIE4UlrAm6rlTw/D2Mey3C7aP55QUzbANJ2bPIDEXoY9yAp5DSXSFF0Cl9p
         cAW7oaOHq+8nmVbRLDp8bMT5wPrJEaHAG+W8v3zHcJWFch5KVW1VuD/g4stkfAcLoYDj
         eLtg==
X-Gm-Message-State: AOJu0YxAxSoMHRFfwQVGSUVJlAE77nMSvE5FjlXsIR72w7Ru+qcFdMcn
	NPE0TGy/zVDg6Oo5sjSypICAiLKHeJCPxEbz1xlPyKMfVtK7bOfUqN0MFdx26OBZYhb9t+DtA9F
	Al5bOOqnqztTv6XdjwE7UU5cRJsU=
X-Gm-Gg: ASbGncsnItxYmURPGtamFNrYTCzUX/RwBmgWYdy3Sd5FoNQISIOZ1ebTHuXzdiFL7Xz
	/+YRm3ubQpUomoJynTF3VodQ2H/H2eAmBeSLgLMB9
X-Google-Smtp-Source: AGHT+IGQltFiOILuJmK41z7fUZbu6Ebu2SioYY6nRsq4x7bJossuwgDgRFeKuLhgf1wtejGa9gNg5wnMnFDAk9xkEYk=
X-Received: by 2002:a05:651c:f0c:b0:302:1d8e:f4fd with SMTP id
 38308e7fff4ca-305f45f42bdmr24140791fa.35.1736531536904; Fri, 10 Jan 2025
 09:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20250110130116.894607-1-ross.burton@arm.com> <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
In-Reply-To: <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jan 2025 18:52:03 +0100
X-Gm-Features: AbW1kvaTFbeTQlnbhbbNpiq8KQYhRaolmMcLJgTh4m0FxEOf0eD7i97wpB0cZno
Message-ID: <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 17:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209659

Too late to easily ignore as it seems already in master, e.g.:
https://git.openembedded.org/openembedded-core/commit/?id=3D5e14a1b26cc77b3=
5c3e36869021afae9455bb1a8
or do you mean some other changes?

On Fri, Jan 10, 2025 at 6:36=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This series breaks under nativesdk, please ignore for now.
>
> Ross
>
> > On 10 Jan 2025, at 13:01, Ross Burton via lists.openembedded.org <ross.=
burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > Using the package architecture to select the right qemu options to pass
> > to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
> > to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
> > not typically any options set for the machine name.
> >
> > Solve this by using TUNE_PKGARCH instead: for the majority of recipes
> > this is the same value, but for machine-specific recipes it remains the
> > same instead of changing to the machine name.
> >
> > This means we can remove the qemuppc workarounds, as they're obsolete.
> >
> > Also update the gcc-testsuite recipe which uses the same pattern to use
> > TUNE_PKGARCH, and generalise the else codepath to avoid needing to
> > update the list of architectures.
> >
> > [ YOCTO #15647 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > meta/classes-recipe/qemu.bbclass            | 8 ++------
> > meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
> > 2 files changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qem=
u.bbclass
> > index dbb5ee0b666..8d7c82668b4 100644
> > --- a/meta/classes-recipe/qemu.bbclass
> > +++ b/meta/classes-recipe/qemu.bbclass
> > @@ -60,8 +60,8 @@ def qemu_run_binary(data, rootfs_path, binary):
> > # this dance). For others (e.g. arm) a -cpu option is not necessary, si=
nce the
> > # qemu-arm default CPU supports all required architecture levels.
> >
> > -QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%=
s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > -QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > +QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%=
s" % d.getVar('TUNE_PKGARCH')) or ""}"
> > +QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
> >
> > QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> > QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
> > @@ -71,7 +71,3 @@ QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
> > QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
> > QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
> > QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
> > -# Some packages e.g. fwupd sets PACKAGE_ARCH =3D MACHINE_ARCH and uses=
 meson which
> > -# needs right options to usermode qemu
> > -QEMU_EXTRAOPTIONS_qemuppc =3D " -cpu 7400"
> > -QEMU_EXTRAOPTIONS_qemuppc64 =3D " -cpu POWER9"
> > diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes=
-devtools/gcc/gcc-testsuite.inc
> > index 0a950b6c9e6..af6c7ad5a98 100644
> > --- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
> > @@ -53,8 +53,8 @@ python check_prepare() {
> >         #   - valid for x86*, powerpc, arm, arm64
> >         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
> >             args +=3D ["-cpu", "max"]
> > -        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
> > -            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACK=
AGE_ARCH'))
> > +        else:
> > +            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE=
_PKGARCH'))
> >             if extra:
> >                 args +=3D extra.split()
> >         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) =
however they either have MSA
> > --
> > 2.43.0
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209658): https://lists.openembedded.org/g/openembedde=
d-core/message/209658
> Mute This Topic: https://lists.openembedded.org/mt/110533939/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

