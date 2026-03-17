Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722DBFF6E75
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:39:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86717.1773779952862988952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjWbqK3E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540355459so59628625e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773779951; x=1774384751; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuXrqE7bZkEPZmgq80Xd5PuLd0cVohNcKNjxoTWMjMg=;
        b=bjWbqK3E/IDEjycvRLgmTNcbxqIhiEqCg/njD72WWNQJV+vxR320f6yRd/U041NPNZ
         ERGWSra/AVi5FuMuw0KO7C4fnhWGv8mN2JjjC3nnZPHJBPctWQU9F3YxVTVz8gLwFr51
         HgW86lqsq0cbQQPZuCpq/kpsb1h9yg3cSvnC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779951; x=1774384751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuXrqE7bZkEPZmgq80Xd5PuLd0cVohNcKNjxoTWMjMg=;
        b=MbRNAMQcS0C7YSNcUJK7XMzmbyWe45X4navshJ46xPXYtNZxrSA8XH0EUUU1RQgYpR
         iACvzA/C//i+1vHWQK91ix3rksk197OFbAizGDfWAqLpyRR2anfhwsyPqot13uQ45ERm
         GJFWXFmqbM/dbchKN96iBVNmMIx2Hs3rtvL17UnJoRRjuyIorkyijhuABVbL3IjBQ2t+
         HNN+YoqSHWTEm4v+ixUjKrmwTt/cdck79hyUH9xK+jSHf4VQPB4cbIVlUpdNqGVjPjUC
         irKKICksBu71zhYBWABjeJ8ROpzibo+6TcFD7oeJzdransnPcFgfWNgrXf9qLMYxlumH
         qAiw==
X-Forwarded-Encrypted: i=1; AJvYcCVNOz/81g7ZvGyPyAoneyvA8CRIjqGELxRhFpdSSSTWIZWbi1uymPdj88lWLmgLVO/YA4orkByOpGESWLwDsFa7+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBAyc6hn5BvOr2cflA5EE1SZ97k1oBw8ErSfkjl1ZL2SV5G1ZF
	XoUk6B4teCu0WZ17fUVa4Dd4F0wSsDZmVO7iZ1eoFz5/pmyT2MvjZX1HwjyEZUnbPQTYwi2cCHA
	m/n/Hyrs=
X-Gm-Gg: ATEYQzyOzMwnmQdPvlJBGmSpb8Gb6sS0DMA5IeVBUx4UXvf+wSVYW1Cy8gKtDrTRHv5
	Ic4KZJgtSrJ2rYV2Wmc24rlQrUBj2yeJmtvB8D3mzrnb8qkmkEBTCb19NTScytCNBEbMPEKRrOJ
	hNRI5jxNK+iDPKOz00SKAVEPq/Xg8EQnOS74Hh6pu7zqBl7BM/6plBNBONEqXUax3v6NxSKT0p6
	K6MUgNNFtYInzwHZZnGWSZQvNlAc+ONo0GDGuQ7fg4a7C5IOxpBvj9G2WPW36rkvXtgyVQSaEax
	NwHTp+XWCC86fBykOnbkkBtgAPCEZl2unroBwsj08wJVPueh4SOgvDRuyqVZzQzZjg7WeAuH0Af
	36c7/yn9+OlgfJpFXLsow3j7ozYULNEB13xzF2j+NPXVzdGBRUpu6KEg2E7BOdrxGKVwq10H7Nv
	Yn1ITxFJY2tnLc2955MWUtqjDpKAkaJSV8CovqGizAFDm4xeGRIZ9gr/EdoB6rCCnr6NwFrH5xK
	pc/gOybeWgdDiJGeEympSzjyg==
X-Received: by 2002:a05:600c:c493:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-486f456fe60mr17544615e9.28.1773779951077;
        Tue, 17 Mar 2026 13:39:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e931:c430:a510:1d6c? ([2001:8b0:aba:5f3c:e931:c430:a510:1d6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51851e43sm1814875f8f.10.2026.03.17.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:39:10 -0700 (PDT)
Message-ID: <01a58e8e40735b71f3bf078b4a5c9e37162cc060.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2026 20:39:08 +0000
In-Reply-To: <DB5PR02MB10213EE78C9A650941C636DF0EF41A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
			 <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
		 <3f73b46c12aff52292d488f48d11572c66991b70.camel@linuxfoundation.org>
		 <DB5PR02MB102139B16A3C8B755F94EFCD8EF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <e69ed8a6abe51f1bca2779f24edfa9d9e4d23d01.camel@linuxfoundation.org>
	 <DB5PR02MB10213EE78C9A650941C636DF0EF41A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233350

On Tue, 2026-03-17 at 17:41 +0000, Peter Kjellerstedt wrote:
>=20
> I think one of the biggest problems here actually is the freedom=20
> provided by the current solution for how layers are added and=20
> configured, and I believe we actually want to make it much more=20
> rigid. Which of course will make people scream (possibly=20
> including myself).

Agreed, there are just too many options currently. Anything we choose
to remove or restrict will upset someone though.

>=20
> I would love to see an addlayer command (or something similar)=20
> that would hide all the gory details of layer priorities,=20

Oddly enough, somewhere I have a patch which does add an addlayer
directive so it was something I already experimented with.

The sticking point was that I really wanted to just drop the layer
priority part of the code and I couldn't face the number of complaints
that might generate.

> dependencies, and making sure it is consistent when applying=20
> bbappends and the order .conf files are read, etc, and avoids=20
> problems with different layers having their own ideas about how=20
> to do things. Unfortunately, I do realize this is an enormous=20
> job, and getting all the details right will probably be near=20
> impossible, especially as everyone undoubtedly have their own=20
> ideas about how layer configuration should be done (I know I do).=20
> And, unfortunately, I also have a pretty good idea of who would=20
> have to do most work to make anything like this happen.
> (I have a feeling I'm not selling this idea very well... =E2=98=B9)

The last time I touched this issue, I got into a lot of trouble very
quickly. It needs time available to handle all that correctly and it
simply isn't something I've had.

> Another thing I would like to see is that the order in BBLAYERS=20
> does not matter. Instead, the layer dependencies should determine=20
> the order, pretty much like how the task dependencies decide the=20
> order the tasks are executed. Unfortunately, I do not know if=20
> even this is possible, or if my view of how the layers are=20
> configured is too simple.

I'm certainly want to explore that idea. We need to work out what
issues people may run into that couldn't be solved in that case and
whether we're prepared to accept those compromises.

> And if I may be a bit adventurous, I could even see the BBLAYERS=20
> variable being removed altogether (or at least not used as input),=20
> and instead be replaced by, e.g., a drop directory where you=20
> create links to the layers you want to use in a specific=20
> configuration. Then adding/removing a layer to the build is just a=20
> matter of adding/removing a link, which is easily done by tools=20
> like bitbake-setup, bitbake-layers, kas, repo, or even just ln -s,=20
> without having to manipulate an actual configuration file, which=20
> is always error prone.

I think BBLAYERS as a list of places to look isn't the main issue at
this point but I appreciate the idea.

Cheers,

Richard


