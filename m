Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1002A71D45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 10:30:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so17805790wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 02:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bYZ4CYtAYvzMyoKZ5HJXA3JYzXviuXdxyXAlHPhpsJg=;
	b=DxgZJ1Un4Cmqv03gzRX0NUkpUOdf1aYt/ztG6FNIZglihMDITSjTQGXv+ihQvSJgbV
	bUXWEDf8jLAmpX/HC9/l5Xl3MHGxRr67w1hZhx72AIGhPii3sl2PkRGMgm53ufKu7daK
	jKza/fqzWHHi7n1GthKSCaltL9nCUxpyb5Metn8On9IMUjkCZJdpdOpnLwlBr53mEonN
	cYxDKfXUMWcBMp/y56SXzaH9O+CefU8XhVEWzs448Vg6PVjkUHyY0jCdQXBdIIvzqm7S
	woa6gw7WuiL6NZGYbs5fj5Pz6tdUwuDWrXgDNFaTjt32tUAPgZCW0dsOEAk4lQCxAC35
	FxCA==
X-Gm-Message-State: AIkVDXJtJ+5MQZ11+p9A7KiFi9Lg5AoD3ukqvziXK/GmoNfkTVB4pSsD0pclgv+S2Xuc5A==
X-Received: by 10.28.221.11 with SMTP id u11mr13702060wmg.123.1482143407825;
	Mon, 19 Dec 2016 02:30:07 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	gj6sm19996976wjb.29.2016.12.19.02.30.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Dec 2016 02:30:07 -0800 (PST)
Message-ID: <1482143406.27847.15.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 10:30:06 +0000
In-Reply-To: <20161219030600.1284-7-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
	<20161219030600.1284-7-raj.khem@gmail.com>
X-Mailer: Evolution 3.22.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 10:30:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-12-18 at 19:05 -0800, Khem Raj wrote:
> Disable asm to fix
> 
> > You specified a pre-MSA CPU in your CFLAGS.
> > If you really want to run on such a CPU, configure with --disable-asm.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-
> multimedia/x264/x264_git.bb
> index e790681ad3..240a19661f 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -23,6 +23,8 @@ inherit lib_package pkgconfig perlnative
>  X264_DISABLE_ASM = ""
>  X264_DISABLE_ASM_armv4 = "--disable-asm"
>  X264_DISABLE_ASM_armv5 = "--disable-asm"
> +X264_DISABLE_ASM_mips = "--disable-asm"
> +X264_DISABLE_ASM_mipsel = "--disable-asm"

I think you can use _mipsarch these days, which covers all MIPS. Equally,
mips32r5 and later have MSA, so I think the override should be:

X264_DISABLE_ASM_mipsarch = "--disable-asm"
X264_DISABLE_ASM_mipsarchr6 = ""

or just

X264_DISABLE_ASM_mipsarch = "${@bb.utils.contains("AVAILTUNES", "mips32r6", "", "--disable-asm", d)}"

not sure, and completely untested.

Cheers,
Andre'


