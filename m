Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1FEC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 10:06:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.11829.1714471598112550376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 03:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nLaSHn+N;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34da4d6f543so119613f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714471596; x=1715076396; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fo7j29bHxGNO5EXm/TdOJKoZI7KsFB8fBqkvWJlxJ6o=;
        b=nLaSHn+NyqhaADX9kAbfSq4a7dvsE7LDLZNTmwJuPs3E23mgS/eR3j7fD0S6FU332y
         7cDkS7uNwh+nvmdU/gzHtzMbcfPSXYvGuNj0Tll8Qpz5hblOIowi1PiemMd6iU++SH30
         Q0xqmNg6dhTuX9kMBbRFae1c4VSc8BRVfYxTzUJHzaYUkXtnPTIrR8UgycQg+0Ju1liY
         Rx5qWw2ejRQ5Rpxyc2R8c2E+VwtITvkwI6azGLarBVWWOKy7q3BOPXDNKZSBRjSGjz9+
         EKT0Q5/n9mBb4hUgg4++M7QeAw2HZYFdXJ51xDd7cTjwa5ki7ONA8yb1Tf9CJz3wH5oE
         Wklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471596; x=1715076396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fo7j29bHxGNO5EXm/TdOJKoZI7KsFB8fBqkvWJlxJ6o=;
        b=UtEazXGObMrQjFNoF3o2HC8oUYzegdF941ExiIqiMz2alD8JBTDMxGZUcJzBpWesDU
         aN3pa6PVTOfHmJSEaoGDKx/cqghKkCHUYCWHha6IHUB3oDJ6NoaX2lJb/YZ//m0qSOnu
         qNCaRIGS2jg5wsP+XHVoYojZqbVHNMIODe+cmdGKDgVybURFrIooc8WqALoSuee9f66P
         1Sh0gMb9+zGSZSNe1NPfVfLYG6t49atWSPO2KcvVSTmiup4CeMuPXY56BDFYGfJBpHyU
         B9tey/WA+3fuI+sSb52BnIUVeGGBBnyEaYKUPUk7vt23H90QpAwyMJqbdGe+O718Cfu/
         +zHg==
X-Gm-Message-State: AOJu0YwZcAQHljs54Q3rQhQznsJrVz1T7+z44AKDau4fo9xU4IKa48Ry
	ZNYiuCmMzdkOO0ierZpm8s2nwPKFvaQYn7l26n3CkWZLixO/cDR5
X-Google-Smtp-Source: AGHT+IEozFkAIlz2vMf6FbE66DXh05eIbfHsLpoX2YQcSy/QDhqIFxmhQRFNKHT7pQFaCEhJNlMw/A==
X-Received: by 2002:adf:db4f:0:b0:34d:963a:12cc with SMTP id f15-20020adfdb4f000000b0034d963a12ccmr608509wrj.53.1714471595977;
        Tue, 30 Apr 2024 03:06:35 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d6d46000000b003434f526cb5sm31503000wri.95.2024.04.30.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:06:35 -0700 (PDT)
Message-ID: <3bd43aac-4e2b-46b9-83f5-e9982688021b@gmail.com>
Date: Tue, 30 Apr 2024 12:06:34 +0200
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
 <17CB00DB1504FDFC.26557@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17CB00DB1504FDFC.26557@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 10:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198758

2024. 04. 30. 10:17 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2024. 04. 29. 20:08 keltezéssel, Khem Raj írta:
>> On Mon, Apr 29, 2024 at 6:37 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2024-04-29 at 08:03 -0700, Khem Raj via lists.openembedded.org
>>> wrote:
>>>> Thanks for fixing this, however I would also suggest to submit this
>>>> upstream and see if this is acceptable
>>> The patch this is changing one of our patches but I can't tell if the
>>> code being patched by the patch is "ours" or upstream.
>> its the behavior coming from our own patch so in that case perhaps
>> no need to bother upstream. However, the patch itself is also submitted upstream
>> which has some feedback to reimplement the logic, so perhaps for now
>> we are ok to accept it locally.
>
> Thank you.
>
> FYI, I have upgraded my laptop to Fedora 40 that has GCC 14.
> I tried building pieces of Yocto 4.3 and 5.0, and observed
> some other failures.
>
> One of them was vala-native. Upgrading the vala recipe to
> 0.56.17 fixes the build error, but it also needs newer dependencies.
>
> First gobject-introspection 1.80.x, which needs glib 2.80.0.
>
> In turn, glib 2.80.0 wants to use gobject-introspection by default,
> which can be disabled. It is the current state of affairs, as older
> glib versions do not use gobject-introspection.
>
> The other way is to introduce a glib-2.0-initial recipe (built with
> -Dintrospection=disabled) and add glib-2.0-initial as a build
> dependency to gobject-introspection, and add gobject-introspection
> to the glib-2.0 recipe.
>
> What would be the recommended way if I wanted to post my
> GCC 14 build fix patches?

Nevermind, I can see that master-next has this change already.

>
> Thanks in advance,
> Zoltán Böszörményi
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198754): https://lists.openembedded.org/g/openembedded-core/message/198754
> Mute This Topic: https://lists.openembedded.org/mt/105797819/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


