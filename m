Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3769FC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:02:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9246.1676505767866274495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MPSfVLet;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so3175148wmp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLF9RPPyb27TRoKMb0IYE+gpXPi23e3GpPFl/KKcBFg=;
        b=MPSfVLetlRoaAgMLaDzGCbk89beH/7fa4cKtfwp2v/xAZ1hz5Vv0IuRP7NV1WW+O65
         peFE5Z6jAS+0Lx6Opnq037C/1f0UnERJiJmv0mGc9+EpCx8GC8gORJATl4Iv7y7UTSpP
         NpdS4FhI/Fz5615pDjKlUENTZF8nZFnUco5iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLF9RPPyb27TRoKMb0IYE+gpXPi23e3GpPFl/KKcBFg=;
        b=6zmExjBd0ICHgvXY+AfHZ0aTD1D1rkxcg4VtYm6PCaOdRPw9kjf9OMcejFGykLqYdu
         pEteerKzvBgb32rjO3sEeI9+hNuPu6juw0yv9BHFBSFRGNLHswYSse42g8JfH/vQpFXA
         GKkRnwBP3vjixEv4kIIWz0U1TTcYBH41q+P+rZ5S3+E82ZJuqdDLLJt/iJvl4x5jSldf
         /vhGffH0+a0zEWb4CIEJ0BHrkw/fBGxNYBt4codcaHUlV4ydEsnSL7zbzeN2xeuPPD7S
         358f3zzr1MWP1kZQN+C8myhShnLC3s0c8z5yRP+3+VyIVvTBTeHgU2CgZAvONe/fjk6l
         /rOw==
X-Gm-Message-State: AO0yUKUTSRe5A0gymk1tVIgr2JPcz4+LM6LyrFjGebf0BUNjkO+EJ3pG
	647B4ruyG0vx7HUdVtWadRfXAA==
X-Google-Smtp-Source: AK7set+soozMG/mk2FndXc9jxSFJB9zRaWK+ZnPsoobAu9h9BH/vDeI5CiG7hEVUvKxQk3Xd63rqog==
X-Received: by 2002:a05:600c:43d4:b0:3dc:557f:6129 with SMTP id f20-20020a05600c43d400b003dc557f6129mr3074063wmn.2.1676505765300;
        Wed, 15 Feb 2023 16:02:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d39a:5560:699e:2da6? ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id g7-20020a05600c310700b003dc59d6f2f8sm3732900wmo.17.2023.02.15.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 16:02:44 -0800 (PST)
Message-ID: <124b9c9667b038b8502f6457ba7d894fc4ef3c58.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Thu, 16 Feb 2023 00:02:44 +0000
In-Reply-To: <20230214165309.63527-1-alexis.lothore@bootlin.com>
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177223

On Tue, 2023-02-14 at 17:53 +0100, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> This v2 does not contain any change in patches content, it only sets the =
From:
> field correctly. Sorry for the noise.
>=20
> This patch serie is a proposal linked to discussion initiated here:
> https://lists.yoctoproject.org/g/automated-testing/topic/96652823#1219
>=20
> After integration of some improvements on regression reporting, it has be=
en
> observed that the regression report of version 4.2_M2 is way too big. Whe=
n
> checking it, it appears that a big part of the report is composed of "mis=
sing
> tests" (regression detected because test status changed from "PASS" to "N=
one").
> It is mostly due to oeselftest results, since oeselftest is run multiple =
time
> for a single build, but not with the same parameters (so not the same tes=
ts
> "sets"), so those test sets are not comparable.
>=20
> The proposed serie introduce OSELFTEST_METADATA appended to tests results=
 when
> the TEST_TYPE is "oeselftest". An oeselftest result with those metadata l=
ooks
> like this:
> 	[...]
> 	"configuration": {
> 		"HOST_DISTRO": "fedora-36",
> 		"HOST_NAME": "fedora36-ty-3",
> 		"LAYERS": {
> 			[...]
> 		},
> 		"MACHINE": "qemux86",
> 		"STARTTIME": "20230126235248",
> 		"TESTSERIES": "qemux86",
> 		"TEST_TYPE": "oeselftest",
> 		"OESELFTEST_METADATA": {
> 		    "run_all_tests": true,
> 		    "run_tests": null,
> 		    "skips": null,
> 		    "machine": null,
> 		    "select_tags": ["toolchain-user", "toolchain-system"],
> 		    "exclude_tags": null
> 		}=20
>  	}
> 	[...]
>=20
> Additionally, the serie now makes resulttool look at a METADATA_MATCH_TAB=
LE,
> which tells that when compared test results have a specific TEST_TYPE, it=
 should
> look for some specific metadata to know if tests can be compared or not. =
It will
> then remove all the false positive in regression reports due to tests pre=
sent in
> base results but not found in target results because of skipped tests/exc=
luded
> tags
>=20
> * this serie prioritize retro-compatibility: if the base test is older (i=
e: it
> does not have the needed metadata), it will consider tests as "comparable=
"
> * additionally to tests added in oeqa test cases, some "best effort" manu=
al
> testing has been done, with the following cases:
>   - run a basic test (e.g: `oeselftest -r tinfoils`), collect test result=
, break
>     test, collect result, ensure tests are compared. Change oeselftest
>     parameters, ensure tests are not compared
>   - collect base and target tests results from 4.2_M2 regression report,
>     manually add new metadata to some tests, replay regression report, en=
sure
>     that regressions are kept or discarded depending on the metadata

I think this is heading in the right direction. Firstly, can we put
some kind of test script into OE-Core for making debugging/testing this
easier?

I'm wondering if we can take some of the code from qa_send_email and
move it into OE-Core such that I could do something like:

show-regression-report 4.2_M1 4.2_M2

which would then resolve those two tags to commits, find the
testresults repo, fetch the data depth1 then call resulttool regression
on them.

I did that manually to experiment. I realised that if we do something
like:

    if "MACHINE" in base_configuration and "MACHINE" in target_configuratio=
n:
        if base_configuration["MACHINE"] !=3D target_configuration["MACHINE=
"]:
            print("Skipping")
            return False

in metadata_matches() we can skip a lot of mismatched combinations even
with the older test results. I think we also should be able to use some
pattern matching to generate a dummy OESELFTEST_METADATA section for
older data which doesn't have it. For example, the presence of meta_ide
tests indicates one particular type of test. Combined with the MACHINE
match, this should let us compare old and new data? That would mean
metadata_matches() would need to see into the actual results too.

Does that make sense?

Cheers,

Richard


