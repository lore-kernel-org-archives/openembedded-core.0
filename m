Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B01C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:07:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4002.1642111642694063428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AaTnUfPI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso6252170wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yVWHZTtYc0IyqPt8iG9kXKa7RiCZepJ5546DfPVgTQo=;
        b=AaTnUfPIzUascF9EX9vCly0IOpmXXVavkJUMBkxaK+rt6vvy0eATXk7QP4wWyCtm5r
         czj2rMwuQd852LoF+wCxFdtr1TsPlCvWO5N/+BwScxk/6i274ki0p2WlfsaIThR/HaDM
         RiqeFy4h9JmCvlsyZKF3y7zkjJLUE/XcQjmig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yVWHZTtYc0IyqPt8iG9kXKa7RiCZepJ5546DfPVgTQo=;
        b=VpXaTPE21KeksKnLl7wCoofC45zoZpRgcnRjr4824bGIlM2O8UwjzRvhPuE9E3vZRK
         Ko1pzgx4W9cVykLddqeGlmeW0w26cE5vtg1yQ8RB2Jsn+WewXM3LMKUmIQv4pxvsG/PK
         qQmUMqj4Dg3X+3iXXOW1VAtBZLlnuob3YSAxkG7i0zrt9GFJB4wQge7KCJKiKLAvp48U
         5T39KgYj7dlxRgACiMRGx19Eil2jJ094T0C1GMcuoO6sMLNaDxjI26fGN4YLAuT/7lvT
         5+Z0uMLFW5yCkRil+YWUOMKnv2H2DwQvTsN8iSg5BRIcG7UMZTHzV2bCz+YgePFOUaPf
         z7ZA==
X-Gm-Message-State: AOAM531XI0I2cKT5MgyZABp/V2jY28Fa8rVeOf1tAMSDwIPNrDiSVCiq
	xNrXVfJFmlzP/18eL9sTPXsD1A==
X-Google-Smtp-Source: 
 ABdhPJz5ViQ6c8GGW4r3XdI8iBN0YMYx1GHZWNmeorrQkiltU8hXnSzWRYjLiPNR40j9xhIZ2+71Vg==
X-Received: by 2002:a7b:c7cd:: with SMTP id
 z13mr12943143wmk.166.1642111641132;
        Thu, 13 Jan 2022 14:07:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 h5sm3626480wrq.44.2022.01.13.14.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 14:07:20 -0800 (PST)
Message-ID: 
 <dc7564efda700a003c380edf6e769530cce15075.camel@linuxfoundation.org>
Subject: Re: [OE-core] Zero umask when unpacking sstate packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jan 2022 22:07:20 +0000
In-Reply-To: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
References: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160535

On Thu, 2022-01-13 at 16:44 +0100, Jacob Kroon wrote:
> Hi,
> 
> I often see this diff churn in my buildistory for shadow-native (and
> similar issues with icedtea7-native from meta-java):
> 
> -drwxr-xr-x -          -                  40 ./var/spool/mail
> +drwxrwxr-x -          -                  40 ./var/spool/mail
> 
> One can reproduce it with:
> 
> # bitbake -c cleansstate shadow-native && \
>   bitbake shadow-native && \
>   bitbake -c clean shadow-native && \
>   bitbake shadow-native
> 
> I see that the sstate package contains the correct permissions for
> 'mail', 775. So it would seem to me that it is the unpacking from sstate
> that strips the group write permission.
> 
> Testing with the attached patch and the problem goes away.
> 
> Is something like this the correct solution ?

Is this with master?

I'm wondering if your code has:

https://git.yoctoproject.org/poky/commit/?id=c4ecf7c1122380cdbc74fe692aa91756dc5bdf6b

applied?

Cheers,

Richard


