Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324A4F419A5
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 13:07:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18467.1776258429329526530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGmUcu7m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2394474f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776258427; x=1776863227; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hbf8zWx01g2uYBLCCdrcY3MTdzJQMP6snh1IdAXyKVg=;
        b=QGmUcu7mMdlGsHwugbOHc2kyeJlSppeDlgNtVueulZMhbRGSRoJov6S8NHji/W5vDu
         khzWqEQxghszvHzSQ5HIJhN7NhtZScIA3bnY7yAaI7lGh19UZ8uStP2riR1cdVG/45F3
         WH6/Pvl/5nnKbjJXayKO1dpYlhDxFpMIkpe60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258427; x=1776863227;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbf8zWx01g2uYBLCCdrcY3MTdzJQMP6snh1IdAXyKVg=;
        b=NP81tRQBtJhn8PkBjYBOn1zFjO2xk+H7uPDsxbLtxMGcRml/WKVhs1BJ0ser2uKJD2
         reZitOC+c1NIYudxXORUWZ3X890Nd1ZCa/29ZYzH3NvhJUYAXbq00f/PYsijWPje4jK4
         gGhBCoHPBDYQcq5hC0E+SUkSQJrwmGo0yBJYwVyy6alNCq+XtqxSdLHtYaKbL/pPs419
         xFk5+BO5wx7Txeqi92BiPfHeMcZCsEAbWzK47nohTenOH+vb1AJq6VXDmapStH4M7zne
         Qm7Q4Q2fVzfXt6Dm0amKroePUeLx9IeWVVpoK2ubVPGQ73dwK7ytq8IvjP5P2YETrhcg
         qyBA==
X-Forwarded-Encrypted: i=1; AFNElJ+tQio4ANlvoJrqfoPQsr4VsnrBb+ElJL//9a4+8lxeqV5y5IaiOIMxjMCydbDT95dqxY5xKoS5eBEgo/MajxwOeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkIShTy3Ykt+Rmbz1T6F2pbAdSDxbo1wRQqDRS0iJ14ln9krwE
	TEz51fGR4Bho9dZD+l0muO/ZeG/oX8ZChVx5TPzunYGX4Q36SiZXjzGA3jtv0rOZcJo=
X-Gm-Gg: AeBDieum3FDLdbaLXHXZjQyntGaSCvVS/pqnkDsJ+RmD1kGLindyoZ/WgYlce1opbLm
	1uVlfo9hkIbVCNA+9H/pS9i/hxXUEYcs8CUtTr5am/fNBB4AWiIXTRj/Clke6Qj9mV19cp3I2P5
	31VItVQpT/4UFcSmO1yfSKboVjhClhKqZnvvbO38O9jPpAQpsEJcfy6qNS/z0qWdP9i+nQMHN9/
	JTLdVcxlHTdl5zQtX1UqgH9o3xu8nkrxQBr8nQIgCsiW4hKp29lzISp8jPXaAsZZ9V8Z5iSBt3h
	GA97tY3GA5o8AtKHqOQqvPdWhJ/eDqFIg3QTsjKT2vLIzkUZkvEs1mVIB+Hp+TXo0k+CWW8yLWc
	DnE0BnlbqkMHPjq+uuwiyKuxvRPbvFiYqqUXfiSzbB9OMgnFCecGn1RLVX556N/aJu5kNiS9/nD
	YTnqdOtUzdnLdUvPDAov5k3o+l3cRzUV459iQGUCvjgTUSFT7KU8n6nv6DbGRxi4UJNuH8lpPPt
	kiipXrKpAABS01VJTzMETbbXyE=
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr278058575e9.21.1776258427223;
        Wed, 15 Apr 2026 06:07:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b93f:ee00:4e55:7087? ([2001:8b0:aba:5f3c:b93f:ee00:4e55:7087])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee042f3dsm113991205e9.12.2026.04.15.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:07:06 -0700 (PDT)
Message-ID: <7ed13b9dbb647c03834694d6104be8bce6b87876.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Add fallback when hardlink fails
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Arndt <michael@rndt.dev>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2026 14:07:06 +0100
In-Reply-To: <bdc53821-842b-4dbc-a9d8-00270b864280@rndt.dev>
References: <20260415085824.1730569-1-michael@rndt.dev>
	 <58af6d456e153cfd7810fc48a199d170a592f2f1.camel@linuxfoundation.org>
	 <bdc53821-842b-4dbc-a9d8-00270b864280@rndt.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235199

On Wed, 2026-04-15 at 13:52 +0200, Michael Arndt wrote:
> Hello Richard,
>=20
> > The challenge is that the sstate directory is shared, so two builds can
> > write to the same file at the same time. Our policy is "first wins" and
> > anything later is just skipped. The code also needs to make sure that
> > if the sstate file is written, the paired signature matches.
>=20
> Thanks for taking a look at my change. I guess then there is no simple=
=20
> fix for the problem, because checking if the file exists and replacing=
=20
> it must be a single atomic operation. Without hardlinks that is a problem=
.
>=20
> =C2=A0> Generic try/except cases are almost always a red flag in general.
>=20
> Agreed, that was also the reason why I was surprised that my sstate=20
> didn't work. The existing code already swallows the IOException from=20
> os.link so you don't see the error about the missing hardlink support.
>=20
> I guess I will have to use a different file system, but thanks anyway.

If you can catch a specific exception about it being not supported, we
could at least show that to the user and fail. I noticed there are
other generic try/except blocks in there which could probably be
improved.

This is pretty core/key code which we've had challenges with in the
past though and it does need to work simply/reliably!

Cheers,

Richard

