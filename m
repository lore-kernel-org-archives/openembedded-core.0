Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2927FFBE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 09:16:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so4439137wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 01:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+IvRJi/T4iH9ulCjO3rr2+YDKrtf0Tkhdvtb+SKJH7o=;
	b=XDDOsMIJE6ANls+ME41DTFE76uCKx6St0f/V2NQgfYpV8hTmpBjCRoJd6sjg7n4KUz
	hyNxEqx/cinIXxn5QJ5BZDSI6EwM/jQ3y4GaAFQpxGw9XfyyyW1Weth9iXpAFCk57Zcx
	TautgckF1xmsVtD79zD7Ut+B8xkSU6D+iYZuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+IvRJi/T4iH9ulCjO3rr2+YDKrtf0Tkhdvtb+SKJH7o=;
	b=EX6QeWI9mavmZhGkuYFzxjwOpSaZUQiRnXKDVUaAj2N0j1pykkkDVfmxLd7BHNVw0q
	bxMXT46s9NCd0fUY646an3kQ0fD17OrovIl6LE8pFwOPEgmwSJZaAh/vstqRc7/K+kRg
	AHXZ8aKv75/4FS85TllfIle0A863mnAtDHlzDHhhZKkbEmrQWpopWDvjlP9zYtnYSTrE
	x4opWrZo6GEa0IWSND83BvAEZAaVGNJnPq9FkOLQiIiiPuUlb0rv9d5ceXwRdd/EcD+e
	Ya4+jRTI7O54yVeD5yrv/x6QUqV1N8AxwptbxErTOxi1gFbeSa15BGTfJ/PkjLU3wGKp
	4Lwg==
X-Gm-Message-State: APjAAAVprzN2trKLceBBBR9TQAQJ2XXaZfPuPI+EJ99HLMZUyZ9vtT7S
	246K8wt+MtCrztkU36v1Fniy1w==
X-Google-Smtp-Source: APXvYqzxKUfaLQZbYd9C9vOFqEe+tJHffp9Vx/qjmgRbtYunQaibOUUq0OMAX5iAvfM+ogzsrt++tA==
X-Received: by 2002:a05:600c:409:: with SMTP id
	q9mr9078766wmb.19.1578734197087; 
	Sat, 11 Jan 2020 01:16:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k11sm5402224wmc.20.2020.01.11.01.16.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 01:16:36 -0800 (PST)
Message-ID: <b5b04e547e8c4816109af537260e5cbdb86e3c0d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 09:16:35 +0000
In-Reply-To: <20200110172938.3060002-1-raj.khem@gmail.com>
References: <20200110172938.3060002-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] qemuboot-mips: Enable VGA device
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jan 2020 09:16:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-10 at 09:29 -0800, Khem Raj wrote:
> This helps in booting weston images ( core-image-weston ) with fbdev
> backend, without this westons initialization of fbdev backend fails
> because it does not get correct frame buffer settings and exits
> pre-maturely
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-mips.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index 978820a2e0..52cb28a5d2 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
>  QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
> +
> +# For graphics to work we need to define the VGA device as well as the necessary USB devices
> +QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
> +QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
> +

The change is probably good but it causes consistent failures in out
testimage runs for mips and mips64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1429
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/196
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1431

all due to errors appearing in the logs.

Cheers,

Richard


