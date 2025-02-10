Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CAFC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:17:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.48225.1739186223046163738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYY5Vxrb;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so42289615e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186221; x=1739791021; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9ero2N///hAMR9relk150Z+3VG8CdlrRzgQgB2yom8=;
        b=YYY5VxrbvcdgXwBsgeGOkKsODRGKvO0g+cGlSb7ldEQUuZryeoFgf3Dx3u0qa0BX/9
         elotzbrVb94TNkYgl0lBW2WaHwCF78JyyPpql/aeHvjLLfuSIBcH8N2FlYsMyT4T0JNA
         FrNlt+luO2S1vepwq0nfvhTyaaINA1gY9aDanjjZ6IrP6yzR8L0aCkmV98SZCr+ajaOU
         lYjo2byVRHveeqptZqeVLQMTZJKlboo4H13N2NJ7xvFJ71MWJJ0vUdN+FrKBDZboBoIx
         K1cj9QPxZuWfu/5Nesf7JUhM4LJY0+yzzc8/BspTl9hS2bza3mXBcdM7XU7xopVd+ZB4
         KGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186221; x=1739791021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9ero2N///hAMR9relk150Z+3VG8CdlrRzgQgB2yom8=;
        b=CchL3Sjky2kQLGJSOGHHz0skRbXTpLebDwG1DCB5ULH8w/woorN+ppYENp9USFXN+X
         Ex45wdQtx8m4YdebrYd1T3oLK/xrKLooXCN9AhhVHBmtaJ/fenByyQ2yyE4kZeh0aEc0
         4UVG+54NILSvr2fPMmp8eI/bRPI9KDgFBv5Dw0BZdWdrWHtmPXQAAWB2M14OQeM6RxgJ
         BozrHypzksYItoEXUt4yXj3OPfgqB6e3Hq3Op9gZ/s/TakMB/XC31JbMp4ySEkS0a91J
         PwlXRvt74sVeIWQlCGThmjRVTS1TORgVpXpPhJlf0pCHcjvus9qlfDzu3vZhJHFrxD5L
         7LDQ==
X-Gm-Message-State: AOJu0YxxDnDQnc5ns7dDs8nt9iNEfi9is4jyU96C+1GYAhGcb4qGH7E8
	Ix9kR3Y353CA6GFcjZ9L6CcSsX9fWVBqQtjqf0elWw6Hnc3AUIz2
X-Gm-Gg: ASbGncuCvDtQYTgW95G2l2YfXMPc53LQOlbkkocAG/R2kMfzbaw64fGf7YRDkOfbcy3
	WKwcKJehlGvx5VfCfcHZ/uT5KSqYqrug95E7BaLbfiMiXade7e2STt7wwXZ0tF5dB6JmYqH4cRm
	BArt8I+XFI6r2tnmGV4Ry+prLXMDJ1YUOEc2yofLvcEgpBeXAoOpNQ67HkQit1P/NmEgLdS5hdt
	rUD4TdLx90ybBVGQKxqkvLQRuM0QUsZ/r4TsFliMH3OKpzJcE29HLCoO6ogioFJatz/L31fC87s
	C7ABIryDuTQyM8THz0KaF2NZ16RXpwwUxOEdWbKTnxSPoGN9
X-Google-Smtp-Source: AGHT+IFrlQ6L5+PWBqvnNDW4CoveZdHfQDG5PJzvVq9pZ90ZufOaQP42S5xm/cUIKC3H5VyfONhIPg==
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr88647725e9.26.1739186221075;
        Mon, 10 Feb 2025 03:17:01 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43935d4bd5csm69441785e9.6.2025.02.10.03.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:17:00 -0800 (PST)
Message-ID: <4f5dc96e-b2d9-4125-b053-c78bc9bd3ea8@gmail.com>
Date: Mon, 10 Feb 2025 12:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v10 1/5] rpm-sequoia-crypto-policy: New recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250208072445.986573-1-zboszor@gmail.com>
 <CANNYZj_fcDG+PAoLNcEnKOD3+ooiiSS0acLOrT+j5yqZHjr8ww@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_fcDG+PAoLNcEnKOD3+ooiiSS0acLOrT+j5yqZHjr8ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211091

2025. 02. 10. 10:03 keltezéssel, Alexander Kanavin írta:
> On Sat, 8 Feb 2025 at 08:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> +Assume that the policies are good as they are committed.
>> +The CI for fedora-crypto-policies ensures this.
>> +
>> +Upstream-Status: Inappropriate [Yocto specific]
> The patch as it is is indeed not suitable, but perhaps you can open a
> ticket, describe the issue, and see if upstream would be willing to
> take a configuration option instead?
>
> We generally ask that Inappropriate patches still come with ticket
> links, so upstreams are aware of the problems we face. Sometimes
> solutions come out of that, and if not
> this documents their response.

Ok, new approach, hopefully better.

The two new patches are also pushed to
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/226
and all the problems I faced are described at
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/issues/57

I just sent v11 with this change.


