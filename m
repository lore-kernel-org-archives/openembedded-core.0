Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F53C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 13:49:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.12790.1738158576522005038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 05:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ABTEqN9I;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso3818950f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738158575; x=1738763375; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7kVnPNqikEFEiqn8mupr6R5iB84/0QJ9bpF4KKUOCo=;
        b=ABTEqN9IZc2D+D3ZjaCyPboAqkyyMDCabKYlVhpxv5PuKRZB7c9Tvx8z/3HFa0LlJa
         +EaJqbk/Dio376fKriGWo8Vf8/CmSfn2elpjzgxvWmGlQtl9pI/7XM4cQZWisp76Z7pD
         39uOr4XiL27Z7qAIFMZTj9d1THQ9m3vehylSGliFcPWSdJzTXGig+lW/+mPrrCFIhLoy
         lRl2fIXhE27fuZHG0ks2j/+uoQfV4T5ZZ4M7hYEqImLHo8ZMn1JYVKcwCRdYuBvm3fFI
         Nc8yYcgMv7plo1VBVYpYPZXAJH+dLMUDfRM/t9pJ+AjP9Ri8lM6TXuAuwUReQ1BXAMlK
         Y9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158575; x=1738763375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7kVnPNqikEFEiqn8mupr6R5iB84/0QJ9bpF4KKUOCo=;
        b=eianTGu/MXzwBWOHsx1ghsuXqaAotjVMF9fjacPmxscy4Gp6X4OfyZPZIs9pkjYrI1
         QL7x1++b8GRzqHTG6j9qtpzlZ7CEIMRI+1CLIrB/SfqC+MJqk3GW4t85o/6P5NgEgeyt
         LYeOBLEdf5ljiFRCa1HopusHavo/oKuXfZauiSzM2isJxuvjBsLa3O83T5PJD8KZseJ/
         YMUKyzIlkkbs2CN4+UXK25SaBttFilAYdm0cDLs9+zSF7AqylDIcCPyMYFE4TtQTxv9N
         NHT6RY4rLsxjYGnvBdQnIXW0SFqXMKxhUSlcZVyoaEbpFMKkK4o/0Shu1wHIef9Wi6J6
         2/tg==
X-Gm-Message-State: AOJu0Yzv4YhyCHBtXE0OLh/g34RtAGFMMOnglb0bOwfWIEnTLO4cTYFJ
	N/yikpyqYn0tmqJx0Af8SXzF0g4i199fP1QK05gwk1VS2Ncozh+J
X-Gm-Gg: ASbGncvuFbGWE0IW4d9VnFIHyoFV9PWDtE98JDzyQkjqqg5VfnAPM2hlTNudropUzM3
	1ZSPGn1+2NPWmpmfrhAkswtue78lHAXxBvw/a2/ijYsY2FCwPnstdNSp/0tKPoSIhHNUTIQARWv
	7/Q5/2EjVDxEM9vqyLzQaRSVxEi20AsLCjBU0NayJaoH1TvJkiG2RZVVBiIDpIXt6epma1bvYfs
	eXQDSiMGdY9ZtNJWKCi6Zunmwrvdjk/hO9eR85Y8PPu8tg6Jzy134+4ptB8636Ikz+fwUVhFkAO
	n/h2tIttiBinVgoq2hDcX8cSnTVnuM5HRBcfmQZxOjEjogRc
X-Google-Smtp-Source: AGHT+IHZxn+0uVTOjnpWpxe82/Y1No5i1jJoH7i+B20s9VJ24GvjcXdZe4g9M9I1pUX7Fbo8CX/Gtg==
X-Received: by 2002:a05:6000:2c3:b0:38a:888c:679c with SMTP id ffacd0b85a97d-38c520a309dmr2956008f8f.42.1738158574577;
        Wed, 29 Jan 2025 05:49:34 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3bacsm16869677f8f.83.2025.01.29.05.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:49:34 -0800 (PST)
Message-ID: <7a3ff3d8-3406-47b1-99f9-b857a31ebd18@gmail.com>
Date: Wed, 29 Jan 2025 14:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129124741.4115324-1-zboszor@gmail.com>
 <20250129124741.4115324-2-zboszor@gmail.com>
 <CANNYZj-123Mqr8zyCjmtqyE6BYD2R=wVRy+5NMACu18KAdidSQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-123Mqr8zyCjmtqyE6BYD2R=wVRy+5NMACu18KAdidSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210384

2025. 01. 29. 14:05 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 13:47, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>> +        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
>> +        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
> This and the other patch are now fine, and can go into testing. But:
>
> - bonus points for updating the signing section in
> yocto-docs/dev-manual/packages.rst to mention the above
> - extra bonus points for updating the 5.2 migration guide in the same
> repo under documentation/migration-guides/.

I am on it.

In the meantime, I am running "oe-selftest -r signing"
with the patches on my box in poky.


