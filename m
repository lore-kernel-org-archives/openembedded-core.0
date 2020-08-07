Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.8290.1596813483310910595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 08:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EUJhawmn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id d190so2047389wmd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Ilr0kiSR+wD38SlNB3Pkw0+z4etePWuEoSIqc9YUzjo=;
        b=EUJhawmn0LeGm3mUaAex7ZSaCqQGIxuprrBKDgJlJL2wRArUyIVVDgG5VfBNpTxrjK
         vqb7BcoG7PenxTPUlFXasAAN+iS3nZCQd4DYDVOoXJjpgspkIzP7bQPn2jUmYJ8qMeUC
         aztRPhQe4V8qiOBTmZhM0hTkRNbWdF5SIfoDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=Ilr0kiSR+wD38SlNB3Pkw0+z4etePWuEoSIqc9YUzjo=;
        b=qCE8HVORxAWraO+Zd4xLnsGmVFXE2bAJDDzr284O8rf0NBgS5lKj4p4fPHtbYz813l
         /oNf907To5u8dxEz7a9haYu9AzUtpGMYZ+nRnfLLHH0wqR0sqvE74NXv1budm9jPb+yl
         rGIoO5IIc7AAJjDPukB91Ug7WNZsHS0Y8a0pHgEhdLK462At69bYj7Zv2TwUkBHzWcWC
         Qsb6JfpIXAXQ8uqYHhudBTHutJK/n9HOqje2hmdwYDJnrUEQZZZYDH+QU+ROSgVHLeBf
         HZKn1x02ZdVzl48Sz9SHgXb5btKsGiA8rOfFF9hIk3851i3TE7rt9Affup8Z3MOwisGV
         D3ww==
X-Gm-Message-State: AOAM533jd6ivOhLiIcZGa9AwQGt8QpXLxGskLZXV8q457RUfmUQ2WqH4
	zRmhQg6WDdSh963NrGZtIC11+29U4K/1AQ==
X-Google-Smtp-Source: ABdhPJxucEen8G/5VZbTQt7wLUsNHtuhY3CKV1gTwz7KW/dE6AGdbhMKxizgww99iJ/1F4Qdm8Eyig==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr13665707wmd.28.1596813481506;
        Fri, 07 Aug 2020 08:18:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id 32sm12076175wrh.18.2020.08.07.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 08:18:00 -0700 (PDT)
Message-ID: <da1885af24ecf70823c3aa80ba668cc71493582b.camel@linuxfoundation.org>
Subject: environment-setup.d usage in SDKs and eSDK
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Cc: Jens Rehsack <rehsack@gmail.com>
Date: Fri, 07 Aug 2020 16:17:58 +0100
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've just spent far too long staring at this so I'm going to write down
what I found out. I may as well share it publicly.

An eSDK can be used like a normal SDK with an environment file that can
be sourced. The challenge is that an eSDK contains native binaries
rather than the nativesdk variants in the SDK.

This means that where an SDK has nativesdk environment.d files, an eSDK
ends up using "native" environment.d files which are not used in any
other context.

Some recipes like cmake implement both. Some others like icecc or
openssl only have nativesdk variants. This probably needs cleaning up
to be consistent.

It gets worse when you find that buildtools is included in eSDK and its
environment file is sourced. This means you get a mix of nativesdk and
native. If you set OECORE_NATIVE_SYSROOT in buildtools, it corrupts the
eSDK's variable of the same name. This why buildtools has a hardcoded
list of variables it puts in the enrivonment rather than using
environment.d.

It would be better if the two sets of environment files (native and
nativesdk) referenced different variables as currently the two can't
coexist. This also really needs to be fixed.

Cheers,

Richard






