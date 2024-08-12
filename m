Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA14C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:54:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.43584.1723460092479670188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dIFlxN9B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so29226225e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723460091; x=1724064891; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3sCajAoPaMh3RNMBKoNFFLEUrwzupzHSLXugWhyjLQ=;
        b=dIFlxN9BTcu2gVNGRKm846gmXIngXplJC9oLomfjWVX1NQQvwDtunWQEdvTeQSujhj
         1EAZK8WD9um3yW7zz72QmvtZ80j7Cm6bVHhnqA8VwfkS0pOsItb8dCCQUBQz4wdRDelU
         0IUpALsZgMWm8IIxUaINfIL8OKnovudHZdbDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723460091; x=1724064891;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l3sCajAoPaMh3RNMBKoNFFLEUrwzupzHSLXugWhyjLQ=;
        b=p7CFf8R2kzn4MhaLI7Q1Lwo1jff7AOfMpeu8DdNi1xIjknDPGPi9vWhICvGmNPTfE7
         Rhf/fufHYYlRrn2lUf50oqcnaw2ua5mHPy0FcQAJq6t17FdM53iloWBW2LaJbr+xBd8m
         MdpeDyZcgMevwxJd9FCMS4BgFAmVy4F7jyTpaCr+XqalU3QyLVLLMU207GwJd1zNoCN2
         dSigDSu7QNG2SAqVMG5WuuOQ3lOX24Ht3cOLTFWSMZu2PY68WOFep51psZALa6xV6CDO
         SYdmANpAAlRFnNWVfGE0kxpn4yB4Rz8+UCqvzT5Ppz0dPU0kxi0b21T2jSY5EXuk6/cP
         aoGw==
X-Forwarded-Encrypted: i=1; AJvYcCXmQSidfZBxNqlSbMi8BFBYRxKIzMnnTOQOzUXVbH4lS70Ep1LhnYRg/IQFuu5jgaYS26D5xWx/bXVwKyEqZY8ehyuCDyErSE9JhW27nUUO7L6rUp5LaIoI
X-Gm-Message-State: AOJu0Yx1SPur2tMHJC5XYlUusH/dTS7v5SIeYJ/LzvJjq4/celtOyH9J
	4nS0H9LX73wAGC0nJ0Y43fgW8gpEll6fxcWziFVj6gO0ULFxbL1RdAD66Wf9UE0=
X-Google-Smtp-Source: AGHT+IGklAineDT7uPFAml69Yn9A91R1f+zyvq4UTE2Yu2Jv8gEi6pTu0Garn1wiMg5/qUWOGzACOA==
X-Received: by 2002:a05:600c:5251:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-429d482a66dmr23955e9.16.1723460090482;
        Mon, 12 Aug 2024 03:54:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4? ([2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c746cf0sm184343635e9.19.2024.08.12.03.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:54:50 -0700 (PDT)
Message-ID: <06e377987b01e26fae310e29d571e01d2f1c5c48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][master][PATCH 1/2] apt-native: don't let
 dpkg overwrite files by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org, Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Aug 2024 11:54:49 +0100
In-Reply-To: <2c71d621-6b84-4d55-8693-b1b0d6bbd3de@windriver.com>
References: <20240618033019.1181198-1-changqing.li@windriver.com>
	 <17D9FBA631EBE6C1.1999@lists.openembedded.org>
	 <2c71d621-6b84-4d55-8693-b1b0d6bbd3de@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203219

On Mon, 2024-08-12 at 16:32 +0800, Changqing Li wrote:
> On 6/18/24 11:30, Changqing Li via lists.openembedded.org wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >=20
> > With --force-overwrite (implied by --force-all), dpkg will not
> > abort
> > when a package overwrites files from different packages. As this
> > can
> > also lead to "The following package disappeared from your system as
> > all files have been overwritten by other packages: <package>" and
> > subsequently broken dependencies, this makes the simple case of
> > conflicting files hard to debug.
> >=20
> > Instead of finding all possibly required force options, only
> > disable
> > overwrite for now.
> >=20
> > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > Take back from
> > https://git.openembedded.org/openembedded-core/commit/?id=3D4292387ef6c=
4e80428bad6a07c844a288b27d9a1
> =C2=A0
> https://git.openembedded.org/openembedded-core/commit/?id=3Df058272de9c
> ba188d96940c8c921cf31727fe4d1.
> =C2=A0
> And apt still behaves like before,=C2=A0 it is possible to meet the
> problem this patch try to fix, so take it back.
> =C2=A0
> And scarthgap merged this patch,=C2=A0 but master not yet.=C2=A0 So ping =
for
> master.=20
> =C2=A0=C2=A0
> if master branch reject this patch,=C2=A0 should scarthgap revert it?=C2=
=A0=C2=A0

This should never have merged to scarthgap before it was merged to
master.=C2=A0

This is why we ask people not to send patches to multiple branches at
once but to send to master, wait until it merges and that it is seen to
be stable, *then* request a backport.

> Sorry for sending the patch to both scarthgap and master at the same
> time and cause this confusing,=C2=A0=C2=A0=C2=A0
> Will send backport request after master merge the fix in the future.

Thanks, that does help everyone.

In this case I will test against master and see if we can sort this out
there. If it doesn't merge to master, we will need to revert it in
scarthgap.

Cheers,

Richard




