Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03144C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 13:47:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.45099.1636379262817029712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 05:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NEluA7/c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso11668404wme.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8+r0tVqqMc4z9CMAwglSdEeDCMR1ZAs6tVL3u1oujXw=;
        b=NEluA7/cbsH2nTxZe1Iq7wqKSELtQ8mHhffGzxXi4BDcSX0ofxo1mzAyCxF8nZYNTm
         kEt46GPGxLmHaC2sIqL4mAgEV+T4fnvsa2WlXKu9n8g5yxpSgWhByHSyxkzcYnkJkTaO
         JoIrrSQxNMv6OYz/ArJBy0WYtFB+o7MKslsfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8+r0tVqqMc4z9CMAwglSdEeDCMR1ZAs6tVL3u1oujXw=;
        b=q8pMrXQVD3eEF3a/t9TJvZQM/nM9YxGDeyJTJ3zVyxMweKThQdWcFJz3fI0UhBkYRb
         6aepE521WdMS69/caS56hOnnESRggbAG+laXdvm1tNXJCFF//9q4pPxWgW8/VIVFkSj5
         oOnfw7xwWS5lTXAzELnghUyR8et/+xYlaJ3WVwhQ0ZoKaxJxIqbciE6vxx6olXAcHFN1
         Hw9BoSnwUvicXdQFG/aAYbrZW7lDiIkkDRmTwar1+4CrrPH87gFJHTTOPiJWZk95yf4O
         7II/61MfkYdu0YwFe2c+Ig0AzXedaBRqoimAdptv5FYBLrMDR/zpL23yq2xl74DZArUX
         pdLQ==
X-Gm-Message-State: AOAM530cn/WnhKaeDgcqFp83RHQODTi2f8/tBPlgHc1JocVG8e0c2Ex8
	xDL1/LZbgDIbZtUyS9n6i9F5dA==
X-Google-Smtp-Source: 
 ABdhPJzOY6DeK9H45WFi3QggiX/wF9XvWDsuppjLd0zyk462d7KQQfRT4ahBfZXMIcitq4b0qfVgbA==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr53101006wmh.37.1636379261106;
        Mon, 08 Nov 2021 05:47:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c39:dba0:779a:3673?
 ([2001:8b0:aba:5f3c:5c39:dba0:779a:3673])
        by smtp.gmail.com with ESMTPSA id
 f8sm15326457wmf.2.2021.11.08.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:47:40 -0800 (PST)
Message-ID: 
 <6211c23fa5df4aee234e246364aa88ad753d0a93.camel@linuxfoundation.org>
Subject: Re: [PATCH v3] glibc: ptest: Add running glibc time related test
 suite (Y2038) with ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>, Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Nov 2021 13:47:39 +0000
In-Reply-To: <20211108144217.5be89bde@ktm>
References: <20211028120020.23276-1-lukma@denx.de>
	 <20211108144217.5be89bde@ktm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 13:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157981

On Mon, 2021-11-08 at 14:42 +0100, Lukasz Majewski wrote:
> Dear Community,
> 
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs time related (to check if Y2038 support works)
> > glibc test suite to OE/Yocto built image.
> > 
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> > 
> > This recipe installs time related glibc tests on some rootfs image.
> > Afterwards, those tests can be executed on the real hardware, to
> > facilitate validation of it with Y2038 problem compliance.
> > 
> > To test time related subset - one needs to call:
> > ptest-runner glibc-tests
> > then change the date after Y2038 threshold for 32 bit systems:
> > date -s "20 JAN 2038 18:00:00"
> > and then run ptest-runner again.
> > 
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> > 
> 
> Gentle ping on this patch ...

There is a reply from Alexandre on the 29th which says:

"""
There is a remaining issue:

WARNING: Nothing RPROVIDES 'nativesdk-ptest-runner' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/glibc/glibc-tests_2.34.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-ptest-runner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-ptest-runner']
"""

Cheers,

Richard


