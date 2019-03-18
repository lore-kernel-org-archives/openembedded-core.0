Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D2F2579BC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:12:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w2so17191321wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8WZOV9E/Fy8BUB+feLDrkb7TC/K0AWpJ9kk/VFlNQMg=;
	b=dSWG4k+AZe+Q5xum6q4FPu4RmgSFJcEUPWuCvY/qaezcP8GT+13Oc5mmvIAjQvJ4Wy
	ZZkgCPrp/TPe+P7JJwOsLZFliLHCixuyHu8hBZsKlP3hUN8qMMi5S/sW8TnSHx5jOXVT
	9+le0MLAtXUmUfLFL9XsLa7hBzCab07YA9CI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8WZOV9E/Fy8BUB+feLDrkb7TC/K0AWpJ9kk/VFlNQMg=;
	b=tFjSyo0Mu3yWR3Mvfd8Q4K3D+GR3jWa1aqrLhKXh9pIV4VS7ym8iqCOwGY8+yUo4s/
	Nb/KO6irkWy8RuNJKToWfjr3MczrcBoUFz/6c/XYiZW0nuI9EiyqkL3sJqAGyXILX3QO
	brN4dj/tv3kABL51/wM+HwBOhhdChOveCxLW/ZjbeRZOVlUxfa3H0F0BfOacI+3BY0AA
	S9Yq/q/atQHDi1cpxdGqD3WZYGYqBz6MfKAgF8XHTTIeB1BRrYSmW4azWq8+zXFXYxth
	Vohcmn/ZWZCpLg9fTpH5np5JZlOvlG/xGnlMCbfNbPekDn2g6EaqxLDtnaRG+miRoWYO
	e77A==
X-Gm-Message-State: APjAAAVpT40ia1Z0i1e+uwCoNO1U2LCmErG4qzSYHTGKg5Cb/izjpxXU
	mRDWKXQltm48ZrBvT6SmtjwLDw==
X-Google-Smtp-Source: APXvYqxbkm+k3ILexiFDjs60aJPZmFLH6+E4WeO4fwqGhNfKKT7DS/OpFABveDVLdais5qWtn3Xw+w==
X-Received: by 2002:adf:e692:: with SMTP id r18mr2870345wrm.231.1552918325561; 
	Mon, 18 Mar 2019 07:12:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r6sm9790170wrx.48.2019.03.18.07.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 07:12:04 -0700 (PDT)
Message-ID: <3a10d22c5fd11fc3304e7f7da7a03c3899bd759d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 14:12:03 +0000
In-Reply-To: <20190315062903.1431-1-raj.khem@gmail.com>
References: <20190315062903.1431-1-raj.khem@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] cross-canadian.bbclass: Do not override LIBCOVERRIDE with SDK libc override
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
X-List-Received-Date: Mon, 18 Mar 2019 14:12:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-14 at 23:29 -0700, Khem Raj wrote:
> cross-canadian tools are supposed to generate code for target and if
> we
> override the libc override then needed overrides do not get applied
> when
> building gcc cross canadian e.g. for baremetal, which causes build
> failures during compile
> 
> e.g. https://github.com/riscv/meta-riscv/issues/117
> 
> Not override libc override helps us fix this issue
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/cross-canadian.bbclass | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/classes/cross-canadian.bbclass
> b/meta/classes/cross-canadian.bbclass
> index f5c9f61595..ee53faad79 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -9,7 +9,6 @@
>  # or indirectly via dependency.  No need to be in 'world'.
>  EXCLUDE_FROM_WORLD = "1"
>  NATIVESDKLIBC ?= "libc-glibc"
> -LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>  CLASSOVERRIDE = "class-cross-canadian"
>  STAGING_BINDIR_TOOLCHAIN =
> "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-
> ${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGE
> T_VENDOR}-${TARGET_OS}"

Whilst I understand the problem, we need to be cautious here.

*-cross-canadian-* runs on nativesdk and for example often use glibc
even when the target uses musl. This change is partly reverting fixes
made to ensure that nativesdk worked as glibc (and glibc overrides were
applied correctly) even when the target system used musl.

I think this issue may need more investigation unfortunately...

Cheers,

Richard


