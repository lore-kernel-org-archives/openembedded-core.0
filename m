Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7624.1615553103973851653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 04:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cjSeJNQg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id o16so1701674wrn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 04:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kQuCLLmWlKrRfMzTUOm0t8KoQ68Z+PlBVoFLEkUsgJE=;
        b=cjSeJNQg9fDeT1Jp6CMbZF1GvtcXxRYkh8enhX4uJ+9aOdv2vISMO2olAaNBwKhxeG
         5BMbLx5bntJ2awSePKwuH5MT6UWbf3/x//4buMqNSMPYKKlJzODl8SqTR1BL/V60FTXc
         r/vd1Bly2XFpA6WBdaHk7HKn2bI9nfobDsBok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kQuCLLmWlKrRfMzTUOm0t8KoQ68Z+PlBVoFLEkUsgJE=;
        b=tfv7ZD3oc6mfHxSOrba3U9fc5HmuY93BJc7w0J8zBJ28MaWgAHx69CUtCB9vRdT5hN
         K4SLaP2SCLwm5e7M8DWa/4wNfXUECNuCLfd8sGLGG7MEdxqOthby4CrBrInBjqC9Jdu3
         1pSFLXJjjvc0aaZF4AAltElzk2aLorGB0mgh9y7U3qHgEJbsoeo3pSgt2ad+fJyg3eJu
         zOKVTQPfC6Tv4FQlkucghcqwOu2ARq0Hg66xVpCwINCk5DSKKUKI7DAXQQfgrK6UJjws
         PR8ywWmVl7iOxun9/Xr5pmX6WRra1e+quxD4nNnuKmug5twRVhdVesgN8Z5z4RQo9YKV
         0vBw==
X-Gm-Message-State: AOAM533wyB7nRjTyLQqL0yVlRoJWxAwj5pXFxa22uByD4B3ck2xkpCnQ
	uUIJDwRdcMgWKyaCDd5UJyrFkQ==
X-Google-Smtp-Source: ABdhPJxwkCW32EjZQ/QgDFhECyqaGOEmXZNJlUiDhd6+vkNJ+y3+xhaCfe6+xKke3e8DQRns2KfGCg==
X-Received: by 2002:a05:6000:23c:: with SMTP id l28mr14286246wrz.251.1615553102221;
        Fri, 12 Mar 2021 04:45:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7cc6:73c3:839f:86be? ([2001:8b0:aba:5f3c:7cc6:73c3:839f:86be])
        by smtp.gmail.com with ESMTPSA id n6sm7864713wrt.1.2021.03.12.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:45:01 -0800 (PST)
Message-ID: <7f61a68faa2e2d14eb41770f7e4973c38abb409d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] linux-dummy: add empty dependent packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Li Wang <li.wang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 12 Mar 2021 12:44:59 +0000
In-Reply-To: <1615542770-26280-1-git-send-email-li.wang@windriver.com>
References: <1615542770-26280-1-git-send-email-li.wang@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-12 at 17:52 +0800, Li Wang wrote:
> some kernel includes kernel-image-image and kernel-devicetree packages.
> these patckages are defined in kernel.bbclass
> but, when use linux-dummy, these packages are not defined.
> so, define them as empty packages for avoiding compile error:
> 
> ERROR: Nothing RPROVIDES 'kernel-devicetree'
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  meta/classes/linux-dummy.bbclass         | 26 ++++++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-dummy.bb |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/linux-dummy.bbclass
> 
> diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy.bbclass
> new file mode 100644
> index 0000000..cd87915
> --- /dev/null
> +++ b/meta/classes/linux-dummy.bbclass
> @@ -0,0 +1,26 @@
> +
> +python __anonymous () {
> +    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
> +        # copy part codes from kernel.bbclass
> +        kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
> +
> +        # set an empty package of kernel-devicetree
> +        d.appendVar('PACKAGES', ' %s-devicetree' % kname)
> +        d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
> +
> +        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
> +        type = d.getVar('KERNEL_IMAGETYPE') or ""
> +        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> +        types = d.getVar('KERNEL_IMAGETYPES') or ""
> +        if type not in types.split():
> +            types = (type + ' ' + types).strip()
> +        if alttype not in types.split():
> +            types = (alttype + ' ' + types).strip()
> +
> +        # set empty packages of kernel-image-*
> +        for type in types.split():
> +            typelower = type.lower()
> +            d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
> +            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +}
> +

Rather than generating broken empty packages, why not just set RPROVIDES_${PN} 
with the appropriate things?

Cheers,

Richard

