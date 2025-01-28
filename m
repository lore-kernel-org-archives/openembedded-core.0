Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD8BC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 12:28:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.16270.1738067296868475612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 04:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeVa4La+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e0e224cbso3167252f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 04:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738067295; x=1738672095; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luRKEKbq82l6e0SLRoeOQ0VaHq+8zLzvBD0aSrnWgN4=;
        b=EeVa4La+w8AgRwVZkEQ8Wgyn5FNB22DzS5uLakf6zE36dk0Njm0SoDJO3qpxuKNJzP
         HCEvK3gsfMhsUIV5Ln/9v/fz56BzN97obpX164OzatcLpbt8pMKbDxxfD3sfELTtMvbF
         Zu09Elqh3BFFBbeaEjpJlyZV91UlXxopV8L3Ett4YhZH/o9f5+pWKOCBnDelp/VemnIN
         2+8o7maC+bWWdQ0lmBNX4TrcEhntfXTj4Fpw5TWwVrTjjnOb5hB+VILGLl9AYlPHFcZw
         OA6wQsMrMW3sYBaJIYkjgmqfViveanSP/jA9rMFFfQgb2DbgCrFTaP73CfzvCWiVAgAx
         39cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738067295; x=1738672095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luRKEKbq82l6e0SLRoeOQ0VaHq+8zLzvBD0aSrnWgN4=;
        b=nrbbdKPmtdzNj2Lk+TsqHQft2rvUi3Y22EXTnrqSHop6/2SXPEq3YXzro3bxmKG5or
         x2p0R2oR4huxJTyuEwtTLSUNlWY1/+YWW5XNTKErRNn+ItMdWqnGDL6tuhDiU9m8ejhj
         Kye9cECiExi4x3JkX991eqdxXTaVnRJ9v/PDm+FL0oCQDNQ7uro+MydXL5cuaHofAFrX
         odfeqIpEj5YbWGwOyg/6TY06revWX0TZYPpKsQXvj2lUbdEh4dhzGGZJ18HN7S3lCgZf
         fxgNwoFYD5OJzJ64QSo06TclZBgyUfijjclGXKE4ETGMy2CLuyR4qd5b0pBGP2llbf5O
         sfVw==
X-Gm-Message-State: AOJu0YxxDh0j9pC2vWEvm87nRP0ogAhmuc/3WrTQuKXsF9+OT9c7X+3f
	NNEAA0azeJF0f0NWiKvg9wvbuVNrLMRNnc3Ffi+obodZyDvGjS27lxZObg==
X-Gm-Gg: ASbGncugmgy7k8X8C5L+4yReCliR053tiHnNlZ2YXaYqadvYsQVuYyXMCDqyVY3QlTj
	0nu3RCtpo8uwW7yoABrbtTuXw8l9mAp/UeqQzp9CaoOH4/WBjVPI8ush0X//bUTCJ2dCH9DkMY/
	XoB3xgifRXgjsZaTpLhpGPH7u4Dt8HsRsiyTyDeu3ToE1h/6fy/4z/s5EjIvIlEQu1cMOOZoN37
	Rc0WMWUW4vQxCFYDDWebMKnVRQtVprh1FdJVXEmGzfWGxGYSRpTEZfUNPeFIDfr5nAESEppHXTV
	mhtZHk1XXpxnKGy+oCzXO/vLO/Hg6yfMgTSLzYN/QVJ15hbp
X-Google-Smtp-Source: AGHT+IF5SZZvJU5CxFjw+oYCrVbqVRe/D6kBpFbCFSJgtvgGgZKHR6e8hE4Zw1O8J8wNYjq++2iYXw==
X-Received: by 2002:a5d:588f:0:b0:385:f220:f798 with SMTP id ffacd0b85a97d-38bf5655b12mr38059109f8f.6.1738067295019;
        Tue, 28 Jan 2025 04:28:15 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188a61sm14200011f8f.52.2025.01.28.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 04:28:14 -0800 (PST)
Message-ID: <ef779855-5513-44b6-8b85-f4c07fa69756@gmail.com>
Date: Tue, 28 Jan 2025 13:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
 <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
 <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 12:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210322

2025. 01. 28. 12:57 keltezéssel, Alexander Kanavin írta:
> On Tue, 28 Jan 2025 at 12:53, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>    Which is
>>>
>>> - written in rust
>> rust is in core.
>>
>>> - needs libclang.
>> There was a motion to merge meta-clang into core,
>> what happened to it?
> The effort to move clang to core is ongoing. Patches were posted and
> reviewed, with a significant number of issues to be addressed. If you
> want it to happen sooner, please do help out with them.
>
> Even once clang lands, we likely won't re-enable signing by default,
> as having both rust and clang on the way to do_package

That's bad. This would make some packages in my meta-clang-revival
layer non-buildable:

* older versions of intel-graphics-compiler/intel-compute-runtime
    from meta-intel need llvm/clang 14
* python3-llvmlite (dependency of python3-numba) needs
    llvm/clang 15

With Yocto 5.1 and older, all 3 libLLVM versions (14, 15 and the default
version from meta-clang) can be packaged / signed and the library
packages can be installed in parallel.

But clang and e.g. clang14 can't be both pulled in as build
dependencies, since they conflict.

>   (which uses
> bits of rpm) will lengthen build times to unacceptable levels. I just
> posted some unfortunate benchmarks for rust-native in particular. But
> you might get the rpm signing oe-selftest working again.
>
> Alex


