Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E91CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 17:05:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.21923.1760720714752760982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 10:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y2oCcUtr;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471076f819bso18044785e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760720713; x=1761325513; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11WXCmAr2J4Q1VKOSE4Feuiuoee/FnM9Wk5Ls9V39FY=;
        b=Y2oCcUtrD2NBFpC6+032RFqIe0MLTI0QEQtx23VB5eYfYRoE3IJzdEio8EevDJqbVd
         YOnW8cGG7R7C2tw3KWvKvPZ3axIO3LOD5lwa7J4Q7Trods9zLVQAFLOdRhItgEtAh5xe
         F4x9MvavwgJxHz8EOLbo4mMOC35ae4rhgvrBubOTy4MEjRCk95h6m39gdHGnG2cZ87Y8
         CfuYotVgyK9BTF4Wsm+LNtvdswytGMoWvo0nRHEn8UNrPYg/UAsPtSffyF2xRLiFBI1l
         rWreTG56YCiCCB/MVQZHjmbnGkkZ20mvZq8/R/Ej2/oq3z1AxJ9LLEdfgHBcORFtawOD
         HIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720713; x=1761325513;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11WXCmAr2J4Q1VKOSE4Feuiuoee/FnM9Wk5Ls9V39FY=;
        b=HwpSZPCf4w+gw4Zy/h2fVrfMYV9Oc7hKOuodWmqet2eoe1a42m/I87PwAEAk+4EB3w
         sibtlH4Z/dlsDPc1oFu71+FpSBRQyxSZ3i0u0Eef+qUPEXtu/3tlIWc36YIpYW7IOIb4
         /nc9ZyCHaBfW6s/JDtqjbLbibdygZhcunKrBIFN0kcZLMmhEdYZMss2+Cd82keWOhWFZ
         0dr5odBJggSLFkREC019DxF5WvXEcrrX2aZhwjlKZhQw/xYACl+LEOJaEsYBBj9tSIFd
         G6NrkMXfEYsNqzGmE8OHrwyIeq+S1j2WVMaOebS8HExGWk2RZkESpA0Xy2+qWMYeOBgN
         SuWQ==
X-Gm-Message-State: AOJu0YxyGnzLZZaWtGWBwhacEHfqSvhiwL/i3dzzGNsYg6FnAzYPe44u
	Nmjta2KpMQf8jqT0YWKthk7+XIVh694XXTMLxdgCwEpWaqis6TbzMUND
X-Gm-Gg: ASbGnctRD7ZJcN5qeJwd23QBbGnIDlznOoTFbc17+3g29L7gAgsmOh+i3/LoSEOkKDX
	WG9cjwHBP3lTToOL8bMG5qcFg4zCLuvfJHZV0liFc6hfkdaNQIsqgVm9ObHlBHZvt+3jFYgtZgt
	rYv0wkvJfeUwuOMq/u28AnHuaKIWGX0qiXcDbRaGv/AlWk9MoGoyKV8+yZp9iLv4/SQg0Qr+Pup
	YG3dNec5qfrjKekEINc/toO5jkQHSSLMGV22/xY7ns/GfCtmsoCzUVdcUPElMSPwCYayNK6F80F
	lQRxghtE/43vIHJVBjc51liG2Tdv+wiclxG0yC3pFvpAQ7SjOBA6dqsxzf8y8LGPqUAym2ewxuz
	H6+2nEitKOUh9KiVtleDe1w3/HGguLzx2ydCwUHsob1c+YTcEtRirc5ht5oDIY4/t43PC1Kyp6G
	DKllc0oqci4nN50AI=
X-Google-Smtp-Source: AGHT+IGmY1UFJJXlxSAy1D+FcDBKqk5RvLkJlbVAX+ARs5FazO+BieJylSPAz9qCZ5mit8NuAkM7hA==
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr33603235e9.36.1760720712471;
        Fri, 17 Oct 2025 10:05:12 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm3782745e9.15.2025.10.17.10.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:05:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:05:09 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Yi Zhao <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>,
	Hui Min Mina Chou <minachou@andestech.com>,
	Cyril Hrubis <chrubis@suse.cz>,
	Andrea Cervesato <andrea.cervesato@suse.de>,
	LTP List <ltp@lists.linux.it>
Subject: Re: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
Message-ID: <20251017170509.GB355538@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20251013185934.GA114595@pevik>
 <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 17:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225028

Hi Richard, all,

