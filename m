Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1311CC636D6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:34:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.7157.1676543638856676330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 02:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aq+k6M3Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso1242550wmo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 02:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y1xzCA1bqwdo9pTxp8pd/LpAFFSBiUQC6xHwceAbEvE=;
        b=aq+k6M3QuLlo7UfKMq+tN1vzR1iDtmPec/g5Pu988juve8yGffNl2b1jOqi3Lhv3F+
         hgQyCGFGpMuOvqwivVNRO6yuWgnzyHNnizqcxYbxDELl6UGDNp9FgU7MrlV1w1Xn5ixJ
         Ghy6DggK3QWgcZOIOjtCq1RFS1StZyD7eGe+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1xzCA1bqwdo9pTxp8pd/LpAFFSBiUQC6xHwceAbEvE=;
        b=O1h02+BM2yU3SIsHk8MJX6mAUvyOjWiV8nNSsoelBA/9JGFQvsSnZLJbCpOMvsmZnP
         dq3UANXHu2xuexQ6VpajRhf4enS4Ejy0suqWxBjuJzDMR1xCoD5O/ZFaMhMpGwzpsPhJ
         eeNSYWpNTsb2nQvvu+748YFF0KPu7PlGZ2yWw+1x5H1JsfarlLhWouur0ZwGnlMen7RW
         QI2FBXd5Zdg6D3NAWFJOZFLsdB4UBvc+qq8c+yp1Md74PYifYFeTUGOG2Ykp3PrHT6Sk
         2LHfKxkj05t3jMDky+aqIBgW3M1xnTT5VIH0DyyZox9j2lan2zvjAI5RHNh9cQ7sLkW0
         n71w==
X-Gm-Message-State: AO0yUKVODcRpypI3PFHpf6yJdXdB6JMuU5Y5ct3q8K/i+9AScWygNp4r
	YqE8BMLG32v+5fM6BorhJ0moUg==
X-Google-Smtp-Source: AK7set9rPGFAdZPfLp/LmiZADwYi5U1+JnWxnZsNrSEpA5J5RQw+Dwshkxopgdu5KhD7/TaZlL0guw==
X-Received: by 2002:a05:600c:318f:b0:3df:e468:17dc with SMTP id s15-20020a05600c318f00b003dfe46817dcmr4385609wmp.40.1676543636975;
        Thu, 16 Feb 2023 02:33:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d39a:5560:699e:2da6? ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id c63-20020a1c3542000000b003df7b40f99fsm4990609wma.11.2023.02.16.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 02:33:56 -0800 (PST)
Message-ID: <4e8fa5b3cc2de0a3c740827b405129425d9a62db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Thu, 16 Feb 2023 10:33:55 +0000
In-Reply-To: <407f3fd1-199b-9d65-cbf3-66bee54d4cf2@bootlin.com>
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
	 <124b9c9667b038b8502f6457ba7d894fc4ef3c58.camel@linuxfoundation.org>
	 <407f3fd1-199b-9d65-cbf3-66bee54d4cf2@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177282

On Thu, 2023-02-16 at 09:56 +0100, Alexis Lothor=C3=A9 wrote:
> On 2/16/23 01:02, Richard Purdie wrote:
> > On Tue, 2023-02-14 at 17:53 +0100, Alexis Lothor=C3=A9 via
> > lists.openembedded.org wrote:
> > > From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > > * this serie prioritize retro-compatibility: if the base test is olde=
r (ie: it
> > > does not have the needed metadata), it will consider tests as "compar=
able"
> > > * additionally to tests added in oeqa test cases, some "best effort" =
manual
> > > testing has been done, with the following cases:
> > >   - run a basic test (e.g: `oeselftest -r tinfoils`), collect test re=
sult, break
> > >     test, collect result, ensure tests are compared. Change oeselftes=
t
> > >     parameters, ensure tests are not compared
> > >   - collect base and target tests results from 4.2_M2 regression repo=
rt,
> > >     manually add new metadata to some tests, replay regression report=
, ensure
> > >     that regressions are kept or discarded depending on the metadata
> >=20
> > I think this is heading in the right direction. Firstly, can we put
> > some kind of test script into OE-Core for making debugging/testing this
> > easier?
> >=20
> > I'm wondering if we can take some of the code from qa_send_email and
> > move it into OE-Core such that I could do something like:
> >=20
> > show-regression-report 4.2_M1 4.2_M2

I was thinking "yocto-testresult-query regression-report" might be a
better name/command, then it can default to using the yocto-testresults
repo and resolving yocto tags. You'll also likely want to specify a
workdir for the operation but those are implementation details :)

> >=20
> > which would then resolve those two tags to commits, find the
> > testresults repo, fetch the data depth1 then call resulttool regression
> > on them.
>=20
> That totally makes sense, it will make future change easier to test, than=
ks for
> the suggestion. I will think about how I can rework/transfer some code to=
 do
> that. I feel that one thing could still be troublesome to do so: since th=
ere
> will be linked modification in yocto-autobuilder-helper and openembedded,=
 do you
> know if yocto-autobuilder-helper is fetched on same branch family as all
> repositories needed for build ? From a quick reading, I see that it is by
> default on "master" in config.py in yocto-autobuilder2 repository, so I t=
hink it
> is always on master, which will be an issue to solve ?

Unlike yocto-autobuilder2, there is a branch of yocto-autobuilder-
helper per release. We can therefore move code from there to OE-Core on
the master branch and we'll be ok. It will be a small headache for SWAT
whilst we test it but Alexandre is on cc and will cope :).

> >=20
> > I did that manually to experiment. I realised that if we do something
> > like:
> >=20
> >     if "MACHINE" in base_configuration and "MACHINE" in target_configur=
ation:
> >         if base_configuration["MACHINE"] !=3D target_configuration["MAC=
HINE"]:
> >             print("Skipping")
> >             return False
> >=20
> > in metadata_matches() we can skip a lot of mismatched combinations even
> > with the older test results.
>=20
> Indeed, comparing MACHINE when present on both results can help too. I ma=
y have
> skipped this because of confusion about our previous discussion on some t=
ests
> being "cross-compared" while other are "strictly" compared ! I will ensur=
e that
> most of scenarios allow comparing MACHINE, and if so, I will add it in
> metadata_matches to be checked first (because cheap to test), and if it m=
atches,
> check OESELFTEST_METADATA too (more expensive)

MACHINE should always match, that is fine. What doesn't need to match
are the distros and so on.

> > I think we also should be able to use some
> > pattern matching to generate a dummy OESELFTEST_METADATA section for
> > older data which doesn't have it. For example, the presence of meta_ide
> > tests indicates one particular type of test. Combined with the MACHINE
> > match, this should let us compare old and new data? That would mean
> > metadata_matches() would need to see into the actual results too.
>=20
> I thought about this possibility while starting to work on this (checking=
 for
> existing metadata to kind of generate/guess test configuration), but I ha=
ve felt
> that it would need too much "business logic" encoding in resulttool scrip=
ts,
> which could easily break if we want to change some tests configuration. I=
 mean,
> if someone changes some parameters passed to oe-selftest in builders
> configuration, he will very probably not remember to update some "guess" =
filters
> in resulttool.

I think it will be important/useful to have good regression reports
against existing test results (e.g. ultimately on our LTS release
branches too). Whilst I don't normally like hardcoding things like
this, I think in this case the benefit outweighs the ugliness as long
as it "fades" over time which it will if we add proper metadata going
forward.

> I will start working on new revision of this series based on your comment=
s

Sounds good, thanks!

Cheers,

Richard

