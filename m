Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95953C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:54:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.1476.1637776478237909834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GfAOaqdy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2772948wme.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LkNBMnp9uk5Yrgxr7c9u5q3L+2Kh+VHtrL1NabYFnn0=;
        b=GfAOaqdy4J59AHAgdWI5qr3pl+OZrA0Or9uon2OID6+zpKra9Fc8J9k1nUZxjDnKAX
         3NUiBjVmqGK6gQonrdtelMOHER17ba88tyP0EVMDsnZp93G70rE/E3h6WeNy1/wk373x
         Vsodwr8kF0tKjVTrqJTd7RZRvdduqTyRUoEvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LkNBMnp9uk5Yrgxr7c9u5q3L+2Kh+VHtrL1NabYFnn0=;
        b=oBky0Abc+r9JaZieCEtKBWrjqJ7kM6ukesuVWflvnO5L1wYqMo1UWU5UXZi56DDxPr
         KW1fcH/HOZswZYIXEg+P3JDAFUsOX4RAvAJrboxrWOVtpsUf/WSKZMPFQ/s+IedwEE3A
         bMzj8AzH2oHTCKBkJAQLY4Rk3ypybS6Vu51HWZ0rHmXz7OAFZg+eOJbJ9A7J5zHoKWUF
         6RtRsH5smEMBxHI62NW7lXqayjnq55tgKgyDY09rqaVsMrFY+68lrMfZkjs48k11GmNQ
         dCCZntfy864t0eJMNWHIvRy2Ij+An0hqSXEp7sM+8I/b92qwK5r4sODU8iOeCW8ObJdW
         EB5A==
X-Gm-Message-State: AOAM533QTar0/sYaokKEwDq8dMZ57miYSlmuybWSD+DYEYX2eM+9iQxY
	civg846fSD1xzuoz08aMg+qxKg==
X-Google-Smtp-Source: 
 ABdhPJw/cSemYePS48yBEL1uOacTUe4MgjmpaktB0tCEB+Yi7AqyLcuIAxxPe2/dpgzW9DGYIZwmHg==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr17805423wml.23.1637776476460;
        Wed, 24 Nov 2021 09:54:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id j8sm460487wrh.16.2021.11.24.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:54:36 -0800 (PST)
Message-ID: 
 <d0866a4fc26fd15318cb4cda7718178dd73b45a0.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with
 missing search directory mode
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Jasper Orschulko
 <Jasper.Orschulko@iris-sensing.com>, Konrad Weihmann
 <kweihmann@outlook.com>,  Martin Koppehel <martin@mko.dev>, Stefan
 Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 24 Nov 2021 17:54:33 +0000
In-Reply-To: <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
References: 
	<20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
	 <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:54:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158734

On Wed, 2021-11-24 at 18:11 +0100, Stefan Herbrechtsmeier wrote:
> Am 24.11.2021 um 16:17 schrieb Alexander Kanavin:
> > Is it the missing x bit on directories? 
> 
> Yes.
> 
> https://registry.npmjs.org/protoc/-/protoc-1.0.4.tgz
> 
> 
> > If you've encountered this, then 
> > where did it happen,
> 
> cp: cannot stat 
> '.../git/ui/./node_modules/protoc/scripts/postinstall.js': Permission denied
> 
> > and shouldn't the tarball be fixed instead?
> 
> How should we fix a tarball from npmjs.com?
> 
> 
> Is such an influencing change acceptable or should I move the change to 
> the npm class?

We don't want to support that in the general case, that needs to be in the npm
class.

Cheers,

Richard


