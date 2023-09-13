Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0600EDEC4D
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 12:33:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.10637.1694608389900816618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 05:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xRzg3USj;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-502984f5018so9733816e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694608388; x=1695213188; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p84QybirxtA4umR03ZoyjAixmHabjqPBZ3pxhvpjawk=;
        b=xRzg3USj95UARMEMOvVaQYnKhPG2BsHNssKcVnOc/1G2MLFYjDnsjQxasEiqZsiSY/
         keqi1aHbUa5p5o7qV8TcgckQgP8/j4IKGGnOgKzj+rLST0ka2IT6GUqZAP/y/sJiX0Hj
         qAAC/apgB2r43+BwPyV+x7mqNcFArMChNS8+Jr/e7r2wQcnBg//UirZHEOmXFi/1DXhu
         RfuIBJPOCuTjRltAB9DOwXoMjTTChLdnxhBnys38gw6D89Z95e4j3HFUiJDsX7yRoiIW
         zReQoHzMw+o0FkKZmwPDZdvIWt50E6ovHVDgwi9FaN/9RmdjhhLwre/FyqLTtP8kpzFS
         wkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694608388; x=1695213188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p84QybirxtA4umR03ZoyjAixmHabjqPBZ3pxhvpjawk=;
        b=f9jGOXWMn6yMOSvxFGTAUmqHagllTV8t5gYRsIVxRFak3L/RJXN8Kb8wvUJzRG1mHC
         eAKJ4jgxfuaU2PEhoehHmT5HImM5nqNPcKJYLZNg2nmHCG8+37G6zk8Xb19/uk7WK5HQ
         B6TNp93lTquayf1ajbqchHaprwl/rhRTg2M4onq+cS/4pi4LPclcjTCWiEmmDoqQ8SW2
         46VULxuMl2DoGVam0427Nmok64UvIbAKjy2WyNOsvSIv498vJn7/yBTA9VHCJSDoYGWK
         fUspY3cVL4vDipbYgkmfkM3EwSa2ct84EmZfjf8YgKCWplrvHNBryDhhXu99cxtjoc6Y
         ngcw==
X-Gm-Message-State: AOJu0Yz2iNHZ+PYf0rnPMZgkBacvQsImNqOkHn3OYA11XuEIHtB0x15j
	2Q0D3BPbvzwOyiGTnsSESh0ogA==
X-Google-Smtp-Source: AGHT+IEwlowj+eYV9DSSDE/Os3vBrVOZjR9tgQExtGhw+JBSFCf01fM9Bak55xr1wXTM/MlmkFtxKA==
X-Received: by 2002:a19:e050:0:b0:500:9a45:638 with SMTP id g16-20020a19e050000000b005009a450638mr1837241lfj.2.1694608387964;
        Wed, 13 Sep 2023 05:33:07 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id y11-20020ac2446b000000b004ff89fc80aasm2119165lfl.233.2023.09.13.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 05:33:07 -0700 (PDT)
Date: Wed, 13 Sep 2023 15:33:05 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: yocto-security@lists.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>,
	mark.hatle@kernel.crashing.org, Ross Burton <ross.burton@arm.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [Openembedded-architecture] Security processes: YP needs
Message-ID: <ZQGsAX4XIMkSN35C@nuoska>
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 12:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187588

Hi,

On Wed, Sep 13, 2023 at 01:52:19PM +0200, Marta Rybczynska wrote:
> Hello,
> I've been working recently on collecting what works and what doesn't
> in YP security processes. The goal is to go forward and define an
> actionable strategy!
> 
> Today, I'd like to share with you the summary of what I have heard as
> needs from several people (those in Cc:).
> 
> I want the community to comment and tell us what you find important
> and what you'd like to see added or changed from this list.

Since most users take poky reference distro and combine it with a number
of open source and closed source BSP and other meta layers and build
systems to produce SW for products, they also need documentation and tooling
so that they can replicate the Yocto Project security processes and use the
available tools.

In the best case downstream users are on poky master branch or one of the maintained
LTS branches, but they can also be stuck on a non-LTS branch due to BSP
or other technical, contractual or even purely political reasons. Having a
description of the processes and tools and best practices helps, and if needed
they can for example backport the needed tooling changes to their version to
help or kick off in the maintenance effort, just like how upstream LTS branches are
managed.

I think most of the documentation around the tools and processes is in place already.
Having maintained and shipped from a non-maintained poky branch, I can just say
thank you to all who participated in the upstream work to get security vulnerability
detection and fixing possible!

poky seems well maintained and serves as an example to everyone wether open source or not.

That being said, extending the CVE scanning and status tracking work to include more
open source layers would be nice both for the maintainers and for the users of those
layers. Using some random old branch of meta-foo may not be so safe. Maybe add
this data to layer-index?

Cheers,

-Mikko

> * CVEs: Visibility if YP is vulnerable or not
> 
> People want to be able to check/look up a specific CVE; it might be a
> CVE unrelated to YP
> (eg. package not included, Windows issue). The cve-checker result is a
> part of the solution, but people also want to know which CVEs do not
> apply.
> 
> * CVEs: synchronization of the work on fixes
> 
> Currently, there is no synchronization; multiple parties might be
> working on the same fix while nobody is working on another. There
> might be duplication of work.
> Ross has https://wiki.yoctoproject.org/wiki/CVE_Status
> 
> * Triaging of security issues
> 
> Related to CVE fixes and includes issues reported directly to the YP.
> Some issues are more likely to be serious for embedded products
> (attack by network), so not all has the same priority.
> 
> * Private security communication
> 
> A way to send a notification of a non-public security issue. For
> researchers, other projects etc.
> The security alias exists, but only some people know about its existence.
> 
> * Visibility of the security work of the YP
> 
> There is much work on security in the YP, but it lacks visibility.
> 
> * Documentation
> 
> Related to visibility. We need easy-to-find documentation of subjects
> like submitting a CVE fix,
> reporting a private issue, and how our processes work... This
> documentation should address people who are not regular contributors.
> 
> * Additional tooling
> 
> We could add additional tooling: a template on how to add cve-check to
> the CI (possibly
> a different one than the autobuilder), analyze the result, and extend
> our tooling to their layers...
> It is also related to the "Architecture" topic below.
> 
> * Architecture work
> 
> Security if more than CVE fixes. We also have what is happening in
> meta-security: hardening, compiler option,
> secure package configuration, use of code coverage tools, and so on
> 
> * SRTool
> 
> We might decide to use it again. It allows one to do much but requires
> constant commitment.
> 
> * Presence on pre-notification lists and receiving information before
> the vulnerability gets public
> 
> YP currently depends on public data. Principal distributions receive
> the information before
> a vulnerability becomes public. It requires (in short) private
> reporting, a security team, and a track
> of excellent security record.
> 
> * Becoming a CNA (be able to assign CVEs)
> 
> Needed if we want to assign CVEs to the software of the YP, like
> autobuilder, Toaster etc.
> 
> Kind regards,
> Marta

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1747): https://lists.openembedded.org/g/openembedded-architecture/message/1747
> Mute This Topic: https://lists.openembedded.org/mt/101334933/7159507
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


