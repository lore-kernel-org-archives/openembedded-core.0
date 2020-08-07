Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.2774.1596792096159548301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 02:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zp5AxFeR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 3so1185482wmi.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gwMMDfXx/g4GpJEl6exxPy0Qqinu3kdWKiGtj41EyO0=;
        b=Zp5AxFeRNnYdu9Tg+OBp5sM8568Yg4/hhOJQjuwXjm2K50DZkgrQlMnBR37nI+WDcy
         pZ0/1soY3nGMgpRlBwNLPLbNDEKulASmpjLQ3UqqU7beh/zqLzm4JzPEsw7f/85dJtnK
         AZGgbbaE9vK6DP+f+pjQTq54TTodpsE2n8mkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gwMMDfXx/g4GpJEl6exxPy0Qqinu3kdWKiGtj41EyO0=;
        b=d9GFxtjIueESOuN5CldUjfLA2qw2oLkt0ZlKD+YOdafVILkNqRkZ2b1DEW+tPG+xwk
         ohekX5vDhuEDjH8WfcLaYbnj/xJ4TS2+n8VeVp/Ivuxm7iVpjHoN3+u6KRFxPtNuoOaA
         F/ghl5QRDZqJ8Pzgi2Py1KVJfXddGNfWK7xDMo9mHelP+u4WftpzoMfSiEEryvwtaml7
         mACCfP1nUIotBc96bgRjE39jLTJwZTsTq7Z7DoopW+PRbl6o7fyJtz4Isj2IZ5yMLx1i
         KKgJRaLbvUYj3s3O9kz/tWEzOcAvPAXfmCR19TFPTvK3iLSRiYuf7ZPXnbJ/rN8sBjwZ
         WlSg==
X-Gm-Message-State: AOAM532bwuluDKC5J+NKCAz9x25EtK2VAmaeAK+NVSryeYAws/eJ4Mi0
	EUGduQS3oGkiQad/Y16dz+WWiA==
X-Google-Smtp-Source: ABdhPJyBVBFqbS9SQPi1Kg/XZaMeTpY0/JjDHO6xLeEGH4cINvjL9sQyr8Rs6mB4seEPdLtnrH6oDw==
X-Received: by 2002:a1c:818e:: with SMTP id c136mr12353931wmd.170.1596792094343;
        Fri, 07 Aug 2020 02:21:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id k15sm9836655wrp.43.2020.08.07.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:21:33 -0700 (PDT)
Message-ID: <57532ca51c2af5673966e242c4c5414441707429.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: fix codesonar warnings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, anuj.chougule@kpit.com, aditya.tayade@kpit.com
Date: Fri, 07 Aug 2020 10:21:32 +0100
In-Reply-To: <1596790670-25319-1-git-send-email-Amitanand.Chikorde@kpit.com>
References: <1596790670-25319-1-git-send-email-Amitanand.Chikorde@kpit.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-07 at 14:27 +0530, Amitanand N Chikorde wrote:
> Fixed below systemd codesonar warnings.
> 1. isprint() and isspace() is invoked here with an argument of signed
> type char, but only has defined behavior for int arguments that are
> either representable as unsigned char or equal to the value
> of macro EOF(-1).
> 
> As per codesonar report, in a number of libc implementations,
> isprint()
> and isspace() functions implemented using lookup tables (arrays):
> passing in a negative value can result in a read underrun.
> 
> To avoid this unexpected behaviour, typecasted char type argument to
> unsigned char type.
> 
> 2. "seqnum" defined, not initialized & used in device-private.c
> Intialized "seqnum" at definition.
> 
> Signed-off-by: Amitanand <Amitanand.Chikorde@kpit.com>
> ---
>  files/systemd_codesonar_warnings_fix.patch | 106
> +++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 files/systemd_codesonar_warnings_fix.patch

This patch simply creates a patch file. It doesn't get applied anywhere
and is in a generic files/ directory.

Shouldn't this go to upstream systemd?

Cheers,

Richard

