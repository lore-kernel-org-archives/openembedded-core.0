Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.10636.1600858550730069872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 03:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DQNqK8Lj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id v12so4793731wmh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=v4KGA73bI6POcVe5Y8DkHDIPpodxq3R5bCFGbTq8T2w=;
        b=DQNqK8LjC9C+8BZzCFiVTd2NNmwajMKLUWmo+0l72yaSjc2SMM1ssNKO9/GgbTp2uU
         7toNbkJgMwcYx23Kf4WDKlIOvY6U+aFbqd58a8nHj6FeJrq+52/8JtOjWMKHA4Hdlced
         nW2sZS9/14tXuFxbTYkYe0AbV9TJjz22vcBiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=v4KGA73bI6POcVe5Y8DkHDIPpodxq3R5bCFGbTq8T2w=;
        b=XvgwdntrRpcbVBaFscftyzyJfLIpKXZPTV1v0ID7dKT96PD1VJR01D3r7n2PEol/tt
         42L6yBlMayTfoC72A/ItMuyYiP4OQ6oWcQzTGwANni6pRVZ+4zAu+y156ptyEfDC1xTk
         UlSha1gUpZO1eQrPfZGQj5DMXOCvAXNh3oePwwDryKVTBlym1LY8Of7IMZ8YoEw2yN8/
         WdvK9bZWBgKgvwbcPP/tP0V9rya1YCa0YyF3dIedEG6MgEVT26P5psTQ7Zdg+72rYCxd
         pqK9gWUm8XumxrUb6ORoXGmf/MOsu1Tw7EXZVF9+ta1TlZq1uknlm9Nwvl8Gm/gh/zAT
         TCgg==
X-Gm-Message-State: AOAM533YEpHhPupVaC1/N9JLkTp7RczSnPPEeNh2wMwe8n3lpXeJiS33
	K80HxFk/6sDDcnkjHqRFXfcqqA==
X-Google-Smtp-Source: ABdhPJxBFf2/+6HFDOGmCVDJ3Y1R/YtYMwfSkrapa+OWu4/KFHHFraHPEVeK1Dfnl6tcF3JlQ+xXYA==
X-Received: by 2002:a1c:2e17:: with SMTP id u23mr6183083wmu.73.1600858549070;
        Wed, 23 Sep 2020 03:55:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4d01:62a4:e14d:6b53])
        by smtp.gmail.com with ESMTPSA id m23sm7218532wmi.19.2020.09.23.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 03:55:48 -0700 (PDT)
Message-ID: <dbad1eb0150a238cb46c129d55d45d026e5142b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] dhcpcd: disable service to start on boot automatically
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Cc: ross@burtonini.com, ricardo@foundries.io
Date: Wed, 23 Sep 2020 11:55:45 +0100
In-Reply-To: <20200923094548.13448-5-yi.zhao@windriver.com>
References: <20200923094548.13448-1-yi.zhao@windriver.com>
	 <20200923094548.13448-5-yi.zhao@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-23 at 17:45 +0800, Yi Zhao wrote:
> As the default network manager, connman has its own internal DHCP
> implement. The dhcpcd may conflict with connman if the service start on
> boot automatically.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> index 4344841b54..dd473cd815 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> @@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2
>  inherit pkgconfig autotools-brokensep systemd useradd
>  
>  SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>  
>  PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>  

Rather than just disabling it, is there a way to "only enable if
connman isn't present"? I'd imagine there is some kind of unit file
setting for that?

(the other patches look good, thanks!)

Cheers,

Richard

