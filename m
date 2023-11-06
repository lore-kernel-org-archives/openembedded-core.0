Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC9C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:13:40 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.53354.1699276413203637694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rBo41ivJ;
 spf=pass (domain: baylibre.com, ip: 209.85.167.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b5aee410f2so226829b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699276412; x=1699881212; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsrIuT1RpLfFCzqQrIExSlgGZ/UQI5IVV3RWuyQpFHE=;
        b=rBo41ivJEVnwDvJZuqGSrMjtQPlizml+RGTujX5bt05IobOLyKY0XQlbSrGwzc0pNZ
         pNUVvO65SmmCDs+O+Qm/ysPeyBo0qJqFjSWtyxuqSxwDAtdNsVyl+L5QePtgFWF2+gVK
         ga+/VzKahPcPzpenqXv2YfT7TZhqyISepRHy/GhdBJH3uqm4Y5W7jT9D11QpW9Uxw2c9
         aXI1o8FEwR8JQJQiTEwyLlyKpGF/9ui8vZac3l7+fU0WRutAKt+rzczWEu/EXLCLLPOJ
         6W4gXFyYzXOVmku5Wf5yA2S7P1rUGgSQJ6ZQJHj5ZmLQ9XNw4bZgbM+wmdafkW16j/RX
         br4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276412; x=1699881212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsrIuT1RpLfFCzqQrIExSlgGZ/UQI5IVV3RWuyQpFHE=;
        b=rFB5vAKcML9XNHjVsuo9Ga7yGmOP5hclPySirnSVKvD4o/GC6oP3DWKWW2AxCpiJC6
         jqnaBaP52/cG0jjJnURPbAfr0xPb5j3HwapF3rvi5nBb3+CajbaUc2fCCFztoWUWqNVs
         B1bhxnysxFWTQ8SUGzN3jRmN8AGqG27wP224CFCm55zlIbtzC6dtIl7g4e+Fm14ZWepe
         gTY2pmkL0rEo7sAljYz4A1Z8XynBPMsxkScBkY8ksdc5ZJl63w/9JW2xWcQpKhTR+j2L
         BRwzQk5cLFVR+99RT4tFctikfbZzeyFG8wffpHZHMDekdhqTIyNU3OhQVj05K74Yyuio
         Na2A==
X-Gm-Message-State: AOJu0YygACVIrrv9pD8f9zcOWFBjOirmDfxb2RolvbjcNO076C8xAshw
	U5IHoavYoJWw7TYDCQMagq0/WQ==
X-Google-Smtp-Source: AGHT+IFIZsO/TXrdLwgiV7ZA+QstQTXFBmatqN0vWSvYDfdmYNSQkFvGcDr1oVFpMLWhob3kQ6D4aA==
X-Received: by 2002:a05:6808:22a5:b0:3b5:94f7:2b2 with SMTP id bo37-20020a05680822a500b003b594f702b2mr7596414oib.56.1699276412146;
        Mon, 06 Nov 2023 05:13:32 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a16a800b00767b0c35c15sm3245325qkj.91.2023.11.06.05.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 05:13:31 -0800 (PST)
Message-ID: <11eaf282-e9dc-4ed6-994d-c94c47582150@baylibre.com>
Date: Mon, 6 Nov 2023 08:13:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] cairo: upgrade 1.16.0 ->
 1.18.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: qiutt@fujitsu.com, openembedded-core@lists.openembedded.org
References: <0101018ba28d50b5-31bd6f92-16b0-443a-b238-0e8143dd0ea4-000000@us-west-2.amazonses.com>
 <CANNYZj_cfDiPZQsZQv88XsS8AqSVRanefc1ZNbi-ZrfacOurcw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_cfDiPZQsZQv88XsS8AqSVRanefc1ZNbi-ZrfacOurcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 13:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190214


On 2023-11-06 07:25, Alexander Kanavin wrote:
> On Mon, 6 Nov 2023 at 03:54, Patchtest
> <patchtest@automation.yoctoproject.org> wrote:
>> Testing patch /home/patchtest/share/mboxes/cairo-upgrade-1.16.0---1.18.0.patch
>>
>> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> This doesn't seem correct, as the patch doesn't touch LIC_FILES_CHKSUM.
You're right. Having a look...
>
> Alex

