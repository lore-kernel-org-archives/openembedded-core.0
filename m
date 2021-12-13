Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2041C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 22:55:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.18865.1639436144114762664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GxII+Def;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id u17so29574764wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PO3HRzeYj4iwQWYhBQyjDJLVEJejdVS85W+ei2Wiz0g=;
        b=GxII+Defo4n211MhpgR1IMsd5fkAzUw1b1o/y7A9lQxemT7QW0fbN9h3msRWxmGStd
         OMBZeDkOZ2g/fAe8qap1jcg1qLoI9SHmk06xS0LvIwCdVRs0A76/eqF6qrhTbbXKave+
         Z7oi0GlL4eqOWX3fX0ol/YlH0BdUUG9tYNMJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PO3HRzeYj4iwQWYhBQyjDJLVEJejdVS85W+ei2Wiz0g=;
        b=DWV3g4IpNckVxyz/Tp3DUxBfn+HssLL3ogIRh84kZRQmRJmmIlu5yz20mc0DN6jhOh
         awLxogzvmhRH9h158geZg8eQf9KjQxENizwZVZCMqA3idcRnyBIEGnYM/03mrouczqYw
         tp/r2d/8aXezLkGYAun/kHFNSLVwcU2/ciLGWlfjKaRxjvle+mbUeMf1nTj8+eGTpS7V
         nAtmrzyYLqHidJuRwf8hdXLeFBr6YgYZPSO1/RVwR7X7F3H41LKw2eXMUfFm3sKtSGYF
         s5+qe30FnFhXKVJEhP0AVQ6dk7uh4t8Jh2He18Cd3kHIYJa/k3M5Jx684QhhsnRjnhR0
         IkYw==
X-Gm-Message-State: AOAM5322QiBgGaD7cR6YFML9rYFHFETEtV2XSx2psQrAWzfg1r4NA1Zr
	08f2m9iLxhDo4N+j7xxi50iIhQ==
X-Google-Smtp-Source: 
 ABdhPJyER8hf/R3ixlj6mx98c+SDUXHHTgwxGU/gfcx/agH66Ivo+r+4XROh7v5EPgPDEUFwTvYP3g==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr1656694wrx.70.1639436142217;
        Mon, 13 Dec 2021 14:55:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62?
 ([2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62])
        by smtp.gmail.com with ESMTPSA id
 q14sm9486942wrz.109.2021.12.13.14.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 14:55:41 -0800 (PST)
Message-ID: 
 <4d8cda3a2b2db6292f39e4705d0518b1887349dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] Implement functionality to exclude dirs
 from rootfs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Dec 2021 22:55:40 +0000
In-Reply-To: <20211213211416.46449-1-peter@berginkonsult.se>
References: <20211213211416.46449-1-peter@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 22:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159661

On Mon, 2021-12-13 at 22:14 +0100, Peter Bergin wrote:
> With this patch trying to wake alive an old patch that never
> found its way in to oe-core last time [1]. The added function is to
> configure directories that shall be excluded when creating an image.
> 
> One use case is that some directories are located in a separate partition
> in the memory and mounted during boot sequence. For example configuration
> that shall be kept during upgrade of rootfs. Then files in those directories
> can be excluded from image and handled separate.
> 
> Is this functionality something that can be added to oe-core?
> If not, are there already a method to get this with current functionality.
> 
> [1] https://patchwork.openembedded.org/patch/147567/

The trouble is if we start taking patches like this, we're going to end up in a
mess as the interface here isn't great.

It is unclear from setting IMAGE_ROOTFS_EXCLUDE_PATH which image types this
would apply to. Doing this by a task specific flag is horrible, no other image
control does this. It is also unclear how you handle the situation if you have
two different tree locations you want to filter instead of one (possibly in
different image types) so this method simply doesn't scale.

When you get to this level of image complexity, you usually end up with using a
tool like wic. You also have the option of passing in extra parameters to
specific image creation types like tar to filter paths.

I'm not against adding something but we need a better interface for something to
be accepted in core. I don't know what that looks like but this isn't there in
my view.

Cheers,

Richard




