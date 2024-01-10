Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869CAC4707C
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 14:23:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.12713.1704896606606747546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 06:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d+ADszKH;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd08f0c12aso44662801fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704896605; x=1705501405; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtHpJesDeetxl2aO81xLrasMnogtiwQkEGtSEmcRlbk=;
        b=d+ADszKH95LhP6ihKmFPqWGgNt61AZSdc43yaP00Ye2mrT3Tud2nYX7XUrrFm3AR6n
         FzfPgH20GFdK+eICtQMiK/kJRncbf4nG1HL81+9BkfqvvEKnV9v1di3m4ONzRqZV0SPV
         Ig/KeXF+XR4e8IYx9rExTADEkUr+Rldo/xvij5980E+ZaCpZFvVUA3cPuwW3Kl1p0S3S
         KaSbyDX8lbOr9I6PpxdXLNlyQpqpRIwLtn/POk3WT/w1sLHteMxtF5B/OL7kKIHiR11V
         o9yl8nSUUwwbh+L4u2Wc5cjqMmd3kW0d21tNqtHdSGoXu+PtBFHP660rnxjFx1TiCbgS
         95ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896605; x=1705501405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtHpJesDeetxl2aO81xLrasMnogtiwQkEGtSEmcRlbk=;
        b=sbcVF9Eq+1BFFKD7oRSPrq3i/XZ2NFc7q5npcCjhLGRj96tdgdN1wFGuKtleso5Xuc
         NLtbHhJ0zurNJEeCZiVskz27Pb4gY/3elEf1JpgJrHUq5WN4haPTG6PNAd0GvRxnQzgE
         GsW9tlPFiIovA0Gs9srKvegWrSDpSLuvFCj9UT6g30ofnFUT1VR8a8bu3cGHInfwst9e
         4jrKnVXZjE9YoTVDTl2v9ujtxJCFDWOzBK5QUuCSfyRP4dhejC5tI5OsvKTJoPNq3dQF
         pdASqFHhbMn5WtttwJeCIOlzz6tW0FnwD/9oTxVJOprsu5jodGaoyZszIRrq747jIN4U
         TjcA==
X-Gm-Message-State: AOJu0YxT1Ch0h4EuTdfOG4YNESCHMEkxbehUK9ylqgPpizwJeAHRNh6J
	GH95lPQHeVYNWITcbsMaU8A41VnlBsb6cg==
X-Google-Smtp-Source: AGHT+IHM0bmgfK3imys9Qg3LLpnRJagBADuuhHNLeoQgypwve1WVXcrILHfPmyM9+E2Z51M13p4uRg==
X-Received: by 2002:a05:6512:1102:b0:50e:ca83:887e with SMTP id l2-20020a056512110200b0050eca83887emr364715lfg.34.1704896604540;
        Wed, 10 Jan 2024 06:23:24 -0800 (PST)
Received: from nuoska (drtyq0yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7400:df00::193])
        by smtp.gmail.com with ESMTPSA id d23-20020a0565123d1700b0050e7c6a5f6bsm665786lfv.72.2024.01.10.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:23:24 -0800 (PST)
Date: Wed, 10 Jan 2024 16:23:22 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa parselogs.py: load ignore files from
 sys.path
Message-ID: <ZZ6oWucoyepbY4cK@nuoska>
References: <20240110130322.4078930-1-mikko.rapeli@linaro.org>
 <40B3B6D9-1EC6-4CD3-A42E-52E7F3A588D8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40B3B6D9-1EC6-4CD3-A42E-52E7F3A588D8@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 14:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193513

Hi,

On Wed, Jan 10, 2024 at 02:01:36PM +0000, Ross Burton wrote:
> On 10 Jan 2024, at 13:03, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > python import.resources open_text() loads files from the module paths
> > but this requires layers to set "addpylib ${LAYERDIR}/lib oeqa"
> > which is not needed to find the plain .py test files to run the tests.
> > Also an empty __init__.py file in a layer will break the resource file
> > loading completely as only that path with __init__.py file will
> > be used to search the resource files. Then open_text() is marked
> > as deprecated from python 3.11 onwards
> > https://docs.python.org/3/library/importlib.resources.html
> 
> Deprecated but replaceable with files(package).joinpath(resource).open() (which is all open_text does internally).

Yes, but that seems to break if __init__.py file is found from
${LAYERDIR}/lib/oeqa/runtime/cases.

> > So replace open_text() by iterating over sys.path to find the ignore
> > files. This works since paths like ${LAYERDIR}/lib/oeqa/runtime/cases are
> > already in sys.path. Add debug prints for found and not found files
> > while at it.
> 
> I’m confused why lib/oeqa/runtime/cases is on sys.path directly, that sounds… unusual.  Do you have any idea where that comes from?  I’m guessing oeqa is throwing it on the path whilst searching for test cases, but that sounds like bad behaviour that should be removed to me.

No idea where this comes from, but it's there. addpylib is doing similar things,
adding paths to sys.path and for this use case this not really necessary as
${LAYERDIR}/lib should not need to be, it only has oeqa directory. I presume
test case loading via testimage.bbclass or OERuntim are adding it. These are kind
of hard to debug since "bitbake -e" show any of this.

It's a bit odd that layer.conf would need "addpylib ${LAYERDIR}/lib oeqa" for loading
.txt files but that's not needed for finding and using the oeqa .py test files.
With this change addpylib magic is not needed, at least for finding these
.txt files.

Cheers,

-Mikko

