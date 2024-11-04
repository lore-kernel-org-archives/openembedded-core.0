Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68AD132D7
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:46:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.59115.1730731582900885695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ilDtMeuT;
 spf=pass (domain: linaro.org, ip: 209.85.221.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso2727219f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 06:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730731581; x=1731336381; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mkwKX5yTOirp6v1tj0aAQrFX9BPW1NXO10i+slfIXs=;
        b=ilDtMeuT4IpGva1xKn1lXcF9l6/+/p4v7azDdsAfgJupKNYly3LQcHGyerdJLF86y8
         DFn/LHS3evFryrdtaGrHpXdsra2QnSA9LZBZEtzbXNn6eldUa77xrgKZtdLV7c4RrX01
         gu2GGhLtGv3hPbSVsG3NBvrU35XHfmXgOhBLU7WZTJzVT27yv9Wb9ac4EEmF8Kjz+b14
         sVBCzfcciKhQ4ZZqOWs+2t5MqZCbDybDivK0sxDRLOk8KNhxpSzLzWazvFqq/9T+Wd64
         FLK5aaOZEPBRGlTYOKrH2tCUPlK1jD31TYLN2k0LfIGVS2LHkY17P2w+od7FJNyuy8EA
         NQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730731581; x=1731336381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mkwKX5yTOirp6v1tj0aAQrFX9BPW1NXO10i+slfIXs=;
        b=knt51OyXN3dlMMJXGW4kOrB/xS2P9+ToXup7vKYAmTJPX3vTRcQXebgmGwVVjn+2U2
         EpJ/K9hmAzNKSRXO/w0h2BEMmwypzQXOa7QvUxbiF7H6uUX4n3YqP+qRAAAwpJv1Pa21
         N9hhA2czhA2T9K7IeQdmv5oPvUqdiCtDmB/16cpuWeMlNQm2LZlfbxAklY8ZqrkB80Rn
         KV58UmkxOCWZMCJaqNbMFQsfNA9N6eg9E+CVF9bJOVl/bS7PODb5PfXbY+1A5SO5Oapq
         cMwTZsa50CrBD40v6ayMVX8qgNlFGBiyUFoKX2tfkc/vRbDJhWBS95GEYubb4wlMV2jY
         qNXg==
X-Gm-Message-State: AOJu0YwkLEoHuQX0+uD8leo9b3upAsmmLADbeDf85JBmo4x++GLooNID
	CokTMVupyxOtO2WjmVghSyNAfK02dmQDQXzCEpdMvRt+g8u+RwQ1noa96GZSeQI=
X-Google-Smtp-Source: AGHT+IGc3vPVSoVAjUiSRp4QPZQ7flucfbk1oekOHvDytlWYeJVj6S0yGbb6+MPwELubHPlmarXIjg==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-380611e1392mr22404862f8f.41.1730731581138;
        Mon, 04 Nov 2024 06:46:21 -0800 (PST)
Received: from nuoska (82-68-34-100.dsl.in-addr.zen.co.uk. [82.68.34.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116af7esm13394930f8f.103.2024.11.04.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:46:20 -0800 (PST)
Date: Mon, 4 Nov 2024 16:46:17 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
Message-ID: <ZyjeOcX6A5n5DHhB@nuoska>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
 <D5DH1WX0YPB5.1HGW4MP6F3QTB@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D5DH1WX0YPB5.1HGW4MP6F3QTB@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206684

Hi,

On Mon, Nov 04, 2024 at 03:42:10PM +0100, Antonin Godard wrote:
> Hi Mikko,
> 
> On Wed Oct 23, 2024 at 2:08 PM CEST, Mikko Rapeli wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on demand
> > with systemd-repart using device specific TPM devices for encryption.
> 
> Now that this class has made it into master, we need to document it in
> https://git.yoctoproject.org/yocto-docs. Would you be able to help writing some
> documentation about this class and the related variables it defines? It would
> need to be part of documentation/ref-manual/classes.rst, and the variables would
> need to be documented in documentation/ref-manual/variables.rst.

Sure, on my todo. Feel free to send something if I don't get into it in
time. Struggling with some trivialities currently: rm_work wiping rootfs
and wic creating and empty rootfs instead, breaking builds and tests
and hindering debugging...

Cheers,

-Mikko

