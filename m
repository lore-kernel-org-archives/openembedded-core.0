Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55494C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 12:17:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.6220.1644063464363251036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Feb 2022 04:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AmBNOAED;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso5387651wms.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Feb 2022 04:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5fyaR3avlt3cHOfW+1gJT9WH7ZXdLQJ7//D8a2hZ8Mo=;
        b=AmBNOAEDGeS4SNk+vGdaecPOjopmKCZ+iH7UfPgAd9G/CL6v/ViBkyoFbFLNi8PR0P
         0fsfka+4BwX4nJ8xCVrr9ZUD1f8RNDm0W+nTegej4j7+V454U68NgFJmL7osYP2mXEpE
         CQd9/FsgXorbGk7ob18nDN5W8Ctm7vI16SltE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5fyaR3avlt3cHOfW+1gJT9WH7ZXdLQJ7//D8a2hZ8Mo=;
        b=0+fYpcvXrg9OnMCXeyZvMWGg15RvcdN3rvJZv6Tx53dAhVdkMcXVpFiMjF7rIUgunO
         USU0b86z719vb013RBTAIoL+LoXVU8519+GP93qMwWV8bl8WngC/rnX4AcdbPNMsL8bf
         1l8wIdJ24zFo6Q491eRBtSVdlPNMcjMnjB90NEcDbb2bU+IZuFXR0xpRST1X+WYEufoK
         qafeJzA/eNrp84opX6MR/XlTTbyN9Raup1bRH5yz2TF3daq67ZRBZqoJMARsY3acaVcY
         ekcMh89vsR2Q9+OoqMSahVSXk03i8pr/lpQdkl/wtiOxEWW8dO/vFDD2aVKYdxG05mqI
         VOOA==
X-Gm-Message-State: AOAM530W7eodept79B1SbYp4pbczgJvA0i1xiPEofoYoN8hhWRt1MHRQ
	7t2t1kbhC+C/9BG2YP6EqcqkEg==
X-Google-Smtp-Source: 
 ABdhPJwqxLzCl0IwOvXHFlTMmpqJW+/uvIMS48q73aU6YfmYmi6XCaDj+k97Tvgsk9j471kAEE7DSw==
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr2896824wmj.184.1644063462554;
        Sat, 05 Feb 2022 04:17:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ec6:d613:20af:b6d5?
 ([2001:8b0:aba:5f3c:5ec6:d613:20af:b6d5])
        by smtp.gmail.com with ESMTPSA id
 5sm4972762wrb.113.2022.02.05.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 04:17:42 -0800 (PST)
Message-ID: 
 <9b70621a03c6ad8f1756a696f4dc6ce1bee17e4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] systemd_create_users broken even more
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chuck Wolber <chuckwolber@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Feb 2022 12:17:39 +0000
In-Reply-To: 
 <CAB=6tBST=oiTOZt7gs=am_F72+NyQoazKsaksPEYPp8m5f414Q@mail.gmail.com>
References: 
	<CAB=6tBST=oiTOZt7gs=am_F72+NyQoazKsaksPEYPp8m5f414Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Feb 2022 12:17:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161388

On Fri, 2022-02-04 at 18:53 -0800, Chuck Wolber wrote:
> 
> When relying on useradd-staticids, this commit [1] made the problems that this
> [2] bug causes, much worse. Prior to that commit we could predict with
> surprising accuracy what the UID and GID would be for the very small number of
> systemd-* accounts that were created (or simply patch the expected UID/GID
> values in, but that never became necessary). After that commit, a bunch of
> system accounts and groups get created with the wrong UID and/or GID.
> 
> I suppose this is an opportunity to implement BZ9789. But since this issue is
> so old it either means it was forgotten, or it is really hard in some non-
> obvious way. Is there any insight available into which it is?

I don't think staticids are used that heavily and maybe not with systemd so I
suspect that it is just that nobody has spotted this issue. It doesn't sound too
hard to fix.

We're at a weird point with the project where many things were solved in the
past but the people and processes who solved those issues aren't there anymore.
We continue to make great progress in many areas but some issues are slipping
through the cracks. We do have new policies in place about tests and so on but
given the diverse uses of the project, there is only so much which can be
practically done with our current resourcing (from the community, membership and
otherwise).

> The solution seems pretty straight forward, so that pretty much guarantees I
> am missing something important. In the systemd_create_users function inherit
> extrausers, set the appropriate variables, call set_user_group directly, and
> then remove set_user_group from ROOTFS_POSTPROCESS_COMMAND.
> 
> So where did I go wrong there?
> 
> Also, does it make sense to return from systemd_create_users early if read-
> only-rootfs is *NOT* in IMAGE_FEATURES?

I'd imagine we'd prefer to do this "pre-processing" at build time if we can and
save it happening on every target device even if read-write.

Cheers,

Richard



