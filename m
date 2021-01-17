Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.16460.1610875167400243268
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 01:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dGjjIm/X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a9so10087852wrt.5
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Jan 2021 01:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eqZsVlwVTxlxShpajcwkhvoMZCEka9FiIjO1sBrj08c=;
        b=dGjjIm/X6XE9XVZ4CoBuh0egwlzyFHnJ+RY44oLZT9O44d+QLWBd/tJGe1Xu1BMd0a
         vMRQtAex93pkVqnfWLAKm4OhOAfT991FiEs3jly79ip96B0dKDv4aBgBTc2mm1tTf7T+
         HSXsvZNhhnMjL1ndJ18ygNHpjcQLHUYl7CVX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eqZsVlwVTxlxShpajcwkhvoMZCEka9FiIjO1sBrj08c=;
        b=hFKoepdflNFEOKAsuGf3906TD5L25dHcNlHurRHiNTzwAPLA3NhJ80/0UiP2RnATzc
         ddCF8uvw9eE1/K8hM2uVZZPXd6wodaiy/6Z3CbXaiIN2IVZoEtPmmgQBSicGV0EgChxJ
         c1LJm+D/2PSKrx/lvnYZHPZ7snNYN34pK5D5VPf/UJEkuv4AHpHoPidM2qGQXi4SOhQk
         cX70IIZuR2FFN3Nj5Do33SgHIggvH4sjEr/X8f3DOnO8P8WJo8a2c1ekVEPOFhngq1NC
         VKRYreInK4Prk+8xZYCdEVGPRDKRDXXMjyDwDvf76UzNeEt/onc4MynXI276AITR2Nar
         s/WQ==
X-Gm-Message-State: AOAM532OHcGcqL/Airx4aTfVy///NnUyUOZqlxfZChQRVuTzS0cinOSg
	SuK18HiyqjFl9h9E3JLkXrPAJw==
X-Google-Smtp-Source: ABdhPJw9gFRuTB+VGcaNhbTp/Ocn5rJU/Gjas+B0JJ8C+pffEekyeh7xd6LuYBusJ4H832YcrU8c7g==
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr15829500wrx.297.1610875165633;
        Sun, 17 Jan 2021 01:19:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bfb4:a7c0:34bb:ed0e? ([2001:8b0:aba:5f3c:bfb4:a7c0:34bb:ed0e])
        by smtp.gmail.com with ESMTPSA id x18sm25500910wrg.55.2021.01.17.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 01:19:25 -0800 (PST)
Message-ID: <468148270ddf4d915287e381785974d4319ab2ef.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] systemd-conf: Allow systemd to manage QEMU wired networks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
Date: Sun, 17 Jan 2021 09:19:22 +0000
In-Reply-To: <20210115214903.11811-1-JPEWhacker@gmail.com>
References: <20210115214903.11811-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 15:49 -0600, Joshua Watt wrote:
> Allows systemd to manage wired network interfaces just like on actual
> hardware. Systemd seems to be smart enough to not enable DHCP if the
> interface was assigned a IP address in the kernel (e.g. by runqemu), so
> the existing use cases should continue to work.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-conf_247.2.bb | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf_247.2.bb b/meta/recipes-core/systemd/systemd-conf_247.2.bb
> index 944b56ff82..ea35e83f4f 100644
> --- a/meta/recipes-core/systemd/systemd-conf_247.2.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_247.2.bb
> @@ -29,9 +29,6 @@ do_install() {
>  # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
>  do_install_append_qemuall() {
>  	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
> -
> -	# Do not install wired.network for qemu bsps
> -	rm -rf ${D}${systemd_unitdir}/network
>  }

We did this for a reason. In testing we're seeing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1831
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1830

which I suspect could be related to this.

Cheers,

Richard

