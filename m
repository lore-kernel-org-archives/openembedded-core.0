Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEEDC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:20:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12070.1739456414245214004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G/0mrSAX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso1357002f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739456412; x=1740061212; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emYwfJ1Z47WH+ykpojbWqScayTYM5F9aDnPeL4keGOs=;
        b=G/0mrSAX0xMaNTXScjVTQYoz4nrHtfIXdADF3CGHTc4ERzL0SdVs6NuDFmrc7jJ0k/
         bys0GAMH3YnKs7f9sFJQofVygCL3EZD8kVZy6WyxTUnE6EU742oBzHOian0pFeJCvhW+
         Pm+SuhHOvEMeTavgiGJxuHzJrI3f7imgkieAi8R/fpUIPZzMDOV6RlLU3etNPqygGrMU
         Idkks8UP+vXgK6YIjnHpJO8bYoY6twuBAqF7G51h3IobUW7bONbcoxD3p9x155MG/nTl
         Jel5aY21/DdmGVtNXAEet67hnDoWKkxGxLdmHQymaNa2HCBLqLtNcrERX8SkiByLZwHg
         H4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456412; x=1740061212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emYwfJ1Z47WH+ykpojbWqScayTYM5F9aDnPeL4keGOs=;
        b=mn1EIeyiNjoBCJecbC4GJYi84PVdiXv1h3EmEyGWm8SbE6K2WmtpuajhMhfTVpovVm
         rDJupQx66kuNmYoCWlFHYx43X7yITPXGLprwP2Z0zy/bN/JewjzelZRWXTOFyzzJfa/y
         /QERbKZvgDYVQIpqOiSHNzEa+Sxed12vTOhqU4ggvftlKLwuZ1oiX9JmZ+g4ZMQpUfo8
         MNk6uUpGQ7+gsTfV5/N4NI0eM7U6SsgRD7NF/rgiVEs8AG8e7hznMHib0Bd8Ngm9NJsr
         Vq2qBW0daRLWq+4YDFAOOOvU/bf5mdManB0gYamkI682UYvjys3eEPxsM1zumlHmAeDN
         ztsA==
X-Forwarded-Encrypted: i=1; AJvYcCWJo6aZC8EBrbHWKd6gdhsUPb1Pr7yJZu/DuWW0q8FlQGcaXJj5Pb24CIExXCPEvbb6gqpqFhYLQmbK6WFPBMzxAA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yykqs0uiyV36G+yz6mXOeh4yTy9VdTxtTFDyIJIYGlwBHUzKwB6
	IhfnHjMYkFawOA/TD5t54+Z8tljCVryfZ47ufTycJJGqj7NmHwjm
X-Gm-Gg: ASbGncsB7glQXcwg0nEYdBw/nUW/9n/IhoZHdOd8/jKQG1rYzMrXFzotDl8wLtXqV0N
	pHzIvRUKxjjvQYw2OrMz9LyANljUqiRPLrbXOYOW0R8rsJKTb9ijMg3xwsEfFVQkvLJ18tY+ZUr
	l7ZJgCz79PzrnE8TmGsWZ/ExjAYhCHi7U5fAb1Tjw+XefBDcSHsBRCk615eqsztqNXFb69zbFBT
	4inSzK8pJsRINHa+/D/bEy6DPCCNf0x1yLDRhT59fmnK6RK4JnNdR8WWQad7jyrf0NDQvHpboGy
	C6qaT2826B83ktmQWhYt6cowNmEndiD0jxMwwfJl+60DjzFP
X-Google-Smtp-Source: AGHT+IGnKKDfEceHPjFn7Nhc6IlJRtQGw5T1rfzG3Qp/uGaOi8MX9Upc7/jfIefjV1ZwT8rEtOtFRA==
X-Received: by 2002:a5d:59c8:0:b0:38e:dcd1:3366 with SMTP id ffacd0b85a97d-38f24d74705mr3429562f8f.20.1739456412338;
        Thu, 13 Feb 2025 06:20:12 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915785sm2080080f8f.58.2025.02.13.06.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:20:12 -0800 (PST)
Message-ID: <eb47ba1c-fac3-49a1-9d5c-d56168c39595@gmail.com>
Date: Thu, 13 Feb 2025 15:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211336

2025. 02. 13. 14:36 keltezéssel, Mathieu Dubois-Briand írta:
> On Wed Feb 12, 2025 at 5:35 AM CET, Zoltán Böszörményi wrote:
>> This ships a crypto policy file for rpm-sequoia.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
> Hi Zoltán,
>
> I believe we have a new issue with this version:
>
> | python/build-crypto-policies.py --reloadcmds policies output
> | /tmp/tmpqvyryz80: line 5: Bad configuration option: pubkeyacceptedalgorithms
> | /tmp/tmpqvyryz80: line 6: Bad configuration option: hostbasedacceptedalgorithms
> | /tmp/tmpqvyryz80: line 8: Bad configuration option: requiredrsasize
> | /tmp/tmpqvyryz80: terminating, 3 bad configuration options
> | There is an error in OpenSSH server generated policy
>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio
>
> Can you have a look at this error please?

I tested the recipe on Fedora 41 with:
* nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
* faking uninstalling it by renaming /usr/bin/nss-policy-check

Both worked.

Some of your build hosts where nss was not installed complained
about executing nss-policy-check unconditionally, which is now fixed.

I think this is on a build host with a very old nss version installed.
Can you uninstall it?


