Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151E0C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:43:10 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.13436.1751420582870928923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+jWMHRZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d40874b399so356569985a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751420582; x=1752025382; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZKVlbTyWYK4LaK80xzdUC7ZNQmcFZE/cMscr8o76Bo=;
        b=c+jWMHRZUdh7+owI6gwIZvVsmxrybSL9Dj0hnUa8zcvJqkigMW0rhXCxoORCoMQq8p
         Tsw9vWkxoq5jqLq2s4ex5YbMWevl5UApyD3PWZyy3wPEX9zXD4D2Y4LY3UmorpnHlKR0
         h3Kr7ivC7lxu8o7nuLuAFzGm8VPiz8ta2lSLi4+B1ilXue7Bn6QqkJM0kJyfAgaUdBE2
         OHDaA8x/Lx3vHLfBry7UZQ/RaGZz5FSwhGatP/3Nuhc4WSyKAkA5kaTJ0ERllVOWPz13
         rmnranyvPcxLiMtTIhNYPk4r0sLW9Mu/vLr31sb8n0qbbCUXGlHjgFasn+uxzPvkI841
         /5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420582; x=1752025382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZKVlbTyWYK4LaK80xzdUC7ZNQmcFZE/cMscr8o76Bo=;
        b=l9RcZdavQKs2uOFf7CLPOLq0X0gRzIKUZb46DS2K4kxgfb08yntRYT9UP4YTgOkOSa
         ZFDkY+mmDn+bGEGyJjs0cOcdwEKmdHgaBzAfmNhtb5g1ViA90GOofN/zfzfB2QWFLvBt
         4QrG6lK8RX26WEfkOaIseLsANgZz4FR5g6BWJhkPlos6nd3awVDl0b4kUmZRRBU9QgRD
         xu1kQrwZvtlD9+aqAeitlzWv1Y9kAkcvzoIQgz46GLgNEFnpFNeg6oo/O1ME5BNZQcwG
         ntRmiEivcffs0Qvwn5AkpkFryo2eSfE1aDJxtMazLvK1vEbFOkNh0EjUWs5fAi2ZX1z+
         xJ6g==
X-Gm-Message-State: AOJu0YzHVJsQgKM2HZ5qtPq2x/74iZv1EBpkxd7rb/hldWRCSN6Qy6c5
	oEl0Hh7fAVXZz3n9VseDyqZN8bCz3FypuGOjifRqlrTnxCRyutAtOyn+
X-Gm-Gg: ASbGncvUo4fuMMQGfXDmY75rySe1xaOKjhCw9Rz339iiQqqLk/d6DuzwU6w0mWMKh2a
	P+mifJu4//9t8xX5UZMsKvkR2BmY3GH9jXsbj/eA1rLw96reiaT9C9KlL3W8qFs92qnv3JPSdbA
	GzjdDzeoVNj7Ly3eyAgzj3ZBQ7/MwybAl23ZWoGHx97wVAsE90zbRQBmPRqjs/1mlJBDoTebvfK
	d5Dn4n0qz9/0pjQ5NTP7bYU/hsq1UFHmIwc5iILASWe2MbrdwdVhxSv9kJ4qrFVcVuok6HmChM/
	s0v87IhXHzKRqpusH3rvr18TW6Y8IhAXQPdWqEQUJMB+bVvOaEri9tEJaQ0OUOJb58jyha87XUY
	u9Y+1t5o5INwrz0cPfjQhUD7uKgSJA6vN528stZPy
X-Google-Smtp-Source: AGHT+IGTtp6GziThdaFgtwjrVICdgOm3HAEI6xB+qLavA/WaD43M6aIAVpYSR/gVXY+I+RT6dGLRvA==
X-Received: by 2002:a05:620a:45a4:b0:7d3:ad4f:ce0d with SMTP id af79cd13be357-7d5c47a43bcmr213314285a.47.1751420581754;
        Tue, 01 Jul 2025 18:43:01 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443235ed1sm861951185a.100.2025.07.01.18.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:43:01 -0700 (PDT)
Date: Tue, 1 Jul 2025 21:42:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] kernel-devsrc: make package version
 consistent with kernel source
Message-ID: <aGSOo+eIpM1fMU8B@gmail.com>
References: <20250630121708.4010323-1-hongxu.jia@windriver.com>
 <20250630121708.4010323-2-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630121708.4010323-2-hongxu.jia@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219745

No concerns on my end.

Bruce

In message: [OE-core] [PATCH 2/2] kernel-devsrc: make package version consistent with kernel source
on 30/06/2025 hongxu via lists.openembedded.org wrote:

> The package version of kernel-devsrc is 1.0 which is not consistent
> with kernel source
> 
> $ bitbake kernel-devsrc
> $ ls tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-*
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-1.0-r0.qemux86_64.rpm
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dbg-1.0-r0.qemux86_64.rpm
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dev-1.0-r0.qemux86_64.rpm
> 
> After commit [kernelsrc.bbclass/perf: make package version consistent
> with kernel source] applied, it moved the setting of PKGV to
> kernelsrc.bbclass for common use. And bbclass kernelsrc has already
> inherited linux-kernel-base, this commit uses bbclass kernelsrc to
> instead of linux-kernel-base, and remove duplicated settings.
> 
> After applying this commit:
> $ ls tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-*
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-6.12.31-r0.qemux86_64.rpm
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dbg-6.12.31-r0.qemux86_64.rpm
> tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dev-6.12.31-r0.qemux86_64.rpm
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 7ad848c35eb..3d2eb3929e6 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -7,7 +7,7 @@ SECTION = "kernel"
>  
>  LICENSE = "GPL-2.0-only"
>  
> -inherit linux-kernel-base
> +inherit kernelsrc
>  
>  # Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
>  inherit module-base
> @@ -20,14 +20,10 @@ do_install[depends] += "virtual/kernel:do_shared_workdir"
>  do_install[depends] += "virtual/kernel:do_install"
>  
>  # There's nothing to do here, except install the source where we can package it
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
>  deltask do_populate_sysroot
>  
> -S = "${STAGING_KERNEL_DIR}"
>  B = "${STAGING_KERNEL_BUILDDIR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219516): https://lists.openembedded.org/g/openembedded-core/message/219516
> Mute This Topic: https://lists.openembedded.org/mt/113906487/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


