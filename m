Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B49C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:40:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8887.1642408811386464969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a7LgXFvK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so20914361wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gURlD78gGnnkgdIx1RcjEFDUpjSpcDyqAQF4yeo86xo=;
        b=a7LgXFvKXduAbzAzPZFaV2Y483BnOlO+6+3CysCZBu0bCbXedadeHxKiQi4JjYmAUD
         epxfD6ntN4qhSFLjFpcD3bGKw0oiPevMVdwj6J3hsxl46dd5gyb5+q+5Ip98HAtPMQl7
         mQMULmIYitxpVLUy9rEdFR0IBZKX6YXF7go2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gURlD78gGnnkgdIx1RcjEFDUpjSpcDyqAQF4yeo86xo=;
        b=D96sO63QF5D2dlspfWSptIK0vvugG9sDYATF8ETzDdAbJIxoiYyCZxtfy3b7K6gl2l
         /ZYLnJWjFUDFCzERZCoYRRkkw+YjgbcqT8ruz0hlfS5UL0xBSd5XmV6Jms8kFBgcjXp4
         dJsdU4TCyYCoB1j3YEfJIxlU7yIwWv92BA4izNQrG014ff77+NlcYroKjchDFwsMgE39
         fWxX5+vqjx0j56rI1/LcCXSAcid14rk6jm2EG39yDvu03iZW1C52TpIAUq2OH7Z7EeyG
         k3aBdb5LScpi6Ck16lmf/ldtlSHlQz/Z3vIHgnDiSpcGULBorcclAaXhympbteZ1Ae5R
         Ku5Q==
X-Gm-Message-State: AOAM532Ienr7Lotf2O7n5LYbt8eWvl422FglcUkwpfiuF0/dX7IVrp6F
	0bBNvfoUui0Lv9QBtDHI5zEhlw==
X-Google-Smtp-Source: 
 ABdhPJzFUr6tCtRvTa/nZAODaJL1begpY4E7B5MJaXPtE1x5T0VF6XCTGBaeqIk5EFFYnwU+Cus2lg==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr18704424wrq.287.1642408809527;
        Mon, 17 Jan 2022 00:40:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36?
 ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 g13sm3685472wmq.22.2022.01.17.00.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 00:40:09 -0800 (PST)
Message-ID: 
 <8165e9492bf778187f6cb6941e5d9f7a87d6fccc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Preserve permissions when extracting
 tar archive
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Jan 2022 08:40:05 +0000
In-Reply-To: <28618.1642404491183454308@lists.openembedded.org>
References: <20220114074138.51861-1-jacob.kroon@gmail.com>
	 <28618.1642404491183454308@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 08:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160635

On Sun, 2022-01-16 at 23:28 -0800, Jacob Kroon wrote:
> Although this is now fixed in master, I was wondering why this doesn't seem to
> be a problem in dunfell.
> In dunfell, sstate packages are unpacked with "tar -xvzf", no -p flag, but
> still
> my buildhistory doesn't show any noise when doing:
> 
> bitbake -c cleansstate shadow-native && bitbake shadow-native && bitbake -c
> clean shadow-native && bitbake shadow-native
> 
> After dunfell was the switch to tar+zstd, but I don't understand why that
> would
> change the extracted permissions.
> 
> If anyone has got a clue, i'd be interested to know why.

I think dunfell doesn't have the umask changes I linked to earlier in the
discussion? That means it will behave differently but there are probably other
permissions issues e.g. a host with your current umask compared to a host with a
different one, particularly around the group bits.

Cheers,

Richard


