Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D8ACC7C2FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:56:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y139so422403wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hZ3hW1PFYAazwC+yrFSpyi4zRGeTmbyq29HNRepRehY=;
	b=TQbrVKcJpN0fCM3lz6fcaTJxl2o5dyNv26bTya6OI7CGs3YB8L3ShiY7ci+JmOp6ex
	qn2BMI+Usk43sKbtbGiMrUwflsiFULb7AdoyPk6yhf9/nvEt/efiRWkDg8h4Ve64r3jG
	c4680LCB+hhsecaZNOMYSbjUVBJu73hVd4zMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hZ3hW1PFYAazwC+yrFSpyi4zRGeTmbyq29HNRepRehY=;
	b=shcR/01aBCKcVQfRsh8swVmsMITUE0A2eDFY1alH56g52EBDe4vwBoNEAYmSSEAS+c
	A1hZvp9UUjGcGLtKPOnLD889ugO/e8li/A5L0LBzYI3OgK9p1MY6p3MfozCT9bxV9+mF
	hkrXct2u+HfKtGzYjcgSTzrQW3BGxVb/yqtzoEB+EZP8vWgr57HTUzTP66Md3Eg7/QwG
	aX/26hGZXBUftuLC0tomiINfJOuJhivaitPlvxeZMWBhumwUHms4w30GftuwaAEPbXnU
	TP48uVL5gL2zlK0n8eOuuuslCwJvvBiBeRYyUeKFRO3p74ufv+0WgUlYDAJ9rmWI7xWX
	7ViQ==
X-Gm-Message-State: AJcUukf7EzGKviRP1n1Y7Fmw4GN4LRqS6SSVyWv0jLbpuisoS+LdFn9/
	bo2BNAIH9G84V9p+UBQaj38rHA==
X-Google-Smtp-Source: ALg8bN4hnvTD7pBeMV3LSAJdp/i33UQndB7nRAYnCLB7qCkCxUM+MYLEtLAawRbelwJh5fbVLYA7xw==
X-Received: by 2002:a1c:414:: with SMTP id 20mr27130637wme.67.1548885398550;
	Wed, 30 Jan 2019 13:56:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r200sm5917866wmb.36.2019.01.30.13.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 13:56:37 -0800 (PST)
Message-ID: <608ce7362098bbc8c96431fd8c56441a46e1a56b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 21:56:36 +0000
In-Reply-To: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
References: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Wed, 30 Jan 2019 21:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-30 at 16:02 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
>     The SDK was unable to find the C++ header pieces correctly since
> it's
>     using a generic compiler, not one specifically targeting the
> multilib
>     vendor prefix and default tune.  This adds the right mapping to
> ensure
>     SDKs work as expected. And fix problem in below configurations:
> 
>     multilib configuration:
>     MACHINE="qemumips64"
>     MULTILIBS ?= "multilib:lib32 multilib:libn32"
>     DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>     DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>     MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>     require conf/multilib.conf
> 
>     ignoring nonexistent directory "<path>/sysroots/mips64-poky-
> linux/usr/include/c++/8.2.0/mips64-poky-linux/32
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Breaks in testing sadly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/236

Cheers,

Richard


