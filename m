Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6799.1609337413494506395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MGWebo2t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id t16so17558925wra.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j1MXYjw7u4JQpGUYi3kWKlj36NAPS/sPzw/3Ew5LuBM=;
        b=MGWebo2tbUm5FvXCoMXCwU1JZdwMk7UDzc1R/qjbuYc7OCFOXS42X9geV2PU3CHSq8
         dQJ3pZG8klph2UIo7i1fsKA/67E4jmtiUfr1Sacx4Ym9kN+1ZSQBa621p8RNrRbg+xxF
         XvLeuTooNMGumvBb/Tr0Q9Li8+5KcxK1mpWIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j1MXYjw7u4JQpGUYi3kWKlj36NAPS/sPzw/3Ew5LuBM=;
        b=JYJAXVXo9BuwLSaIOvDOMiwOmxI/6U8IxjjFUnN/TcP3A0eC/CbuoWNjjZ0DorbPHB
         lPJAYSfYWOhso9lx19cHpfwukbU/DhplLRuje3X9s5A7cVGj+ePWEvI10fox2aM2PCjH
         jeHFjHW8bp45tPJdjEcohFXAhGGj9cljJ789SwOoAMRKqXC0ykW7JKPnbI7jVg3/LBLr
         L+LQPJ6+Vgig4NRIXdWdSjkoJQjAXeLFEQ8g0+ufublEW1ctmueJB7agjOawTGFxiBSx
         FajFu9R06kBBUuwNWeVwZG/9qbnI0knxIrxXNKvgecNCS4G3rW1aATKTCr7P35TShPEY
         f++Q==
X-Gm-Message-State: AOAM532y8oiMwnMLILctlTdcrZSIdiTr3Mx5ZdfPnznLGV7YsxHJHULW
	92elTgoPgMv+6yiKgPIMIuoAbg==
X-Google-Smtp-Source: ABdhPJzAgIM8yrN6uLgHHMUIpQJz4aaJnXHgaB/jCB3ifnycXQsxGrpnofxejMFLYSxatbA6T+0y6g==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr59686863wrn.91.1609337412016;
        Wed, 30 Dec 2020 06:10:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id b83sm7835582wmd.48.2020.12.30.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 06:10:11 -0800 (PST)
Message-ID: <fbcefecc76d5cd481c661b57f0d394520ff646a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 1/3] PSPLASH_FIFO_DIR: refactor
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, Naveen
	Saini <naveen.kumar.saini@intel.com>
Date: Wed, 30 Dec 2020 14:10:11 +0000
In-Reply-To: <20201224153105.21211-1-twoerner@gmail.com>
References: <20201224153105.21211-1-twoerner@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-12-24 at 10:31 -0500, Trevor Woerner wrote:
> Add an entry for the psplash fifo directory to /etc/default/rcS and
> have the
> pieces of code that need it source it from there rather than
> duplicating the
> definition in multiple places throughout the code.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/psplash/files/psplash-init    | 4 +++-
>  meta/recipes-core/sysvinit/sysvinit/rc          | 5 +++--
>  meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 ++
>  3 files changed, 8 insertions(+), 3 deletions(-)

Unfortunately this doesn't seem to build on arm hosts, something to do
with the fifo I'd guess, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/2179

I've not looked any further due to holidays but this probably needs a
bugzilla entry and further investigation. Series is on hold until we
get to the bottom of this.

Cheers,

Richard



