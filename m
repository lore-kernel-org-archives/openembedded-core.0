Return-Path: <martin.vonwillebrand@doubleopen.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B264E99051
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:46:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151333.1775807188872914121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@doubleopen.io header.s=google header.b=eOiwfBgB;
 spf=pass (domain: doubleopen.io, ip: 209.85.167.46, mailfrom: martin.vonwillebrand@doubleopen.io)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a10d130b37so1386291e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doubleopen.io; s=google; t=1775807187; x=1776411987; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fiA5XKgJ7IxzKbwxICTgEh7o7Tsn1XEQ4dW0NUtWm8=;
        b=eOiwfBgBV7pwKsICuh0s51T+ydLmy4GqdFc86ukEmjAmkiwz55NvneA89Fu5zGZlAb
         3cdkpYNYKb9lscfoI/eS6QXDjCKG0o2WUClrYW/VaTQxvQvkdeRPs0DVn7LUnTVf3L0R
         16psyhwws2bX8652GjeazxEevgjsw5JpmD6l8UJJa1uk5bVp9hhwM+LyRUR8V/Psp32o
         PfSIFCqaHvfZ6AgXNY+1yGznp4fDdo8Sbha/ADZoEdwvcyqu/FhOR2bX+lCyQPPGXThw
         pXayWBsseUdfLuL9js8zRljzW6Kmd2+hvxtgSFKGlFQPuDMXWBMz4JRjt1Nhq3bWYtIa
         ctBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775807187; x=1776411987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fiA5XKgJ7IxzKbwxICTgEh7o7Tsn1XEQ4dW0NUtWm8=;
        b=lZ/6ykohXVNrDG/gMI4JHR8ARe162DuTcfe1qIn/NWopH2KTLFv40qVHUK2PBU8JPC
         ztv8dSMrKWFw7l+IcHt2WDWZjCEv/7EglIJ9LzvzEjARRX5grt1IXdaedKII50wzPRR9
         1Fzuvx//r+pyrooJj8dmt6uinFrfwHNtFMAHAm7Su+sKC7MeawQ2AW62bIqrPhoma6wV
         kGDDf1NF3zXTV+MRFC1ICsk757K4BcjBF/rEdM65544/q/nnRHKE9jAo3EqPivgCbB5v
         HOaC/VWFxoyttOWI+ZANdVi0WHQlsLoezE2sZ7asSY+E9RBEugZE4mSRwLAm6T/SzA31
         19tA==
X-Forwarded-Encrypted: i=1; AJvYcCX+xo3YxC35mmiMPU13u7iz4OdTy3GWpoQ5vsjewnu7vZmLOPVKk8P/qmFHaAwhUQ5YKI4BFaM5A/0+00kqpVXSvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPPltm2gGGeC19OkCA3D2bJGQqwy/F4DH8lofBpawtTenuprPo
	BCNi0fYZ4SGpz5/FJmA2K9vfYJfoomB1XyZ436lSGoc15+tOnnA+8p7bFSFqNPJb1B4=
X-Gm-Gg: AeBDiesvS50/XMKDBg8hCmDa89m73WHur1d2Ca3nnDYyrKhYSkL4f1AzQSmSFeBGcPW
	iGiAKSLyGgvHHMEqYlEt4h5+PLYSqC2Ttn+zUkzTgmUUR8dbA6unKfb4A1reUdvJBuW1pIZjsI0
	SFLmrSyKBzMFQeF6LM39Au383tZ85CVGmt3CFKJ2Vqq4H2v4ZT/5fBwJyjoUtehrdpQ57BbI2Pw
	CEbRlCFnC+a4dDcNR0W9M3ROhplgcT0+jJw9B+uYaxEbW/8gDE40PRh++NGNnrsqPXB9ltpEwvh
	yxN7kKM5Yv7z3DM252aVyfC7ufwHzpwn8EwLftZiZIhSCfbscDCQaSf5hzL7ZfKCTGAHUhZhS55
	wWpf9B/R7blylkqyUyL5lKa2kzr9553w5aCAHfhx5egvxsw+ArcFxdGIwcwpd6cZ6lAfX/h35A4
	mtW5G0/eppa5yIch6oQla5lmUUTGBWKlcZnOo9hqTDKFFRJ3zDIHJVHm3GXGzx6BFi/r0QBdab6
	3EAh6j8c+cdS0cpDstOIWo=
X-Received: by 2002:a05:6512:61a2:b0:5a2:7cde:3440 with SMTP id 2adb3069b0e04-5a3f0879215mr672453e87.17.1775807186766;
        Fri, 10 Apr 2026 00:46:26 -0700 (PDT)
Received: from [192.168.1.167] (h-185-57-5-116.na.cust.bahnhof.fi. [185.57.5.116])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86784sm539917e87.8.2026.04.10.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 00:46:25 -0700 (PDT)
Message-ID: <61c75c3d-39e0-4ca7-9c65-2e56b21ae02a@doubleopen.io>
Date: Fri, 10 Apr 2026 10:46:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] Adding PURL identifiers to SPDX 3.0.1 install
 package elements
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Stefano Tondo <stondo@gmail.com>
References: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
 <f4bf51a0b26fcff35191bcedf8e51c09e27b856d.camel@linuxfoundation.org>
 <171ed7c8-e488-4113-a64f-a55395dccd9d@doubleopen.io>
 <CAJdd5GZRsW79e-t6YjMyb6HUsE-Dszu=dW8b7H+KvVG+bvU3Kg@mail.gmail.com>
Content-Language: sv-SE
From: Martin von Willebrand <martin.vonwillebrand@doubleopen.io>
In-Reply-To: <CAJdd5GZRsW79e-t6YjMyb6HUsE-Dszu=dW8b7H+KvVG+bvU3Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 07:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234995

On 4/9/2026 4:21 PM, Joshua Watt wrote:
> Can you try again with spdx output from the latest master branch of yocto?

Hi Joshua,

Thanks for the pointer to master — I've now tested with a fresh OE-Core master
build. A few follow-up questions:

On PURL: I can see that pkg:yocto PURLs and ecosystem-typed PURLs (pkg:pypi,
pkg:npm, pkg:cpan) are already in master — that's great, and addresses the gap
I raised. Are there plans to backport this to scarthgap/5.0? And would
contributions toward that backport be welcome?

On the SPDX output format: master produces a distributed, content-addressed
store rather than the self-contained single-file SBOM that the scarthgap
backport generates. The rationale for the single-file format in 5.0 seems
clear — a self-contained document that downstream tools can consume without
understanding the Yocto store layout. Is that self-contained output planned
for walnascar/6.0, or is the expectation that downstream tools will assemble
the full SBOM from the distributed store themselves?

Thanks, Martin


