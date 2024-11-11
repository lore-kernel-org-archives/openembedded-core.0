Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5598ED3ABE0
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:21:21 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.66450.1731349276790994726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0sqW+mwK;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cc250bbc9eso35900116d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731349276; x=1731954076; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hbkqQ0zhU5R0nW7gYj/pcLq+UJgPLC/1w67z0Ws+ro=;
        b=0sqW+mwKvG4MvN1hb1v0iVUKPMwOA2DMold/hmg0btQmGT0CPWC0jeCUbLg6o/ZjT3
         s3SIZMzkPCbsIxH5wVQN4Hj5pfZFvLXvjhw5k3TMdT9s0ZFOHyigdsWI/tdEBnfPI5M7
         tRJxw9yC/c7msZMIEIT7/E2JoU0AGWJztlCKifhbuLg7OEaqg6T96vgYhPFdDXizygw3
         ifrAI/86IvP0zZHTpaLZ7d85ZA3bfxho6r95izyDT7/+Yby+vrcIOOnCK4hDMbbuDOb+
         +lnUaM1zIBKgSr7tRmiiiu6sY2FRK9ZEM6+hKMYfUK6FbESJu6j26Sao+W+YWw8ay5GQ
         98NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349276; x=1731954076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hbkqQ0zhU5R0nW7gYj/pcLq+UJgPLC/1w67z0Ws+ro=;
        b=AAh2lyo9kqAsvGy0coQklXymXxRIO8s3s7v4EGDuJ76TZdQMgSUOhsxwH914t90LjT
         4lfwv6h5d2YanZ0Ghb8X4tdMd2ckckNr1VE/5c4qfoWEp6mPYHpDTE1vwLFzak05xr+r
         BlXrgU++wFuuJgG36lTkvAL1rFSL9Rw0OS58xLT5QKgmQHftyBRK7AJU5SAoocrIo3hk
         rMPfVQGukX3F9E+6xwNuARLP57REkmDnC3GEABRXLmURtex52ABCrX+/hGjZoZ9LCC3a
         8mIoa46PLV3sh/6TCqZYsjN0/GwRuszTG2HM/m9cp6jEHPdTt+HVpvemPI8MKs6VE8EQ
         Gdvg==
X-Forwarded-Encrypted: i=1; AJvYcCUIEXZuhjyB5bu+wU89Neya/u90qlOTdFW+CU+pRYFkfDBP+etYeTp1RmED4OV+7RwtZzXy07X18dEXpJVJo/ZbRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzq5CElKolzgpCx96WSml2NIZmIXePbu994LEpXwaVqzrmnQ+Ms
	IoZCff0LOCubhl4FZgJFrawl9RHCggkiMeszFl/Lb2xBCtpZAFf/cSwmd6MtbqY=
X-Google-Smtp-Source: AGHT+IEGqPW8COevP5r7FOMsb99GfxThtkykJTNHnfipxw/Fo5JbMtl6zmhjwLl1mjkANQxvI29aNA==
X-Received: by 2002:a05:6214:3c8c:b0:6cd:5ff4:cb1f with SMTP id 6a1803df08f44-6d39e167075mr157797096d6.3.1731349275799;
        Mon, 11 Nov 2024 10:21:15 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396208436sm62169536d6.56.2024.11.11.10.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 10:21:15 -0800 (PST)
Message-ID: <d221ba2b-95c7-466a-863b-2db97a857b27@baylibre.com>
Date: Mon, 11 Nov 2024 13:21:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ola x Nilsson <Ola.x.Nilsson@axis.com>
References: <DB5PR02MB102134FA3962BC6E299ED305BEF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DB5PR02MB102134FA3962BC6E299ED305BEF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206976


On 2024-11-11 04:56, Peter Kjellerstedt wrote:
> Is there some problem with Patchtest? It seems it has not reported
> on anything for almost three weeks. I would, e.g., have expected it
> to report on Ola's patch series from an hour ago as the patches are
> lacking the Signed-off-by trailer.

It's been down for a bit, yeah. I'm actively getting it set back up and 
should hopefully be running again this afternoon...

Sorry about that.

>
> //Peter
>

