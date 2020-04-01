Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.2532.1585733062984594781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 02:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iMyk0s5K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id m11so23800326wrx.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 02:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UOvc6ihF5/EnKhhn87ZaNZQx2TrpuTzSI9ZD2YMEPAM=;
        b=iMyk0s5KO5wnDKKUmaVzmz/oLnSc0zcqcCX88id5dI1agSDqN9cVf+/C9v/8qo+hbt
         BL3sqPMfJ2K8faasi53n9hB77AMpA8leFQC3aN++6xkDulupvrqhfiRl7MShbI6Vhi3t
         0QYOMZqmGyDHD5BUb6iQcAVF8Do+eUnmBffW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UOvc6ihF5/EnKhhn87ZaNZQx2TrpuTzSI9ZD2YMEPAM=;
        b=hBfkcV710QiL66qGdbMkxWTOlDOeYS93Qe0AGnX7xjbqVtP0wjhsa2t2+21GbVzhxk
         PpkLBGIEbaYplzuj4K6R6fSx5QE6ir5Ua+mj9CdwK0pVEkMhMQyaXErlJuDvTninc+pU
         uzPODTBfcjpJlT3jNDnvq1bAJAi70PoWbxk5ImwrR6dHYa6VmMeMo4emTrE7xDtRPJ2N
         sctdG5OgtphMClWNkliagLpMhzKphDfFPWfyR9mabOezy4pGtRxRdnQTbGp5hqPrM87A
         gauvSwcWMnReCwLNpaJFl58fF0OabAUQq0/B+N/24v2CleSplqUu9wr4MHDu3oyyrlC3
         180A==
X-Gm-Message-State: ANhLgQ3WzCnaJzwucUGguOVx2Fpr9vs+Z2e2jtoeAwqHXfjTnCpfmgQj
	tckcj2xSnCR2dpgI5gdM6oQQc70eLm8=
X-Google-Smtp-Source: ADFU+vvFBz0nQXbfVg61cXGc0XwDS9gfrMq2QDaB8dHsSTWgAP1N8nYjqKtN3oiaib/nR0ckOqWYZw==
X-Received: by 2002:adf:aacf:: with SMTP id i15mr22297465wrc.31.1585733061477;
        Wed, 01 Apr 2020 02:24:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d1sm2206407wrm.86.2020.04.01.02.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 02:24:20 -0700 (PDT)
Message-ID: <6e0af711c659eeb8fdb223a1fd58d907fe73b90d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@gmail.com>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Cc: Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>, Otavio
	Salvador <otavio@ossystems.com.br>
Date: Wed, 01 Apr 2020 10:24:19 +0100
In-Reply-To: <20200331151645.1030603-1-otavio@ossystems.com.br>
References: <20200331151645.1030603-1-otavio@ossystems.com.br>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-31 at 12:16 -0300, Otavio Salvador wrote:
> One significant change from previous OE-Core releases was the move
> from
> u-boot-fw-utils to libubootenv which offers a generic and not machine
> specific alternative. However, it is not fully functional as
> currently
> we don't provide the default environment nor the required
> configuration
> file to be used by it.
> 
> This change address this and include on the default u-boot.inc the
> needed code to generate, install and deploy the default environment.
> 
> The side effect of this change are:
> 
> - new ${PN}-env
> - u-boot-initial-env on deploy
> - fw_env.config on deploy
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This change is late in the cycle but it is critical in my opinion.
> 
> The lack of default environment as well as the configuration for the
> tool is a regression from the previous release and this mitigates it.
> 
> Changes in v2:
> - Fix wrong path on do_install
> - Change virtual/bootloader-env to u-boot-default-env (RP)
> - Add Tom Rini and Stefano Babic to Cc

Sadly it breaks oe-selftest's sstatetests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825

(reproduce with oe-selftest -r sstatetests.SStateTests)

As well as world build file conflicts in deploy:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/405
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1731

which is a large number of issues to introduce just before final
release :(

Cheers,

Richard

