Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA92D38FE6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:29:06 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14365.1768408146258529271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=PfJ7QZxn;
 spf=pass (domain: ossystems.com.br, ip: 209.85.214.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so69090355ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1768408145; x=1769012945; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyaR8gbNZHxCE2YzXJZ0FAHnUUX1iBe3am8RTYnPRhU=;
        b=PfJ7QZxnvshepENwtPhbW9Rk7F/zT3w+2rpgsc9MDeyvCCa2jHIzhNz/AJfjkPgsc+
         DelharW4WTZy+p4/x5/bLSRhXsTyXTRJ999p21GfIkDVMEIumqGJlCdYu5f1Lw5xnNk2
         4xKC/J/mCnSpamSgGoUsyNQhue8cU2M+fgqktiUSTGoUEO06iUUN8bvj9iuValWFzgRc
         WifovGOHD0ujQISwnE0ZkLWPn4kmhZPE4wCZXTVI/RjppVPbdf0lAQhFBYgyfXW/qWBh
         4Gii9BgVvDBKRE/WDX13EuZT+aFerx6PSelX78pNvAqhpMbV/QKTn8MRhPD+EFBdUsoi
         QD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408145; x=1769012945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyaR8gbNZHxCE2YzXJZ0FAHnUUX1iBe3am8RTYnPRhU=;
        b=qc8q+MzNlfcPnBwpg+hCHgzA1LKpZE/g7Lh7vLV9xu+H60BJVdZX1ZeTrZjr5uH9gQ
         WAb6mJCdgxmxJTN0z7e5p8rdIeDBXY8bR3/60uNdFZH6xR8Q8CngSXcHNiDV0tCzA8bI
         LlA2Ahq7ILuCeA/Plra5ZWvmafwrvql2BhKSBMyvCCWBrsNDW7z1QrjZx6yt4KtlV3Fl
         43KzSYcbQSZyelY2TdZHvsTaPi/WjOhH63BiTVhfng+6J/HzdnUUqfQ/aRxCKOdAHtPc
         gs//n/L/dRVQF6FYMZPsWCYlbqx1IFW/xqTDBONRwrZezoAnRJGHkjX42JOsxQQQxedE
         8sCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrQIM6rXmT5Cmn1lWjIp18gIovHwUa/+CHv1cGEKNs03a9QRxcz/0uUA1fOcgivBGFs8lBkSDsuWHRz0+1IY0qgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8cmp1ekZm12BUJgH6euZn5OdN7lMqD1270NjKnKgEVcgqruVA
	3xYRZq34nTQIKV/UnUpd9hlQjwrflPc1ZZjJ0qOsbOvFw0RDNl9LDcZTBtNOQhDK0bGgxK7U0cD
	fbonVAava/w==
X-Gm-Gg: AY/fxX4YynCOEtBQdYPe7cegqtgrXGNPFt0x7peCGilO0TtYXe6KkLcVw05Nw+jTFSW
	m2H2xmuB+gKYqGxqGNqGIUC9NIyizwWK4D/yiR1P8IIjiZQ9szfiFRrv+I+cyPwsP8utwP4m9DP
	1qVSsxeykqVkjBdku3J8RfvAQrEFhwONsS63Q2ptVUb7rpEVC2YslRvTAKBm/VLkW3GiK7UUyNO
	C8B12h7H5wbIQaSbENW8ITF7GifWu/0z0MOqQ5B/Cmu+YfpyBToEG+B6Ov1wKXdNFtmB0vSHlFa
	plxwXg/puelzicW4NrXCPrIiAaAl5bI7sViV+okyWHlh+BtAALOUcFvEwuV4HNDty9rM7CGBHMb
	H1rwyYsdbEKHbl4YrTjkLHg0RilZ55eLjUzIKAXKCrJqaGVSfU3CHZAIvTW1SAEzc6SUuiI63Ra
	QFEbxLnvlery4uHzEmxpPu12m2GwfNGS1btpOADSjzUxXCu0MKFKOe/YbwMWIPiBc5+3EIOtfik
	L0=
X-Received: by 2002:a17:903:2a8c:b0:2a2:d066:b668 with SMTP id d9443c01a7336-2a59bb1737bmr26353065ad.12.1768408144982;
        Wed, 14 Jan 2026 08:29:04 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm235552495ad.33.2026.01.14.08.29.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:29:04 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c565b888dso7383829a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:29:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbprz1X7Jn6zLDrVaH+vazSQj6ucGCnSh4Slp1uVtPNznxtlW7rgjmxujs4xNsE2Qc9XaD95A1XeJ3o9msTaH85A==@lists.openembedded.org
X-Received: by 2002:a17:90b:38cd:b0:33b:b020:597a with SMTP id
 98e67ed59e1d1-3510afd8e27mr2666282a91.0.1768408143627; Wed, 14 Jan 2026
 08:29:03 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKowQqn-VuqaT1w3cXCWGfBeMtG2rHR9HXBFqxSfttAk4Q@mail.gmail.com>
 <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
In-Reply-To: <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 14 Jan 2026 13:28:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoLW_2MKNP_d5HaofWDJnRdGAF4H_F_a6K5yf=_Ex4mOQ@mail.gmail.com>
X-Gm-Features: AZwV_QgXIAlmcOmK-IYfIiEDvTk2h0vyShgCYpJMROcLlwgHPmU8I1Xkk1qUFKE
Message-ID: <CAP9ODKoLW_2MKNP_d5HaofWDJnRdGAF4H_F_a6K5yf=_Ex4mOQ@mail.gmail.com>
Subject: Re: [OE-core] [bitbake-devel] [RFC] bitbake-setup: Documentation
 terminology and tooling suggestions
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229353

Em qua., 14 de jan. de 2026 =C3=A0s 12:19, Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> escreveu:
>
> Hi,
>
> On Wed Jan 14, 2026 at 1:02 AM CET, Otavio Salvador via lists.openembedde=
d.org wrote:
> [...]
> > 1. Generic Configuration =E2=86=92 BitBake Setup Template
> >
> > The term "Generic Configuration" does not immediately convey that this =
is a
> > reusable template file used as input to create a build environment. The
> > word "generic" can be interpreted as "basic" or "non-specialized" rathe=
r
> > than "reusable template."
> >
> > We suggest *BitBake Setup Template* as an alternative. This clearly
> > communicates that the .conf.json file serves as a template for creating
> > setups.
> > 2. Specific Configuration =E2=86=92 BitBake Setup Instance
> >
> > Similarly, "Specific Configuration" does not clearly indicate that this=
 is
> > the *result* of applying a template with user choices. The relationship
> > between "Generic" and "Specific" is not immediately obvious.
> >
> > We suggest *BitBake Setup Instance* as an alternative. The "Template =
=E2=86=92
> > Instance" pattern is widely understood by developers and immediately
> > conveys the relationship: a template is used to create an instance.
>
> I like the Template/Instance suggestion, but I'm not sure about removing =
the
> word "configuration" out of these terms. We are speaking about the
> _configuration_ of a Setup after all, and "BitBake Setup Instance" could =
be
> misinterpreted as a running bitbake-setup execution.
>
> So maybe:
>
>   Bitbake Setup Configuration Template
>   Bitbake Setup Configuration Instance
>
> or simply:
>
>   Configuration Template
>   Configuration Instance
>
> Would be enough. Having "BitBake Setup" prefixing every occurrence of thi=
s term
> is going to be too much otherwise?
>
> What do you think?
>

Honestly, especially when you are mentioning this in a context that
you are talking about the Yocto Project as a whole, having the bitbake
setup as prefix helps to avoid confusion. I don't mind about having
the word configuration, even though my personal preference would be to
not have that.

>
> > 3. Nested "configurations" =E2=86=92 Variant
> >
> > Within a BitBake Setup Template, there are nested "configurations" (e.g=
.,
> > poky, poky-with-sstate) that represent predefined bundles of fragments =
and
> > settings. Using "configuration" here creates confusion since the term i=
s
> > already heavily overloaded in the Yocto ecosystem.
> >
> > We suggest *Variant* as an alternative. This conveys that these are
> > different flavors or variations of the same base template, similar to h=
ow
> > distributions have variants or flavors.
>
> That sounds good to me, but would you also define a Variant as its own te=
rm (in
> the glossary)?
>

This specific case is a configuration concept of the big setup JSON
file. So when we specify the contents of the JSON, we will need to
have this information.

> [...]
> > 2. Allow Empty Variants in Templates
> >
> > Currently, bitbake-setup init requires the user to select a variant whe=
n
> > one is defined in the template. There is no option to skip this selecti=
on.
>
> I believe this is already achievable with the --skip-selection option?

What I mean by that is that we can skip this just because there is no
option to be displayed to the user. Imagine that we are using the
BitBake setup to provision a customer project. There are times that we
don't need all those questions because we might have default values
that we are going to use anyway.

>
> > Allowing templates without variants (or making variant selection option=
al)
> > would reduce the number of questions during setup, making the process
> > faster and more approachable for newcomers.
>
> Instead of no variants, maybe we just want to instruct the user to run:
>
>   bitbake-setup init --non-interactive choice1 choice2 ...
>
> Another idea would be to make it possible to define default choices
> in an existing template? The documentation would then instruct the user t=
o
> simply execute:
>
>   bitbake-setup init --non-interactive
>
> which, with no choices passed on the command-line, would provide the user=
 with
> the default variant (the Poky Setup). The default choices would still hav=
e to be
> printed on the console to make it clear to the user what was selected.

That is an interesting concept in my opinion. Either way, when there
is no choices, we might just show the user what we are selecting, but
not asking, because there is nothing to select. Also, some variables
as the variant that we just discussed above. In case there is no
variant available, we could just skip the questions as a whole.



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

