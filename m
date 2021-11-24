Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F16C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 09:40:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.4135.1637746822819544171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 01:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=guZytftf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i5so3067420wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 01:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xLj6yUqLS8Swx5BAvjOpTZMDvQe+oi5Cc9n8i9iEsE0=;
        b=guZytftfscDO/90Fnz0aiIX4NpWIt/wPc5rj5JeiCUhMvgtM6hMTgGijex7S2XjETS
         JBmJ41Kf0avdyG0+Rm165Muo6UpK6UGlbkskuV2Pk+Z7I4lhu0NrhG9jI4hPv+tfleUR
         C8QAS1WBYUvAOb+XZ12KT8DQKRRgMNXvpydVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xLj6yUqLS8Swx5BAvjOpTZMDvQe+oi5Cc9n8i9iEsE0=;
        b=Ev1MThiZ0wydgZ/eMZssQCKnLQKWA4eSGp8FICLXVFtKemQktgWcICRM5S03FE/wXT
         sPB5H7Uxq1AzBX7F93tT4zhJcrJ14X1wTre7XG7/zQNWxllHntjXEWncNjJhkw/kgLE3
         93ON8tRLgecDfVmA0trR/PsCTW+xe649yMd6I3au8dLf7GYuVus/8mhvPTFbX0+J1wEh
         HNJf/leKSXsavwizMOIG9I6NTlL/ZbfIvr1i6cc42XxdG/lwTVDhw2zhUr2rqSGeCln3
         dSb7aCYuJqpPk5MO0aa6KTXnzHUbUO8JQoGXgo7EHAJZEyBHRuDNuS8OQvMsNvuxkLbu
         CgAw==
X-Gm-Message-State: AOAM5329pDwyTQGYQdMZBVU1p8zKLOo1m5bwuWjhISeAvL493Nukf7+B
	qU5foCMLtJ1jCOxDc9b3z0jGxA==
X-Google-Smtp-Source: 
 ABdhPJxBObagNAWNQfUMMQOMCv/B/kPJCkWS53ifOi/z0hpSMvDqFmiRzJrclUmbbEnq5BrTSaflyg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr16957345wrd.362.1637746821217;
        Wed, 24 Nov 2021 01:40:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id
 p12sm17346452wrr.10.2021.11.24.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 01:40:20 -0800 (PST)
Message-ID: 
 <1771e4a17c093f41521f561c053b321cb001c275.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] insane.bbclass: do not hardcode oe-core path
 in upstream-status check
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 24 Nov 2021 09:40:18 +0000
In-Reply-To: <20211124092521.1077244-1-alex@linutronix.de>
References: <20211124092521.1077244-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 09:40:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158683

On Wed, 2021-11-24 at 10:25 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/insane.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..8a47da5a09 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1176,7 +1176,9 @@ python do_qa_patch() {
>         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
>  
>         # skip patches not in oe-core
> -       if '/meta/' not in fullpath:
> +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> +       match_oecore = oecore_re.search(fullpath)
> +       if not match_oecore:
>             continue
>  

Does this pass the sstate tests? I have a feeling it may encode a path into the
sstate checksums :/

Cheers,

Richard


