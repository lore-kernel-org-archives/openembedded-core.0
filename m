Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0C1CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:03:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.22133.1758218629305291577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 11:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egms2iJO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so231582966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758218627; x=1758823427; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4TV2o98uN02iAiGeV9hl6XjagMGh1yGnEYW0SAaFiQ=;
        b=egms2iJOikh3ZBA98TZJtCXvrNt9ymLad92BaedML7UEdeWh/vBQskz8/xurfSPMq9
         8loiQXSRRHkZZoAuHnOzQ9/g8uDI+mzxvXhlFdqCElwu9f9DQzRSIZF1pDvwXSpZ/6SS
         ojBWyUN+vZmajE6xQReYf2v2vP03iuPsHffQr3D+9F74PSwPrmra5/lRhxWLspC7mCG9
         cc2iC2xfY2zqSxiQi4cR/Lofg5PkCDmcFrYJ7PxPRxPXfzG6pqYqJZS4kKghNLBUx4gR
         Ww1TmbVeJZR5gzA9XPHJi+6D/nRr5TUBpGRQ0lSgK0SKOGUMxHPfWI8Wk1Ds7n663WpV
         t/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758218627; x=1758823427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4TV2o98uN02iAiGeV9hl6XjagMGh1yGnEYW0SAaFiQ=;
        b=cFwuVlNnO1cCXKGqatUhNNTQMjn/esjZByxN36jO2bZCvInp46+bMqCFFQbTjbGLYI
         86u8kfUJU0WTbRpb1N3T4gukVAGBHmo0Y9V63EHzADk65Uun9UwsUcPjCTwbUUQpjhvN
         pO6ivBZl5qiwWd/b2W8MBAayoUSUqOu3Mbp9qMEryxi22Nojg5Auij11l+9fQzjl0X4C
         aa0w8AWp8wp0F4OeOBG4WAqZWKB6gONWV71y9Z/47HP6e27lJR9Nn1ZOZi/cJOoJTFbm
         kv5uH2lZD63lXitNPyiWobO8D0+aSTsP/86UhOrD5QqUqvkWxP6FrVajC6beZ8aCnv2j
         YKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoS3crIRmN9RD0vb4Ae5TYKEy3UBtfMn/C18VZS/WZTZzWyPgnzomeId9qBQt5lopKBnfnlx1P02+JFMwb6JAdpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqhBY8qx9sKmU4ryUg1Y0JP+LpeVYq/bv8EJkoyJCnPEA+HHMR
	FYmk+UzrNmH1JD9JMyt18/KnRT2xYndB0G1gBhNO6bSyD0wW1Pws2xn6
X-Gm-Gg: ASbGncsD515DIu8qet66Ue7/jCu7H0SYQ3Ngpxrzvhrr3+S/JDb1vLHgZA9sbDgfw3j
	xUhDxnDnD0aGproFn03Sj79nGy9h/Msqyw5rD0yP2KLMy9w1XbasriEnLs6UZ/gfG9CeJWPjEXv
	VGlfG1xhMK6PvYDjouuWdXuw0ahNHPD7LznCSa+fqnzewEIJIFEA1wHIlpYTwPyojVqnK00J/ze
	AM1ny6G5Jjm0DNS31mB2jZeUt3ItJatNvCRoXhLpCRKoZB2YDh5xhh+N1IJbmTakKkKk96GRtPV
	ogb+trVFDXOP/nlUET2Whl/9hHRgWhk2Zr8EWCEeTOwztfm7OXPlQtv9uHE/RpOrwDcmtLEzqmW
	5mk8rsuJBc0L+EDeLy/YJVcDI+5HV43HvtcdZkV3nUPZu4Qa1uA==
X-Google-Smtp-Source: AGHT+IHFpLQFdlL4NkpJAm/YX6M/MWRa52NPs08SeN7YY7ld3TzbG1Im129nn9sKXAK2jF8kmffwiA==
X-Received: by 2002:a17:907:7288:b0:b04:6973:1ee9 with SMTP id a640c23a62f3a-b24eedc0766mr19299966b.16.1758218627306;
        Thu, 18 Sep 2025 11:03:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd1101cf4sm245113066b.86.2025.09.18.11.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:03:46 -0700 (PDT)
Message-ID: <38ea17ba-8e9f-49db-8ba4-8d337081d936@gmail.com>
Date: Thu, 18 Sep 2025 20:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [yocto] [PATCH] systemd: backport fix for handle
 USE_NLS from master
To: emailaddress.ashish@gmail.com, openembedded-core@lists.openembedded.org
References: <ea2af4ec-e7f9-45e2-b6b4-20aaa658c593@gmail.com>
 <9753.1758210874547409740@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <9753.1758210874547409740@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 18:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223654

On 9/18/25 17:54, Ashish Mishra via lists.openembedded.org wrote:
> Thanks for feedback @Gyorgy Sarvari 
>
> I have pushed the change
> https://lists.openembedded.org/g/openembedded-core/message/223646 
>  
> Sorry if i may ask :
> 1) As process since i have send the change , should i delete this thread 

You don't have to delete it, it will be just ignored in this case.

> 2) Whats the suggested way to do handle such correction (no change in
> patch nut just added missed branch  details ) 

If you notice it on your own, you can just send a reply to your own
initial patch noting that it was a mistake, and send the correct one
afterwards. It happens.

> 3) I will monitor scarthgap branch as suggested ,
>     is there any other way to know if the patch is accepted or some
> other modification is expected by maintainer 

If any modification is expected, you will get a response directly to the
patch. Steve Sakoman (the the maintainer of the stable branches) sends
out regularly patch reviews on this ML, that includes a list of patches
that he intends to accept. Look for that mail.

>  
> Just trying to create an mental process so do less mistake mistake     
> I will share two more patches once this goes through 
>  
> Thanks Again .
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223648): https://lists.openembedded.org/g/openembedded-core/message/223648
> Mute This Topic: https://lists.openembedded.org/mt/115310928/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


