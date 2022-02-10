Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FA1C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:40:14 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.9167.1644493213490355966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=mHZkW3aD;
 spf=pass (domain: burtonini.com, ip: 209.85.160.169,
 mailfrom: ross@burtonini.com)
Received: by mail-qt1-f169.google.com with SMTP id k25so4842712qtp.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXx+HSM0J503qalN5yohs2Y/xzurQu7K9PKZKAYGu/I=;
        b=mHZkW3aDooGlOBFmeKJq6xsy/+3yxbvk5an+J2MxUU2HyjtMkqry0YLrCNxOvZsibo
         IHTqnfT1grKsQWRrPVarNi8C87uN1r4WE6O1J+xnZxudxEy2Xzrt21vJZkChPiTmgD9X
         amLirJdHclMp4LXA+2mon39PTbR8pc+XiIvk2/qrdBrY9n89mA6+ILb6gqoLgbLM0OtO
         M6jBoA3UZDsZZdAat0BssQZ+0YPxrYX1ukDSyXDE7Ma51QlsYLmxF3Wyy2Jqi8hGDVbB
         UDTlio7rC08v88MZoWDPaPiAuVTQnnD20a2ic/nqBdVQ6RIqzjIvYnIZ0ZFSGU2QtQmY
         VuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXx+HSM0J503qalN5yohs2Y/xzurQu7K9PKZKAYGu/I=;
        b=T7pT8tLE/n9/cn5UOKlhs4XAO/QPy89XAD6gtNIEVczW1UhJJe6ZL8YMQTF2d8WjdR
         nHwTle7HQW+Cyphqd/tongyte0eRAdar4yYf7AZWiwDF/Oi7xKaod85tFq/qQtKzPDw2
         zdDmQKsAXJGrqdemWiZGQHxRJPV5B4+1xbi7/1n2vh+6EybJ5MNYru36j5MWiO5p+W5q
         ZdMRJsRM4eflXcQBqzNGPMiup3YOlSdtqQAAcRIicAE59Ms58vOfbEi0UCQ9AHM4XqXn
         3nfppfk3w5pSuBNjw1QpjZyBi/Bmq1adxJWpKHDoD5UQpeN+q+ZlrJTykEFlqfuTleov
         hX9g==
X-Gm-Message-State: AOAM530tGbOhvF6CZYz/0pTxiUqzkpsj/NJbfwH0cdmYG33aSs1mTrD7
	a8OOAJlfB6Lgf81AQaztf+Tok6a6WFOICi8oUns275F16LPcWg==
X-Google-Smtp-Source: 
 ABdhPJxj3DQfLiLzg/1xvXEqK1hdqmqIlaFtMGL8T335gpf8dNKULZtY7JVnrDQ2H2Nn/hnP8O2ULWv5ifV3lPnPfXQ=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr4486184qth.22.1644493211202;
 Thu, 10 Feb 2022 03:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20220209125315.3177811-1-ross.burton@arm.com>
 <1fa6164c-8a8b-e706-2385-d9c04ace1c5e@gmail.com>
 <5c62a8c54a42a51c039712d3741bc60606959c82.camel@vaisala.com>
In-Reply-To: <5c62a8c54a42a51c039712d3741bc60606959c82.camel@vaisala.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 11:40:00 +0000
Message-ID: 
 <CAAnfSTuSr0pVBu7A+gKY87nAtA4Wrwf_T=ySqUsMCaKd6MXbEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: stop FetchContent from fetching content
To: Eero Aaltonen <eero.aaltonen@vaisala.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 11:40:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161607

On Thu, 10 Feb 2022 at 10:13, Eero Aaltonen <eero.aaltonen@vaisala.com> wrote:
> > what is cmake's default ? I think it could become a constant source
> > of pain if it is not default. Since many cmake based packages might
> > start to depend on it indirectly in future.
>
> CMake's default is to allow downloads.
>
> It's possible to write CMake projects so that they try find_package
> first and then fall back to downloading. I think
> FETCHCONTENT_FULLY_DISCONNECTED might be a helpful flag so that the
> build can then simply report if a required dependency has the wrong
> version or so.
>
> CMake projects that use _only_ FetchContent will likely need heavier
> patching.

The reasoning for this patch is that with the network isolation change
the FetchContents will fail, but as in some environments the network
isolation doesn't work (eg Docker containers) we can disable
FetchContent explicitly too.

Yes, projects which just use FetchContent are a pain.  Lets guess why
I wrote this patch. :)

Ross

