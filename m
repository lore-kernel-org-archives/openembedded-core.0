Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCB6C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:46:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.503.1739310376562916678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nx+tk2nm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43944c51e41so27794435e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739310375; x=1739915175; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YyMqmwwVmHmmnQIdEq3recNWBoYnNrV71Mb327ejtz4=;
        b=Nx+tk2nmqYktQZmkKWmIaiRHSxRnoesQSWbSYT/v9Tv/GCuG0ODtxDRN2GhJOB1cIi
         vw2TdEAwHyBzuty2nC2JZek4cu2BsIX+hT84vPteOGcsFel/Qix/RsiuqqRouzC4xR4G
         2U0CgtZ6Q1Hp7jjmqOhjbdLEvpAuNg37R9SE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739310375; x=1739915175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YyMqmwwVmHmmnQIdEq3recNWBoYnNrV71Mb327ejtz4=;
        b=mHTl1YY2oOdZjwl5KmH2RJK+FC52DbDtnwryPt2dRStzh5nwUxG1MtsdHmlqSkt8/j
         fE+6lVicYAP0kgecEzFjzrHDJOV9yCsXxJaVbaQAt84wRhcB6N/2BahZBgJ8PlA4yASs
         BEeMAuSrNmON0aizi/zvecoIKCwZERDG1A3bgcM8Cuyi/QFEbk56YspZyPlg8qJ6XCPg
         iHfOstwgA77FyhCKn/jkN1T82jkdhEEhFQj4iMB+EDaqSrTswoOb6VuXMt9IP1xlJcqM
         xTzocWJTjTDPocDjdpJ+TLGfvnp3gaaFr9FRVVpQL+QFU6TsCndCUoMUNLuM1XMmLKUu
         HVeA==
X-Forwarded-Encrypted: i=1; AJvYcCUXhrfDrDFcoGA/h6Om+nfxsABrItjk46mad0REDpvbrrrnK6tOaWS8knzyO3hxUcJ2vWqv1uPM2KqGp0dakzZUDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUldGEPweP/ihC648NWKV/EwaJluz600BJgrL9x2gIQA4ryq2X
	rF+zPY1sNjDdq6N7jZASWuAke7xbaemee4tnF+Jldq5DVSH2/Cm4y4lm6VNrGpw=
X-Gm-Gg: ASbGncuK0cYarlVzPFoiOK4pDwzZUiZj9OcHwq4rOFmvteEPKVbNGsLS0vdDX08Zond
	BjS3SB++9SdMMxj+zOEO2CwmWGhSRG5ImtEjA2UiW6PTWRVlglvOy+FTDqS948YdVktKMtLjr22
	Hg0Ma2qzEDvF2xI/XioiRsFvioBJsRA6ctfpSuZkUKrdX6StjsaAvEaeUyZYkf87phhJCi8aAYA
	w0ofR9JjUajK0u3rkfJhmVEuRezvUNmjgzScmuI5J/fmYTL1lH4kNxyaoCWoVLz4wX5I592rttu
	MqciW8aEHm7LpZekymCnXoF8NdG8spEmZ4y8cqnXjsqflEgloiy/YmP/TjgjvBRgt9KOJwtlpbO
	JajOH
X-Google-Smtp-Source: AGHT+IEhcEey05Vf4FfRANmyQ6M4hf/w9jULMs8uxGpugYKCODEth4+CjqMeyPoqV0npzvOGly+Zfw==
X-Received: by 2002:a05:600c:3b15:b0:439:4b9e:45fc with SMTP id 5b1f17b1804b1-4395815f6cbmr8472055e9.4.1739310374709;
        Tue, 11 Feb 2025 13:46:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:679f:b1ce:de17:3648? ([2001:8b0:aba:5f3c:679f:b1ce:de17:3648])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc2f6aeafsm14602607f8f.20.2025.02.11.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:46:13 -0800 (PST)
Message-ID: <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stefan.herbrechtsmeier-oss@weidmueller.com, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 11 Feb 2025 21:46:13 +0000
In-Reply-To: <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211188

On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openemb=
edded.org wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>=20
> =C2=A0.../python/python3-bcrypt-crates.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 84 -------------------
> =C2=A0.../python/python3-bcrypt_4.2.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A02 files changed, 1 insertion(+), 87 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crat=
es.inc

So let me as the silly question. This removes the crates.inc file and
doesn't appear to add any kind of new list of locked down modules.=20

This means that inspection tools just using the metadata can't see
"into" this recipe any longer for component information. This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.

Are we basically saying that information is now only available after
the build takes place?

I'm very worried that the previous discussions didn't reach a
conclusion and this is moving the "magic" out of bitbake and into some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.

I appreciate some of the requirements are conflicting.

For the record in some recent meetings, I was promised that help would
be forthcoming in helping guide this discussion. I therefore left
things alone in the hope that would happen. It simply hasn't, probably
due to time/work issues, which I can sympathise with but it does mean
I'm left doing a bad job of trying to respond to your patches whilst
trying to do too many other things badly too. That leaves us both very
frustrated.

I really want to see you succeed in reworking this and I appreciate the
time and effort put into the patches. To make this successful, I know
there are key stakeholders who need to buy into it and right now,
they're more likely just to keep doing their own things as it is easier
since this isn't going the direction they want. A key piece of making
this successful is negotiating something which can work for a
significant portion of them. I'm spelling all this out since I do at
least want to make the situation clear.

Yes, I'm very upset the OE community is putting me in this position
despite me repeatedly asking for help and that isn't your fault, which
just frustrates me more.

Cheers,

Richard





