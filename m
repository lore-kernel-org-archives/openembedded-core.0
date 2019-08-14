Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EDD856D6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 22:20:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so576820wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kq58q98y4A8NEnB/hnEqDH8UO/Ej8/vICwXJOoLXh1Y=;
	b=J8jILi7NY24teIqP31RtDYQOylojHAn1aG+NjAeDjdZQV4WBCNQsHfgDqAl/4yGfMk
	YFGVcoA53P9h8+XXsa3/rJtwNanUlnKKARUf1M/GhL+yjItwp9xU34gPT3D4b37eCulI
	AR41BEhl5FgAt10KEm50Qi88OLPrE+uwUNVoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kq58q98y4A8NEnB/hnEqDH8UO/Ej8/vICwXJOoLXh1Y=;
	b=BgzGVuL6L6P+yoEhTDdYVcmbHfhrBd8NWO3Tf8drGVrUxpFufobec5fddoy+nPCjzE
	o/XsLnc4ppKT14wZ17AJgx+2x0Do9w9f8wY9NPm/ig1vQY+p13bpuZRj3cAubWhtxNWY
	Lx+l1LU1aPp3ASlHL8+Ytvc/rX9SMWKbLtsXhKD3vRhB8DoH06xlTGrqOQ0Xt+AGkmjv
	BwfXy1qnS9cSMBRuB1xCcO7qzNuLPPQJQ01Ttnu89NS2LUozJj1UDGMwkUw2TRcOS2hm
	5/6jcmlHApDwPEN/Whp80v3W97k2nhjej33Z3hQfe5JOJei83u9kDCJ09HMvWSuZR7rj
	LUAg==
X-Gm-Message-State: APjAAAVayFwu6QWpB3Y/jREYw/stL0jEOaTkDbgIEgHhZwpjJjsSOuDy
	tjl4VErEfLwiqVDp+aX5wy+xWQ==
X-Google-Smtp-Source: APXvYqxTGw91g81v345Tp2BecFB/DHqA82bpGCXsEL+Nmyva2DK5scc2cD15snVGvk5ms1gWkiXo4w==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr1747191wrs.108.1565821243533; 
	Wed, 14 Aug 2019 15:20:43 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm2630295wrb.80.2019.08.14.15.20.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 15:20:42 -0700 (PDT)
Message-ID: <83c8625d33058ccf085ebd2a646aa41519c73625.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 23:20:41 +0100
In-Reply-To: <20190814152613.46996-1-alex.kanavin@gmail.com>
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] linux-yocto: add drm-bochs support
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
X-List-Received-Date: Wed, 14 Aug 2019 22:20:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 17:26 +0200, Alexander Kanavin wrote:
> This allows better modesetting support for the '-vga std'
> emulated hardware provided by Qemu, which we want to
> standardize on.
> 
> See here for background:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb     | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

https://autobuilder.yoctoproject.org/typhoon/#/builders/41/builds/929

Cheers,

Richard


