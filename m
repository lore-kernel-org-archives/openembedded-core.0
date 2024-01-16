Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE23C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:34:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8547.1705394040159055900
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WW+gDpiR;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so73456065e9.2
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705394038; x=1705998838; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOZWMbejDkGQoMN+JuGKVJokeSqHjRgApE4XaNYEEz8=;
        b=WW+gDpiRLoX5+wMNADC/27imMP7oh1T/iEIJK0eVSIUZUZoh60aoPTyhZ10AsPqbfH
         PAK6pS/Jt8y5b25p3VdQ3hGWK3kx6aiNHRLd2rBZTIaMy10opdHZBj0H3IkH6u1KbW2B
         YOVy7yZsNXw7XcSDunRR4dXmwYFDEVXtZWf6sfM5q7KRGt0W3n32QNMcWoiqTDK/7CN1
         3M4GGl2chCU6yVJ51Pk0zDEJFBOjUY+MUwk1lxihNbFok7c0fl1awaLFN3JYSDe7wVX6
         AcEf5WfOT9aQnnTKayedsxlQ4o9t9BM21jvBGmmM56Ns2vsAtjlZF2i07thvj8GTevzO
         gkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705394038; x=1705998838;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOZWMbejDkGQoMN+JuGKVJokeSqHjRgApE4XaNYEEz8=;
        b=AyVpIB8+W7dXip5eazQvlqfYoBdkK75ED8oLao0pvz+eUJeaxcXRh03+J38JHWhVmf
         HggJUG4scLn/PP6CK7G0ArWiEWTHH0OpHdRmA8t8nJ+Jps3Ek2WbyD7LwyViWC7uoJ0c
         SGhBZkytIKjUhCOpjQ92XRHB6TxhJkMg4b52T/MHiyR+JesjKoBaQcuEEB8VuYc1/k1+
         lxip+VdzcMFQN4p4wxR3QyvG5ck97TW13ND+iyK1JNBbGFdmOrR5TeawVDcg9/l+gOvL
         MBiX7Zl5lvlsNBvSxSRNNjH4JXJoQuhxIDyXLQHxSTSRuEHWbORJyxC7bCkC8NPONuOk
         UGuw==
X-Gm-Message-State: AOJu0Yzf6VIS0chQomkQyuG1jufcuiEy6oTZZ1Wa5pWCwWpXdK7/fd03
	qQqnlHl3OaTGaouU0RXPVS0=
X-Google-Smtp-Source: AGHT+IH4fZ+tjz14ccWHFQ6pgdjY68PcxXhkdYydoeWpI6M1TC9ZuT/6+f+63GG+4QTMgTqRxQNsnw==
X-Received: by 2002:a7b:ca58:0:b0:40e:76bf:7168 with SMTP id m24-20020a7bca58000000b0040e76bf7168mr1737293wml.103.1705394038506;
        Tue, 16 Jan 2024 00:33:58 -0800 (PST)
Received: from [10.139.3.237] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id m26-20020a05600c3b1a00b0040e4c1dade4sm22598701wms.36.2024.01.16.00.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 00:33:58 -0800 (PST)
Message-ID: <be7981e3-0d3d-44af-9ce1-6b9ca51d06b7@gmail.com>
Date: Tue, 16 Jan 2024 09:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] recipetool: Don't fail on local go modules
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20240110115335.92914-1-uvv.mail@gmail.com>
 <8a756432917f8120a8e2d0d5b1e8ee9daebd6132.camel@linuxfoundation.org>
 <3ec7d9d9-c1bb-45ad-ae57-54ff7733d487@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <3ec7d9d9-c1bb-45ad-ae57-54ff7733d487@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193836

On 10.01.2024 16:45, Lukas Funke wrote:
> On 10.01.2024 14:59, Richard Purdie wrote:
>> On Wed, 2024-01-10 at 12:53 +0100, Vyacheslav Yurkov wrote:
>>> Local modules are usually referenced with a 'replace' directive in
>>> go.mod file. If that's the case, remove them from populating SRC_URI.
>>>
>>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> ---
>>>   scripts/lib/recipetool/create_go.py | 32 
>>> +++++++++++++++++------------
>>>   1 file changed, 19 insertions(+), 13 deletions(-)
>>
>> Do these changes mean we need to improve the test coverage in oe-
>> selftest for recipetool?
>
> Test converage needs improvement, yes. I haven't considered the case 
> for local modules since this seems to be rare(?). Are there public 
> projects which use this mechanism?
>
> Best regards
> Lukas
>

I added coverage for local modules in my v2.

I'm not a golang expert, but it seems that local modules in golang is a 
means to "place a patched version into the project space until upstream 
fixes it" more or less like Yocto does with Upstream patches. It's used 
a lot by in-house projects, but you could also get a glimpse on github 
with this query 
https://github.com/search?q=path%3A%2Fgo.mod+NOT+is%3Afork+content%3A%2F%5Ereplace+.*%2F&type=code&query=content%3Ago.mod+replace&p=3 
. Note, Github is able to display only first 100 search results (Github 
API restriction).

One thing I don't like in my v2 is that I need to look up a public 
project to add required coverage. I would rather improve tests further 
by having everything in one repository and just one test, i.e. it has to 
be a small test project that could be used to test all go-related 
functionality. The question is though where it should be placed? I could 
create it on my Github account, but would that be a good option?

Richard, any suggestions on where these projects for selftest coverage 
should be hosted?

Slava

