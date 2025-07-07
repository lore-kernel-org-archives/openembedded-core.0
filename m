Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB871C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 23:14:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6170.1751930063722104801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 16:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MxH8ymVL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2481683f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751930062; x=1752534862; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ps+hFb1a+GazKj1jZnIjDaKepxZy5Fgx7O1C/42ODzQ=;
        b=MxH8ymVLfetWBYMkoyvVI3ERbmTJGVIQblkK4y893wxgkEzZl8SySHPEzxZ9mXWPh5
         B2qi7/XiMqT6bYa1QPp3tf/9c+2LLo/B+NdTXOBtiFG4R0dVsXvf+BT3chiOV/lRptJn
         cioYZ+7D/PiDQkFdL9zbfmIqsz3xJ6smFokGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751930062; x=1752534862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ps+hFb1a+GazKj1jZnIjDaKepxZy5Fgx7O1C/42ODzQ=;
        b=kvvFo8+8IH1uEob8pV/VA5RC/FefyWcNNwVGlwGb8hczcrYxVyHICbKCqb900DSX52
         4DcDHRtXsu+aqg0Z3C1S0fW+U0+lKG7Y4t1VgFkYEqplCGbVGQzqXSf1XvFykoarBcet
         uIhPqmWXdnTn0bddHYlcbfpRuTmxj4IO4Ajz5LtvkLEHfXjtdhYbHZE/6N7yzG6x4N1K
         SvO0GbeVQjFMt5AC9Tk9jHF54q2qxLWcCOAZ5CvVkAn0vnzxcFjfkjfhbKgmT4Hk2osX
         t702MgExTizoxtwY56tfnQfwJALVYPoz/uvhJiKDntrBOPqy0jeZIpTCDVh6ThWiwCZy
         zfyw==
X-Forwarded-Encrypted: i=1; AJvYcCUrnPWuNHiK4YR9B6GLhHR3S3rxcIoz6mC9GPUuqTuoE6Cn4MuWcNIQEACnr+Tl57yta6UhC6g1i8AMX//71JX//Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxz9X1RWG4fDVWFkn10kdAcGbUJE/keM5JIBP3Ig3ghEuwNyZjI
	rgvrGsOKOkXWVjk07u69GF4ZJazLmdzQt1lAtH3SVJ4x/GSkgdfwZvmDGAq+jMeiPik=
X-Gm-Gg: ASbGnctF2azrBSZkPBIMHp8z6d54X5fwtxPTwGXGkRy3urZIVtTNklNEgAgBiBGmG9/
	GCwapntWZQ2g1aQSnIJaDvdkPgBr0KAmSe6ktghWEHMX+OJ/62r9oqT8ivGdPKWjFmR2h/CAWFc
	QQQvnYXY/0wkXG5Q/+YO7l/pJJ/4zZMP0las5Hdm1R4QeWZh5447Wv5EjHMSyQ3DjaaeloOLf4i
	53N+YMVFS2o3cQUYDg4HMbQ8lSIKAiUHc05fOTHnLzSHPoE/jYSawvxPQLol7zIEeLEYv0Op8kg
	FPIaBHh+fwn/R+nLVs4kJeTUgudYDG6Z9rRvcH1CKEgVZ4/YZgvnqGSv/kPdD02kNg1UAp/45XU
	fvpnw0zuTh69Bg9UdiisapsMx9YJb/g0m2JwpszK3kCIhK3R9kQg=
X-Google-Smtp-Source: AGHT+IHVwyWPbdus+my5MUeBqEl3y9lNXE91wGKqHB+tKFEcyG+HxLP31LgsLvCvY3TPlQ6p13kt4Q==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e193:e707 with SMTP id ffacd0b85a97d-3b4964e52c0mr11306344f8f.41.1751930062076;
        Mon, 07 Jul 2025 16:14:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f30e:ae60:b271:f9d2? ([2001:8b0:aba:5f3c:f30e:ae60:b271:f9d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4709c6b2dsm11200730f8f.40.2025.07.07.16.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:14:20 -0700 (PDT)
Message-ID: <b19964795c1fc2baa3151374a13e4f6232a80938.camel@linuxfoundation.org>
Subject: Re: [OE-core] GCC Patch removal - 0008-libtool.patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, Khem Raj <raj.khem@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "MacLeod, Randy"
	 <Randy.MacLeod@windriver.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Jul 2025 00:14:18 +0100
In-Reply-To: <DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: 
	<DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 23:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220003

Hi,

On Thu, 2025-07-03 at 11:38 +0000, Sadineni, Harish via lists.openembedded.=
org wrote:
> This gcc patch
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/gcc/gcc/0008-libtool.patch?h=3Dmaster
> =C2=A0modifies thelibdir=C2=A0from "/usr/lib/../lib" to "/usr/lib" in the
> libstdc++.la file.
>=20
>=20
> We removed this patch and rebuilt GCC using bitbake. We did not
> encounter any build or runtime issues. We tested building gcc, gcc-
> runtime, and core-image-minimal. After booting the image, we also
> tested libtool and a simple C program with the following commands:
>=20
> $libtool --tag=3DCC --mode=3Dcompile x86_64-poky-linux-gcc -c hello.c
> libtool: compile:=C2=A0 x86_64-poky-linux-gcc -c hello.c=C2=A0 -fPIC -DPI=
C -o
> .libs/hello.o
>=20
> $libtool --tag=3DCC --mode=3Dlink x86_64-poky-linux-gcc=C2=A0 -o hello
> hello.lo
> libtool: link: x86_64-poky-linux-gcc -o hello .libs/hello.o
>=20
> $x86_64-poky-linux-gcc hello.c -o hello
>=20
> All tools and the generated binaries are running fine. So, we believe
> this patch is no longer needed with the latest GCC sources.
> However, in the commit message, it is mentioned:
> "it shouldn't be passing this into libtool in the first place but for
> now this resolves the nastiest problems this causes."
>=20
> Do we need any other tests to perform or is it okay to drop this
> patch?

I dug into this a bit more. gcc-runtime's do_compile log clearly shows
-rpath=3D/usr/lib/../lib being added on the libtool commands.

This does make it to the libstdc++.la file:

tmp/work/core2-64-poky-linux/gcc-runtime/15.1.0/gcc-15.1.0/build.x86_64-pok=
y-linux.x86_64-poky-linux/x86_64-poky-linux/libstdc++-v3/src/libstdc++.la

which says:

# Directory that this library needs to be installed in:
libdir=3D'/usr/lib/../lib'


The only reason this isn't an issue now is that we delete all the .la
files rather than include/use them.

I'm therefore a bit torn on this, the base issue is still there as that
rpath is "wrong".

Cheers,

Richard



