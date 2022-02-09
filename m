Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DBDC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:44:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.26675.1644414271332150562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cGjPt48B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q7so4067304wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T0Y9OaaxXsb70rwQplvv8156d/BP9UV+bq2pdjCnzAw=;
        b=cGjPt48BView+E4TVTvYmADY4TnbWKpeUP5703M9XyteFfaJymGHWgSqmyj8wR6Lko
         aIHcBc1FjkLw9GAgrnXJz9Hu2ag0RqpfHCRPACWSQ7ses3uyU+WYBPqfG7q8aCilXACd
         rdFFKnu9x7zornBsOEyZWH/3MCKUMoq8ZAP9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T0Y9OaaxXsb70rwQplvv8156d/BP9UV+bq2pdjCnzAw=;
        b=Qqk+MZFZGNHZJJiqI8EWn0WtXaaUHCLK3VApNaCzc45L6V2dMD0qxUU2e9YZzizdS0
         1nyez29im1qe85+/DeoQqyVMhEbdjiEmWV40ofLwCS+rfGE1ly4M4fXwi1G/G0MbHxFG
         fdzOabrjjPx+CXpJ+kKaeS4LjZ1RixMAHqWem1Ef+jcjY24RaGYt7Fq3Z3W9jvNeM0IG
         tSaM+XyzkdF7R+fGHtNP4lLIS9cyRYRAxp7ggZBef2FYJl8ABsSQQVBVAq9Rg7bVukh1
         zo+YC+W7yPhc35nf4BfXIVHnfFTqWSb+4RSLNaTV0xfNmBWrAj1PmseNPwwvTk58RF3G
         vw6Q==
X-Gm-Message-State: AOAM533QCWrpqOpKQUmSUb2o6kpu4t9HL+9JHrgmJ3iO3L57WhPNLKXR
	CYrthZwKAmYkd0VvVrPKnfgts2KojiN8Ig==
X-Google-Smtp-Source: 
 ABdhPJxY4GOyiLHnyIXYqnp2V1rg3ob9rPOttsn13mbjET5AgkckmtvK5vhsP+XS/WPwWJxmnxy3EA==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr2198549wrp.80.1644414269860;
        Wed, 09 Feb 2022 05:44:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2250:1cae:83bc:d91f?
 ([2001:8b0:aba:5f3c:2250:1cae:83bc:d91f])
        by smtp.gmail.com with ESMTPSA id
 j6sm4405186wrt.70.2022.02.09.05.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 05:44:29 -0800 (PST)
Message-ID: 
 <0b8c7bdb2015d519d32cb79130fd8e1b3d65699b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] perl: Help resolving WNOHANG and _exit in
 Posix module
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 09 Feb 2022 13:44:28 +0000
In-Reply-To: <20220209051544.3280726-1-raj.khem@gmail.com>
References: <20220209051544.3280726-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161560

On Tue, 2022-02-08 at 21:15 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v4: Fix filepaths in release tarballs which are different than git repo
> 
>  ...01-ipc-force-POSIX-WNOHANG-resolving.patch | 52 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch

As I hinted at originally, this papers over a crack and doesn't solve the real
error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5042/steps/12/logs/stdio

What the real error is remains unclear too :(

Cheers,

Richard


