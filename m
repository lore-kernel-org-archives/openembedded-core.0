Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEC57FCE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:08:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c127so12352521wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 09:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bJVZuxM5PqRZQJXVS4/Hz9KL2UMGfCRZVmyQmvascMc=;
	b=Ff4SwcO7JLnw2B76d6kKW2Vavj5hNnMVax8jQ9GgxkOUpcwTtblKlaxHv/oNd8+8QR
	VU8d5K7BtQEmu3RZV8uerJYA/pqkm4UWdYk2tMeTw2hn+qe3jNRQJ46G39ElHmstqz4u
	RW8Aald4UGfpAZ+I9jVOqccRrLloAC1KNpWCp5Zr1U+tdHi2cl/xLrZvur3QsRtu0g/n
	nstz4c0w/GrM1ZqVaDhAASsIiXMHmxnNhjc8ta/LWR35G9cjiDgT1hzmO4vJL5JKL/Bm
	L/IsvhH55EXX16vcY4Li/Llqd2ffMNkv//ed9mb/6qHyafHocQ4nambajjxw4f2cA1r+
	g/AQ==
X-Gm-Message-State: APjAAAVs81WeQ/lk1RYYVMWh/Qiw1HcNFqj1cvBCujf+RPFs/xDCtLYJ
	ZNzZyKiB+4fdRZt0nuYkatk1N2yP
X-Google-Smtp-Source: APXvYqziigcrKgDUNFqBHnxpEkSCDQj16hJzby02J/i11kjQldRSZAywVvmxT+tN8xwOXNq2orWPog==
X-Received: by 2002:a1c:a9c2:: with SMTP id
	s185mr35699347wme.119.1578330490128; 
	Mon, 06 Jan 2020 09:08:10 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e18sm73596109wrw.70.2020.01.06.09.08.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 09:08:09 -0800 (PST)
Message-ID: <68f893a224c39ed4778f1d35b6e38ac06faca346.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 06 Jan 2020 17:08:09 +0000
In-Reply-To: <f8e251c9d729cabcb7f9eb0ee536c6a894e58e87.1578035913.git.raj.khem@gmail.com>
References: <cover.1578035913.git.raj.khem@gmail.com>
	<f8e251c9d729cabcb7f9eb0ee536c6a894e58e87.1578035913.git.raj.khem@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags
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
X-List-Received-Date: Mon, 06 Jan 2020 17:08:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-02 at 23:21 -0800, Khem Raj wrote:
> This is needed for 64bit time_t support on 32bit architectures
> see [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f

As per the above, __USE_TIME_BITS64 is a glibc-internal macro, to be defined (by glibc),
when the application requestion 64 bit time_t via #define _TIME_BITS 64

Is the behaviour different on musl? Should this patch instead set _TIME_BITS?

Cheers,
Andre'


> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tclibc-musl.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
> index 8badbbb40a..22f8214ba3 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -18,6 +18,7 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
>  #USE_NLS ?= "no"
>  
>  CXXFLAGS += "-fvisibility-inlines-hidden"
> +TARGET_CC_ARCH += "-D__USE_TIME_BITS64"
>  
>  IMAGE_LINGUAS = ""
>  
> -- 
> 2.24.1
> 


