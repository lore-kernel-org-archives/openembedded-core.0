Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3BEC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 06:57:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4762.1738997856793278361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 22:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h7yicoRI;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43622267b2eso27482965e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738997855; x=1739602655; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usjJ8KqCrVpmqR/DULwVlmTd71dIn7NdtMaQHZNbdHk=;
        b=h7yicoRIwHiTy0MON1WgZJ55dxV1A+OvmjJOla1I1pxsVd/OQZsrzHTuVrvRARh0XS
         0RdZ6TXXcNJ2mffhLpWTaOmzS3j6Sp5r7LCOgXHm7ZCnzVbn1HMDjyCH+Ui1GJl+rwLw
         Ua3donMh6Vq16pQeakmbZVGBjEIGSGEENBV3J1ikQf6OUTZU7FXNWJc3wKMJHLx5jewK
         cvvyklIHfJ/ltEc4QMXqLVbUUmMBNH7m0MZipM9rYwvBFL++YQBuhG4SFiAIEilX6Qcu
         iSr6/OkRJdnaT9eJI23BJvzVmPR2ipsUTw82rYzCZ3mC3d3/+uvP9CGMtI8ZHxXlwM2e
         BmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738997855; x=1739602655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usjJ8KqCrVpmqR/DULwVlmTd71dIn7NdtMaQHZNbdHk=;
        b=N50WsDpPQXLWaFoWtuScCJiAVT2xVD2jrus2H+7vsOEgkqsnu7Toct4Jkdxqz/qG/K
         SQQS+WmPaXs7dYZLOC3lT1f2bSR3VrFYGnisvW9PfoeEOVP1rJ41IGJ3NHR4G0XmpL7B
         aAr7dqHVeYcdUe/XnU37o1S7cHk2YI7UJqYluSyO0qAETL5E05Ahk9jbmB0bsS99VtLP
         dPoXXA7F4ERZ0sb2A7uimMqlUqA1lv4WKbbu1TqYhEk9wkV3iaHyjVn+vmdfqqNlS3zk
         SO/twSyZ3w9qCRBY9/J+P6SkH691l5EiBg7o9rQJBr45fDeF3jCzG4FGkWDv63P6NlZG
         3IHw==
X-Forwarded-Encrypted: i=1; AJvYcCVif3iJimwtimDDm7vOfPRoZZI4b6OscpiuJAPzJdspGsC0yEKlPiXyCjSTerBXzI6JcWA1sQ/Ub2EgWQsBhf/VXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQ0g2Ih0mpklubIe2N0TBkuYPQvTZ2McfJJn4xezXtQnq06sC4
	j1WWPr2tit6RsmnPMNsYFUeuSpx6jLx+zI/TKRhyFL3LPqBNL0rO
X-Gm-Gg: ASbGncu75oxXXlX/emCFmYHz29oQyVSUxXax5LHTI2+btuOqEtqniqkEgK5S+SRa0B3
	48/EgRmWMO1vIHSRxXom12cuKs85GU2Pe94gOkBVP85VQ2X0f0CjzneXLr/8Gs19HUydE+F24h9
	OwGu1Z6MLMuOL+j4IZvjFnza/RVV1hsm5Q6vKBt/P1F4RwVj06CnuV/Z+kUU4Tuc1k2Zv66+RJ8
	eoK4WS8sayrtE/vy19XhqjNijslatHSYWSllB8p8Aau4/vKHOmZ09A/Td9s1KwJPc/3LyYicv4D
	mngQCBMCz/jjA9vfoKYSx5v+c2BI4ePEDok2iCMl2QNZrAi5
X-Google-Smtp-Source: AGHT+IHbF8NYXHxmKip0B4HjTLHecq9tQQap4UnzOZfjf2Nbq33vBz3+it+9CrmPsJJvlg1W5yJ5AQ==
X-Received: by 2002:a05:6000:1789:b0:38c:5e03:5cd with SMTP id ffacd0b85a97d-38dc8ddd8f5mr3773269f8f.19.1738997854824;
        Fri, 07 Feb 2025 22:57:34 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94db77sm111978805e9.15.2025.02.07.22.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 22:57:34 -0800 (PST)
Message-ID: <282eb376-6e64-4e06-8ddb-19767a8b3138@gmail.com>
Date: Sat, 8 Feb 2025 07:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v9 1/5] rpm-sequoia-crypto-policy: New recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250206114547.3441965-1-zboszor@gmail.com>
 <3e8003570397e8eb864a55cad9a2f8668d114112.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3e8003570397e8eb864a55cad9a2f8668d114112.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211013

2025. 02. 07. 11:25 keltezéssel, Richard Purdie írta:
> On Thu, 2025-02-06 at 12:45 +0100, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> This ships a crypto policy file for rpm-sequoia.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc      |  1 +
>>   ...1-Make-xsltproc-settable-as-XSLTPROC.patch | 43 +++++++++++++++++++
>>   ...002-Don-t-use-hardcoded-python3-path.patch | 41 ++++++++++++++++++
>>   .../rpm-sequoia-crypto-policy_git.bb          | 34 +++++++++++++++
>>   4 files changed, 119 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
>>   create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
>>   create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
> The new recipe doesn't seem to build on musl:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/969
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/985/steps/11/logs/stdio

The problem is not musl per se, it's that one of the
python scripts executes /usr/bin/nss-policy-check
which is part of nss and does not  exist on the build host.

This may be patched to be used from PATH.

However, nss is part of meta-openembedded.

Either rpm-sequoia-crypto-policy and rpm-sequoia should
go into meta-openembedded (in which case the signing
self test would rely on meta-openembedded or moved there, too)
or nss must be moved to openembedded-core.

Alternatively, as the least intrusive change, testing the policy
with nss-policy-check can be omitted as a Yocto specific patch
(because we can trust Fedora's own CI for this repository that
does check the validity of policy changes), in which case the
current setup can stay.

What is the preferred way?

FWIW, I tested the last method (patching away testing the policy)
with /usr/bin/nss-policy-check renamed, so executing it would fail.
The recipe was built successfully, with setting TCLIBC to musl even.
The generated policy file is identical to the one seen on Fedora 41.

I will send the v10 series with this change if that's acceptable.

All the other logs below seem to hit the same issue.

> and the policy recipe is struggling in world builds such:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/958/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/956/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/956
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/887/steps/11/logs/stdio
>
> and in reproducibility testing as a build failure:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/993/steps/12/logs/stdio
>
> Cheers,
>
> Richard


