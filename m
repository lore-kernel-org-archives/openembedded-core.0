Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082E5C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 21:25:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.78520.1702675507561753144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 13:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=cNV0oqOf;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so13484515e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702675506; x=1703280306; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hSU6ORs+UF3S3c1Hw4rQq1i7Mepav71gvauPZ/TyU08=;
        b=cNV0oqOfxmhVKwgYX8p/w+bKpKr9W52+5LyJm34pRdUmIl3rocztz39Jtsn3tqdZBl
         OsIcU77/incwuhXZc8/3aa+tG9mvXJ4iwIRlPeHmdGa8LbCquYDMa0QRFF6a6xrpzGBV
         QPfoV2x1CpKokspWDezxy/9JRRgJLInpmlN4ZGdGxQkCqmReRRCcG80lkN9Q5WJpypiU
         r620Q0/9h6cMDiMHhLJZ7CRaB3K7M0nhuS6H2En0RcFgdbg3E+Mdtl4ggXjrb1dnpd4g
         280fwtp2Lx1Q3Za5xoszTtrzOLl2AycEZ4ocQnqsiIcLLd11EqMTD5LGvmtUx1iXA2b3
         Ey9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675506; x=1703280306;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSU6ORs+UF3S3c1Hw4rQq1i7Mepav71gvauPZ/TyU08=;
        b=qOIDsl3tX4AsWDKP0BfoU+8lq7iPZxabFfacRf7wmyCiGPVL+VagIeEEN4Te2h05gt
         kopcvSs86j+y1y5MV8btufMOzhYelp18SYYX4nuTG+Gv9f+CKGY2jmaH8lnRZr+0EqTz
         MQuQf07KlkJkLV8oNPWzoFxFdg5R/HTQ2/lVYg0Z88KhqkyqvgLcQmesWYcfTQDC0NOD
         MhTQ0mcK3aDY6J/Q4fWXD5piBT3Yqp90mFUAB4PJriMyVOee/CbN4oU5UcxubgY9ALUJ
         uCPDGmHL6Dddi4Sf4LKQLv/+saYFdr/6/N7J8tfjE39Z5Rz2yE/dlmU6qRmChaoaysV4
         /YyQ==
X-Gm-Message-State: AOJu0Yy93uf9WaDfucqZzeUOZgQvWuvi5dffULCQVEQLg9v3tpHEJfaz
	meeUe0QC3J+9brC7oHxpjsk01Q==
X-Google-Smtp-Source: AGHT+IHb7kSBDWIB4OlG9qLeUo9AeTj4VdoESZ7YS/zU8cNfDxqkAk43vC/nOKZ57sQSHcVdK+ZZYg==
X-Received: by 2002:a7b:c8c8:0:b0:40b:5e21:dd44 with SMTP id f8-20020a7bc8c8000000b0040b5e21dd44mr7009841wml.114.1702675505803;
        Fri, 15 Dec 2023 13:25:05 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id fa17-20020a05600c519100b0040c46719966sm21588257wmb.25.2023.12.15.13.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 13:25:05 -0800 (PST)
Message-ID: <0a0c81b8-b74a-4cfb-9484-1ad166083453@smile.fr>
Date: Fri, 15 Dec 2023 22:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] externalsrc: Ensure SRCREV is processed before
 accessing SRC_URI
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231207223258.3273718-1-yoann.congal@smile.fr>
 <CAOSpxdbVCTyG5Y0Pay7G+PPxLHHhxcg-UOunTOQvWD7MkHSDRw@mail.gmail.com>
 <e4d7dc18-84a5-42e2-8c49-9c9b673606e6@smile.fr>
Organization: Smile ECS
In-Reply-To: <e4d7dc18-84a5-42e2-8c49-9c9b673606e6@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 21:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192548

Le 14/12/2023 à 22:50, Yoann Congal a écrit :
> Le 14/12/2023 à 17:24, Steve Sakoman a écrit :
>> This patch resulted in oe-seftest failures on the autobuilder:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6322
>>
>> A representative log:
>>
>> https://errors.yoctoproject.org/Errors/Details/746003/
> 
> Thanks Steve!
> 
> Good news, I can reproduce this locally and easily:
>   oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files_subdir -T machine -T toolchain-user -T toolchain-system -j 15
> 
> I've commented this on the bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14918#c7
> 
> I'll look into this.

V2 sent => https://lists.openembedded.org/g/openembedded-core/message/192547
I've tested that it passes my bug reproducer AND all the previously failing self-tests (I did not test beyond that though)

>> Steve
>>
>> On Thu, Dec 7, 2023 at 12:33 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>
>>> Call bb.fetch.get_srcrev() before accessing SRC_URI. Without this new
>>> bb.fetch.get_srcrev() call, SRC_URI might be accessed before SRCREV had
>>> a chance to be processed.
>>>
>>> In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=62afa02d01794376efab75623f42e7e08af08526
>>> However, this commit is not suited for backport since it is quite invasive.
>>> The part of the commit that fix the bug is:
>>>     --- a/meta/classes/externalsrc.bbclass
>>>     +++ b/meta/classes/externalsrc.bbclass
>>>     @@ -63,6 +63,7 @@ python () {
>>>              else:
>>>                  d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>>>
>>>     +        bb.fetch.get_hashvalue(d)
>>>              local_srcuri = []
>>>              fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>>>              for url in fetch.urls:
>>>
>>> NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
>>> equivalent to bb.fetch.get_srcrev().
>>>
>>> Fixes [YOCTO #14918]
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
>>> ---
>>> Richard, Steve: This is the commit we discussed at today's bug triage.
>>> ---
>>>  meta/classes/externalsrc.bbclass | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
>>> index 97d7379d9f..eb6afca4ab 100644
>>> --- a/meta/classes/externalsrc.bbclass
>>> +++ b/meta/classes/externalsrc.bbclass
>>> @@ -62,6 +62,9 @@ python () {
>>>          else:
>>>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>>>
>>> +        # Ensure SRCREV has been processed before accessing SRC_URI
>>> +        bb.fetch.get_srcrev(d)
>>> +
>>>          local_srcuri = []
>>>          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>>>          for url in fetch.urls:
>>> --
>>> 2.30.2
>>>
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

