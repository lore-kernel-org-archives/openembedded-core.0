Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A99C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 23:49:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.37549.1747957766058066655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EfsFMuNH;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so8304529b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747957765; x=1748562565; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CK4V1jX52XZBTq8j3FdLHz5DS6tWUgFQDj6sMJy7XSQ=;
        b=EfsFMuNHC5dIjycT9qp6XMQxH8oPfaOmMjlRZyNg3VkzbPMwf+OYebIEoCfH5cuSHh
         G0n0B8S8M3+BqC4PniVmWx/xRMfJFThd5XvZj0o+q2I8MIoXLCn8GrQBEuUTkSw5ENmF
         6G6eD2pY86lyQg8NLAjv7pyeKA+HvFDhqyo+2wEThOAaPkzKPqyXBFWrKe6y7vSilrsg
         LqTx2cwxq+ClgdJp986Papm1XbFZR4+rPPZghWtHeziDUfY6dRMvHjU0y4QCbY6HOw1A
         gSI/WrXa1S7gBkJh/BJ4r6EtHLu75S4Gp8UOOoodj4LNWF/ZtvZrQFvLsrsGUYQDlOQ9
         8qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957765; x=1748562565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CK4V1jX52XZBTq8j3FdLHz5DS6tWUgFQDj6sMJy7XSQ=;
        b=JghzYXlWBN8y+8rmkhx6SospIC4g7VM0CyScTTdPmnlgRsj64dGxjTOrk0CGDPRMRI
         l2QPen5HNB0c1gijUtZ4YRobrWjYpuf+lrEkZIbs04KsSPkDEFDQePjqu7UYQS/9PBtC
         8+gtXpVl7capIvBnGiqDU/XrHJ5eVhWqc6MvwR7QZMwNkj+PjfRZPNJpN3ESuaTjW9Ek
         0y0ZMU6znMko05JiDUGrN9yXwaV4hXlcGnw6U+RARchUMT+pCZYYppDw0i1/XM7vrOM1
         whdYrMnSArhhvPrs90n7u76whODuV4ijhzPkCXkzWzb6dRP/0HkUAblZltB8c70Gw7UE
         aWSQ==
X-Gm-Message-State: AOJu0YwbNjatHeir3J3dyqQpsmf2adpvpbAkEj2itonmtFTTi2npNsHe
	6feMqe5hhlHUZwy3+SFxfs3bUsrHgZ6cJy73eS+yZSC55B3AFExbZmT2
X-Gm-Gg: ASbGncv2JU2JEIOK9nDYiuY6drPqc3hqpSjAnSLRyHNm1NcbtLhTVHjtKfRNMxhMJ4G
	i6P71cgqlN+QmL01OK53u4WGsevksTHWyDOTTNMBuEa1ZKH/jilQrx9rmhRkVuKoXS3ZbZ5cB37
	CE1R2hPGhtKWxrwlkfPDi7wGkqdUVPu4SJvFJ2gVG+eE6A2q34zKiUmQ39ELnpW0ssBuA8El8h5
	hgLsBtyzZaNBMbBKehugOPM7qALsp3AH79AsFhYd89u9Kxd10VrU1CDti5TVAQ8AI0GSnXesjKO
	HylExVtsRwCsmG0LaTCEJl2RISQkivVKrKu5FKGdVIXlKqq+wttP43YXsxLRg3zK3b9BAl7bpP0
	oxQABLLV8b39VL6QaICCOH3AIR9sV514qr17O/m5Hhs9W
X-Google-Smtp-Source: AGHT+IHBHZmJPTqUCmOsid643jV/BJpTjL5v0uCyAoMzuWlUpOc/MUWLgEkG8o5ZIXllPJTJS+S4+w==
X-Received: by 2002:aa7:88d4:0:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-742a97e9b89mr34121244b3a.10.1747957765359;
        Thu, 22 May 2025 16:49:25 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:7444:5952:9108:1ddc? ([2601:646:8201:fd20:7444:5952:9108:1ddc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9871500sm12035891b3a.131.2025.05.22.16.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 16:49:24 -0700 (PDT)
Message-ID: <beeb7e31-984b-4069-bbe5-84fc99cd1dfb@gmail.com>
Date: Thu, 22 May 2025 16:49:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 27/28] systemd-boot: Use gcc on musl/arm
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-27-db97c2eb3756@gmail.com>
 <BC4F1602-93E6-4BCA-BAC5-C1C9584ADBA6@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BC4F1602-93E6-4BCA-BAC5-C1C9584ADBA6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217153



On 5/22/25 3:12 AM, Ross Burton wrote:
> On 21 May 2025, at 07:20, Khem Raj via lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> wrote:
>>
>> clang does not support -mgeneral-regs-only option for arm
> 
>> +# arm-poky-linux-musleabi-clang: error: unsupported option '-mgeneral-regs-only' for target 'arm-poky-linux-musleabi'
>> +TOOLCHAIN:libc-musl:arm = "gcc"
> 
> Why is this specific to musl, does the choice of libc really control whether this option exists in clang?
> 

This is not musl specific, build with arm/glibc failed with exact same 
error. I have removed the libc override for v3. Thanks for feedback

> Ross
> 


