Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4A2F8808C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:03:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7963.1776322998168012241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 00:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vhd497o2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so92098025e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776322996; x=1776927796; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7Mn56nvd80QgwV3vnmCfQQDCK4NKAQsuE8qem4cvuA=;
        b=Vhd497o27IV4SijpQYA6RT20/Mh4l98QhmPrIyGkuTBRQYXviSvpEVx14ODlJR72Fx
         6aUDz3cBJNDEG4Fp7mc+KWyhstbN4CtOLzPF24aI8mi/kvMdtaZv7yWooDEXaXSpUKc8
         anmTLVPV/Z505Ii+k8UVEBHAXYHzI8b5wuFHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322996; x=1776927796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Mn56nvd80QgwV3vnmCfQQDCK4NKAQsuE8qem4cvuA=;
        b=qf4Fgi9eAstI+626q9SFZc+J+6yw7x0/mq62hSK1HskY4sSIvzikk8FP1do05p8GOk
         C6NRaje+/gfPZGvEK/SLG9OQgLiNL6xHic12NYNUv+ZqfTHj8KaJcUtydnLSF5YcbwP7
         yzpRrAqpRpGw28tP9G0BMc0SI3CPLH31Kn81lglr/Q+Rw5JQlg/hQIxNGpIK62tM5cNM
         8pXFgRaRtz+5XpatkxlXSX3SIrRull8n9FFlAhNha4P8HKn6IubJHMd6sLcy4nwzyCVG
         T93lrFtDvym6AXPvcjBBIoNO9v8gNTRP7sqahwdlR4XmBVfTs2R1plQMD7EJH2X9M2A2
         bGGg==
X-Gm-Message-State: AOJu0YyR3kAr7MO56++/h3um9A5WkUlN/GpdUkXsJ7czzbR3kaRI/x12
	XHkG0UCMNLXPeB0wnJULHQKpIVIgD3rRcAr6CQ/H2ontn2Cqpf7ny4YCT7gM1IXO6ho=
X-Gm-Gg: AeBDiet7Nq174AIPbe8f7JuT0ujAx0P5bdt1ydCpz3jgt2wzi+v9X45ePv34HSAts32
	0yAjOuzrvMe8Q2Ijjxlygz/RnrNwWzNK0Jm6ER5guaF0ECsS3mzgI4IW0K6sStmpFQMr1zPc7RE
	vAA/UTRaqt7Aa32lBEQFcjLR6JOC+baBKCpZPupZwFFkjUZEPG26LW5ph3Eemi0reSg8JPQaFgz
	wV6C797H2lXELRgGevul/vybhzqH0cvtzbcCjs5HTiWqU1uRN5VZmxz6HAzxBKREQynWoCxLMAh
	vNhOEhPMwMipqZbpl1XKWhhQKw3r+2DIO39z3Pf2xSnolwYoG+5miMXVmzM+8UCyozjRNN+rnWN
	LDGBnZ5cjndrtFu6CI6bkNq/P1fcZIeKnquHa0vu8hNGFrO6Kowp+W77XC1esNOsVJh70pqRDCh
	dZAu0hj6bduxtKCSFUnyh5bpcUb1b0yp6kn6SZxZ0kpcb/2AO3ObEdyKVCyQ367VhSf4SKlIRgE
	1KneLSj+RSckcfTbZyKOJJhZhY=
X-Received: by 2002:a05:600c:4f95:b0:488:be58:bb5b with SMTP id 5b1f17b1804b1-488d686c443mr344749975e9.24.1776322996433;
        Thu, 16 Apr 2026 00:03:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7? ([2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818d70sm49855885e9.4.2026.04.16.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 00:03:15 -0700 (PDT)
Message-ID: <aa893eb861bf4dd18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adam Blank <adam.blank.g@gmail.com>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 16 Apr 2026 08:03:14 +0100
In-Reply-To: <CAFAffzwtCKC7HGtRptDoTDFUyCg4kYfkTGmYUCy3Atn-2TqWXA@mail.gmail.com>
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
	 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
	 <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
	 <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
	 <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com>
	 <CAFAffzzW9r43AE5hKbXihkXqZTWeO=sQGctTkmL4Eg+U9X31AA@mail.gmail.com>
	 <DHMXQQX9N8S2.2XR0GJ6ALH1O3@bootlin.com>
	 <CAFAffzwtCKC7HGtRptDoTDFUyCg4kYfkTGmYUCy3Atn-2TqWXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 07:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235390

On Sun, 2026-04-12 at 16:18 +0200, Adam Blank wrote:
> I've dug some more, as I couldn't come to terms with it ;-)

I'm certainly a bit concerned with what you found and have been wanting
to try and find time to understand what is going on. It would seem we
simply must not be calling that code path?

> I've got a fix and a reasoning behind it: when the typo is fixed, a
> new callable function is identified and treated as a dependency of
> 'do_package'. This in turn pulls in its dependency on
> 'PACKAGE_EXTRA_ARCHS' and the test must fail.
> The fix is simply about making sure, that
> 'package_populate_pkgdata_dir' has 'PACKAGE_EXTRA_ARCHS' and a few
> other variables in its 'vardepsexclude'.

That is a good find and would certainly explain the error.

> What bothered me was something else though. I could clearly see, how
> this part of code in 'package.bbclass' was based on
> 'staging.bbclass'. There is an identical chain of dependencies:
> -=C2=A0do_prepare_recipe_sysroot ->=C2=A0extend_recipe_sysroot -
> >=C2=A0staging_populate_sysroot_dir (referencing 'PACKAGE_EXTRA_ARCHS')
> -=C2=A0do_package ->=C2=A0package_prepare_pkgdata -
> >=C2=A0package_populate_pkgdata_dir (referencing 'PACKAGE_EXTRA_ARCHS')

That would bother me too and is a very good question.

> I couldn't believe that somehow 'do_package' had this issue, but
> 'do_prepare_recipe_sysroot' didn't (for no apparent reason). After an
> extremely long chase, I found 'extend_recipe_sysroot' in
> 'BB_BASEHASH_IGNORE_VARS'... Since this was more unexpected to me
> than the Spanish Inquisition, and has been there since 2017, I'd like
> to ask:
>=20
> - Is it truly justified for 'extend_recipe_sysroot' to have this sort
> of globally unique, special treatment?
> - Wouldn't it be better for it to be handled using the same mechanism
> that are applied to other functions?=C2=A0

Those are good questions. I suspect this:

* was done to make things a little easier on rebuilds if/as/when=C2=A0
  that=C2=A0code changes
* was by 'design' in that it was anticipated that=C2=A0
  extend_recipe_sysroot=C2=A0would be called from more places than it=C2=A0
  may=C2=A0have ended up being called from
* may have predated the exclusion mechanisms being reliable

I'd not be against using more exclusions and moving it out of
BB_BASEHASH_IGNORE_VARS but we'd have to be very careful about the
potential new dependency chains and carefully audit them.

Cheers,

Richard





