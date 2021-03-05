Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.836.1614986960799546969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 15:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eCQP2N2X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v15so3878359wrx.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 15:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3trS4talIlKiphEDPbTL2eYb4dLJNGEjR4DF6JDJvAU=;
        b=eCQP2N2XMLRlfbv23pApR+tpAKOS0g+iNtV/5afIw6stwwvWx6AEPenOQ+nqpIwDgf
         SIe84vk2be2gmLQBN+M51a9lbICTCx4nTGqUP5kmrpTiGwFXCyvNJaZC8Hk2wD9D2QtO
         E18r54uN8id5YvIy/6wcsJbuCrLaCwZ5hIngo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3trS4talIlKiphEDPbTL2eYb4dLJNGEjR4DF6JDJvAU=;
        b=gH0AU0Q96ZCWHJuTxXdLM5z6I+Ryc6Vb6UwiAn2HFw8zkJFAkWkBxIw6BOzop+D96p
         VB01z7URSe3f4pFXFBedOqEZgCUUysAg/vt5zb4aIJ/rGnwAqbcaYzZ9UPCLpZnh+XpF
         An/aTiR/j6yBpVKr/m7hAtjEdV5AU29iVff0seuJC2byKisaCTfn4ZXXTdFdLSUj3w4P
         J/IcjbXjpBVo9G34smC/rOrT9Ojq5/YYC11CweQA2EMsiQO4gM0I+Y9E0DoCglDXXXAS
         DZHKehHumDfjhLi8/FIDTgDwfYJxTikZPtzqS67a7Vp7v3rLfUMGL/mZ7m1qI4+ipbpp
         b90A==
X-Gm-Message-State: AOAM530fs9yrkPPkWWKdRMJG2tlwf929JaTtpNM8tjNP8Q/mvk+1L1rI
	3HWApVr2BOw9rrzhpK4QGYS9lQ==
X-Google-Smtp-Source: ABdhPJyE05A7GACgyTgtRjcfmXnrHOPuzpvtc7AyvoF17RxXfNMqPf4nAww4mZELiz7550Fj08dz+Q==
X-Received: by 2002:a5d:5082:: with SMTP id a2mr11147627wrt.289.1614986959100;
        Fri, 05 Mar 2021 15:29:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8791:d573:be1c:dfe9? ([2001:8b0:aba:5f3c:8791:d573:be1c:dfe9])
        by smtp.gmail.com with ESMTPSA id i8sm5977471wrx.43.2021.03.05.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 15:29:18 -0800 (PST)
Message-ID: <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 05 Mar 2021 23:29:16 +0000
In-Reply-To: <20210305101040.822-1-Qi.Chen@windriver.com>
References: <20210305101040.822-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
> As we delete the .git/ directory, it's impossible to get METADATA_REVISION
> inside eSDK. Because of this, we meet the following warning when installing eSDK.
> 
>   WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
>   but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64
> 
> So we record METADATA_REVISION in eSDK generation time to fix this problem.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 3 +++
>  1 file changed, 3 insertions(+)

I have to wonder why base-files is depending on the metadata-revision? That
implies that base-files and hence anything that depends upon it would rebuild
each time you update to a new revision. Is that really what you want?

Cheers,

Richard



