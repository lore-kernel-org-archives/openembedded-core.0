Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.36540.1614008838935206968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HqgxTUiJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id v62so14796266wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rrvRCFOs+lsrIPn3rfxgzjo44YuYBIaLGQbvkeVuzsM=;
        b=HqgxTUiJFxj3x7GotvGVCm7/fCEx0KkI8QBf3TxR9MS6azTTm82aeOula13G8oXwWS
         hn7uGSD09XS2WidwJEDSx0gFnhxg6Yd2GO5Elz5Qo2+OAxMVM7O3Yn5BLc4EsfFk5vKa
         c/YFJBJ9hFFKc3RNjk90Mcz3n9qYtuyFTfkT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rrvRCFOs+lsrIPn3rfxgzjo44YuYBIaLGQbvkeVuzsM=;
        b=XKHuSymED3YAuoFFNdmx64iofIWxb35oWwsdCIP41aEbtuyNxqU2m+rOOE+KTNYiJr
         kIzqSEU8GTaysqE6trz6toLYHbNk+NTwY2IOezpIXijkEUqzQRvo62wT85KIshaxvDMg
         bZLY07S8MLcg+bie06LhIMFdEvCgMieR4Ispu2h8Kxf4BHXoGBSlHUKw6GNlcaro+gTU
         T7EWmXo0LH1yVqORmCehp7h7MCjoMcm6XdiKHnt7LEz7MQMpNw0xoLMReyFd/4WGe0wO
         LVRRhG9pwGHCkSwYFyVA3AiYnF1M3F92Uhe9PoAT3XQjoqApvLL2qdOgeCn1ZaBvOYV0
         VcOw==
X-Gm-Message-State: AOAM530nQyhjx2JYsQ8cUKdUpqfnxZqJbDmMIS+hVEuBFk+LWmz+D/ja
	E+xBHvTut1PqW8A/keGScJ2DDA==
X-Google-Smtp-Source: ABdhPJyAyZ8faQGez8RlrpS/wsggl/7vlTy+r2npGPibrAeFD2scEDfIbNCVh4DqmmjeR4vSc359lw==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr2333599wml.32.1614008837337;
        Mon, 22 Feb 2021 07:47:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id n9sm27578274wmi.43.2021.02.22.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:47:17 -0800 (PST)
Message-ID: <a1f1f885193be6a0b9b7fc9268ac251f2baaf473.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 22 Feb 2021 15:47:16 +0000
In-Reply-To: <CAPphmgbMCQFgsFP2A8bTSF_6ZPg=0zJwrsOdM49M0VprX0xuaA@mail.gmail.com>
References: <20210219175307.46218-1-jatedev@gmail.com>
	 <20210219175307.46218-2-jatedev@gmail.com>
	 <d03dd49676e706f3806dfa902ede127541c5a757.camel@linuxfoundation.org>
	 <CAPphmgbMCQFgsFP2A8bTSF_6ZPg=0zJwrsOdM49M0VprX0xuaA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 10:37 -0500, Jate Sujjavanich wrote:
> I have submitted to the upstream which I believe is the github iputils/iputils project.
> 
> My previous thread had the wrong mailing list address, so I am replying to this question here:
> > Thinking further, how about changing the PACKAGECONFIG to:
> > 
> > PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
> > 
> > ?
> > 
> > Cheers,
> > 
> > Richard
> 
> This would disable the fallback to setuid if PACKAGECONFIG libcap was disabled.

I have fuzzy recollection that the setuid didn't always work on some hosts 
so had determinism issues of its own which was why it ended up disabled. It
also presented a little less of a security issue that way, although would
make certain operations harder.

Cheers,

Richard

