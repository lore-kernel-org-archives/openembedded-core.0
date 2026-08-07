Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D1EC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:38:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39241.1786095483841864119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mT6tqSzP;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so29924005e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786095482; x=1786700282; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Qn02Qqbp7aPzQ5uq0gvugaFlvJ329vTjhJ+V0bHOCc=;
        b=mT6tqSzPjodvURLw/82QgAb7E4gdbZDn4Jl7zKFDbSuMUlFolDS9GmoYE/EoP2kSru
         MwGJwaDtX7+WueQF06PM/CZqLBY6kHH54pFzuxfnx5Vivf7zpQHtIL7NyHaEq+h2NsR/
         9UTX6pkDd7KB9Ngw6rVYohPCVoQJCfsYvC6HcvZD5bL77hSTmXauUr+DrXAlsU7uVl2w
         i04eDPA2YBtcapNV89/QWJvFSr1iEVdqyz8HlG8SWNTWUykJ5GT1RNjz2HIbzQ9XkGPO
         N3RoDPVAAVxwHfZYgwJk02Dm2d/yQr25mNX8685uUU8apTjGh/OKBoQHUSLAtFE/hjJq
         9Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095482; x=1786700282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Qn02Qqbp7aPzQ5uq0gvugaFlvJ329vTjhJ+V0bHOCc=;
        b=VzfwXjKXsCJihnvx0UWNzFQCs/NAsy1t4MbNPTEtQfKW0JfTGrCSovkynEgViQLv2T
         3tlQ/qf23rhjttWTSEjxG83foiyCEjRp/EsJX6umnJh02AeVQOj+CCR+KVf+A+pz4kOm
         Ea/hk4/in8OztuEuN8kCdbnMfIdiCAIDMFmP4p76KNONn8yDybmb06fnZ+5NPQm0vOxh
         5hES0Ugi5TrFDCSAXlwpQn5RH6t/1nnSs95strlqSxqIrGmruD3P62YOAmvhTPv0Ltih
         NVIEfDQfyL4g4/EpHUkphPvhNELJghZEuMT6Y1LZHxTf/p2p9X+s7QqGopZab6PWvZU1
         eGTw==
X-Forwarded-Encrypted: i=1; AHgh+RpyB3KGxQvUmqJeeTC0G+SFQiBeYWxYVsYg2TrOu9RjEIYnmiSkO9bODHKbizP9mkRD7Qv50jXHO6RwscU9+GUDvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySvQ8E3C0016JL269o/6C8gutVB/icrW3ml6NSR0Fdq4bGlbQU
	QDSlSthVYZSn/MM3ZERFNTU+erV5YxG9PI2E+8EUCZvlXd1bvcx7rkKo
X-Gm-Gg: AR+sD12CslT+PX5Gaawlu17PFdWt3hNZRztUt6yYJTjuKAnZnz6CWc7Cz+fEG/XTzJW
	UkZpm5Z04BeIyJM3Nmnu3s1f1az+5qCvbsZhPZGMiPz24Q0DH5rPf8JfnRzs0eICxzg2jKfQK4O
	OtoKWEu8BhPyVxi++I3Z7NML3EloioK0zqaj8LPaR+uV3/+RPg94UboSU0qOdWUqPsZmbP3tzBN
	g/jKxNJ6INu52Zhxbq4NJ6yFC5UCSq7z+HaoN1Slr37+JXEYg8B2AzcICAm65wWBMqNiZyXxc8z
	uHP4kYP25irtay1SWzPxzu0BoXTsGRwtR6i7xgwrRHkShqFv65Flf1NH1H0V2xsmhLmozceSXGh
	pfQzwwrNQyiJibRjyqPtOStrtmOvt6t8plSYuOIfoKGsNb2diGCbMBFVoyCrq/pJ3UlrNEJa/VX
	1NnWavb2YpKvk/ksmPaSsK4jjmOWya05PTR2x6KxSq/PhPYTj6dGy7mnoXHE9f8kaTSou4fE3oX
	OqTUbsVtkb1lCIvQPPvxzobxjbvpTN8i1JCUEJuibwx4U7OYAKz/Ofbxndl375H7LyPXdboKjoz
	EHSzhpWB7a/YqwEpnmeJ+PI=
X-Received: by 2002:adf:e992:0:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-47fec519539mr26953660f8f.18.1786095481726;
        Fri, 07 Aug 2026 02:38:01 -0700 (PDT)
Received: from ?IPV6:2a00:1110:109:4924:2d50:d977:a37f:2dcc? (2A001110010949242D50D977A37F2DCC.mobile.pool.telekom.hu. [2a00:1110:109:4924:2d50:d977:a37f:2dcc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm4067644f8f.2.2026.08.07.02.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:38:01 -0700 (PDT)
Message-ID: <712dcddb-ae9b-4719-9b21-fe79fcc043c7@gmail.com>
Date: Fri, 7 Aug 2026 11:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/3] mesa: Upgrade to 26.2.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260806051437.276400-1-zboszor@gmail.com>
 <DKIG5B0QYAB7.15MM1X6A47OUK@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DKIG5B0QYAB7.15MM1X6A47OUK@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242996

2026. 08. 07. 7:02 keltezéssel, Mathieu Dubois-Briand írta:
> On Thu Aug 6, 2026 at 7:14 AM CEST, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> Release notes:
>> https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html
>>
>> Removed upstream 0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
>> Adapted 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
> Hi Zoltán,
>
> I believe you need to remove or refresh another patch:
>
> ERROR: mesa-2_26.2.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch' on target directory '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/mesa/26.2.0/sources/mesa-26.2.0'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/mesa/26.2.0/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch 0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
> patching file src/intel/compiler/jay/jay_ir.h
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4342
>
> This happens in virtually all configurations. Can you have a look at the
> issue?

Sorry about that.
I only tested the change with wrynose before sending it.

The v4 series fixes this problem.

FWIW, there was another patch that was removed due to
its contents being already upstream. The commit message
in v4 reflects that.

>
> Thanks,
> Mathieu
>


