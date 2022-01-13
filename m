Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1E4C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 21:58:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3852.1642111086780750851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 13:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/9Qhu3K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d19so12683739wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tHOsYSuJyhHjrPykp4Bb9kTRDQCgVA3vj8fCWyhggwA=;
        b=Q/9Qhu3KJcRiGDLBpGyiuzgBG4OKMrAnismhHxK4j7dtA8zidi8FZTnSY69hPBWwAm
         z3BnXE863gZPCSZnhtQNKs4gyoPb5BoqPvr19LqRLKCH/uVnXqFCgXqVJfusz5XOP6EL
         jQlhzVFRfrouE6a5cqoj4MS4/w1oyw/VMhtdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tHOsYSuJyhHjrPykp4Bb9kTRDQCgVA3vj8fCWyhggwA=;
        b=RbuHlthTJahdeAID2vLTuoF+2RgueT761Rhgp9Q4vCTslltMerwYl2kIGkgXrp2eaK
         ZY3g9Wl+Uhc/XhoeV2AwCQD8TiKTBH6DnKE+uCY7wTlH35C3Koz3mlhlYCNy65fPyUxR
         2jx/3JmM8+XLR1m+VmuWgs0apZJN+lmjwpj/zWlGMHOWKaNCALNQC94XsqdMOpPhvIuW
         /sLdxYwE2WT4MNCV23dzx9gHkxAyDCduA5+NBctNmXH9wV6TITajLcDL/L98IhZMszCs
         DZ5IQCh4iAP5Mo8ZNhe337m3F+Tnk6AY6bnr887cUbqICt0I2JHVXiEBn0WiGmycd7vz
         A6Mw==
X-Gm-Message-State: AOAM530vwd2RAHK5Fgtw/FHhG6gf1x4cb0pa4kbIyxJ7N86HDI/OOcXX
	7lgusiAlfZrUljQSPucaTMr/3A==
X-Google-Smtp-Source: 
 ABdhPJwRJJQ+9WrKjfdJWRkR1CJGmtBPn43NgtZdVcVl4E/cw9Hi/hBVRmAOT5qX2/7I4Iyxfl3hKA==
X-Received: by 2002:adf:e84b:: with SMTP id d11mr5450072wrn.336.1642111085187;
        Thu, 13 Jan 2022 13:58:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 q63sm9406761wme.0.2022.01.13.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 13:58:04 -0800 (PST)
Message-ID: 
 <62e596bd10d0eedec94333f5d854d9022e3d64d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] valgrind: Enable network for ptest builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jan 2022 21:58:03 +0000
In-Reply-To: 
 <CAMKF1srXrw_80NNT6zaQsh8aR7gkw8YqDp=x+OjyHNnduFcO9Q@mail.gmail.com>
References: <20220113173555.1925441-1-raj.khem@gmail.com>
	 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
	 <AM9PR09MB4642C9029183D8A03387674BA8539@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <CAMKF1srXrw_80NNT6zaQsh8aR7gkw8YqDp=x+OjyHNnduFcO9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 21:58:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160534

On Thu, 2022-01-13 at 11:12 -0800, Khem Raj wrote:
> On Thu, Jan 13, 2022 at 9:46 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> > 
> > My understanding is to add
> > 
> > --nonet
> > 
> > to XMLLINT_FLAGS = --noblanks --noout --xinclude --postvalid --noent
> > 
> > in docs/Makefile.in
> > 
> > and we should be good - haven't tried it yet but it should do the trick
> 
> right, good suggestion but it did not work originally thats why this patch.

I would rather disable this than allow network access. We need to understand why
we don't see this on the autobuilder, something isn't adding up here...

Cheers,

Richard


