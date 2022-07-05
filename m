Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42611C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:08:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.86762.1657040857045211334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a6Qdh7i3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id u14so15345325ljh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03tljXy2tBedW7DDvmnhwbbDT8nB4jxksFsSTxVetik=;
        b=a6Qdh7i35r6uvrEGlyZBl3MOGO+ouZqLFHJ8jMD1gLJAZkQdPhedEmPpO6TPyokUN/
         yoZeRk9FLCMJvP5cCHz/xKjzH4sXo5Abb9FDltj0yX9z5TNXWUORHrJe7Bdydg2znKRU
         HYetigRN7RXdxAWCPJoSkDG/86+qWWHHcfJtuNKtXbidhKIcLWF0d2xqZ9mNF4klcPhY
         8GrQAzDMAlpvOxCS/piYMoOZqSSuA/IjUntcZGz0QeQxnaM+MxLairnnb+WHEz7PY7aH
         MA466Avmns9mbEgLC26kdDTE8rjyFd5WjcZJiyjESzJ6C0ld+dA9rwSEVeLWM4yIRuwS
         woDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03tljXy2tBedW7DDvmnhwbbDT8nB4jxksFsSTxVetik=;
        b=mKBpuzMQVCbH6MhNb3E622yb8wjlzjC6UpoRhJDGmkwJXNLo6d84F4GF8rF84A8/pS
         z+mXHjKFN1v+/TRemUiwXOU3Q4HJdoaoXvMErjJIV9gIAIU+aFQnc+xK8V9ZNdYLOiD5
         umNEtZmqV1hNgz1RAUduscWM1pH/Xwc1ZzDGpuSViqjFIkWRY3cvPzpyf73oLwJw37/D
         IAUb029ADubEMDtLe1KhwbanBBnVIcQBgNlaeI1GhiVpW3qEIAeLli8zJaeNgDgaxeBx
         BgBXLouNhhVP23jiOpu8MeGn3h1lyhXvKcSCO18wacyoWcxSGrmVotgCIUh66l02YFoA
         iDJQ==
X-Gm-Message-State: AJIora9U67tmjBbLdmKZJfK8XCTNu9NAWwsLCxvA1ZGAxCtFScrVTxju
	Tx45W+ZIO50NGYwpP099mf2iJCdXYRYzdxgK+Dw=
X-Google-Smtp-Source: 
 AGRyM1spbSg28SwQrrHQob3AQeB23G3Bt51koF+r5U9JndpAD3xoPDA0sP7U5mHWe7nBXLZHzIdMWXMC2gKsUAgFD3Q=
X-Received: by 2002:a05:651c:4c7:b0:25a:755d:5f9f with SMTP id
 e7-20020a05651c04c700b0025a755d5f9fmr19254060lji.109.1657040855223; Tue, 05
 Jul 2022 10:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220705163949.770641-1-alex@linutronix.de>
 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
In-Reply-To: 
 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 19:07:23 +0200
Message-ID: 
 <CANNYZj8wqKxXRFzykE_rbFeRRvGTysgi=PEtZHLOYM1Exgmcyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: write task locks into ${T}, not
 into ${S}
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:08:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167677

On Tue, 5 Jul 2022 at 19:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Not an option I'm afraid as it is in ${S} for a reason. This is two
> recipes both pointing at the same source (e.g. a recipe and it's
> BBCLASSEXTEND native version) can work.


I considered adding an exclusion for the lock filename to the code
that tracebacks, but special casing like that is pretty ugh. Today
here, tomorrow elsewhere.

Alex

