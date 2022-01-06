Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9606DC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 13:31:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8577.1641475885660215244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 05:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HSbnlyAd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id a5so831405wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5pf3+5lqGHYKBL7/aEkAqwQG/wXB7SrXkJON+o5ZlYE=;
        b=HSbnlyAdMW7tTvs1JKwh7wij7IQfUYbfA9BP5RMalgAQsmESB3pHhbuw0G669QOqHb
         Pfe4exOy7BZgUJB2ctD0cw5Aaow9VvhfMxNkFPcTA/GARrxCcd+afBjKElPlmF1qRUkR
         GuczH7mvfoaE/Wws6kNFPWrA5taRZKc6RpsYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5pf3+5lqGHYKBL7/aEkAqwQG/wXB7SrXkJON+o5ZlYE=;
        b=fCxI2e9Nsh72de5FndIaI8rkD4Xlk2euO6WSOjLaCBiUkfPgHG4YFtbxwBcnTpzHsl
         wMNnAFzQvhWNgH+amH0pLkyqRJCAaZOxZODLj8XwwHUkf2EATIbCqjHnAl6pn1ux0j/H
         TRku5sPahARmlJZ6IFCBu47f/mDL3ZTUzNGWpW9p1HXSGsEn+wc3lV0Ogm+vBvhhmUC1
         arRy4jKurThhVGYcSJbl7OlvhNrOkyio4u4/8GvVMmJqYv10H3iC4XrKc5hnNqauY1zS
         fw6CmCewEo5cUHq76SmrwXkT6tb71KhbUcsyU07LV4taH0Foxm3AvUhjvmBJic6sje2e
         tYCg==
X-Gm-Message-State: AOAM531Gs094ZjTv7Cgn9L+zjpXrO83S1tQeTNffnxihIe92PYrNYi2c
	LvS5pS5POML08knQq72kJD8whQ==
X-Google-Smtp-Source: 
 ABdhPJzzC8Lvr9UNKWilaZ+YxOVO3RcUGSNbGv09C5h5X3QGHqEoMZnQC8Xp41Ey6WU2xhOO2gbAaA==
X-Received: by 2002:a5d:430e:: with SMTP id h14mr28152320wrq.99.1641475883754;
        Thu, 06 Jan 2022 05:31:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3191:8101:b589:380f?
 ([2001:8b0:aba:5f3c:3191:8101:b589:380f])
        by smtp.gmail.com with ESMTPSA id
 u11sm6067137wmq.41.2022.01.06.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 05:31:23 -0800 (PST)
Message-ID: 
 <35e0b2db53eaf44c64d7505e5b70f983e928cc99.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] grub2: fix CVE-2021-3981
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Mittal, Anuj"
	 <anuj.mittal@intel.com>
Date: Thu, 06 Jan 2022 13:31:22 +0000
In-Reply-To: 
 <PH0PR11MB51750B7FDC8104AD362275C4E54C9@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <16C48A4E435FADD8.12001@lists.openembedded.org>
	 <PH0PR11MB51750B7FDC8104AD362275C4E54C9@PH0PR11MB5175.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 13:31:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160229

On Thu, 2022-01-06 at 02:38 +0000, Liu, Yongxin wrote:
> Hi Richard,
> 
> I saw this patch has been merged to master.
> 
> Could you help to merge this patch and 
> 
> commit 0f528608eb48809955b2610ecc4bd689f1cf8899
> Author: Alexander Kanavin <alex.kanavin@gmail.com>
> Date:   2021-06-15 10:12
> 
>     grub: upgrade 2.04+2.06~rc1 -> 2.06
>     
>     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> to branch hardknott also? Or do I need to send those patches again for hardknott?

Anuj (cc'd) is the hardknott maintainer who would handle this, not me. We
generally don't do version increments for stable releases unless there is a
strong pressing need to do so, particularly on a branch which is nearly out of
it's maintenance window.

Cheers,

Richard


