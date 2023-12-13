Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341F5C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:54:23 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.38071.1702479260258856358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=z8JAlC1s;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77f408d123bso250301185a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702479259; x=1703084059; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+gXispHqjb0T89TTezl9iEQMsJMGNa53CXU81GN7io=;
        b=z8JAlC1seVRhpOVU2oigXioM4jffP+LfSZZ4OzeCqzQ/3W4U7R4iZbjji3vIXheYak
         03Qr/kRwngyW3O86SALq89EFnT2wzECE5qhxfUmNDMycguoyCt5f/+VfS/ulNePIH1bX
         uUY1QepRqe+wjGOZrCAJKcCdKujJw7I8U6REVKKn8CdoncshjGKg8HLOoAZO7C2xm/6T
         TmbZ+4plEtKnLb8XCCcH2iqYuKgcvgpN78eFpwOmwkecAgP8YVjGwCXSn+PDZaa16pO6
         90Lgc2Jk1pFRxqpkVNCEmh4AkAR9Zy+gFRTdqU800dJjy8pXeYemoS8LsePyOi5veHiw
         Mv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479259; x=1703084059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+gXispHqjb0T89TTezl9iEQMsJMGNa53CXU81GN7io=;
        b=u0I33BiHLTamyY6BhLIgadd/A7c6dqDUzMjfftxJkc5HDPkdMnKA8yzIGPeadPk9Gw
         QCdXOjS+Qgx3pSS5niLRVBsrV5wznk+IjgWNwZsnac18F9Yiu4UGg5tvcPQxAY9UVPuD
         J61gquuBZYcrTSJPsV6DMmxaLuJ++E+3hANUEnzehSc3Q3jxlSkWscknM+Qfp7PBmCS8
         hRhNjMSz7Or6SU6JQE6IenFPuRLrkRMknWvfpgDsV3nMe9gAngQzmJmw4N2JGoyFy39S
         24YdfMBvKfdoxXJoIliJTB7zSHER4f/E/Vs+DnVVKL5EXfUw3jJzZYmdBApBRNdXt8eB
         328g==
X-Gm-Message-State: AOJu0YyanFkYtz9BLWKuz/vNIlYPGnQ5yufCX7k97c4lgeWnpatqvNE7
	FQgOhSITixi6TCrCQUclnK2cYg==
X-Google-Smtp-Source: AGHT+IGARvvyaUhiyNFTon94UA/xpmTHEuX5hQNJT7VNtWVCrqAP605kMdtIpo9+lJHuxOegjBLcOA==
X-Received: by 2002:a05:620a:4494:b0:77f:8dc1:964a with SMTP id x20-20020a05620a449400b0077f8dc1964amr2286177qkp.75.1702479259318;
        Wed, 13 Dec 2023 06:54:19 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id or15-20020a05620a618f00b0077da7a46b0fsm4540807qkn.69.2023.12.13.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 06:54:19 -0800 (PST)
Message-ID: <878d9666-9b33-4058-853e-081181f46c74@baylibre.com>
Date: Wed, 13 Dec 2023 09:54:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add test for deprecated
 CVE_CHECK_IGNORE
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231211164553.12425-1-simone.p.weiss@posteo.com>
 <A1B8E888-E4AE-4F4A-9BE6-049B984A6854@arm.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <A1B8E888-E4AE-4F4A-9BE6-049B984A6854@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192297


On 2023-12-13 06:27, Ross Burton wrote:
> On 11 Dec 2023, at 16:45, simone.p.weiss via lists.openembedded.org <simone.p.weiss=posteo.com@lists.openembedded.org> wrote:
>> From: Simone Weiß <simone.p.weiss@posteo.com>
>>
>> If a recipes was modified recommand the use of `CVE_STATUS` instead if
>> `CVE_CHECK_IGNORE` is used. This is a depreacted variable and will
>> result in a warning from the cve-check.class and should hence not be
>> used anymore. [YOCTO #15311]
> It feels like this shouldn’t be CVE_CHECK_IGNORE-specific but a general deprecated variable check.  Can you rename so we can easily add more variables later?
>
> Relatedly, BB_RENAMED_VARIABLES is a map of variables which got deprecated but the solution is a simple rename, the same check should look for those too.

I agree,  this would be a good change to make for long-term 
maintainability. LGTM otherwise.

- Trevor

>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192287): https://lists.openembedded.org/g/openembedded-core/message/192287
> Mute This Topic: https://lists.openembedded.org/mt/103112424/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

