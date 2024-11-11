Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1593D3ABF5
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 19:52:11 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.68874.1731354723531185172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 11:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SFppyTgQ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b1539faa0bso316648485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731354722; x=1731959522; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/Y/BqO4Apq7LG9irL2hCE7bUEh14uSaXgll9t10nqg=;
        b=SFppyTgQohoR4FAEA3YDKPntuprlzg3+BiwD6qcVRHrVJ7ETG9AAb/l7QKE3ZyslLh
         OT9dCf1M2msj48+kLnPWPn+ZzRKj3twRNN6wVAn9mes0DIP5+KZePvkIilrHYQqJx9Q4
         vgj8er7YEK5X90scB2KjvbsoIcUKfijIt+h/Hbf7/XOkPWtjExHnk/O++JMLdql6eb3m
         rF0lkfMCGMEfSIgnig5LlzoIRdmO7t5WD4r7VPejM1BKUcGU79OIU3XLHgDeC6iFaJKs
         BzMHHWLLhfYmZigDjsu/HyuF8RT3qoV1wQjFAs2q8S2RUCQxsA8PxCvhF6bRdzX7lLej
         Z+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731354722; x=1731959522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/Y/BqO4Apq7LG9irL2hCE7bUEh14uSaXgll9t10nqg=;
        b=mF5Z5RXSnDmi+Ju0J190BABs3npG5Z33BBRtPfyGzMfyCAsE8ElhUSi7uAP2cJq2Gm
         ZMJ2yFT/sfTWmrJe6vzf472ZxeXub5vIQo0go3R5HWThq2wS8ZaUCgQqfuVQqbz4diCM
         B8bVshTY7Au/F68yXGzl1gZV6XXK8141Z3yXIupbDmvZ1pFjaJrG2iC3dV3dn4T39yU3
         PrGWrGbgQgWe1j7OyLTAQZ89DTcWDhdwreQfOxGgywcV631S/SChGKfBYnnZt2xX6Tdd
         40QkBsr6j27FyZQhCSkAygNlGf5MadUTkcfjAFUGtitr73pZiVYwKmwwJM+ZhVjJ7oDH
         y0dg==
X-Forwarded-Encrypted: i=1; AJvYcCXBsZVHRJ+YviNUYqC+0+5rXoY1+Ed79NEbP3isns3lAmPD48XY58HxSBCVHTGbuJuFeuid0xUOB0Hgoc9mUNJiRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2wV3etnEYeoHEahsY3iQK855zp54ob3QuykFoKKLwPmqgdj/0
	70TMYhlhHbpMYwbqMyUmDXCF7vozazMPGiCTF6USwiuhh4ekS64VqkHNOLARiHQ=
X-Google-Smtp-Source: AGHT+IGNc+yQwIEFYcoXaYDTiVtRbM0uSW8SvVRRaTfSWAkc+HWaJ/ulvEa7WDpOmn2DpXIFCpQJ4Q==
X-Received: by 2002:a05:620a:1706:b0:7b1:4fd4:e868 with SMTP id af79cd13be357-7b331dc9915mr1682111285a.51.1731354722238;
        Mon, 11 Nov 2024 11:52:02 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32acf7f31sm522065885a.129.2024.11.11.11.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 11:52:01 -0800 (PST)
Message-ID: <cd6c4f26-4d06-45bf-952d-8aa91780f30d@baylibre.com>
Date: Mon, 11 Nov 2024 14:52:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ola x Nilsson <Ola.x.Nilsson@axis.com>
References: <DB5PR02MB102134FA3962BC6E299ED305BEF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <1806FCFEA77DB1DD.19665@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <1806FCFEA77DB1DD.19665@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206983


On 2024-11-11 13:21, Trevor Gamblin via lists.openembedded.org wrote:
>
> On 2024-11-11 04:56, Peter Kjellerstedt wrote:
>> Is there some problem with Patchtest? It seems it has not reported
>> on anything for almost three weeks. I would, e.g., have expected it
>> to report on Ola's patch series from an hour ago as the patches are
>> lacking the Signed-off-by trailer.
>
> It's been down for a bit, yeah. I'm actively getting it set back up 
> and should hopefully be running again this afternoon...

It's back up and running now.

- Trevor

>
> Sorry about that.
>
>>
>> //Peter
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206976): https://lists.openembedded.org/g/openembedded-core/message/206976
> Mute This Topic: https://lists.openembedded.org/mt/109512191/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

