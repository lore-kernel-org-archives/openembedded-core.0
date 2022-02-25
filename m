Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F48C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 21:19:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.2723.1645823973115716335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 13:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YHNRxopx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j17so6357628wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 13:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JHb2A6LpIrPRr6OD+/9S6lMX2WWSLsGd7Ok/wleMLok=;
        b=YHNRxopxXDTy+Tg655MMrDj+UrwtZcrwWKSLI96rsGs5F9GpGvmTyLzozAddG4XodZ
         DtXmpRjygJix9KqeiWLQOifxk3MFIbFaOKdb82vscL3OXdxlsIqgAVsr9KXhJra4YpMU
         pq/oeMUeP04omQaFsPgmpggE1aIptCkx7eK34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JHb2A6LpIrPRr6OD+/9S6lMX2WWSLsGd7Ok/wleMLok=;
        b=V/UFzM0fRrWGKMzcSkb0682+ezCAOwsBGZcpjIcw5DzP2iKSGJLdQS4j03luDJTwUH
         N4WG/s7L8BUYwki/ebeFO302MdWo+vutWcfNsbZXr79aSlQAlD4kJoXZpFwYCHdp/0SA
         hrMzVD17zFR0lAR5tzTiLNELe2qMYcjSnEcGOrWlA93fduT6Cb5FvicVNPTsGbd6zzNo
         GmidwWbBDPO7JuAnCHxt3lLHZ9/FdvScpvRI9z88qOYM4nJm3JxlrnXJRGUHWacgUjOH
         efawfmtHjgS0E79WpAEB1QHpoZmrda8rixdTaDZNC5aeEX/bQM10wEQicI+thFdvahcA
         mBTg==
X-Gm-Message-State: AOAM533VEnXqKkwab/JddTR5quWtr90JQnKX+zYr/oBKx7vM0qo6Mj9f
	vSJqlSvcYVqUqd9APcbwa1phkw==
X-Google-Smtp-Source: 
 ABdhPJz5Yl3Q7jGlIjMWx+gITMz2ivcN8Wtcw7qQK9CX0nZWpIizDh6l1NYPw0nUtzIOUm+AkVZPVg==
X-Received: by 2002:adf:db82:0:b0:1ed:bf4b:e327 with SMTP id
 u2-20020adfdb82000000b001edbf4be327mr7433017wri.527.1645823971522;
        Fri, 25 Feb 2022 13:19:31 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id
 b15-20020adfc74f000000b001e888b871a0sm3367968wrh.87.2022.02.25.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 13:19:30 -0800 (PST)
Message-ID: 
 <63129c4bef7fbd014cf7563d5cd056ffb757c378.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] OELAYOUT_ABI: bump, avoid tmp/ breakage
 by removing old cross manifests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 25 Feb 2022 21:19:29 +0000
In-Reply-To: <20220225195251.2433615-2-alex@linutronix.de>
References: <20220225195251.2433615-1-alex@linutronix.de>
	 <20220225195251.2433615-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 21:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162411

On Fri, 2022-02-25 at 20:52 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/sanity.bbclass | 22 +++++++++++++++++++++-
>  meta/conf/abi_version.conf  |  2 +-
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 773902e619..9dd829512a 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -559,6 +559,23 @@ def sanity_check_conffiles(d):
>                  bb.fatal(str(e))
>              d.setVar("BB_INVALIDCONF", True)
>  
> +def drop_v14_cross_builds(d):
> +    i = d.expand("${SSTATE_MANIFESTS}/index-${BUILD_ARCH}_${TARGET_ARCH}")

This is nearly there but there is one further small tweak needed.

This will convert the current TARGET_ARCH but we probably need to glob the other
possible options in case there are other things in the TMPDIR. I'm a bit worried
that might match some other things (such as crosssdk) however if it removes too
much, it would restore it from sstate so it might not matter.

Cheers,

Richard




