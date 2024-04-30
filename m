Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865A5C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:17:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.10176.1714465023722356765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKnPuy9b;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41ba0bb5837so26665525e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714465022; x=1715069822; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mX9RBWtxJ3Rd9r4pq1p1Zp4AjKGcfyajN2XtLV2F4tM=;
        b=HKnPuy9bDjMIjkQZNe+4da+62Qrr2cVZETCey9YUiduzbwE0T4CkmgZsdfn6N6zcRi
         jmIzUwIczVx8BpO6Le7Jye4kmoTeVYw3OWxQxRwf8ezb8pMugcdnvjcarTI+lotjqiN/
         QQWvSnIwuX4OBrO0FxgHv3wyZjOCdRtsg9XUXN/7JP8FkGwnNOIcYopkiBT6rwaE5BAQ
         UFuL4mKZMAiA6YVO9JjUZqLbTm044uHfCWxPFTst+om++0WxV/p9ak1jLAldo35k/p93
         HU7gRbKxfihcCcIWbpd/Xxa0G+W8D5JEorXmMevnmk4kLRQ9S/dfkWmpWuIIlRc7YuKq
         gpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714465022; x=1715069822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mX9RBWtxJ3Rd9r4pq1p1Zp4AjKGcfyajN2XtLV2F4tM=;
        b=lzpF0AgR/1EVESGcx/uAt13oKRD/RVfpPeZEJlvoRETPivpLMpGfTnA668ctzE7Qlk
         IrUMc22ZXNo84mRKFLaTAShYohbqF2phu6w2B3k2SzQhI7fbCIvLpJaVQJWKDfnQ5yxp
         2PNC5clJNrqrHgZ5KG4e+szFPLygWXLgUkF+DFtBi86fTmnIQRp6K1ao3dP+iA1j6WeP
         c/VeDdNtlnokwK4ZX+FD5Rlcp0uGK3DCfiPk1E0y0ItL6enz9R3hCZP2URgpHJ5Jp6h2
         0s9bDhItTvcwSPd6akZgMOGytXG85o1D/1f1jFtjGo7JKDFcN18Ch3momKMQRrm3C72T
         aL9A==
X-Gm-Message-State: AOJu0YyWC3QjBMus064APejvLEp9Nph34oh+Rl64oj16h/xFKbqjw0VQ
	GC2mr5/L4BRMdFQ6019BmsWyjmb63HQ0+bNor0X/qAbHO7M576oB
X-Google-Smtp-Source: AGHT+IH6Bhd+nPkd8QtBFufnAOm0R23dpWbFomSaVJbOrSpuw2ahg8Y7TR7v61h0WNtJDIaY+YFc9Q==
X-Received: by 2002:a05:600c:b93:b0:41b:ca55:2e2c with SMTP id fl19-20020a05600c0b9300b0041bca552e2cmr6199450wmb.17.1714465021653;
        Tue, 30 Apr 2024 01:17:01 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041bff91ea43sm9813484wmq.37.2024.04.30.01.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 01:17:01 -0700 (PDT)
Message-ID: <4468a782-f0c1-449c-be65-e5c6fd6bd180@gmail.com>
Date: Tue, 30 Apr 2024 10:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cracklib: Modify patch to compile with GCC 14
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20240429102959.3493324-1-zboszor@gmail.com>
 <CAMKF1so2k-N0VvfNnzOdu5L2pMLppN6UQqkK2VQRhG_ww73z-Q@mail.gmail.com>
 <b0e91df1e218fa314ec717d1192134a0f9e5c02f.camel@linuxfoundation.org>
 <CAMKF1soN5FJ5gLH5i6z=k1bkSmtsmTv=UHtpYUL02x1rAbDj_A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1soN5FJ5gLH5i6z=k1bkSmtsmTv=UHtpYUL02x1rAbDj_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 08:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198754

2024. 04. 29. 20:08 keltezéssel, Khem Raj írta:
> On Mon, Apr 29, 2024 at 6:37 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2024-04-29 at 08:03 -0700, Khem Raj via lists.openembedded.org
>> wrote:
>>> Thanks for fixing this, however I would also suggest to submit this
>>> upstream and see if this is acceptable
>> The patch this is changing one of our patches but I can't tell if the
>> code being patched by the patch is "ours" or upstream.
> its the behavior coming from our own patch so in that case perhaps
> no need to bother upstream. However, the patch itself is also submitted upstream
> which has some feedback to reimplement the logic, so perhaps for now
> we are ok to accept it locally.

Thank you.

FYI, I have upgraded my laptop to Fedora 40 that has GCC 14.
I tried building pieces of Yocto 4.3 and 5.0, and observed
some other failures.

One of them was vala-native. Upgrading the vala recipe to
0.56.17 fixes the build error, but it also needs newer dependencies.

First gobject-introspection 1.80.x, which needs glib 2.80.0.

In turn, glib 2.80.0 wants to use gobject-introspection by default,
which can be disabled. It is the current state of affairs, as older
glib versions do not use gobject-introspection.

The other way is to introduce a glib-2.0-initial recipe (built with
-Dintrospection=disabled) and add glib-2.0-initial as a build
dependency to gobject-introspection, and add gobject-introspection
to the glib-2.0 recipe.

What would be the recommended way if I wanted to post my
GCC 14 build fix patches?

Thanks in advance,
Zoltán Böszörményi


