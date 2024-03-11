Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023C8C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 10:09:40 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.59415.1710151772948140838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 03:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iuxnu7b5;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: zboszor@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36524116e30so15741965ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710151772; x=1710756572; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ygFQxwePprz7CiPSWNFSQ390fpDdPenr8r+b2IGwoQ=;
        b=Iuxnu7b5EjFUZrgzA4TKjM8hkErsn5RqqzTVcPCIS7NpjxgXf25nqP+F9eg5jReGw+
         HwM60VrQPF7dYYG93aNNIaphX0FYib+6XTH6Is1+87DIEuXT7uDzak2C7rls+D2Bs6xD
         HYnD0si5Ev6SqqIERQc49dsTAMl9c8bZe9nrt/wYuhk/wxtxMkQ3jKuv04x6EoTXYTsG
         7D4Q32JeA4WoCY9A/2pb+28LlzyTnRg2USc6dqAen7Oft85XLAP1Re51usRMxsoPR7wV
         4X4H+yP8lkiAut1ttBM1NBPmWEs4edhirIPMn2m90o4soU5oZH2N4PrJXpD2jF9ouXKX
         Nbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151772; x=1710756572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ygFQxwePprz7CiPSWNFSQ390fpDdPenr8r+b2IGwoQ=;
        b=Ul49JL/qnyrStl1wsIqjPDxQkJnP5MMVEJY7WBLUu0tJKyos1PIkM3Jbq6hpTpqg3q
         W3hFCvFF20tpk9Gc61zPGVEWVmQ911Kb7cpICf/FoAmXmgNQiKTLc+PhYfw1drlyakKh
         9y176KY1NsM/yrmwE20fTLdN6ruPAeHuPo5Vz3WKpD78oG84zJ46mf+2JeAtjXExq0ev
         3R34Vekkm+MY/E0Oj/27p4VQhmVY3WuX7DZywuMWttHtT+UVlsA5IMnyWm/EP3rCyF2o
         sHKfEKl5tJpGNHESxOiEVfdZbpZxk+rIMYFJYvg3F2/devwaq5XbkZxqXgQT0qTD3uPu
         k8eQ==
X-Gm-Message-State: AOJu0YwgctBUq9f2I2Z206TiXn9Byxz/CpeMwLB+7Vxh9OcOiEvpuvdU
	MTKcWPFLpTKD33oj/Vzjl023OmKjhrxO7IbJR/7YLoNDQCSbM92y
X-Google-Smtp-Source: AGHT+IEjWSPvc6NeGWs9LvU9aium7GKe0WbOK5XAZG5wPeYNaGxaJmEcjfrOPiK5X6hkNQsty/Tu4g==
X-Received: by 2002:a05:6e02:218d:b0:365:fe08:8268 with SMTP id j13-20020a056e02218d00b00365fe088268mr8418143ila.5.1710151772149;
        Mon, 11 Mar 2024 03:09:32 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id c14-20020a92cf0e000000b00364228350d4sm1601410ilo.84.2024.03.11.03.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 03:09:31 -0700 (PDT)
Message-ID: <71b34437-cd65-48c0-89b8-1030cf1a30cd@gmail.com>
Date: Mon, 11 Mar 2024 11:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
 <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com>
 <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 10:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196931

2024. 03. 11. 10:37 keltezéssel, Alexander Kanavin írta:
> On Mon, 11 Mar 2024 at 10:30, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>>>    If you manually edit the file on target, you might as well
>>> manually resolve which version you want after the update as both are
>>> available regardless of whether (noreplace) was used or not. Or
>>> perhaps merge the manual edits into the new version.
>> The interesting use case here is that the configuration file
>> in question is generated on the machine using a GUI,
>> while a minimal stock version of the file is shipped by the package.
> This can be handled by shipping the stock config under a different
> file name (e.g. conf.sample or conf.template)?

Yes, I am aware. But why not use the package manager's
own features instead of adding a workaround?


