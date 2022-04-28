Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F0C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:30:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.9624.1651149049515488169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5yr3lef;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so2936947wmn.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hZMA+5eXe9bXoHhnB7L4o+3UhlnoXYfwJ0GmyniD9hw=;
        b=M5yr3lefHQm626zVvCAGi3zJ4C1k9FkEd7WDBN3F3J7LdnUMQ3OIUUW3jr7ANqNAAu
         +7mGdJq7lBhjojnMdiZOSbcRg4AZNfekICYVJ5Q2gz8tZ+YjLFI5Ml0pG2GkKl9esqmb
         RY36GtSwSojDAwDCpDI4CQlrkceHPsHmycacg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hZMA+5eXe9bXoHhnB7L4o+3UhlnoXYfwJ0GmyniD9hw=;
        b=o/2rUNVCNWwAu8ZiMsvUxGfjObT7t2lBJI9MUmNgds80vTV6Su/HVhesK5A6wkcykx
         40EhZUDFLWW2Wn7uVFQC/7ew/ms7oOzEiY/czr+7y09Dfv577q7MoHiIcxJDZDQn+jBo
         0xNKuqOKrdOHSKcWtrgOMRdR0vooMWnQ3/VZb4HlsmgrY2H76VOsLAg3WOgudkCKofEJ
         0maP54GYRosw8GNc5Ust7cNxfrH9Vm/FugU6lDRQAwUTx0Kn6wq2athUl5yS5KzvAy7h
         RvOwSsZgg/s+F9bJpxM1o9WwGOPjrJBqtkI2oMrgKtA309cu7cIHIGCXp1+huXKKZI3l
         TxLQ==
X-Gm-Message-State: AOAM533whQcm2kcZ6aoRYnXLhjAo1qR1iCmQ0hhLmnvAp8VhbG8kML8d
	3riyL8y/crENnU4oWxLZFXk0JQ==
X-Google-Smtp-Source: 
 ABdhPJxvueBmsDqtGHZzK4Qo6FwUY0YMVIs0IerIN7I91dO6qWsFcGbk5W2YxOinmImW46Vnw9yhzA==
X-Received: by 2002:a05:600c:1d0f:b0:393:f0f1:ab7f with SMTP id
 l15-20020a05600c1d0f00b00393f0f1ab7fmr14503516wms.89.1651149047741;
        Thu, 28 Apr 2022 05:30:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66?
 ([2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66])
        by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b00392a3e6280bsm4006046wmr.8.2022.04.28.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 05:30:47 -0700 (PDT)
Message-ID: 
 <37753e878c988098cc777b5ddeb178267a1ec9b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] sstate: add a LockedSet class to be used
 on the mirror thread pool
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2022 13:30:44 +0100
In-Reply-To: <20220419094616.433632-1-quaresma.jose@gmail.com>
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 12:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164944

On Tue, 2022-04-19 at 10:46 +0100, Jose Quaresma wrote:
> The python set() is not thread safe and we use it on the ThreadedPool.
> With this LockedSet python class we can call the 'add' and 'remove'
> safely inside the ThreadedPool.
> 
> This piece of code is taken from the stackoverflow
> https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> 
> May be related with [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>

For info, https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5083
was a failure with master-next which included the changes in this discussion. It
doesn't seem to address that issue :(

Cheers,

Richard


