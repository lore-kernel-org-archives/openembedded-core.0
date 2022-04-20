Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA51C65C0E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13928.1650491678088734452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dlWI2/zp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id y21so2062236wmi.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=J87c5WCximTSGZLOWFP4wqOHCrsIhyundnJquro1E7U=;
        b=dlWI2/zpcKP6L4E8jbJgQ9A42AOSFclNdDf5rViO/1ikuVht29bJ+cDN4d/nCE2vQf
         2AwXzYPOwwXNRjeqN8868UuI0dqphOB4ROvGqZ0JklXsN6HNoVyYgzyU0fvVEYjUb0/K
         fP3e17uqv0C4wEZkWbMa1G+NPZl11RRtvVa9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J87c5WCximTSGZLOWFP4wqOHCrsIhyundnJquro1E7U=;
        b=stUF2au08zQzCHCldpwx+gxnj0f/cDYGsIYoCvi2F3qcPHoiRMSL+TO5DDbt9cjmph
         qYX17ReCzLwfKglX9J+tk43Pnjh7HMAebxMhpPnIbUWboMmlLl05b1NJDtcjNdXYmcd6
         +4zEPWOnEw6mINw+RyqlRNnk7RNW+sdqGXtyWKJj6ykJsNxgPwDo/c2SW5Ion/13AGcA
         adb5CUC/ayXSpAUm5pvSU9uyiRRV4qmirH4bLm2ShDvU6sSnQMbwhkJYufM6xWc/qJ6t
         Q85vWjvFIpU4tL2EwaoaWAI6H3kUe5datiwnDZ2l/dKkrTR370nV4TnhbGizV8nAXA4d
         edRQ==
X-Gm-Message-State: AOAM531fkn6wZJua8mtm5OXL/JdHdc0FQrnkO2qveHalHCgl9DWFFX4H
	OMqqX5RxVJATcgCMMk9dRyd1YQ==
X-Google-Smtp-Source: 
 ABdhPJzJ9sT5lHNeGP0rRGnhNx5uorP6F4ygmMAHcLq3TSh2piYNKNdPZR6mGZpGxSnpr47rufaPEw==
X-Received: by 2002:a05:600c:3ac8:b0:392:a821:7975 with SMTP id
 d8-20020a05600c3ac800b00392a8217975mr5495293wms.138.1650491676492;
        Wed, 20 Apr 2022 14:54:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be2e:566:8fa4:996b?
 ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm831168wri.4.2022.04.20.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:54:36 -0700 (PDT)
Message-ID: 
 <f6df27bbd307aa4c97514297fbb8f26c38f7cf00.camel@linuxfoundation.org>
Subject: Re: [OE-core] Intermittent failure issue summary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Apr 2022 22:54:34 +0100
In-Reply-To: 
 <CAAnfSTtF8M6SowDmW-tv+D44vNWNrapOb6PGa1GedbZxKf2zNQ@mail.gmail.com>
References: 
	<d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
	 <CAAnfSTtF8M6SowDmW-tv+D44vNWNrapOb6PGa1GedbZxKf2zNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164737

On Tue, 2022-04-19 at 17:50 +0100, Ross Burton wrote:
> On Sat, 16 Apr 2022 at 11:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > x86 boot log serio/CD drive timeout in qemu:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14743
> > We've talked about disabling some of the peripherals we don't need/care about
> > such as psmouse and the CD drive. Anyone fancy digging into this with upstream
> > qemu? I suspect there are other people who'd like this too.
> 
> Patches sent for the keyboard/mouse part.  The CD drive is trickier...

Knocking those two out alone is great and much appreciated, thanks!

Cheers,

Richard


