Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DE6F5A8CC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 23:11:14 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6830.1776725927579906698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 15:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=QIfPbfjh;
 spf=pass (domain: baylibre.com, ip: 209.85.167.182, mailfrom: dlechner@baylibre.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-479d68a90a7so698589b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 15:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776725927; x=1777330727; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBwb5DHnaw6Kqy1D5beE2OV+bmsjw/VjFy+XD1uTLM8=;
        b=QIfPbfjhLKkvFJg7H2L+puZdMis9QE96Y6gbDNpTUJ8MRL/G/kU4XZmr1dfNTqntS2
         3YjJcItV+9MJdDSWHj6ppCqR8CW5f1g9Ju3xgCA+wnpauqvrJfR2EWtsgjZfa5Vi+zoD
         hIFxsxnz4P6GD3PDuVJrmC+wXcNeL11avJPZ44wy/WK335rhE1gKQk4S894x0Zg7oooR
         Ll1k7wVbXlMyvVtU4mPP9J8xGtM+1XiH7sABafyyXLy/s+Sdi5IvikCTbuKdU6cZa2NT
         H6vbMKD00vrnuhdh+Q0AeWjvc1zpqtdL8ZoN8vWormhwq80hbTt/I88AHrXvP9Wj04Gi
         8VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776725927; x=1777330727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBwb5DHnaw6Kqy1D5beE2OV+bmsjw/VjFy+XD1uTLM8=;
        b=a0Ag54S8I+Jw82VH6o+eqnPGtFhSc43gEsjhF99Ri/uPUICLiR5rBYg54XkJJOviQW
         y7qC9LmV0MGnaP/7aOr3B/9dOGs2Hh+tpiaDYlTySMXObWIHNzzx71ppXWHnmt0AxYrp
         cenHq5OOqmU4wWcTkcWpHKgLWv+lWiuIENbIIoeG4stHOem3QBilTHASck70E4o8WlCx
         ACJ/G1BppEKp2P/BmF8kF2WiiOymUJ7eEVVzDTe/M1cjAqgQMjeiHTnQp42FQlD6stDv
         cpWH3XNACToI5X13sfbAUQezYZCHs7ABvZD+k1JJjzpmIG+9K7tlBVybCQoBisjfxF2d
         HTUA==
X-Forwarded-Encrypted: i=1; AFNElJ/eEJ0MBItV/13JDa5ECRobvNsX99ERoq2C0YnC0k2mmNwtNQuC9qOEhbEljasD07IOJb18qjXpfHNBIcRzYOi70Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE3y/vJ/ti+0oE5gJTIxMh6CoJ/6DvD5UmIKjZ4pq9iHlJMVqH
	J9DwGv/LLWeXWg0UsBCUXGAvqJ7/nb9sUEefnA9R2XHCsd6mdpBesu33dCaFXKdYvGw=
X-Gm-Gg: AeBDieueA+neQ0UvtTWNdUX+/ZDI0s1bSG1fGmfqyENyia8ko+vjNH2c54s7z5z837n
	PY8fWm3ylDASYKxXpiLy62o9xU9TGA45cc9esD0IdUi40ZqMvR0UfmLI4ibY91zTZ6CRHjC3O+Q
	GWAMtEQI/TnjCYe/wRPIybvqO+cG1bp0yGq6c1adnXOQDsdBlAoI+eYh4AGgIs5kMiZYyXUutqe
	x89IvxmEtHxPdlCmq4q0y9sF8WC43hVs7I1aOBEtdKz2C/1xk7K2iBSueGIwsBxGmOybpoDAV3F
	Eb/IirE3Ca69vET4JXiOExtCvofIWC1Rxy61OWB4shz4II4OpX0Ldz2oBXIIs6dryCrhSYfCUFv
	ZJPNr7wxrLV8hyxEEtC41vVjncJI1yPCixFShmJQShbqfgTB2mKcecJaM0PDyihgejJVXuy2cSW
	1mKmFmzmk6QQROE4UYi6ZZeFnC8WuhM/zGalIg581h0cDBC0qDJ6PMRWGyOivpDm0JlxCquvXDb
	ymXhaKgVdd4
X-Received: by 2002:a05:6808:50a9:b0:463:faa3:8dda with SMTP id 5614622812f47-4799c958f2fmr10259586b6e.13.1776725926821;
        Mon, 20 Apr 2026 15:58:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:49fb:b337:a968:94e7? ([2600:8803:e7e4:500:49fb:b337:a968:94e7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-479a02097b6sm7750684b6e.14.2026.04.20.15.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 15:58:46 -0700 (PDT)
Message-ID: <ec9b6639-00a0-4fc4-aee4-f57f9cb26a5b@baylibre.com>
Date: Mon, 20 Apr 2026 17:58:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: mkeficapsule: Add disable pkcs11 menu option
From: David Lechner <dlechner@baylibre.com>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>, u-boot@lists.denx.de
Cc: Simon Glass <sjg@chromium.org>, Franz Schnyder <fra.schnyder@gmail.com>,
 trini@konsulko.com,
 "openembedded-core @ lists . openembedded . org"
 <openembedded-core@lists.openembedded.org>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20260420083850.8504-1-Wojciech.Dubowik@mt.com>
 <61daa047-74f0-4a76-a61f-de54ca4b716e@baylibre.com>
In-Reply-To: <61daa047-74f0-4a76-a61f-de54ca4b716e@baylibre.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 23:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235588

On 4/20/26 5:15 PM, David Lechner wrote:
> On 4/20/26 3:38 AM, Wojciech Dubowik wrote:
>> Some distros are using gnutls library without pkcs11 support
>> and linking of mkeficapsule will fail. Add disable pkcs11
>> option with default set to no so distros can control this
>> feature with config option.
>>
>> Suggested-by: Tom Rini <trini@konsulko.com>
>> Cc: Franz Schnyder <fra.schnyder@gmail.com>
>> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
>> ---
>> Changes in v2:
>> - make use of stderr more consistent
>> - add missing ifndef around pkcs11 deinit functions
>> ---
>>  tools/Kconfig        |  8 ++++++++
>>  tools/Makefile       |  3 +++
>>  tools/mkeficapsule.c | 17 ++++++++++++++++-
>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/Kconfig b/tools/Kconfig
>> index ef33295b8ecd..ccc878595d3b 100644
>> --- a/tools/Kconfig
>> +++ b/tools/Kconfig
>> @@ -114,6 +114,14 @@ config TOOLS_MKEFICAPSULE
>>  	  optionally sign that file. If you want to enable UEFI capsule
>>  	  update feature on your target, you certainly need this.
>>  
>> +config MKEFICAPSULE_DISABLE_PKCS11
> 
> Options that disable something instead of enabling it are confusing.
> Can we make this MKEFICAPSULE_PKCS11 instead and invert the logic?
> 
>> +	bool "Disable pkcs11 support"
>> +	depends on TOOLS_MKEFICAPSULE
>> +	default n
> 
> I think it would be more convenient if we did not require PKS11 by
> default. Otherwise, everyone using Open Embedded that doesn't have
> the "p11-kit" PACKAGECONFIG option set for GnuTLS set (which is the
> default) is going to get a build failure and have to research this
> and find the option and modify their config to fix the build.
> 
> It seems like it would be better to make people who actually need
> PKCS11 possibly get an error by default instead and enable the
> option. This is pure speculation on my part, but it seems like
> this would be the smaller group.
> 
Or maybe we could avoid the config option altogether and do something
with `pkg-config --libs gnutls --print-requires-private` at build time
to detect if `p11-kit-1` is used by gnutls or not?

