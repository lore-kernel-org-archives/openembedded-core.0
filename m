Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D3DC7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 18:06:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.25479.1677262004608644358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 10:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UyV1P9ur;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id 6so14386257wrb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYHpiIeDz4JXvc+qZotOw+vjtGH8TlWyodsDSnLmuSM=;
        b=UyV1P9urXdCDaTa2ah/8k5Cu3ebaHCFsgWFlZ6Gpij/gU5MkeneyPQizfi8lPxjy3e
         5wh1/ZuJ+Batuein8PtRnfrOpz11CThSYiK+XXKuVDhGh390nUCE1N41X76DqkeX1r94
         0JkD6WnLIXUqqK9DTGdS8w7GoY8+T8vEBFJKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYHpiIeDz4JXvc+qZotOw+vjtGH8TlWyodsDSnLmuSM=;
        b=kbw5aEbvH93h/EpTJ884B19qNBvr9MQTPV6txlSxTfh2l3VcWmo25w/3/KqGhFUO7A
         P+0pXuVAZlqlR1AjLafoVEzXwC0QGwLv5ZBc4n5IzkE26K2JW1iiuhgOxbyQ3lNQK0sq
         5qhTDqO1lyYULJIlXBF9XSR3Sko2bwfBQF0qn2o0ASBMAgF0PRAU6Mjcbg7Srsoc3TuN
         sH6yebHCkr8mabrIJIaby2NxHPw/r/Du+zTkbDDU1z6Qe4tzKUceatpO9V2xJFZ54JGK
         7KHsvnl2wbUD+8VlNYB3KVe7c5HKfys9xsWwWxpBY8QO2OQ+j9K4Tuo93eRD0GdeJNnC
         wdPA==
X-Gm-Message-State: AO0yUKWuwNWyRxe6UbK34mxX0eFMdcI/Yn8SytwoNogrdkXkFeSWAO+q
	/5rx5ShHcHX/Tt9aPvL3n6wN8A==
X-Google-Smtp-Source: AK7set9/XIBq8aW3DeuFl4LZeFwAixznbEzWVwlQIEv+U8/Nrj8GQqJolrYfIx0l3GBygvisTJwjMg==
X-Received: by 2002:a5d:4d06:0:b0:2c6:e85b:a5a4 with SMTP id z6-20020a5d4d06000000b002c6e85ba5a4mr16231472wrt.14.1677262002809;
        Fri, 24 Feb 2023 10:06:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002c54f4d0f71sm15092094wrw.38.2023.02.24.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 10:06:42 -0800 (PST)
Message-ID: <05acd5da34f737af11848e110d6f87b44deea3bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Fri, 24 Feb 2023 18:06:41 +0000
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 18:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177708

Hi Alexis,

Firstly, this looks very much improved, thanks. It is great to start to
see some meaningful data from this.

On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Hello,
> this new series is the follow-up of [1] to make regression reports more
> meaningful, by reducing noise and false positives.
>=20
> Change since v2:
> - add filtering on MACHINE field from test results configuration: the MAC=
HINE
>   should always match
> - add "metadata guessing" mechanism based on Richard proposal ([2]). Up t=
o the
>   point where this series will be merged, tests results stored in git are=
 not
>   enriched with OESELFTEST_METADATA. To allow proper test comparison even=
 with
>   those tests, try to guess what oeselftest command line has been used to=
 run
>   the corresponding tests, and generate OESELFTEST_METADATA accordingly
> - add new tool to ease test results usage: yocto_testresults_query. For n=
ow the
>   tool only manages regression report and is a thin layer between send-qa=
-email
>   (in yocto-autobuilder-helper) and resulttool. Its main role is to trans=
late
>   regression reports arguments (which are tags or branches) to fixed revi=
sions
>   and to call resulttool accordingly. Most of its code is a transfer from
>   send-qa-email (another series for the autobuilder will follow this one =
to make
>   send-qa-email use this new helper, but this current series works
>   independently)
>   Example: "yocto_testresults_query.py regression-report 4.2_M1 4.2_M2" w=
ill
>   replay the regression report generated when the 4.2_M2 has been generat=
ed.
>=20
> Change since v1:
> - properly configure "From" field in series
>=20
> With those improvements, the regression report is significantly reduced a=
nd some
> useful data start to emerge from the removed noise:
> - with the MACHINE filtering, the 4.2_M2 report goes from 5.5GB to 627MB
> - with the OESELFTEST_METADATA enrichment + metadata guessing for older t=
ests,
>   the report goes from 627MB to 1.5MB

That is just a bit more readable!

>=20
> After manual inspection on some entries, the remaining oeselftest regress=
ion
> raised in the report seems valid. There are still some issues to tackle:
> - it seems that now one major remaining source of noise is on the "runtim=
e"
>   tests (comparison to tests not run on "target" results)
> - when a ptest managed by oe-selftest fails, I guess the remaining tests =
are not
>   run, so when 1 failure is logged, we have many "PASSED->None" transitio=
ns in
>   regression report, we should probably silence it.
> - some transitions appear as regression while those are in fact improveme=
nts
>   (e.g: "UNRESOLVED->PASSED")

I had quick play. Firstly, if I try "yocto_testresults_query.py
regression-report 4.2_M1 4.2_M2" in an openembedded-core repository
instead of poky, it breaks. That isn't surprising but we should either
make it work or show a sensible error.

I also took a look the report and wondered why the matching isn't quite
right and why we have these "regressions". If we could remove that
noise, I think we'd get down to the real issues. I ended up doing:

resulttool report --commit 4d19594b8bdacde6d809d3f2a25cff7c5a42295e  . > /t=
mp/repa
resulttool report --commit 5e249ec855517765f4b99e8039cb888ffa09c211  . > /t=
mp/repb
meld /tmp/rep*

which was interesting as gave lots of warnings like:

"Warning duplicate ptest result 'acl.test/cp.test' for qemuarm64"

so it looks like we had a couple of different test runs for qemuarm64
ptests which is confusing your new code. I suspect this happened due to
some autobuilder glitch during the release build which restarted some
of the build pieces. Not sure how to handle that yet, I'll give it some
further thought but I wanted to share what I think is the source of
some of the issues. Basically we need to get the regression report
looking more like that meld output!

Cheers,

Richard

