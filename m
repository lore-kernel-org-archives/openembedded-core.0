Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81062CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:58:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24893.1780505887699916820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ey51G1Ex;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e2cb01a974so50537597b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780505887; cv=none;
        d=google.com; s=arc-20240605;
        b=Ytd2vBxoDUaZobBO53LfQNklYM1oIia6MhvP//dabUgNfAVF17BYXnfLH9mOB8Po4G
         mp4DCsL7WVYoFlEEgh3TXURidZz3gZ6Qp4gRdTLEiTQq9G3+9Zhw7AwcrtJxIrCxZTDt
         vynbHnAC+SLj+JrBRMnntUXADk7N/DlDMhsGqYIOlcEly4/yLzmmFMW8gX6rGz/txCZu
         MtKNNmW3OtfLHL8Hejj08XA1AZ8Pqor0K44v4L9B9GY0MsCQ7ht3ALubWQYtmlhbt9dQ
         NO7s3Iwqi7s5oz0q/1UhLt3tBXYYVoNEa3vMiIVQCL0rfnslqr0SOXzFi0ZXAkQZ19LB
         ClUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=urOy6NGMiuX5T5pVZ/l4pE4hxsFLlwp+GK5AH6jzTGw=;
        fh=duSlNiYj1xbt5fK3fQ6n7ehKB+4QGs/+/58L6286Te8=;
        b=BbqvWOQdYLPyhObbwXKq0gi4V5Ae1ivH5UacGcVzNSpZ0VPXLgGpuheUOHaeNqlQvG
         Q3JAKC0j+j0rtKgcbyHTfdVfNo8BXhUQ0kFuusPwBcAEH2ruavtJqmdoIGmBTAMdncbh
         zcN6LG9DHPDPZeqrFESrlzK3ePgh9GTSXzpcl0KMUR89pjI817HIGLWNMTUXBQhu/1ny
         S3Ytz68cUrEXKyuogiV4zqoqwfaMJPzvpmUSlg4ahREESYys5gfymOwsxMEARtq3RBXk
         L/cNSPYfzzROW3tBsOhrBXCuLBiLGIreaKr5GJJdTE4BN2cdCFeULvUItOOSJx1HwtSn
         2ZUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780505887; x=1781110687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urOy6NGMiuX5T5pVZ/l4pE4hxsFLlwp+GK5AH6jzTGw=;
        b=Ey51G1ExSkrDCDZ652nSh/1RGRp/0YkK8L5efxTL4VL6830y/TP14KaUKx1sA9QeCI
         SAzRmeOoOhSd8zE5hM/qhJOC3NoSqIMVKoZLY2SqLSz3VKr6G5T5nf8wzcQbgAoZlg9L
         nOtwLUyWenv0fgoht/94/AvcvkGqp56chmJT4DdGFAHp+8v9WK8494FoR8K5zvMhb0fa
         kQAHIOX9Vu253q9fsGj2frETMt3CQktaTtMYlrHuiVUWzx6Ks2IQJN7dZ0RJRS1CK5KY
         E6Phr+mJgvibgf0Z1bImaNrqcCOuWrLXnDxkS4bOo7ibhTjIozdhptoLj37u1r/Ax/fQ
         dXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505887; x=1781110687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=urOy6NGMiuX5T5pVZ/l4pE4hxsFLlwp+GK5AH6jzTGw=;
        b=S8Ovzv4k6okF1TRyN5DYl8xG9biIl/eX5JONpKbH735PiZe9LtDlKBJoEMkUB9ZT1L
         XdvQa6RmGvGpQaTFVK5Q3DSXP8c0N4qctMG052iYE21SRhVo1yHtID6PqhCYYd1TvORz
         gN0yoJk6DQqc7Xs0YvUwvbQuNTgOu5/a3+WkyJNrFcimTY58qTpRroztjaaL8U7Jnhf/
         HyMIbHPCljqfHVx+e0LdBEHLCNVoWwRirXviolBV3LNhElabN+qmsAw5j61RNWZWYsBn
         r5A7XldCANXVP0kOFEWsRe83rHHupHHLRcuqNU8eqDvfIuNDJl1bJCJtXrCB9UxsYer0
         9YAg==
