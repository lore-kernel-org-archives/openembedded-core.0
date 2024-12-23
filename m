Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF4E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 14:37:14 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.14202.1734964627967136983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 06:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kUIaAuDz;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679eacf25cso21897761cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734964627; x=1735569427; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AMNysWl63HzQ/HNSoYg3cBfeYKAV+40UZ6OOuFdMXI=;
        b=kUIaAuDzkGn6V4Wyg/NPIbXSDHta7kkgQfdjp5S5BzGWLJtjzXrr4YxKz0/CWL3XED
         wWWJC1mDxYy+XgzZ7M5nOFiakfCLiM+817DwtOU9i4cMJiEKsDh8eYKOas2lmkoN3i4c
         lUKPGnyMKkDdd/V5iTOPKTnFRn2X1RtCMwSd9R6sZIJERr2zuULU/OVWs2y18u/aH0xg
         3oj9Mdd6XpmPAQgOmrJbuhmccTUyFjQaI6ZWXTG5xynIcE1BJ5GjUM43MqmdD2AIvr37
         h54LJZ75JsNaxRzgSiLkVlYpuZ5GrVUGkNtvPcQwatTPikjb1u7iIm2t5TLgaJAKkI8n
         r0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734964627; x=1735569427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AMNysWl63HzQ/HNSoYg3cBfeYKAV+40UZ6OOuFdMXI=;
        b=dhgi0ZErpzF1+e8LSxVnEJ7lqiA/IyPqvGOfDpUgWHi7viVWaeoApnJzeidk+Aa9za
         HErA48anpzhgfaeLKmrEMg2aY/La8HvRxg/WO0v0QuLd62GyLV4M5/bN821OSgfJW43w
         zRQJr2ZWFylg+3s89XAEaN3OaKdI+9UTJeTDbsqJHzT/YkjyRaguwyoL8koVw8dGy/sN
         urLa+2hhXMwjYzumC32kb+XMaTxveE50H+Q6zoi7At4Q1mdiZgQlXJJhT0ZP5mmT/HCa
         vpzGxlN2RdGpiIEKW8y0erFkbok41frPiFDfQYl/YJSW8DpHDLM6OGG4b9Udljz3e8mT
         SWSQ==
X-Gm-Message-State: AOJu0YyeNmsWgQ3UQBxVBme7a5H/74mQIDrIEOGubzQ5fC2NO3zCpy1y
	xifs3etSIBUath0PW9ALfIcUwM+043YiydyFwrz6NQyJ6+7BgAId+fi9PlifQCU=
X-Gm-Gg: ASbGncs2QiMpprCdElfm/XAC5D5j2sVme6tt+sLMeldGGaaQkZlwvYGHmX+Qsb8ZQ4z
	CKQ0HwROa5PRv9EH1KW5AXULwTgCWZyvmPCpq7APRNIhqLTVgf9ed3sqaX1IkQrmW1ym6Zvu6Cv
	aoAqOs0vYOOvkUfYgvcwDbmVzBYNI0LqNK/I2M+Pqi7vnr35q2JfSM5FVa07b2TsTaYWa1veIhv
	3rMAbyo+0i4L7CmpQUkd+6ivqahIXOIxLRl6UJkAdBL3k95op1uNYPVPB/8fo2NCtDsw+nlb6FC
	DCnjmf9HeyKtjMOmVm/QQcRf
X-Google-Smtp-Source: AGHT+IFrpsVerEzkqUOyeWnn5IWkvpfztPp4JOqddOsQoMG3zAL31y+lbmoV+5Ka16qcewvyCRcMDw==
X-Received: by 2002:ac8:580a:0:b0:467:6b20:e0b5 with SMTP id d75a77b69052e-46a4a8b63f6mr202472921cf.2.1734964626876;
        Mon, 23 Dec 2024 06:37:06 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a9cb6sm44346501cf.51.2024.12.23.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:37:06 -0800 (PST)
Message-ID: <0fbcd8bd-95ce-4144-9142-c69a263d8201@baylibre.com>
Date: Mon, 23 Dec 2024 09:37:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.0 -> 3.13.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>
References: <20241219144255.3366730-1-tgamblin@baylibre.com>
 <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com>
 <edabfbc7-8c32-4765-b7d8-972b27c38127@baylibre.com>
 <1812A90A888793D8.26783@lists.openembedded.org>
 <CANNYZj-Zv8e6n_c2vBKG5VTC8M310YgwgyyY2PNsKmESWBQAJg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-Zv8e6n_c2vBKG5VTC8M310YgwgyyY2PNsKmESWBQAJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209041


On 2024-12-23 06:12, Alexander Kanavin wrote:
> On Thu, 19 Dec 2024 at 19:57, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> That's been there before the update too, so it's not the actual error.
>>
>> dnf is written in python, and -11 return code indicates that 'dnf
>> repoquery' is crashing in the python executable itself.
> It was mentioned on irc that the crash is in one of libdnf's
> libraries, so I went to see if there are any relevant commits, and
> indeed this should fix the crash:
> https://github.com/rpm-software-management/libdnf/commit/f3302a865b230e021e9defbcea978ed1290a9b2f
>
> Alex

Thanks Alex. I looked but missed this when I did (guess I should look 
more carefully at the issues :) ). Doing some tests now - if everything 
is OK, then I should have the patch sent this morning.

Trevor


