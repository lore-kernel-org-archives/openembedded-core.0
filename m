Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1E1C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 12:15:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.64209.1677413710284346255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 04:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZQsmOCFi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id az36so2601017wmb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 04:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N86CYTWvVL/jL2s0OiWWgxsrTcoV8M/QMPcvEPkPIQU=;
        b=ZQsmOCFil089NzPY2llNxGUN9Rwqpjr3laE15O3rY2Ydg4R1iKdADnT/PgIl1EqhiE
         TUU3NYEIBgUPIa7emEsBZR41RmcYctn2DxcOUQVsjrbeeRTGNezPfp7ED4Z4Uq62mEra
         rYEdbZl+FHtdparHyfcafLEw+88J7Lx9aZU5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N86CYTWvVL/jL2s0OiWWgxsrTcoV8M/QMPcvEPkPIQU=;
        b=PXrktFON6qNNzMmurckJDDQC7nEaWdJMzlhFN/6ic1tDVYhWG3WUrDMcjN0SEAC+5k
         a7OcSY9ikMlsfSNFn+P15ANtHeZ5Q/1pTiWNJ7jtgDKAdwJxa7ELES8Eoct3N8FIv0+/
         XYa/pqY1zKIhxZwymWg5NDnhWNRGo6fxhscL+lkyJeoIOs/PB+Za+RyFLyafzXWSOzQX
         nv/PcItv58pI3TXcU7+5DZxg+6mSR7UEie2QQfqR62rvRYTaS4fts6ITlVd2GWknZSsN
         vuWxH78ASd7Dm2WuEUo5zwKB8Vh+oR7Ciu84bOrw30sPomwXhRZJ1XJEiL98JEKllcw6
         sR9A==
X-Gm-Message-State: AO0yUKWrjh617oSDpPlaQhW5eHOtuWs0wkesiTpnhiKVdEe6+usgZM5o
	4Ik1cXma4WpUBfpdhzpQ+GbNOA==
X-Google-Smtp-Source: AK7set9t6veJfVztbPZrHbQwCXqvGDGxjNVgVP55Kys2dudaV0GiBK+eu199uDakmTIGv9+3rPxpow==
X-Received: by 2002:a05:600c:4929:b0:3dc:d5c:76d9 with SMTP id f41-20020a05600c492900b003dc0d5c76d9mr16742287wmp.0.1677413708444;
        Sun, 26 Feb 2023 04:15:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed? ([2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed])
        by smtp.gmail.com with ESMTPSA id n33-20020a05600c502100b003e8dc7a03basm9557191wmr.41.2023.02.26.04.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 04:15:08 -0800 (PST)
Message-ID: <e40c7fea9d2d3ec508c5b5a73315a8429422e2cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Sun, 26 Feb 2023 12:15:07 +0000
In-Reply-To: <684f07d3-6ae3-9932-26e6-edab46bb0ec7@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
	 <1746D4E8592324E9.29542@lists.openembedded.org>
	 <1747067DAE80068A.29542@lists.openembedded.org>
	 <4560f34639cc5c794b0f15edae10aeba0da5e570.camel@linuxfoundation.org>
	 <684f07d3-6ae3-9932-26e6-edab46bb0ec7@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 12:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177733

On Sat, 2023-02-25 at 16:59 +0100, Alexis Lothor=C3=A9 wrote:
> Hello Richard,
> as usual, thanks for the prompt feedback !
>=20
> On 2/25/23 13:32, Richard Purdie wrote:
> > On Sat, 2023-02-25 at 09:15 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2023-02-24 at 18:06 +0000, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > Hi Alexis,
> > > >=20
> > > > Firstly, this looks very much improved, thanks. It is great to star=
t to
> > > > see some meaningful data from this.
> > > >=20
> > > > On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothor=C3=A9 via
> > > > lists.openembedded.org wrote:
> > > > > After manual inspection on some entries, the remaining oeselftest=
 regression
> > > > > raised in the report seems valid. There are still some issues to =
tackle:
> > > > > - it seems that now one major remaining source of noise is on the=
 "runtime"
> > > > >   tests (comparison to tests not run on "target" results)
> > > > > - when a ptest managed by oe-selftest fails, I guess the remainin=
g tests are not
> > > > >   run, so when 1 failure is logged, we have many "PASSED->None" t=
ransitions in
> > > > >   regression report, we should probably silence it.
> > > > > - some transitions appear as regression while those are in fact i=
mprovements
> > > > >   (e.g: "UNRESOLVED->PASSED")
> > > >=20
> > > > I had quick play. Firstly, if I try "yocto_testresults_query.py
> > > > regression-report 4.2_M1 4.2_M2" in an openembedded-core repository
> > > > instead of poky, it breaks. That isn't surprising but we should eit=
her
> > > > make it work or show a sensible error.
>=20
> Oh right, I am working in a Poky build configuration, so I have assumed t=
hat this
> would be the unique use case.
> Since the test results commits are tightly coupled to revisions in poky (=
so not
> oecore), I plan to merely log an error about not found revision (and sugg=
esting
> the user to check that the repository is poky and not oecore).
> But please let me know if I miss a major use case here and that a smarter
> fallback plan (shallow-clone poky if we are running in oecore ?) is neede=
d

I'm happy to for it just to give an human readable error, someone can
add this functionality if they need/want it.

> > > I think I might be tempted to merge this series and then we can chang=
e
> > > the code to improve from here as this is clearly a vast improvement o=
n
> > > where we were! Improvements can be incremental on top of these change=
s.
>=20
> I am in favor of this :) If it is OK for you, I will just re-submit a ser=
ies with
> the fix for the proper error logging when running the tool from oecore an=
d not poky.
>=20
> Next we could introduce all the suggestions you have suggested, but I fee=
l that
> with the quick increase of "hotfixes" count to support issues with older =
test
> results, and for the sake of maintainability of resulttool and its submod=
ules,
> those specific hotfixes need to be properly isolated (and documented), li=
ke in a
> "regression_quirks.py" or something like that. What do you think ?

I'm hoping we don't have many of these quirks. We have a huge history
at this point so it would be sad if the tool can't work with it. From
what I've seen so far, we can manage with the code in the regression
module itself. I've tried to add some comments.

I wondered what to do with this series since I needed to get M3 built.
Since this series was available and mostly usable, it would be better
to have a nicer report this time, it is a good test of the code.

In the end I've merged most of it, along with my two tweaks to handle
LTP and the bigger ptest results issue. I couldn't take one set of the
selftests since they simply don't work. This will give us a useful
realworld test of the M3 report.

I'm working on the assumption you'll send a follow up series with the
tests, the oe-core check and some of the other issues I've mentioned in
other emails?

Cheers,

Richard





