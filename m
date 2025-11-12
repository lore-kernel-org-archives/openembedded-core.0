Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F55CD3421
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 16:21:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1326.1762964487910799276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 08:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b7ger/ON;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632b0621so6951215e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 08:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762964486; x=1763569286; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hiS+GsEfHhWZLGwlK8YDrLEnfd027LII/bbLSSzd8Aw=;
        b=b7ger/ONoxkCE1SSxz5wK/dqW7f5TcgMM331l9S6ZZdw7WKMd4JtznhZPb5Fla+ZQa
         g5RQ21c4zSVcLCXHDpovbymI5uNwfZ5RucGOaC5/vBz/H6BVuvtD3aPcgDfLebdn6QsH
         qVPAklLdReqkx46/WDQmkFeUWxTVfWuWTJpF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964486; x=1763569286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiS+GsEfHhWZLGwlK8YDrLEnfd027LII/bbLSSzd8Aw=;
        b=D+JUfTb6TUZV0lMSsyjITf2igdEk6A8iJY1N9h70AMYzd7JaGhYz4id4JgTAcJGVtF
         a7QL70tClRWMZAF0Jz9QPJuhhY5wXLceSJR2ArLgoVZ0Lw0mF8zaSN2V69APQMw4BVNY
         pchAFTEv9EajKp8MrFpcHgRTBeBPnd2k+5R1qc3T1BJmNBaELrQHKZlRb3F5dqcfBJOd
         ptzieJC1tWBcC/hXFjUrfFqVvl1JRbQAMJhNFSfv8aaESOlhpZZRteDITQCgq4fyMmyE
         EQaocqufcERLqvE5sVUb5TFJWNXQ2wcsWpHvPRUOZ31BfowwNQVtq29viML8+F1AhwEK
         +KDg==
X-Gm-Message-State: AOJu0YwtvTjIbrts29Sv4Ygdwo9bHd93w0ia2HK7vUq7iY0PJEKKwjmZ
	i0E6ucavADyRQDlmj4InzTn3fkKh7hy/uF2RdU0S75zZOO/hgEa5yCZUyCKbUHe/qWw=
X-Gm-Gg: ASbGncuchqfvrXM5Z9TD5nHr2VqFayKmukBtF1aaZxMDaxjXg9pnDkpA8XXxQNY6nDk
	APUSb1TDA6vQ+pQ/cxwfilm4FCDr2KBkItaPQnl9bsSbSbtOtcEkH4Nn8SV0qrG1SQ17qGM3tMu
	T4bngIYEsV9TqNinUKP5zH469FjuFZn6txZXDloZ5lnDX2K599y1prxlTVvr6FQE8Pd7NQopVUE
	TkJ3/ZDZ5S3a4pM8yXWDnfORNeuR5+Z7rmV9Dx8ihmWUiqsyoqIkGVfqMAmes5lZyrryi3Ek9HM
	0mlbgUzrCwPeXOMoq3eC5lyojZEPsvDftP5TehOLY4KH6E2I3+8OSihpj1a6jevsceL9gt9cRS9
	gJTkiXf1aIN+TCATTynsa5nwz4laT/KYkN1b9/02vhtBIvH5TFYKrHHSM8Tn19zDbfOvHb/BZXo
	Lb9KnL8h7ZI6wnhZTPgheYWkci61m0EInNbM+7x4FrHfpAdbg0Bf43KnR765OtfabgbfJvEkGT/
	RQ=
X-Google-Smtp-Source: AGHT+IEmSeMV6ZyECxRnDkM+HVjo2FGFzQl9Ztz9HqdjvNXUpCJURaRqorHaF/M2STvBYTFdAiz4kg==
X-Received: by 2002:a05:600c:1d0a:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47787045055mr38328485e9.8.1762964486234;
        Wed, 12 Nov 2025 08:21:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8876:d08f:2a0c:d6ff? ([2001:8b0:aba:5f3c:8876:d08f:2a0c:d6ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47788a59190sm17462405e9.3.2025.11.12.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:21:25 -0800 (PST)
Message-ID: <22cb0af7e04d0e103ace64b4a36d3cfd40252fce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, "ross.burton@arm.com"
 <ross.burton@arm.com>,  Ming Liu <liu.ming50@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2025 16:21:24 +0000
In-Reply-To: <DB5PR02MB102138544250F88461757114FEFCCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
	 <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
	 <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
	 <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
	 <CALatG=6AR5oSJL7GhhCVZAfu4vGecXj3=nh03nPxv4YBHzcNEQ@mail.gmail.com>
	 <CD811BB8-6C3E-4423-9202-1F2E0B07CB37@arm.com>
	 <DB5PR02MB102138544250F88461757114FEFCCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 16:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226210

On Wed, 2025-11-12 at 10:13 +0000, Peter Kjellerstedt via
lists.openembedded.org wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Ross Burton via
> > lists.openembedded.org
> > Sent: den 11 november 2025 12:46
> > To: Ming Liu <liu.ming50@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
> > bash-
> > completion to PACKAGES
> >=20
> > On 11 Nov 2025, at 11:42, Ming Liu <liu.ming50@gmail.com> wrote:
> > >=20
> > > Hi, Ross:
> > >=20
> > > Yes, that should work, but I have to use prepend any way, I am
> > > wondering "PACKAGES_BEFORE_PN:prepend " is better than
> > > "PACKAGES:prepend=E2=80=9D?
> >=20
> > Personally I think it=E2=80=99s better because we have a variable that =
is
> > designed
> > to be the packages that are collected before PN, so we should use
> > it.
> >=20
> > Ross
>=20
> The reason I suggested to use PACKAGES:prepend rather than=20
> PACKAGE_BEFORE_PN:prepend is that we do not know what is in PACKAGES=20
> and in their FILES variables. However, we do know that the user wants
> to package the bash-completion package and thus expects it to claim=20
> its paths regardless of what else is in PACKAGES and FILES. I.e., to=20
> support someone doing something like:
>=20
> inherit bash-completion
>=20
> PACKAGES =3D+ "${PN}-foo"
>=20
> FILES:${PN}-foo =3D "${sysconfdir}"
>=20
> we need to prepend to PACKAGES rather than PACKAGE_BEFORE_PN.

I'm going to weigh in here. I have a very strong preference not to use
prepend/append but just stick with +=3D in the classes.

If that means we need to edit the recipes to have the inherit for bash-
completion in the right place, so be it.

Our recipes are already sensitive to inherit positioning and everything
switching to prepend just makes +=3D ultimately useless and moves the
problem a level down the line.

So we should get ahead of this and just position the inherits
correctly.

Cheers,

Richard

