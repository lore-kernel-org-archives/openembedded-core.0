Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4FDC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 08:22:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.3809.1646468533991945274
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 00:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PfLEKkOw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id n15so1699437wra.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 00:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2zzcb/PV4MgSD7RIduaC9+oEinaQ6HF2fDSozkHwQGA=;
        b=PfLEKkOw04E0ygfeYnUVds9+okHxBImMnVMTwg/cIz0ZzctBRKoHF/S+kUlDZxUfw9
         mPxzWIQfdY16Psu+v9SuXmynnekuAdDmKJdHzGt0xbdm/iE0zIqb+tEcX0TZWWHC7xnb
         mzm5MbNPOaj23MAaZJyW9z1XRNVrY1ifQOFN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2zzcb/PV4MgSD7RIduaC9+oEinaQ6HF2fDSozkHwQGA=;
        b=h6oKfEBgTT9E7Z2ql3XvinCDD9W3CtuyEvn32r7yTPJysVQqLu0oUmOj+Okd42bjim
         Q8R1MPEDVQnd4UWG0PgrWQTHX3IRZAHWMaFLccZT3uaB6X2GmZxb5ym+QS2RpyC4Q+Or
         7sM42MoHxKWX2bodihjK6hxLqgmh5aLEZBjOvoz2cWuFeWUAkPHBTdqBwre2cHDlKwB/
         KEwAnR9tQCgUFsknf3r1aBEDQSak8LCj9LFrve8BNOwoTHmDYdu7k2N4701ajIgrXRId
         BaV2fu1bO4khtdF4TYbRyMrD2ULLHsHYYFCCzYHANKm3L/83RYBKdimzyNmdExthmhLc
         8Dbw==
X-Gm-Message-State: AOAM532/fF3gsdqbzKQsPoBM6UAJbAc6Msc37U9S6NWWZJeVPIleNsa4
	4FDgik6WjtCxxfJnPF88qy/T/A==
X-Google-Smtp-Source: 
 ABdhPJy547rwShjtnxe9JAK/150FFZ1y4ro/gcPNnGt91Q7oDNbWfDfpTqxQ8kvAE+EQF2I8AKBDeg==
X-Received: by 2002:a5d:480e:0:b0:1ed:9f27:47e with SMTP id
 l14-20020a5d480e000000b001ed9f27047emr1657251wrq.511.1646468532169;
        Sat, 05 Mar 2022 00:22:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:58d2:445e:5b81:1f43?
 ([2001:8b0:aba:5f3c:58d2:445e:5b81:1f43])
        by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm15867825wmb.48.2022.03.05.00.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 00:22:11 -0800 (PST)
Message-ID: 
 <bdbc7662dae5887be08bfdb9fba53f042bf2930a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] pip_install_wheel: clean up
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 05 Mar 2022 08:22:10 +0000
In-Reply-To: <20220304171408.2672507-3-ross.burton@arm.com>
References: <20220304171408.2672507-1-ross.burton@arm.com>
	 <20220304171408.2672507-3-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 08:22:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162777

On Fri, 2022-03-04 at 17:14 +0000, Ross Burton wrote:
> There's been a lot of work in this class lately, so a little spring
> cleaning is needed.
> 
> Remove redundant creation of PYTHON_SITEPACKAGES_DIR, pip will do that.
> 
> Remove redundant export of PYPA_WHEEL.
> 
> Simplyify recompile code using "realpath --relative-to".
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/pip_install_wheel.bbclass | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 3beff685bb..1870b916fe 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -20,29 +20,20 @@ PIP_INSTALL_ARGS ?= "\
>      --prefix=${prefix} \
>  "
>  
> -pip_install_wheel_do_install:prepend () {
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -}
> -
> -export PYPA_WHEEL
> -
>  PIP_INSTALL_PYTHON = "python3"
>  PIP_INSTALL_PYTHON:class-native = "nativepython3"
>  
>  pip_install_wheel_do_install () {
>      nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> -    bbfatal_log "Failed to pip install wheel. Check the logs."
> +      bbfatal_log "Failed to pip install wheel. Check the logs."
>  
> +    cd ${D}
>      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
>          if [ -f "$i" ]; then
>              sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
>              sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
>              sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
> -            # Recompile after modifying it
> -            cd ${D}
> -            file=`echo $i | sed 's:^${D}/::'`
> -            ${STAGING_BINDIR_NATIVE}/python3-native/python3 -c "from py_compile import compile; compile('$file')"
> -            cd -
> +            nativepython3 -mpy_compile $(realpath --relative-to=${D} $i)

This last bit likely doesn't work unless you are in ${D} when you run the
command :/.

Cheers,

Richard




