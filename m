Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1982F46127
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:13:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18363.1774274761414908089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XD5B1UfH;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D7BD44442
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D140C2BCB3
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274760;
	bh=+eUcWmnui3JoU7wgbJZNi1pvFlj0F2yQ/spvnNfEu9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XD5B1UfH1ZdL0ij2TBYORnRm/S2NWW7OqRpGydw47F9g3+FAr4jOg9oEber9z+EjC
	 xS2FyPgn9hnG/2ODwphUk0tzjZN/OJuLz4ZavujST783KSwd1hD4W70HzSSqximoPc
	 BxJHEQ75qFhMbYlhWpgmMwzQfZo//STPFRXPsipwu7TVPDLgVTS8i8cd/zU/vItxdY
	 8bf8lV+OipSd/Iz4mDnffiX6Dwm9sKeAcCbY+sbw3rmTYXRLC1JG6Y6HrhLt6qMU8s
	 xk8+A6wedbIKGpGKOnqu6Jzl3VoCndHfukWaGunlse7X8VvVKsOotUkA6cH2Rwrf6b
	 zqFOq+hgdXftg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a01c80c34so32566511fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeeAuoqMbVh/PM7gFH/r8VCc1WOYy8YrjvuCooBghi51LZOXbfn9Vo09INUmrfvks9y2vzvq9r6mEk9kmVXHdgrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzI8dWZDsNgFWEbuy1ylXoL45kwUUYm8fYeNhcO+Snd9XVk2NMA
	QcTSeiHGGnT1z2pc7a+9WMXIm8cuP6U4NZLmO38+JBC63Awfyy3sosn/0u8zuaqgsBKakNOw+lc
	kfRypQqGiicHWzNzxVSTcr4TaJST+Uf4Ew/eg5q0mHA==
X-Received: by 2002:a2e:2e1a:0:b0:38b:f81c:f6f8 with SMTP id
 38308e7fff4ca-38bf9770e83mr31678241fa.37.1774274758895; Mon, 23 Mar 2026
 07:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <CANNYZj-DEfSop2zjDmqh5JjKq805hySTZQ29NSAjoJFskHP34Q@mail.gmail.com>
 <CAMRc=Mfp+OfKzsUGF-JLsmuvRpoH7dqjqn+vJf1S146zZ=tU8Q@mail.gmail.com> <CANNYZj_kOfbycTx4ZkOVESoRX_euMLJmShuozAeWKBHaA_WWcw@mail.gmail.com>
In-Reply-To: <CANNYZj_kOfbycTx4ZkOVESoRX_euMLJmShuozAeWKBHaA_WWcw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 15:05:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdZT=Y4UQem+YLjVZFTO3QdnGdRHRGa=GSiMbtO5WDLSw@mail.gmail.com>
X-Gm-Features: AaiRm51J0RJc90n4711kxsZfcNFj3_nLpeZ-Tq7AQvxDeMlf3fC2iWehlVQC6iM
Message-ID: <CAMRc=MdZT=Y4UQem+YLjVZFTO3QdnGdRHRGa=GSiMbtO5WDLSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: zboszor@gmail.com, 
	"Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233736

On Mon, Mar 23, 2026 at 3:04=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 23 Mar 2026 at 14:48, Bartosz Golaszewski <brgl@kernel.org> wrote=
:
> > > > ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> > > > find header python3.14/pyconfig.h.
>
> ^^^ This.
>
> > > > Any hints on what could be wrong? The same config builds fine witho=
ut the
> > > > new option. It's just a core-image-minimal on poky with a few pytho=
n packages
> > > > from meta-openembedded.
> > >
> > > This is the error? ^^^
> > >
> >
> > As in: pulling in packages from meta-openembedded? Not sure what you
> > mean, this shouldn't have any impact as the offending recipe is python
> > itself.
> >
> > But ok, I disabled meta-openembedded and it fails the same with the
> > only additional package being python3.
>
> No. This error:
>
> ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> find header python3.14/pyconfig.h.
>

Yes, that seems to be the error though the file is there under
recipe-sysroot-native.

Bart

