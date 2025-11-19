Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461D3CF58C6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:17:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13963.1763576225075262838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 10:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h01kbxfA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so413275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 10:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763576221; x=1764181021; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9L9Mzq8MVEwEr5kY/D0+VggXDfwhgwamX3YHOEEUhTc=;
        b=h01kbxfAVgIoykPLulJZ3I0B99qZv/PV4tamUfxQWCP1u27cFdRKkTHZluuZq3y2m+
         SAOU8WipMjMzEPodpWpCYZ4nkMP0FTjMSnpqIp5qFVHbUABRC4jsxyE9wzwIfd+QDxYq
         96plmGjdRzn5suOFeQdh5e+6Ln3tixVHNt1IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576221; x=1764181021;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9L9Mzq8MVEwEr5kY/D0+VggXDfwhgwamX3YHOEEUhTc=;
        b=FLjZnzL8hZ71StIELvY5WS6E75cNC/cMICXWjk9+BmU2TPBv0T/p424vjZXs2DR4uK
         YyMvPYF7pFDyVmydBHRfNRyLA/Yd9VRYSjv5h79GstWFh4nImqqAKmnV9g+/Un9NdDUa
         qJPPlxUNnjWMyeA9oXsxyi2B5pJWXCWti1T5gGd1StrjIEYIfYrgUCu87PGj5nRa0qW5
         FJlGjo60RvsC7KNX1jMGgqTKp8DUWcAchNzUX31s8M3Q3Ni1y0btdMXmwo7UPCQwOkcc
         95qBZXQTQf41gbeUQZQqo6/frhpIXNKAg/7sIY1q3WdExzCqwgdwOa9bYbHzUDR2rWpY
         W7Jg==
X-Gm-Message-State: AOJu0Yw+e/QortirDrxNRO893Tw2kmsZ9mxCyCZe4cFgATLTr6evrAUg
	TiO5eLldNVlhiBGbLRfGlDuTx0VQQv4+bNCzmvki0ry0OKzy4xe7KXaUxxUgTf+ZAI0=
X-Gm-Gg: ASbGnctBZSq+Fs7GCi+LntsFOshpQuPFm5tnG2CWnDkiSAGcaCQYr65yQ7dbpdnNZF6
	nT4t/3ZOKq2AV8jOTDQB+BQFDg409HJ+sUOrMLQ98hnLGYGqB1llo5cXLF+MS/Gs2LWOUXjkRd+
	zrNrPHFHgfXBVp10HF2tp4k20A/88ZcMeiXU0xBZOjz3mvri3NPvL0v/3s8d/f+qrKbUfywmxw1
	B38XMN/iHmAVoRTyMblJUCA9kNUIhE/hEtODhxDt+pk0JdFWvMSnXT7LkADOt4XveeXQ5pjB606
	onNlI3Y9G83jzObAkE5T/pgu01ca4o4mSf5UZmR/BRVtpaJeGkNlTfyLxHCq1LLW0fgrU767b0b
	Pkmkzy/bq5CTfPMs0qUk6gnyZiZ4ZraIJb2qGJCWOt57bI/MogMZ+DXT1VqSzz9VY7KpXjLMCnw
	Am1L3hdWAzGcPekit7mex4YyGHJ9K0NbOp8+1enbzft1mRp9asy3PxbRs7P7adiENFUp8U9TdpG
	VrcbQ4wc7kyUQ==
X-Google-Smtp-Source: AGHT+IEmBigIMxuc7VeL9LtU9RB7KiweD6QMBzr4nC8xZIGY+0AN/yRbTmxf+KasbPFE7fdO5SlfcQ==
X-Received: by 2002:a05:600c:4693:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-477b8a84e14mr2438795e9.16.1763576220877;
        Wed, 19 Nov 2025 10:17:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8b60:264a:98da:e4b2? ([2001:8b0:aba:5f3c:8b60:264a:98da:e4b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b83142b8sm3556645e9.9.2025.11.19.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:17:00 -0800 (PST)
Message-ID: <331d9c70b2bd4a23790efae7726ac626656e4234.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add canon-prefix-map to
 DEBUG_PREFIX_MAP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2025 18:16:59 +0000
In-Reply-To: <CAMKF1sr9jnTiyAAue6LeGWT5aGganW3zoSCKapGV_dCcrBL93A@mail.gmail.com>
References: <20251119101959.2603691-1-skandigraun@gmail.com>
	 <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com>
	 <CAMKF1sr9jnTiyAAue6LeGWT5aGganW3zoSCKapGV_dCcrBL93A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 18:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226576

On Wed, 2025-11-19 at 09:29 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> On Wed, Nov 19, 2025 at 9:20=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
> > Hmm, I just noticed that this flag wasn't omitted accidentally at all,
> > but because clang doesn't support it.
> >=20
> > Please ignore this patch, will try to come up with some conditional
> > patch or something like that.
> >=20
>=20
>=20
>=20
> Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic
> and I was hoping that packages won't=C2=A0need -fcanon-prefix-map but tha=
t's
> not the case. In any case I think we now have toolchain classes and these
> options are compiler specific=C2=A0so we could either move the whole
> assignment out of bitbake.conf and into toolchain classes
> or define addon variable in gcc.bbclass
>=20
> DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
>=20
> and prepend it to DEBUG_PREFIX_MAP in bitbake.conf
>=20
> That will allow it to be overridden=C2=A0cleanly in recipes if needed.
>=20
> Third option is to keep it as such and add
>=20
> DEBUG_PREFIX_MAP =3D+ "-fcanon-prefix-map"=C2=A0meta/classes/toolchain/gc=
c.bbclass
>=20
> also keep in mind that this option is only available in gcc-13+
> so DEBUG_PREFIX_MAP if used on native recipes might fail for hosts with
> gcc < 13
>=20

There is an additional issue in rust too, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2773

Cheers,

Richard

