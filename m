Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADD6C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 07:24:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.17830.1701415473033435568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 23:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QlF0ONls;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c9bbb30c34so22442431fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 23:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701415471; x=1702020271; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVngzSae4lY60h+EcAg7pq5XtvvBtPBdFDGdlEIFQ2Q=;
        b=QlF0ONlsp8Hi8VmRbihi8DpT0DymNbk1SQmAuCC1Arbcrq9TA92nEPFTi+ocTejD/4
         L8rJF8vtC11AeUVxwQMQPcfzq2KzDqO30BZ+CqaJhsUutR2QCdBKXqowwvoeLuqKR3Dz
         GF309ZJkSwRcenr75P4xWFS2SYUXq8K4+Yt8941pFyKK8PnU+kGUY/YYV8v+BOfhz05N
         SG6xZvHheiP+u9qx2ps+alkKmWo4307PfulFCp+SZmxLV0A5I7YNgEdDdRs6cXXOLrSZ
         /kDtJ9jR9M9i+KuBoEdnb1ClyaScbLZSrUpR4ry5UYc821kBeuc7e/x26g18WZQNC05c
         uP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415471; x=1702020271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVngzSae4lY60h+EcAg7pq5XtvvBtPBdFDGdlEIFQ2Q=;
        b=Ho0BuG4O0DxC55iO1NCREGHOQjRCvTM8zrATH+otVi6bmBNKUwgq4K4HTBg7XDPQuO
         P0pLDwd9OeEwvvMhPpU27j30ZyOMma+gfFfcLgK1iCm8kgw403ZOnNkCVh3Zp9U+KR+z
         CM9p/yhdXNnfusTj1q1k22VwukpapICmhZZtwPU/3EmqRNIwX6CACaqRdu3LMt6oxCLi
         QFlO7cEJMHaMl7B2EFdpZgPotvSvGFAgs5PwM1mua8yeh56nxnxEt3vtmokFavBxqYQC
         DTIAlYiY7ACfQ2OhNd4ziz/fWNKapgX3u6wAxrWExBlXA31DmSO6BeDV1q+OXwEnW64x
         tLYg==
X-Gm-Message-State: AOJu0YxzyKiCQOyZREXygVbdMFim1Wv2eVtypSusWvAMU+cekltqFZcz
	V72vgVA3cMPUQUnL4SQRGUXgRQ==
X-Google-Smtp-Source: AGHT+IHFrjHpzyQxM6q0wnQfe65CgOcWAHgXQzXeIucbujZHOdPcCjuYaSAyYIO0+Xh/R5Uhkhq0mA==
X-Received: by 2002:a2e:978c:0:b0:2c9:996b:3b54 with SMTP id y12-20020a2e978c000000b002c9996b3b54mr413361lji.53.1701415471017;
        Thu, 30 Nov 2023 23:24:31 -0800 (PST)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhbt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::183])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b002c50b040e94sm335071lji.85.2023.11.30.23.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:24:30 -0800 (PST)
Date: Fri, 1 Dec 2023 09:24:25 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd-boot: Add recipe to compile native
Message-ID: <ZWmKKacNvYu-ao5r@nuoska>
References: <20231201065336.1362984-1-quic_vkraleti@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201065336.1362984-1-quic_vkraleti@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191559

Hi,

On Fri, Dec 01, 2023 at 12:23:36PM +0530, Viswanath Kraleti wrote:
> systemd has ukify, a native tool, which will combine the kernel/initrd/stub
> components to build the UKI (unified kernel images). systemd-boot recipe
> isn't providing this tool.
> 
> To use ukify, one need systemd-boot native recipe so that a dependency can
> be added on populate_sysroot task to get the tool under sysroot-native.

Why not call the recipe systemd-ukify then? systemd-boot doesn't provide more than that.

Then, when using ukify, one needs to have the .efi binaries from target systemd recipe which
for aarch64 are:

/usr/lib/systemd/boot/efi/addonaa64.efi.stub
/usr/lib/systemd/boot/efi/linuxaa64.efi.stub
/usr/lib/systemd/boot/efi/systemd-bootaa64.efi

and these could IMO be in a systemd-boot binary package because these files are not needed
in the main systemd binary package and rootfs.

The recipe itself looks neat and small, thanks!

For secure boot sbsign-native would be needed, but maybe a separate issue.

Cheers,

-Mikko

> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..6d89e493b6
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +RRECOMMENDS:${PN} += "python3-pefile-native"
> +
> +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191557): https://lists.openembedded.org/g/openembedded-core/message/191557
> Mute This Topic: https://lists.openembedded.org/mt/102910738/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


