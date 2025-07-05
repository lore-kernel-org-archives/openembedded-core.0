Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D6C8303C
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 10:01:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.14992.1751709704859568106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 03:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6mTIkWc;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so297808666b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751709703; x=1752314503; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPTRDJfW7oM6JQgp0ts7dMPm76ussNSi31BbINED0pE=;
        b=A6mTIkWc+zI8f3OVKS0XXDGSDjIpxtExrBG9xJUAXt3VsTxemCrIkyg395GMBL1Uvi
         VaIj+Oh2+oDClq6msSM7V+XAI3mt+cS+lOzDm6BYiHv0Ib7QsuGuWRqYxM2brl5SnD50
         SFdfpIkznVpBUxeEfOWF7/b3wHw+NMIXEAAO0OG++0vd4OmGybSWPSWJL8VxDTfG5cbe
         2NpIe6Yvn3L4hqQ4S8F6Kbj9/alWq5zU0hkiKhxe7jV1vkU9HuvFI//lQu974rpd4fe7
         gFSaqJcZglxvYoS8xwg9By2Gu/ZmDbM4X7TUJTnuPdncaBBrzlIq36C/SVh4yH6xqkbW
         niZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709703; x=1752314503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPTRDJfW7oM6JQgp0ts7dMPm76ussNSi31BbINED0pE=;
        b=fhnQY9AE3eLbiobTp2uiXroUsKlwGush+NJx1KmeSABpPWbCq5Au8/B7Ii1rWJSgyE
         WxFAB6dXVzgfVN90o0V9FYtC/ghVwKxgU5VtNZyVc4Bv8GBHFNq3Hx2ATib/rAZ/9J5h
         2DoOm+4gngly82FvQLrYncwwavQrpdu4b3S3fwjOhJBgtd60fvqNB6ZUKJesour5pD9E
         WFxQjOZCev6dwJv8B7BCRCgCTRdrst+UNVkQTLj+Rhsu3C25NzJDF+AWNVVPSPn9vE/J
         K41BqWICPrgpWTYPdB2AXfB5RNEiZyyEX6AMvz53TmBI4Kr3l2y5/VeeNI3M0hYXa8jP
         XmEg==
X-Forwarded-Encrypted: i=1; AJvYcCXXV5vzVcMcm0m1zxvFTtci1Cn86PtanLD1kBqP1BLSPozVz22IgSRjbznUAyW6Cuqs8t4aMntVmz/KXLkDHA0dVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOlanfoW8/3L9LZfz7cLpntB4LOmWLhpVLzrzlf8UVBEn2KTZz
	sT1H1Njkfxs6NryIDuLEAvuvAwfGCgy0CIFzVKdgv9UTcsNLiDYkZro5
X-Gm-Gg: ASbGncskSnpnYABwOOgcloerp0f2IvzmblOfwcS9U0Lc3SEeX3CeFK6Pcxagx2Z4GXz
	5AbenuU55eGDz/fBrRoCkox8VKIcG0kE2vEoPMtDnF0O6qZNiL9jr0d3Na5XPzCgBgYybgTEQyg
	2JxY2CL0zLipSnEJIpJwUqHGgl0ClPfJIb7owIGOTJ3me7ovNYuucgABTj7sj0iT6CLf7BotEfP
	WalaA4iJHRf8j4FkYdE4yzMVFb1ZaECwgUbX2GH08aYFQExHEbriWI6P+q7RfW5d5xN+vk7AUrc
	nYRZG2qdinGUA7sVe0ojxB+AZpfjwfFkANFbdKjD9W86FxPPHtq0m5wLoYQdEQPrw/LoKw==
X-Google-Smtp-Source: AGHT+IE4dHvSQG+42G2vQ5exCDnEFCPepbAOu/QX25KZ0SGCpjDUOSdHftrDvNce7aE1QcvP/Wshbg==
X-Received: by 2002:a17:906:4789:b0:ae3:6744:3677 with SMTP id a640c23a62f3a-ae4109d2a14mr170541566b.32.1751709702620;
        Sat, 05 Jul 2025 03:01:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5d2esm325068266b.108.2025.07.05.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 03:01:42 -0700 (PDT)
Message-ID: <bacc969b-dbe2-4256-92ff-4701a5853390@gmail.com>
Date: Sat, 5 Jul 2025 12:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 8/9] xwayland: fix CVE-2025-49178
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1751641924.git.steve@sakoman.com>
 <24cf72e0fac261e335016e0b490f1fc10992bbbf.1751641924.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <24cf72e0fac261e335016e0b490f1fc10992bbbf.1751641924.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 10:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219952

>  .../xwayland/xwayland/CVE-2025-49179.patch    | 69 +++++++++++++++++++
>
Minor typo-nitpick: off-by-one error in the subject. The subject says
CVE-2025-49178, but it fixes CVE-2025-49179. Wouldn't reject the patch
due to this though.

