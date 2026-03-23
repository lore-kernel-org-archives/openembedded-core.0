Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61966F46120
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:57:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17981.1774273734559386267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jqIDzKFU;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 979BE41B33
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D5BC4AF0B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273733;
	bh=zNAbQO+2Rb6IFqUV9sSPo8Nrm7V8YoWPT4pe6TBl0nc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jqIDzKFUYEa4is0vqYUFx7ewU6qEfBub8ZRXvrNbwaU11eBEhYZmgDLNA2tnfugeo
	 up2ArVbPupBu6E5nYKVgDux7l35LQn2b4upko4HliLqK2wlOuLBderZYteHO6Ajemp
	 Zn5lXgqJwLMjP5WfnyrJiN8wSU4sDfzT6ufFORHjbwgMZlLO7WifcFDfmhWeygcfY3
	 mwsroVCDHX1Vrht6cB5Wt7/BjQUzZIR04NJ0YSF9NNNA/2Tj5hPlV5oEmmjXRxVdzE
	 4m2fdlIkrUKtEc7NrD26jnUj6+NS1+IK/bfiaFf9s7zVJ+rTf2VmNIX8Ok5EaBK3Or
	 npT9uSR/qRWEA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a2e62b893so1320751fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfESoVYySeqHJm4bFgDEMEQ+HuCEfiCHnrKd27vun0TJp/l597CBgbxZJC5witKzeT4raMlwRrRasIVyTPYYbkSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaK7oZ+ZMVCJFYOYl2VLP1udgH+DRdrdm5X9PpEXPiiZvhVdB4
	LXm7ZmOaYx/PpIhCSmIGxeL3kJ0BiiZh9iynDzh4wH2PFT0bEKjh5rH8C3Guzgub7Q/Qsbbpjq4
	49Br8i2drr5Jco5TjnynoG5rEgOa1nukUyHOz6VJA3g==
X-Received: by 2002:a05:651c:3249:b0:38b:f632:e0f8 with SMTP id
 38308e7fff4ca-38bf94a6b76mr37511041fa.0.1774273732149; Mon, 23 Mar 2026
 06:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <CANNYZj-DEfSop2zjDmqh5JjKq805hySTZQ29NSAjoJFskHP34Q@mail.gmail.com>
In-Reply-To: <CANNYZj-DEfSop2zjDmqh5JjKq805hySTZQ29NSAjoJFskHP34Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 14:48:39 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfp+OfKzsUGF-JLsmuvRpoH7dqjqn+vJf1S146zZ=tU8Q@mail.gmail.com>
X-Gm-Features: AaiRm51S38gM2X9s7GZJDWN2n4h0mr8MKbiWGDhgQwwT586Cac3xOoSrhDd9luM
Message-ID: <CAMRc=Mfp+OfKzsUGF-JLsmuvRpoH7dqjqn+vJf1S146zZ=tU8Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233732

On Mon, Mar 23, 2026 at 2:35=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 23 Mar 2026 at 14:29, Bartosz Golaszewski <brgl@kernel.org> wrote=
:
>
> > ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> > find header python3.14/pyconfig.h.
> > Any hints on what could be wrong? The same config builds fine without t=
he
> > new option. It's just a core-image-minimal on poky with a few python pa=
ckages
> > from meta-openembedded.
>
> This is the error? ^^^
>

As in: pulling in packages from meta-openembedded? Not sure what you
mean, this shouldn't have any impact as the offending recipe is python
itself.

But ok, I disabled meta-openembedded and it fails the same with the
only additional package being python3.

Bart

