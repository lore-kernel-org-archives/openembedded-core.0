Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6247CC46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 14:37:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.149206.1703860666091963765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 06:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/tLSPkQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso28502165e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703860664; x=1704465464; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojHeY5KDTelyUYnQ9bfLDeBZbcAhkuciriv63P+Cn/4=;
        b=k/tLSPkQ1MrfS4qZi92NHF4U1HMEdUuipZtCnRhoosDtlWez9MpAqxou80ra7mrbUc
         beBjTpb4g+ey54adoqpvuxqvY8Cd0qteGjP3JzALWh0uh6vV9seVsVxZM/veqYEeNzOg
         34vIJ0lsRVW6dWXjsxyp+WDYDgFCJE/KrzU2q7HrOOpZT4D+NscH785VXQ1DtLkfzEtQ
         WXBDX+5J6f80+DNfI6I+OporUQkxJx1Y7PqtioNx95P6MNK97O4usJGR3y/6uSRTDn50
         lAaUokVm4pl3tqu6YKDZGuqJpUcX//dR2lNrse+1Gl0Uml724qssN3w82u/EInAAu0CT
         pW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860664; x=1704465464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojHeY5KDTelyUYnQ9bfLDeBZbcAhkuciriv63P+Cn/4=;
        b=YrtKF7J6kAYpAMOC30dMiBl5a3c8q14MZ5DYq4vK+JJjMAO2sBR3krz/TWzzOMexlt
         L6PVL7MM2PIiR1H+N3mDLhI5sbV85pKuKVO8JynH4qcxzrgXpkBHa62uhC7YQuXEJ2qa
         DLQuk936xMntzOs3AbgWgH9r5SyzJN7AfjSvqFopjrRqA1os+gedQqT5ionogSDd0p+x
         /U+10k/OtC21tP0K76ZVQmh9USPMglDpHe7n1nfNWfWeRv0x+utuf4tG25UkKxFkksev
         jQBIZF/2u4yGN+QxhaYfTAXBkhev35xNsjdbypLcnMBcbG5cKrn+R5WJKqPcRSq7rT04
         0jkg==
X-Gm-Message-State: AOJu0Yyj04NyF9VDqJ1filHEUeZqk6urRaWlxw+evB+uhNdjqrOV4oGA
	xQOW1xZHuRk6Xcz+SOylxtM=
X-Google-Smtp-Source: AGHT+IF7bR4/hIK+lN2oBHhACYpbtJb0SX4dBsrWnny1nXEKX7T31CmoLa47Esu1Nn2By+IXIqPEjw==
X-Received: by 2002:a05:600c:190b:b0:40d:511d:5911 with SMTP id j11-20020a05600c190b00b0040d511d5911mr4799064wmq.80.1703860664217;
        Fri, 29 Dec 2023 06:37:44 -0800 (PST)
Received: from [10.132.21.28] ([194.36.108.22])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b0040d5a9d6b68sm12405414wmq.6.2023.12.29.06.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Dec 2023 06:37:43 -0800 (PST)
Message-ID: <857f96f7-00b3-41aa-8360-a1845eaa3f6c@gmail.com>
Date: Fri, 29 Dec 2023 15:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, u.oelmann@pengutronix.de
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
 <cf5fa871-ddcc-4f18-a013-3ef10ec77de9@gmail.com>
 <625e1f93-9850-4c0f-b546-a246cf94924e@weidmueller.com>
 <1797BB9A6BD89B64.27160@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1797BB9A6BD89B64.27160@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 14:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193015

Hi Lukas,
Sorry for the late reply.

I think I see what's going on.
The module I'm working on is already "vendored", which means there's no 
modules.txt created for my project by recipetool, since it's already 
provided in the repository itself.

I guess this has pros and cons, and I'm currently not sure which 
approach is better. On one hand, offline vendoring (no by the 
recipetool) has an advantage for SDK builds, when people don't use the 
BSP directly. On the other hand, Yocto style vendoring (when modules.txt 
is stored in the BSP) is more transparent for dependency management. 
I.e. I would need to update the recipe when my dependencies change.

Slava

On 15.11.2023 08:34, Vyacheslav Yurkov via lists.openembedded.org wrote:
> On 15.11.2023 08:30, Lukas Funke wrote:
>> Hi Slava,
>>
>> No problem. Party is still going on. The 'modules.txt' is intendet to 
>> be in your ${WORKDIR} as it is part of the SRC_URI, generated by
>> the recipetool. My guess would be, that there is some 
>> missconfiguration in your SRC_URI?
>
> Yes, I noticed that it should be there in recipetool tests. But 
> generated recipe didn't have It in SRC_URI. I tried to use generated 
> recipe as is. I'll try to double check later.
>
> Slava


