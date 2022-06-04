Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D68EC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 12:36:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.9532.1654346173228639588
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 05:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c77UxKuG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id a10so2754557wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=LaZ0YhkMbnhxajAWHErQW7vaErwtaXKDlmdcXaaiqIs=;
        b=c77UxKuGa0h0bXWOStb31GalCbNPufv8A+jSSEt6v5x/iJmjX2ZvEEthJmit+1li23
         5H8r8+RNJeylkx2tUvA0SSADC4l5LzDaOkU7f0Fppo6w9MY3SwRH2nuesIrHmcCESrgX
         BibirCZdNJn9jpJmxuw6+ibYHf6jSadO3BNjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=LaZ0YhkMbnhxajAWHErQW7vaErwtaXKDlmdcXaaiqIs=;
        b=Xg9TcDTMCoGd1pFeUbz7hQmDQQTQFb+PgIK7IbHRtAyQh195c7ZRL6HaTVBmXrEGWF
         GNudeK3tOsoq2Qy8Pdlpt11VlNQuU9+oKyvDjweCklg3zQBwku06q5PIlyqS+f5GcuuE
         NQVk7xMpK9qBe6NiNzbgp6gtPon8yziMulOQ0bwknVo0TPPC3+1Db6Sf6M6YpH6rz+pw
         jeHhTaAQQ3V2OqylTcZh4j19RjkDHpobyYW4iWbTdqfCi+gpj9b9U1moAnYPqoHm73kP
         yqrh5WOKVRFT3HOOCDYWU0BY6b0EhLL3T458zdyH2andGlCOtdU99yJj2LdhwWh24NCK
         Mp5w==
X-Gm-Message-State: AOAM531pGsrghr+WNiZzahyqwDUrmREySDbPtd5LaheepOiyMQIFfWDV
	LLPYqOcrl/qYw24OiUvquw8PvA==
X-Google-Smtp-Source: 
 ABdhPJxOHtqG0W1D5gadcDFfc5b3JXqg1/BhxClUk1koxF2wwJ8qw4w10gl1sudI7HCuJXEVHrCJVA==
X-Received: by 2002:a05:600c:4f56:b0:39a:137e:e105 with SMTP id
 m22-20020a05600c4f5600b0039a137ee105mr32481427wmq.80.1654346171509;
        Sat, 04 Jun 2022 05:36:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118?
 ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0039c3055a63dsm9291215wmq.36.2022.06.04.05.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 05:36:10 -0700 (PDT)
Message-ID: 
 <c56e6afa028d5a73bc35e04cfe07b2f30c8e57d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] perl makefile race - any make experts who can help?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>, swat <swat@lists.yoctoproject.org>
Date: Sat, 04 Jun 2022 13:36:10 +0100
In-Reply-To: 
 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
References: 
	<8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
	 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 12:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166566

On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
> Here's something I didn't think of before. Has this occurred anywhere
> else except Ubuntu 18.04?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096

I'm struggling to get the data out from the old builds, one mentions
ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.

It is possible this is an ubuntu specific make issue or a make bug.

Cheers,

Richard



