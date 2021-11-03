Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DD4C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 08:39:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.4742.1635928745204041762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SxMTddi+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u18so2347433wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DXQ7EOjibWNS4nMcPoSVEy8Nu0ADvH4YYFF4UpHsFIs=;
        b=SxMTddi+xQpi6nRT9STRe5tVnElMLX+i7F3AWpq7uVw4/zt09lZ0Mzt8RnHqBefZol
         zfMCvLF41ojRttJ2cPP51bEX+Kqe8Dx1Sgra7V9Xr3uvSMLKGBWvFnHK3G6KfLb9L8SY
         iydJ7E+SmhVqy6oiR8wTIoiWKYZZ3PH+g/G+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DXQ7EOjibWNS4nMcPoSVEy8Nu0ADvH4YYFF4UpHsFIs=;
        b=4zxQMQtkodHOd7ZDm4ZC6SeIOt5gbChmwwuqFhzPj0HmNyI7bsp8/Ev08VOVfe7Xqx
         nXlIiJgOlrAJ+GWcoLVyrYUKxkkE/joDvsaAWR2qDWw9wKITUvqp+iZ6yJkeZTRlsyYG
         FZsVtDKQ6LHF46aGOk0ZBn17P6encbh0d79wWHRMTTGU7SMe7eQcp2ck9uUu+Mx5SAQw
         eSiP89fOjXbKzSsy7NPzXZ+MRz1odUsDavGFmLYhwuQ7QLUSuvDOtwsKNz+Anoe+nOwv
         euiBEto4qRajfagSLu/dhT6QAn1+ifoJT4Mrydi9ZOBX9tpS6tu9JFXFLZmuCKzuLiuR
         LLBQ==
X-Gm-Message-State: AOAM533xyd51UzVidflhHd7iEi41cERmCtncZIb7x8ypFIl/YlNjI5+N
	rlTf0Oab8DI/Xb4UDo/I6hUMlw==
X-Google-Smtp-Source: 
 ABdhPJy3NnC8yknD5/7T+2Mby2z1jeCkZ1O4jVbIST8bi1J9pB9DOtzhPAxXEDLr6ago8mW9F4MP6A==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr37759982wru.108.1635928743644;
        Wed, 03 Nov 2021 01:39:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52dc:b819:4029:149f?
 ([2001:8b0:aba:5f3c:52dc:b819:4029:149f])
        by smtp.gmail.com with ESMTPSA id f8sm175280wmf.2.2021.11.03.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:39:03 -0700 (PDT)
Message-ID: 
 <0da19b5aa737377b8020330e6c6bb1e928da4b68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 33/33] perl: backport gdbm 1.2x compatibility
 fixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 03 Nov 2021 08:38:58 +0000
In-Reply-To: <20211102084303.2974802-33-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
	 <20211102084303.2974802-33-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 08:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157824

On Tue, 2021-11-02 at 09:43 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...e5fdd87aa205011512cd1e6cc655bcf677fd.patch | 31 ++++++++++++++
>  ...2398e766500cb5d83c4d76b642fcf31d997a.patch | 40 +++++++++++++++++++
>  ...297a58b8f10ab885c19eec48ea076116cc1f.patch | 25 ++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 ++
>  4 files changed, 99 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
>  create mode 100644 meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
>  create mode 100644 meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch

I noticed we had a perl gdbm failure on both:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2782/steps/12/logs/stdio
and
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2498

(as well as lttng-tools)

Is that related to this? The commit doesn't say why we need gdbm compatibility
fixes?

Cheers,

Richard


