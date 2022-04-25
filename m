Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF8C63697
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.27828.1650884574978003190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h6Bhx0K5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id e2so13997876wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7BSTV7zriIyIrDkzEkYasq8JEL5OIkuE4rb7ZmhP/fg=;
        b=h6Bhx0K5EHeV5rSIx3u4ks6hKdF2VAQQ+7Grzd0yASQxR6JqNWey5QBOg+l+Y5pOK/
         uLPZhGzn8j2kfqlX4gIWaVYHgjTtZb4ZTRvlA9OWhquxxoNYtB+NiWwDVWrZljK2dACp
         N2WGegiAs7iO+UjXrQYMeUltSdbSossKdEmHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7BSTV7zriIyIrDkzEkYasq8JEL5OIkuE4rb7ZmhP/fg=;
        b=F792c4Br4PP0yhayH006HzlnssXU+scvVai2gMApEim3r/Deu5Lm0zYb0RWHnoYtjx
         aQyyopH1aAu876eObIlDhF4kPGlhimjlEWzTxdEcrWM1b67in/RNR5Ox3JkycCZqDVCA
         Zb8vmNuFqMD5QyCxEnC4KT9zaar90J7fZoZ0tlm6RRnftl2IOZMn67ET5ChhN65rluGc
         dR8dQq8yIgPSgFfyJNOKPLV055cs3gV/TNWMJDu3VltS4cva3zKmeyT1d5yxEN/cxFM2
         BB4+WEhQI2yxMbPuXaKjr0CSXiUKq2AqtxRxESV/NBovS1vqkNrx7+udippb7p0rFp8s
         y4+A==
X-Gm-Message-State: AOAM532mA6UxPTQ0fp/Stv4t67C7wFYZ8Nv5cPwHQ/ZGCDyeoxOtu5IB
	OocU1JnDobjEXmd1NkujJarqzQ==
X-Google-Smtp-Source: 
 ABdhPJxzD5TflIjuqQn9Yn1/fDG6ZZZck+XrFFQH37rx2y6kpCdoqpvRpeU3mptl00uERm3EH6szKQ==
X-Received: by 2002:a05:6000:1e12:b0:209:6a0e:9f9f with SMTP id
 bj18-20020a0560001e1200b002096a0e9f9fmr13653566wrb.169.1650884572760;
        Mon, 25 Apr 2022 04:02:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa79:b435:615c:b6d3?
 ([2001:8b0:aba:5f3c:fa79:b435:615c:b6d3])
        by smtp.gmail.com with ESMTPSA id
 v28-20020adf8b5c000000b0020ad668407bsm4952291wra.115.2022.04.25.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:02:52 -0700 (PDT)
Message-ID: 
 <7582c60372b7878e80547481b2ff65e0be4a3e46.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bluez5: Add fix for startup issues under
 systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2022 12:02:48 +0100
In-Reply-To: <68c2ad8c-192c-d7d2-c1e4-f30ba994a1ff@weidmueller.com>
References: <20220414205205.2264840-1-richard.purdie@linuxfoundation.org>
	 <68c2ad8c-192c-d7d2-c1e4-f30ba994a1ff@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164817

On Mon, 2022-04-25 at 11:17 +0200, Stefan Herbrechtsmeier wrote:
> Hi Richard,
> 
> should I update your patch or only the Upstream-Status or will you 
> prefer to do it yourself?

Patches to update it very welcome!

Cheers,

Richard


