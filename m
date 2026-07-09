Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8C0C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:28:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3146.1783578506833294332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ncaBWb3u;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c59f740cso10925145e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578505; x=1784183305; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/j7AX2SfOVBp3xiHTQWWXoHKUEmkbmoxMVbHf517gk=;
        b=ncaBWb3uo9B/PEQOHYQ6NnzE9FKV0DPxdnKCeL3gsqOnlD/iO1jfWurjLBj79f+Ce+
         jTvX/4lnxg71vgVpVGzFAeWQs7YSIJTrLheFTzW1HjsLcVet9EvJpcwOmQgAcLADyiqP
         5pXScgCi9qs8/F9lMFazmNCp3nA8C9KxIXnKK/73VH4cz50EHgXCOEe/I/yv9ctuw7Fb
         zcG2C3DzKzt0ycIU5euVBadyRButcbkqr2G7HLXzVqdceDFQMICrMQPXv7u/I2sa4f5P
         fFEs2KhNjZGPA1cWa/BMQ3P4TaofA5CtJ15FIqULetQ5wy+QxeE3+xfFNI7adDz6vkLy
         VUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578505; x=1784183305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/j7AX2SfOVBp3xiHTQWWXoHKUEmkbmoxMVbHf517gk=;
        b=OFsB22VSjFsQhAWhTQrKTdCTkPwmyIiD2VogfcstaSmREce/mX0w0Ss/LHm8Efgf8P
         NQl3q3fxKf+ZR039BsfpzYE11IcsvmuIEkOC4670FTA3Zb8BciDASs4VLG/0pYXtb4FS
         PhfvQimKcVrd97xOV/ItGL1k1X5Dj1K4VNNXSo2qBHNyoseFbb8LIniRETDoPEG3rEui
         W32K1vw87YAR75NcD2LN8oV0dXb6h3sJYN/fyAzLzhVnTKc4Z0dnC2MZ6wNAnWnn+fGt
         LamVoFw3r+5bgnU4oUH7TcKoxwKom1qDmiBeWzYYCYiZ9GQKApmuJ6mRRXlwTNXmsSjG
         bBPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmU8z1VqrmVaFXVJjwd2TMCIdfgX6leOtHcSFFwCG7b2nagXOet5o6grYyHnierOMQptxQvkfo3frz2ZF5YICA8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWEBtaW70KM1Mw1QkmfHzhH/OM3ZIJbepAd4lBQ5041dmdWcHh
	ghLAnLcwMpH0hcq/05zVVJrGx/BlB6wL5njRNvQ/OBpQOB+6F56UiraB
X-Gm-Gg: AfdE7cmSemrAQqUSDeOysxff9KiAHak5xFW2Jn0X1Z0vXhD7JQmXz6z2YnwORJtPNi5
	yJGLxyn91Ddok37aj7MJh7TUQ2y0TuHRQvLTFIHA0fwiSHfh9KVKZ9HBZquZL5/P0EedUFFyIys
	dFw20IoCKlJ2z6+YX86OunEltrytRzl4QBmLluYjVxncaUO3MFEjuFpZOmzv95UDhRKxJjsVsom
	WXZsNshaPQ4a58nPiUPci6BEn/rQSfqF9z64EJ4GPbebSCIbhoW1ZOhIiLWw+20hj2rkFshMln9
	4Rvc5uP4e5yk2D3oqEO4MIm3bsT3XxZ6Ep/MWU8ejNRFsBkQUcTPGbEh1ao1UmbJVbMrvrUdbUo
	C4ai30HYWcX/7GrCNM6gSmiYnDfPBEG7X7S2JjR6yjt0U9aMDpKUgOposM5P7YTyRn1ShmH+nlj
	k6AF49PqXck1JwpbyouaRnUc8e9Hk/LlENkUrueG6VGLX0
X-Received: by 2002:a05:600c:46c8:b0:493:b499:3ef2 with SMTP id 5b1f17b1804b1-493e68da50amr55150615e9.37.1783578504712;
        Wed, 08 Jul 2026 23:28:24 -0700 (PDT)
Received: from [192.168.2.123] (95C8189C.dsl.pool.telekom.hu. [149.200.24.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ff6casm44560185e9.5.2026.07.08.23.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 23:28:24 -0700 (PDT)
Message-ID: <e6b6230a-7431-4992-a6a1-de7f8b897ca6@gmail.com>
Date: Thu, 9 Jul 2026 08:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
To: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org,
 yogesh.tyagi@intel.com
Cc: raj.khem@gmail.com
References: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
 <6a4e457c.dfaa6ae2.334193.82f9@mx.google.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <6a4e457c.dfaa6ae2.334193.82f9@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240541

2026. 07. 08. 14:41 keltezéssel, Bruce Ashfield via lists.openembedded.org írta:
> On Tue, Jul 1, 2026, Yogesh Tyagi wrote:
>> Set CLANG_PATH to the native clang in the bindgen wrapper so clang-sys
>> uses the runnable host binary first, short-circuiting the llvm-config
>> lookup. The native wrapper already exports LIBCLANG_PATH the same way.
> The reasoning is sound, and beyond the mesa rusticl case this also helps
> the rust-in-kernel build: kernel-yocto-rust.bbclass pulls in both
> clang-native and bindgen-cli-native, so native bindgen can hit the same
> target-clang-via-llvm-config lookup. Pinning CLANG_PATH to the native
> clang that matches the native libclang is the consistent thing to do
> there too, so:
>
> Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Tested-by: Zoltán Böszörményi <zboszor@gmail.com>

> One thing while you're here: the recipe is BBCLASSEXTEND = "native
> nativesdk", but the wrapper fix is do_install:append:class-native() only.
> Unless I'm misreading it, that leaves the nativesdk bindgen wrapper with
> just LIBCLANG_PATH and no CLANG_PATH, so an SDK that runs bindgen (e.g.
> rust kernel-module development in the SDK, which is being wired up
> separately) would still hit the identical "could not run executable
> .../clang-NN" failure. If that's right, could you extend the CLANG_PATH
> export to the nativesdk wrapper as well? A shared helper (or a
> class-native/class-nativesdk pair pointing at the respective
> STAGING_BINDIR) would cover both. If nativesdk is already handled some
> other way, ignore me.
>
> Bruce
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240483): https://lists.openembedded.org/g/openembedded-core/message/240483
> Mute This Topic: https://lists.openembedded.org/mt/120052346/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


