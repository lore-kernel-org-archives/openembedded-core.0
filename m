Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B926EC021B5
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 07:56:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.42393.1740211003483973351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 23:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VXVaPc07;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so16935615e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740211002; x=1740815802; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csCWd9cWTp4j3xYrj1YO3z9AkrYR1j4S/HyGO3/Mhr8=;
        b=VXVaPc07rxtkv+eQL/yCcxLYUR8GN+cQtXNt9xNQsdBK50EFm+hJ+/Z02T5nza94pX
         iYjYgpX4+vEK9d0zfvkRDVj9ogasvKUR4NLjHgqd7MI2pJEwSajRecmy0/NTz2zB5bjA
         P+xv5UZrbIIIZxQUat3RScwnTd9eHjrPOs2yKYoIDRpfMi1AEyC6JqBIPnnVY//VeWpT
         hSYPiNxH7Oa7SNYkPIEsUUzMph02KTQOhA6FIHh4Qimtx4EeB1hQqLIftRRIz4loWSMn
         283ezdki6UvgDTJfdxEaFN22H65ZAUHBfA882bkm5aKLt1pgg+EUP8+W/iMHTOmL16ea
         5n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740211002; x=1740815802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csCWd9cWTp4j3xYrj1YO3z9AkrYR1j4S/HyGO3/Mhr8=;
        b=Jc8vEAzCmustV4WY+sSfTAjqDfH6XutJHxGz85k0Z8nyTwhuuM6LWXQhdyZVEjwBZ9
         EuSex/PAo5AF8ptFmK4KNjNfKvT9KiIzfkewzgrgZUKgMlHAh5T0gWN8TOQnEdwq09Av
         aKen++EKGmYMMYWeCTdBmIFa3Ybgyb+H0A46d6CT2hTV0bCXwIaJF9fVb30oz79jAngu
         L0W6n4jQaFkzo37PVOoS0cfW2wr8ACQREm/Onc5DeixK67RS3qcUCZZMt00ClgVLRN4x
         P6To0VOKAhJAC1uj94/Oe70+uQwxIiRZX0jOjIZ4QeYnlRovgdXfNpNOC2nDzRwkLSET
         rWsA==
X-Gm-Message-State: AOJu0YynjS0XxONbZecNXCzBglq8Vwk+Nxne7gQTFhlswF8DS3X4PB9t
	PlqHd/iDiuIbkozgTAX4OdcQUcM6N18mlVg/O4n9AVbQgFi3d5JH
X-Gm-Gg: ASbGncv7Zn5vbG9ZrUkHg97sm5/wO1tUQ/53cbe0IosYSAcRiTiiXZQ+CQ3mdAvSLmU
	F6YV3zb6gpCIOVCuee5hfgl2sZ5qGfGO/007xNvl9R8E7YwoockR0Q7ryy4pqU/hec37HrVZtv5
	keIcZrdxskMyFLf0jvjWJkE/uqbMsTFxmIPMLsZhAFEp724kS7ZVX4PNrutg9doZ9RIYfXjxDuj
	y5HJjnuHqFFFSTm8j1aDv9Fjcbv1xaU5qCCZYlSaYrPK5X3s59mCwiCq5FD0LArs8BmQK42624Z
	AngFXwVRH5MJfWrIg5pXaXdtzNt1TwbczDaMoFde5u3IayK1L5MV5QzxcnU=
X-Google-Smtp-Source: AGHT+IENWTlOlLFtjhB/QFr+NJFZTf0lo9IJEGBD6BHz3IQJeMOfNX86Vaf2EHZ/Au1AAC/6107ZbQ==
X-Received: by 2002:a05:600c:19c7:b0:439:a1c7:7b27 with SMTP id 5b1f17b1804b1-439ae1d7c76mr43601845e9.1.1740211001417;
        Fri, 21 Feb 2025 23:56:41 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm10832416f8f.21.2025.02.21.23.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 23:56:40 -0800 (PST)
Message-ID: <bc48230a-d3b5-4df5-b282-e3a883f361e4@gmail.com>
Date: Sat, 22 Feb 2025 08:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12.1 1/5] rpm-sequoia-crypto-policy: New recipe
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <20250213152144.4016665-1-zboszor@gmail.com>
 <CA355874-B96E-49C4-A338-06225BDAA8ED@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA355874-B96E-49C4-A338-06225BDAA8ED@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 07:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211818

2025. 02. 20. 15:43 keltezéssel, Ross Burton írta:
> On 13 Feb 2025, at 15:21, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> +DEPENDS = "coreutils-native openssl-native make-native"
>> +
>> +inherit allarch python3native
> These dependencies seem unexpected, and if they’re needed then they should be explained.
>
> We assume make on the host, so why do you need make-native? If there’s a good reason, please comment why.
>
> Ditto for coreutils-native: presumably there’s a tool that isn’t in HOSTTOOLS?  What tool?
>
> Typically there’s no need to inherit python3native unless you’re also depending on python3-something-native modules, as by definition there’s a capable python interpreter as it’s running bitbake.

Thanks, I will send a followup patch after testing the dependency changes.

>
> Thanks,
> Ross