[ I realized that we went quite far to kirk topic, which would be interesting to
Cyril, Andrea and possible other people developers or users, therefore Cc them.
Replying to this thread:
https://lists.openembedded.org/g/openembedded-core/message/224816
+ links to replies from Richardo previously in LTP ML
https://lore.kernel.org/ltp/c8d4ee181809c4bbf5e21bf355c241eeb540e9a5.camel@linuxfoundation.org/
https://lore.kernel.org/ltp/8043628a6eed94e788f9fedbf6c8b264ebfbae15.camel@linuxfoundation.org/
NOTE: Cc requires subscription.
]

I added few final points below.

> On Mon, 2025-10-13 at 20:59 +0200, Petr Vorel wrote:

...
> > > I did send some questions and had some discussion on kirk a while ago.
> > > Quite simply, it isn't useful/interesting to Yocto Project.

> > I see your points [2] [3].

> > > What we want to test with is our images and our kernel, as we build it.
> > > kirk, as far as I understand it has gone a different route where there
> > > isn't really any userspace left and it simply tests against a kernel
> > > binary. We'd no longer be testing our build artefacts but some more
> > > artificial construct.

> > I don't understand "any userspace left and it simply tests against a kernel
> > binary". LTP tests are mostly focused on the kernel (+ it's modules). And you
> > can run individual tests by just executing them (+ handle environment variables)
> > or use runltp or use kirk. The executor does not matter that much. In the end we
> > at SUSE also test with LTP our built image :). (LTP is used by mainline folks
> > and by distro folks).

> Sorry, I'm not really being clear. The Yocto Project is in the middle
> of some huge changes and I'm struggling with those. Equally, I did want
> to at least given some response to your upgrade which is appreciated.

> I guess we're one of the few ltp users with a cross environment. We
> have a way to launch target images under emulation and our own methods
> for controlling them and transferring files. We do all this without
> special permissions or access other than ability to use kvm. As such we
> liked being able to just run runltp on the target in the environment we
> already have.

> kirk, at least as I understand it, wants to do much of this for itself.
> That means we end up with two ways of running the target emulation
> which may or may not match. We'd much prefer just having one so we
> either have issues there or we do not but our test environment is
> consistent across all tests.

> > FYI although kirk is meant to be run on the host, doing a different connections,
> > it can also be run on SUT. Sure, there is then python3 dependency on SUT
> > (heavier than shell + it's dependencies), but still kind of runltp replacement.


> > > We're trying to test what we build. You're trying to test the kernel
> > > for regressions. They're two different things.

> > > I totally understand why you've gone that direction with kirk but I
> > > also did spell out at the time that it wasn't something which really
> > > fits in with the way we run tests, or what we actually aim to test. I
> > > was told at the time that basically, nobody is interested in what we
> > > want/do.

> > ...
> > > > I see in meta/lib/oeqa/runtime/cases/ltp.py the deprecated
> > > > /opt/ltp/runltp is still being used. We want to remove it (not sure
> > > > when, but it will happen sooner or later). Any change somebody would
> > > > submit a patch to switch to kirk?

> > > It is more likely that when you drop runltp, we'll just have to drop
> > > ltp. Sorry :(. I did explain this at while ago :/.

> > It's a question if any of the users really need LTP. If yes, you could vendor
> > runltp.

> > Or, write a simple script which parses the content of the runtest files and
> > execute them. FYI for part of openSUSE testing we still use our custom openQA
> > runner which does exactly this. It would be very light: -d and -r can be
> > replaced by TMPDIR and LTPROOT, -I is supported by all tests. The only missing
> > thing will be generating of results (if you really need it, I'd recommend kirk
> > and it's JSON output).

> We'd appreciate and be able to use the json output, we already have
> json output for most of our other tests. Beyond that, as you say, we
> don't really need much beyond what runltp does though. kirk brings with
> it a number of things we definitely do not want (as mentioned above). I
> don't know if we can avoid those or not.

As I wrote previously, kirk is possible to be used as nearly drop-in runltp
replacement run on the SUT. It's not the intended use-case (we aim it to be run
on host), but still supported use case.

> > The reason we go to kirk + ltx is that in the future we plan to get rid of
> > runtests, replace them with metadata info (that will allow many things [4],
> > but you were Cc at the discussion [5]). Once this happen, runltp (or any custom
> > script / framework runner) will be broken. But this likely take long time.

> Right, using a vendored runltp would just buy us a small amount of time
> so likely isn't a long term viable solution sadly. I'd consider it if
> it were but it doesn't seem a good investment of time.

I would say adopting kirk in minimalistic way (or identify what you need and
it's still missing) would be sure safer in a long term.

Kind regards,
Petr

> Cheers,

> Richard

