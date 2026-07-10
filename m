Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AA4C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:00:49 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10982.1783684837882639850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 05:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=KdSxJ04G;
 spf=pass (domain: baylibre.com, ip: 74.125.224.54, mailfrom: pidge@baylibre.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-667923d86a7so1406085d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 05:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783684837; cv=none;
        d=google.com; s=arc-20260327;
        b=nArl7T6afoNMbD53R11f8UuJ0pkn0Z7D9h2JQJswip6ZoKrQbSUBpIVPsFeZeDQnVN
         fQEZuUKAgPY7Lwb7zZ/WKxNqIe/8Flt+rw1hgiXTsdNtDOgwE+QrNE9YT8Q0SQaZIsTQ
         CybPujJo9PByvaxNSYpVGkz0p/g6yr/VyXYBWkFTFGinrTdD/xEzjx7osUIlaPnKw3Hr
         wkbDW8To1oQ4DMFAhmH1yHVxqbDsrFCWzj3AIgUVHcymwlQp92csgNiMyJCXtGO6mCkR
         CxrHg1VyJYVfx4kWAAzXugrBwBCfOIk/KzOA2vsbg4eoVIU0CEJSPGdpalncGxbskg0Z
         tsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qgKJCo+/FIostaxanMBT7nEm4/7n6R82oWh2w1wEWJ4=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=TpGe1BV8xL98W3DO1N1iW/QE9SXl0sgH9yVDUO3PMDaAOoa7uDXU/3HYfjN/YCdmsN
         +idBEeFanUE60H/jLR2XjwGLrT7MbnmWKNzFYUyBa6L9zukhVaqi+GMZtBErYZbmSVK5
         ulwLRU6pzTuZZvEW2+LEFt0vBavDQGWpjm7Yewjasb69DwXrFQ06hsGs3XKG/c+n/4aF
         lNGCnxjP/Mn5scXW28B+HYrT/cHRMSvNZvc17mhv7g2OJoLGveV1gQVMxISI5VaqDQnt
         CvwVcv5GotUPMh/13JvQKqEF+lBLWZkFRGDCqX51uVUZzTi66vszfHcliK3j6xEafUZv
         zpAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783684837; x=1784289637; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgKJCo+/FIostaxanMBT7nEm4/7n6R82oWh2w1wEWJ4=;
        b=KdSxJ04GMhozzNKb/spuIvy5Hu08ASly9jl7CMddvsLkV0d+SUAtoICVJwksBYtZaD
         hbmqb8RqXfveZtKADMs/0cfv8to69hOBU8Vp0JFvtU0KhWy4aFiQ7PlgWa4c+vrhpars
         JavCFfNzkpUgye21M/GxbimSYMIduYWHd901/q93XDrJeIy1wZPHhon/VfRSPVDAXm1R
         /pAbTQjI8OqZ/ZtkVEG1jmO4Hb24l9EWmw0S5Ym96wfBHw1eHVSJ6AjhnKSUyP59Ll7G
         HnoCy8quymo6e8zyCV+Aw6cUKLikGMMGSQwnY+tDCU/NRRuRBLWH3nv8hlw5vLhtcPIi
         pnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684837; x=1784289637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgKJCo+/FIostaxanMBT7nEm4/7n6R82oWh2w1wEWJ4=;
        b=Wd+ijLQC9fA7We0pxNG3Qr/wv27rdhcIw4xSWIO7pdTbRVFeD10tEUStCHDA81ghti
         2tsIS3QGI62xQW0vxWU0fQ4/WHlpoYoewz6EtkF7iMl3Bl5tTLXpamnpb0+KU74fA9gK
         PtnPCNID+HL5sXiJT4tCTZxJuE176kNGrAtEgomrpsXIwPK+XZKQv5eQyf35u+2esp7v
         8LwGusbT9Gf03FlfV5ZVzrA6+zxQBm1hfswtb4DN3bLGxaXGLq80YacRKforsgf1Sj7R
         kO7NJrOnR9Aa6TjFVMYQQsALA+Rbk2TqsBgByUlktsVp+egOFT7D97oY6IzsVB5xEV76
         yrzg==
X-Gm-Message-State: AOJu0YyS9xwu5la/I5YYzXz54Q991Gh9LWGnlZmm25TRLcyWKm4OCkKR
	IO6Di/jiNPLmfWmx+r29oszOaInp8BB3Y9+hp+Ga2ax3EbXjkKpqr7m3ks1BjmgAqFGCl8k7pk0
	pGUb+I9VdLacLjZIGfx3NdAQ3zw/yvhE3u/Z5ovPfZg==
X-Gm-Gg: AfdE7cl/DjWA/Fw2cHRwmuTqDAKBwCHWXAw9fD7lCYnHWLMnzF4i4+dFyzd8Rrokv94
	oPqkhkXNF0UbmuS2ZbUeW63Zsfol30kjvUHqYrqoA/G1JgSNqi9+SvLVmiG+xNgde4nukCj0F9i
	OUwpTqsReicIPBhXxxThPiQKqjTUVNhIZKcIZ/GmeFL9zKKPyREjdsvAn5Mc4qwHw2GrracsU7d
	Kyb4oCf008LTBNsaY/dnjl58do2SHaXXPAI6laBjSbEK1g5Z/00EXxaTcIjJuJO+lmTtR8=
X-Received: by 2002:a05:690e:dc4:b0:667:8b90:2ed4 with SMTP id
 956f58d0204a3-667c629a49dmr2240603d50.48.1783684836694; Fri, 10 Jul 2026
 05:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260708142249.916053-1-pidge@baylibre.com> <DJUSZJTUMA4P.2YSMPEY5JDSXH@smile.fr>
In-Reply-To: <DJUSZJTUMA4P.2YSMPEY5JDSXH@smile.fr>
From: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <pidge@baylibre.com>
Date: Fri, 10 Jul 2026 13:00:25 +0100
X-Gm-Features: AVVi8CeKtHfCmHClNQP_ounUFpWf6eRv9NT9qgl-N0Ij0dUeACPF_Vu1wx4CXz4
Message-ID: <CAOo+uBXS8BC78jsh80h5Xz41_FRfWtxi1_py=eyc=5Ba3tA3dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 12:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240632

On Fri, 10 Jul 2026 at 11:02, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> On Wed Jul 8, 2026 at 4:22 PM CEST, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in via lists.openembedded.org wrote:
> > The tpm PACKAGECONFIG passed "-D TPM_ENABLE=3DTRUE/FALSE", but ovmf
> > renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
> > ("OvmfPkg: rework TPM configuration", first released in
> > edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
> > that edk2 ignores, so TPM2 support was never compiled in, even for
> > MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.
>
> Hello,
>
> By looking at the version only, should'nt this be backported to
> scarthgap as well? It has ovmf edk2-stable202402.
>

Yes, I wasn't looking at scarthgap, but yes, if it has
edk2-stable202402, then it should be applied there as well.

-e

> Thanks!
>
> >
> > Use TPM2_ENABLE (as defined in
> > OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc and consumed by
> > OvmfPkgX64.dsc) so the tpm PACKAGECONFIG actually enables TPM2 support.
> >
> > The same commit also added a separate TPM1_ENABLE macro (TPM 1.2
> > support, default TRUE), but its dsc.inc snippets are only included
> > inside OvmfPkgX64.dsc's "!if $(TPM2_ENABLE) =3D=3D TRUE" block, so it h=
as
> > no effect unless TPM2_ENABLE is TRUE. No separate PACKAGECONFIG knob is
> > needed.
> >
> > I'm sending a backport to wrynose of this in another email.
> >
> > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bayli=
bre.com>
> > ---
> >  meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> > index bda33e2631..ab276bad1f 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=
=3D06357ddc23f46577c2aeaeaf7b776
> >  PACKAGECONFIG ??=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm=
 tpm2', 'tpm', '', d)}"
> >  PACKAGECONFIG[debug] =3D ",,,"
> >  PACKAGECONFIG[secureboot] =3D ",,,"
> > -PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
> > +PACKAGECONFIG[tpm] =3D "-D TPM2_ENABLE=3DTRUE,-D TPM2_ENABLE=3DFALSE,,=
"
> >
> >  SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;pro=
tocol=3Dhttps;tag=3D${PV} \
> >             file://0001-ovmf-update-path-to-native-BaseTools.patch \
>
>
> --
> Yoann Congal
> Smile ECS
>

