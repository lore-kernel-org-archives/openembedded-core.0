Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.15128.1599143163239837353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fp3tJcec;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m6so3501880wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cTD4rPFPni+4dowuX5Dzsujs7bImZzQi4b93uYcB+ek=;
        b=Fp3tJcecXnfR/Fv/TClSOzPn+qGksb+lKFOAcDOmzyXEalXoeUJGWnOWHWvOZe3ote
         /uS9QgZSTQKnP8UEt7nE0HXqIUz7HiCPw/FSWfnl9BDHkaU+GaYfro2xw0Q44WxD6Puu
         5s6NsIg+eNjorIRcUFQh2pL3qBgiHrpJnF/bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cTD4rPFPni+4dowuX5Dzsujs7bImZzQi4b93uYcB+ek=;
        b=VBq0lFToVnJuI0zacg4d9hDP9bwhrbTu0Q4XjJCzKK5/hsZh0dISlti488jV1NSoAX
         er7iHbykpGLaKs8hzRjxY8mQybkvsNL/vuYdvz7TG2cNyQ3ll/N+jsZPUwGJ0HqPIPRG
         eiAG6ps8tDQPvy0ZgTD1RsCze9NgjTFITbDhFKxRB5CcoAg1hpY565xWXAFgAgaOha+W
         UcQ25ZOSEO3aWe3iF0ir6BG3XyDrtRyhJ1TI143BQGgYb5UDM0sFjvjOKdS624v18y/u
         AxD54i1csjAXZ34m3XtfLlD/KDxdARfFmHj3D2gDRQA+fRkGVOhpPncT6mkrhVbHEJxq
         Rp/g==
X-Gm-Message-State: AOAM531mjaa0Cp5shPceE+Suaco+SKQWGFU+oAcRyMCW709Cvm0TEfFT
	2m+TW5+y2/qj2uIOkhqu6srjP06nG/kTQw==
X-Google-Smtp-Source: ABdhPJxVOcd5XkaHG4tTSCuHFutw5FXuauCAhS8TOS0eTf3hVbcyHBFehDCDQTNIlhDCWaj6+3sdmw==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr2990022wrr.105.1599143161710;
        Thu, 03 Sep 2020 07:26:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id v2sm5166600wrn.44.2020.09.03.07.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 07:26:01 -0700 (PDT)
Message-ID: <99f978db8be189ea4e397abbdd5e4330ab3c2095.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] kea: no need to depend on kea-native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2020 15:26:00 +0100
In-Reply-To: <20200903104731.4165-1-ross.burton@arm.com>
References: <20200903104731.4165-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-03 at 11:47 +0100, Ross Burton wrote:
> kea-msg-compiler is only needed if you alter the messages and the
> generated sources need to be rebuilt.  When this is the case, there
> are
> better ways to build kea-msg-compiler that don't involve building all
> of
> Kea.
> 
> Don't depend on kea-native, remove BBCLASSEXTEND=native, and the
> target
> overrides.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-connectivity/kea/kea_1.7.7.bb | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Sorry, but:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2400
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2380
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/869
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2401
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2402

(basically all the world builds)

Cheers,

Richard

