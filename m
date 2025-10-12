Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C562CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 22:15:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.28060.1760307345064630009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 15:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SNT8TaTc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e2e363118so30077715e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760307343; x=1760912143; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KV2K2wGUd/f/EIDrbCaUpK/YSHQI4ngtRs5cctUpjg8=;
        b=SNT8TaTcML9QnhxN6ipRWa3OHhWZmuSGRXsgd+PJ8YyCdw7FtHM2QEr4058UcznmGw
         13j2xH5/u56o+QDk369+k9qlz857Zqz1TjrzTWImQSsV36WLv4zik5EDzQHT50B/KPOv
         +Vd4OqPmtxmikY1awkGgnMJEfKvUf7L/O5U5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760307343; x=1760912143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KV2K2wGUd/f/EIDrbCaUpK/YSHQI4ngtRs5cctUpjg8=;
        b=QkYB1VwqFqaJlpWjBauin8z5FADz6pwkZs2H3JyrVSF1As3zre3ysWwNPity+5qLqb
         cNwEdWIsU+kJUXV8BzgT+znuHBM/vTIEWc8AiMfywS/KoZSM9KjT4OWWbV3+1+zwkmiN
         MyUQ7dN+5WZszldoaO2RyHTwZAMXIwKRZVq+GkDfxoRiLaP9UHmopGd3tUcUc2lyJhJs
         Lvdee8MDxD4AHDFPQQRzWetIX4L+DXiZiPYOxWFenbhPNgCaPo8Nly0L/RL1Vd3ZRSVN
         TgmB4l3a0olCp5/8x3ARvfLciVQmtNRY164vhay6dHwSXqkqsBEoGTkkaAPcTLp3AGoJ
         Nw9g==
X-Forwarded-Encrypted: i=1; AJvYcCWz8j21bz7K1qinW6TPAz7WZD76+BIRXliNvJ0XKRs57WatOaK1rNPx1bqjIVVjB2pGVH19R5BG8ipDsfzfx1bRtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUND0Q9SlBJrkVgFYUDLuG9u7+pTkfKftH8dKf/ZG8gDj9aFd9
	4Shu5T9HQb63c6plzX/nmn4N+PqGNw7aMRwcyeOOYeMg04QrTQb7Q9+oGo3wmVR5gWk=
X-Gm-Gg: ASbGncuWOilnqOT6jlVEqP2fDNNIiw4UFpcUIjftQRs6M1vhQmBaxQERSOawSn3KDP7
	VHHtm+pOG+hsUHkD3mGt3yYrZUcOpwkTUVKNrJBAkSzcWEF7Xl9aySnRxh4Xjv7Bv/CZvRBRXLR
	2JWLZObHiR8etbtDspIhAoddDNBmu09DPBa6VaEIqJgx278zV08O8V29vm6UE1a8Nx9ZiFEnY1t
	OU8C97RgyUo2MnekSoYg5ugdItrHZMqS/lSq/zJrk9jxZmiIxlhaOwVKkbxkJGMr4nR/UuU0wJs
	HVe9LgaG1cJCHTh+/uNTliYpOm38qiy5hNgYyiO1AfJ2RKl35bCk1KxODpHDIAP0qXI9I4xRq+R
	4+XY9NxBog6/U1FS9ty++zkAgCweGk/838nJmRr1QRn/qv7VBhA3hutv6tPkbc/ZFohrWc5hNf8
	NhejSeobFnVM7MIcWlz3t6BT/6Bf6gCA==
X-Google-Smtp-Source: AGHT+IG2bS1Xm4TnbvGPrfYlb90p1YRIP2zJfyNsyYqeohe6iNHrnKkgcrjzY6tBJawLjNISCqAWPA==
X-Received: by 2002:a05:600c:a148:b0:46f:c55a:5a8c with SMTP id 5b1f17b1804b1-46fc55a5bbamr15051055e9.4.1760307343300;
        Sun, 12 Oct 2025 15:15:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b5de:f04a:7657:2726? ([2001:8b0:aba:5f3c:b5de:f04a:7657:2726])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cd658sm116670545e9.1.2025.10.12.15.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 15:15:42 -0700 (PDT)
Message-ID: <b083de5665052d27adc5f71f04fdf54656130462.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>, Jiaying Song	
 <jiaying.song.cn@windriver.com>, Mingde Zeng <matthew.zeng@windriver.com>, 
 Khem Raj <raj.khem@gmail.com>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>
Date: Sun, 12 Oct 2025 23:15:41 +0100
In-Reply-To: <20251012200820.372223-1-petr.vorel@gmail.com>
References: <20251012200820.372223-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 22:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224749

On Sun, 2025-10-12 at 22:08 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,
>=20
> I'm sorry, I planned to test this time, but it failed. Any hint what's
> wrong? Or can anybody test this patch?
>=20
> $ . oe-init-build-env
>=20
> .../build $ bitbake ltp
> ERROR: Error importing OE modules: module 'bb.parse' has no attribute
> 'vardepsexclude'
> ERROR: Unable to parse
> /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> Traceback (most recent call last):
> =C2=A0 File
> =C2=A0 "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py=
",
> =C2=A0 line 372, in eval
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layerid, fragment_name =3D f.split('/', 1)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^
> 		=C2=A0 ValueError: not enough values to unpack (expected 2, got 1)
>=20
> FYI I also plan to get rid of some patches posted.

Are you setting OE_FRAGMENTS to something in a config file? It
shouldn't traceback like this so that is a bug but something is
triggering it...

> * 0001-Add-__clear_cache-declaration-for-clang.patch
> It's wrong, I'd like to replace it with:
> https://patchwork.ozlabs.org/project/ltp/list/?series=3D477319&state=3D*
>=20
> * 0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
> I posted a review, hopefully we get a feedback from other developers
> soon.
>=20
> * 0001-Remove-OOM-tests-from-runtest-mm.patch
> Is it really needed to drop these tests?
>=20
> BTW for those who run LTP: kirk might be interesting tool to use:
> https://github.com/linux-test-project/kirk

I did send some questions and had some discussion on kirk a while ago.
Quite simply, it isn't useful/interesting to Yocto Project.

What we want to test with is our images and our kernel, as we build it.
kirk, as far as I understand it has gone a different route where there
isn't really any userspace left and it simply tests against a kernel
binary. We'd no longer be testing our build artefacts but some more
artificial construct.

We're trying to test what we build. You're trying to test the kernel
for regressions. They're two different things.

I totally understand why you've gone that direction with kirk but I
also did spell out at the time that it wasn't something which really
fits in with the way we run tests, or what we actually aim to test. I
was told at the time that basically, nobody is interested in what we
want/do.

> We also bundle it in LTP as a submodule:
> https://github.com/linux-test-project/ltp/blob/master/.gitmodules
>=20
> It's also in pypi:
> https://pypi.org/project/kirk/
>=20
> I see in meta/lib/oeqa/runtime/cases/ltp.py the deprecated
> /opt/ltp/runltp is still being used. We want to remove it (not sure
> when, but it will happen sooner or later). Any change somebody would
> submit a patch to switch to kirk?

It is more likely that when you drop runltp, we'll just have to drop
ltp. Sorry :(. I did explain this at while ago :/.

I did also flag the issue to our own wider community but nobody has
stepped up to do anything about it. I've way too many other things to
work on so it is very unlikely I have any time to look at it.

Cheers,

Richard