X-Gm-Message-State: AOJu0YxrsrUkaKhmLkYSEYrjTbCod7P2CiTL9aXf669jK8goBYxIvnHO
	zMVPoRcjOOhcWf2oSUIe7gflzXgmqIjCACRKd6gyqF8DkMU51K4xfK/dMquY+qYrfnIlLfmZodq
	VTfCtuUeWFK0sFXSOmeaiRIC0iXFbrHc=
X-Gm-Gg: Acq92OE/eU3hLsmic1iw+HQzaOsupXOHkWeGHpFjP2DWUrtNH/xHzATlLKUDFP0dSwG
	yaV3vOUCzMbwhsHsTvL72lVP25flZ+KRCrAD6X/v9BYUY01nwMeNvGU7xlpdSwh7i/Yr15bDsex
	lHYxmBqidON12bCEewoi589UANtk9iAQQ9/Zn+yc7ugHXK0cQBBLIppSmmJocEL9co9zERY9254
	JYC/U6RxHTYHRXFHNA/y2xKAmoRHz7pixmEb0qh1WX1793ZZf/NPNah3g2JOat658n70aZyG5rP
	y+yagNKasidrlHF5b9feqAEg0SAF7Uoo
X-Received: by 2002:a05:690c:e364:b0:7d0:4824:6413 with SMTP id
 00721157ae682-7ea4af1f59fmr40751697b3.39.1780505886862; Wed, 03 Jun 2026
 09:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260526185633.24403-1-leoreis.costa@gmail.com> <20260603165336.2775725-1-leoreis.costa@gmail.com>
In-Reply-To: <20260603165336.2775725-1-leoreis.costa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 3 Jun 2026 10:57:56 -0600
X-Gm-Features: AVHnY4ISAEphqOOkstcLfwd1ttBwRbF00e00vGGfhog0irLcnTxCk981buAQOBM
Message-ID: <CAJdd5GZcYxoathBzbnDTF+ffWdmbyvR3RcwPsrW7K=V2Cu63VA@mail.gmail.com>
Subject: Re: [RFC] Bootloader components missing from image SBOM
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, leonardo.costa@toradex.com, 
	benjamin.robin@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 16:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238103

On Wed, Jun 3, 2026 at 10:53=E2=80=AFAM Leonardo Costa <leoreis.costa@gmail=
.com> wrote:
>
> > We are planning to release SPDX SBOMs along with our images to provide =
package
> > information about the software components that make them up.
> >
> > As it currently stands today, bootloader components are not included in=
 the
> > final SBOM generated for the image. In particular, for our machines bas=
ed on
> > i.MX SoCs, the imx-boot container, along with boot components (ATF, SEC=
O, SCFW)
> > have their SPDX files generated in spdx/, but not included in the image=
 SBOM.
> >
> > If I understand correctly, the SBOM is generated by looking at the pack=
ages in
> > the rootfs, and recursively adding their SPDX entries along with the on=
es for
> > their dependencies. In our builds, I found that U-Boot does get include=
d in
> > the SBOM, but in our particular case this seems to be due to the presen=
ce of
> > libubootenv in the rootfs, which has the U-Boot recipe in its dependenc=
y chain,
> > so the inclusion of U-Boot in the SBOM is only a side effect.
> >
> > I have not seen anyone raise this as an issue, but my intuition is that=
 this
> > information should be included in the SBOM. Despite not making it to th=
e
> > rootfs, these boot components are still part of the image. CVE informat=
ion
> > about them, for example, is relevant to users.
> >
> > My question is, is there any configuration that should be set to includ=
e these
> > components? I couldn't find anything about this in the documentation or=
 in the
> > code. If there is no configuration regarding this, would a contribution=
 to add
> > components such as these be welcome?
>
> Following up on this, I just wanted to know if this behavior is intended =
to
> stay as it currently is or if it's worth working on a patch to add compon=
ents
> beyond the ones that are in the final rootfs.

It is a known limitation that things that are not in the root
filesystem image are not included in the SBoM. The biggest problem is
that it is quite tricky to figure out how to correctly indicate that a
given non-image task is building an "aggregate" of some other things
and thus needs to produce an aggregated SBoM, along with the
dificultlies of plumbing in SBoM generation to arbitrary tasks. Image
tasks are much simpler to solve because they are well formed in how
they operate.

If you have suggestions for how to deal with this, I would welcome them.

>
> Kind regards,
>
> Leonardo

