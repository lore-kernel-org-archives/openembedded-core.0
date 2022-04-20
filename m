Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05AFC636F5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.13204.1650488448752768753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=evCL/H6Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u3so3922898wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yqgs1xbtJT1FlCSYBMN01Pb7osUValrohVz+BKBbIHI=;
        b=evCL/H6YvZBJNiAygwgHI5PxE3KxWiFmG0II60WLL6lLZcTKO4tbVOid9xuVAKiPMD
         HFBWLCDyQWBCvb2ObXMuq+adA9qTvEh96384ZOdeCKTjoJ9hBsdA1kqh5nTqRYFi1vF+
         tl92+X63eSDChvV43aZbju+uveAAR3yBwwW5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yqgs1xbtJT1FlCSYBMN01Pb7osUValrohVz+BKBbIHI=;
        b=rVH/B+T7jrWq7Qzao0urI/D+G/G1meaBbSyYdu589A3yAHLH7Ca0hOw4OzjU4ZZrCe
         N0zBMxRDcUzzO9C0j93lnXJCDwjSRdSyKzGLceh5KWYZL8FKhKrXY17E5KFmXFlragrT
         aww1Eaq85bikyuhZKM9UMYk+4p+pqHgvuPQM0t2QnpYqy/arlas8snvY9dZeNQDDYVbQ
         eTlotu0H4c5cgNVME8uVPs4H9LbnAIAP1DVFmdZD05gqEYy5P375TgRT/IUEk9WM1DDq
         AiC1UQmgj+OxEDUCGeFCEcalM20Cgq7ra6/czHqh1DvKohQco8eRJRwgEECN5qHqKxgc
         lj8w==
X-Gm-Message-State: AOAM532RYc0PQK5TVFB/F64ISVQYIgKSEey+okgIeoiZsC0TgA35eMbK
	X1rx8hueOCnl71LPu1NyptKoCQ==
X-Google-Smtp-Source: 
 ABdhPJzDRfd03GiLc/erBSensYewBTGBMIyOOqVNSzXrIVYvX30u9lHGinOEigNwBatAg+1Hy8/Phw==
X-Received: by 2002:a05:6000:1009:b0:207:a8fc:cf78 with SMTP id
 a9-20020a056000100900b00207a8fccf78mr16701239wrx.484.1650488447213;
        Wed, 20 Apr 2022 14:00:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be2e:566:8fa4:996b?
 ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a056000178900b0020a9f995a3csm713497wrg.24.2022.04.20.14.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:00:46 -0700 (PDT)
Message-ID: 
 <c309ea4f1d7e0b777fdc789ad2ccef5b35f80ffa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/17] connman-conf: ignore eth0 in qemu in a
 way that is not sysvinit-specific
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 20 Apr 2022 22:00:42 +0100
In-Reply-To: 
 <CAOSpxdYwkknc5MT69Ze1=uN48YFbzf3U8kTGpBCvk1k-G50Ujw@mail.gmail.com>
References: <20220407170029.3500874-1-alex@linutronix.de>
	 <CAOSpxdYwkknc5MT69Ze1=uN48YFbzf3U8kTGpBCvk1k-G50Ujw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164726

On Wed, 2022-04-20 at 10:05 -1000, Steve Sakoman wrote:
> I still occasionally get the ping error on dunfell autobuilder runs,
> so I suspect it needs something similar to this patch.
> 
> I'm not conman literate, so if someone who is can create a patch for
> dunfell I would be most appreciative!  The recipe differences between
> master and dunfell are great enough that I don't trust myself :-)

Also note that this did require meta-agl to make changes to their layer to adapt
to what core did...

Cheers,

Richard


