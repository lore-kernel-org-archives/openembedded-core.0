Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B29CF6A8B
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:17:40 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2870.1767863856931592317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=aykkT4B2;
 spf=pass (domain: munisense.com, ip: 209.85.208.41, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso5784022a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1767863854; x=1768468654; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBthH/UYohXYN4O/9gkEhPdrT2YBB8XCkOByMyU3dkw=;
        b=aykkT4B2F4Z9nTpxa/ZX2aE2xWVHt8j2V4WgkUQ1bIpO+HLMC+c0zSvEiWme9qTu5s
         BXyuTAnDpBWEQfyedKvPw3ep6aMiOq+nrExOtsD9RzHW1FFfTmJtNRq9nNwkpFT9NA8U
         20tgU+ImXAe41XG7jMCp6xgE7XJfCm8B/dvl6bO3Oxp6x6oa9laYdBk+Up2rX9DGxuSf
         TY8ayPhEIN8w5mxpva4dFTcihrwaA+1xI922kI0iOPsNVHZeVokKAhWWF5JNs5Ugqtu6
         ipM0nU/KjtwS7sCzYYiUioxg+9h6tAc/IG+UvvwbilQUcFKobFujp98UQesQAgFi9NDI
         xZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863854; x=1768468654;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBthH/UYohXYN4O/9gkEhPdrT2YBB8XCkOByMyU3dkw=;
        b=SMQ+U/m23btDwiHRuBa2azZq8Thy5OKpDv70WKIDn3NdusYBf/lA8BC/eN7Xme5xOU
         89KKUA3WxPiWlund/UUhDCGF9qh8x/olK1+SCCQb0KY7z489DDf/cALmcHVBH4TEFd5T
         bIItR0ZRhyf3gVG3WU7XkkUvXvXdhKzM+l+TWaB1x8o+V02tTVycsQYN1Fl8Wj0Tabyg
         KZOCCJeBtid9jDeGIoabZ5PT+tdzHm0laNjL4xr74mKWN9AjACDw6Ty8/ypP5T09MpZ/
         XRsPTPN0JQfQkJlE7xww2q7SpcshDRu9BkhobOp3i8fblO1xCLn/7sk9/H7QsyKGqV6I
         KJQg==
X-Gm-Message-State: AOJu0Yy14xzSJvtvaZ3cnVZyjqx4iOlxfiLLsVTH67pKpOt7piRbT+ck
	bo7iLY9a8I/IZ3FVfkHoOVIANNU10B4A3Z3LxtBGmBoIBIObVkolf1GpRXZwmKakKyI8c08UOlq
	aBsSQ
X-Gm-Gg: AY/fxX7NXVJ76u53j5hI67uA5lSKvY5dDWdxi4ecwvPvPmW3GdATQy03Z7GuGnF0AfE
	pfKsUuVrh+bsyRAiQIRGK4R3yq7dFd7dbx0pDhhbwnQcjvB1tOtug8kC35mRdHPn2zoinyS9fbg
	YgQ7n7H8V0aoc6oZ7xEE9oJJfOX1Ad6Nk6YhvCnKZ2tcEsGDyeC+Xchknyl59Gl8EqlJmGqVrAD
	sunfH2zbsCt79Q6+Zl/604O6dTftSt0Oz9oGM+qZ1q/zogu2ioeGsu6B4uI3J2e1q3fA/rebV8k
	MdW9Dg9vBEBt4rVsFCSm+VmZzcKQMTbwLBjB6uxHtcX1opZJWrnDWUGjGmHaGq+O6ehJiktfPhf
	YzRmO/9u8zktbLYDBb1mkFeSCtM3jbsUOxPiZxexnpjBUSZq+yMJD4i8tWtT1VdIEuDvCt0DIlC
	A7j+VtRbp5NITKb5acC05gzmpyeWFxrGvE60V/IBeWGG0bi0ghDOHU1RQi9yFKwRKq4Uo=
X-Google-Smtp-Source: AGHT+IGQB7OcUroybq1jLXhqaE9Yima6a/TOQ26ba8yLxXWi2iehG6y8GqmtOomG9TWg2AWf223lmA==
X-Received: by 2002:a05:6402:5201:b0:64b:608e:cea1 with SMTP id 4fb4d7f45d1cf-65097dd29admr4253442a12.1.1767863854352;
        Thu, 08 Jan 2026 01:17:34 -0800 (PST)
Received: from ?IPV6:2a00:1708:3ba6:500:a39b:9f3c:f7ae:9ede? ([2a00:1708:3ba6:500:a39b:9f3c:f7ae:9ede])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be641e0sm6921235a12.22.2026.01.08.01.17.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:17:34 -0800 (PST)
Message-ID: <6b3ad1e0-3bf1-4344-9e4a-c5ac206b3f60@munisense.com>
Date: Thu, 8 Jan 2026 10:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Gijs Peskens <gijs.peskens@munisense.com>
Subject: Arm32, Fortran mfloat-abi flags not set
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229045

I ran into an issue compiling Octave for an arm32 build, it seems that 
some arch specific flags aren't set into FFLAGS (mfloat-abi for one), 
which ends up causing link issues due to inconsistent usage of VFP 
registers.
I'm not sure where the correct spot it would be to fix it (as a 
work-around I've hardcoded it into my overridden Octave recipe).

Can anyone point me into the right direction where this should be 
applied, or send a patch themselves?

Sincerely,

Gijs Peskens


