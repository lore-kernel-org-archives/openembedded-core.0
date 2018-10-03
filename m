Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6E6878DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 09:12:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c18-v6so4841634otm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zE78OTZwT0CEcHqCFZS+1UKkVCDac2d4HKbBB9heOVw=;
	b=iQBujx/8NDZvx1spgVSIO//j3esBc16T7fb9/HdlI5E1D144FE2rKIVIntDad8doJW
	m/uQDwd9uK6POo+s4P65TVyg1OANFoRTl//WcwqQSlUXyHE9oThSXOxaSsxXgl7tK+kY
	z19ee1TQUuBrXzHRYg/kqtakREVLBTBGAkGkOHigaQMqiTj937Ko4igFJXSKj3ldbUKj
	cTA9vAw10PhHvN6shawPs+FAjazTovJDm/UAs2CNaa2dGA7qsAzSX9QcfbF39vzfC8KG
	gaHPPqjqPO4ySgb09m8NcyCUYDQ9Q0mRbLOpay6bETTDSW4XQN20ayqCdJs2sy1WmRsT
	cxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zE78OTZwT0CEcHqCFZS+1UKkVCDac2d4HKbBB9heOVw=;
	b=gxBbdR/CjF2lA24+EJ2vKxhXauc8azuhdSkpqKhfYyFxfbh7BDBuCNtuw/d5MjfVt5
	4Enc8MThJJbfpWCIL8mUvg/y+nRb93OW65OjSxGqOXoAuMIjky/L5OtHqtBhIg/taifU
	KcUrtf3csaGbgI1S3t01YNE1Xlx0X0icsxp4fIBvtsJgeMnGRqbA4KvzwXkNcz65vPt/
	aLFb4NHedwvE6EDjQRS33fpmQhNbpvU7NBSYcvsNhmb7740lwas0N5dz7npeoP6oUCdR
	m4ITL4Ujn9eDz9ondBPPSkNSsW9mOZ6HQz95jp+N8HQpznTXHvBhVllt5XMIJT90mMbf
	TBvQ==
X-Gm-Message-State: ABuFfog1JeAZkUHNCxPNloyC/roYHA8NKTwDBCBypcsLyGy71iOg/A70
	9zUhz6uo3QVeaB/b9mKMlk5+udkqzIqqYRfU4aCKHk2O
X-Google-Smtp-Source: ACcGV61iVyMBBR7VS+FFjAippP7G7KpuEj4c4l45GFIMtqn1GiWGp9CLmbliV0FSclS8wG5VXzUy2RN4p5FJESWNqTg=
X-Received: by 2002:a9d:7487:: with SMTP id t7-v6mr324380otk.132.1538557937720;
	Wed, 03 Oct 2018 02:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20181003004405.34524-1-raj.khem@gmail.com>
In-Reply-To: <20181003004405.34524-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2018 10:12:06 +0100
Message-ID: <CAJTo0LYvEHqmG35+NQAkts=0w7NkZa5iZJ6zwYb5FSfBe=xEdA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] mesa: Disable asm on musl
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
X-List-Received-Date: Wed, 03 Oct 2018 09:12:17 -0000
Content-Type: text/plain; charset="UTF-8"

Perfect. :)  Did you file a bug upstream, or shall I copy/paste that
into a bug now?

Ross
On Wed, 3 Oct 2018 at 01:49, Khem Raj <raj.khem@gmail.com> wrote:
>
> Musl started blocking dlopen of libs with initial-exec references into
> dynamic TLS area, via
>
> https://github.com/kraj/musl/commit/5c2f46a214fceeee3c3e41700c51415e0a4f1acd
>
> prior to that commit, musl was loading it and silently letting
> subsequent TLS accesses via the miscompiled code clobber memory that
> didn't belong to them
>
> This was wrong behavior and it relied on additional space reserved by
> libc in TLS space to adjust fo such broken libs, but it also fails
> with glibc if the reserved space was already used up
>
> Right fix is that  mesa should be patched to remove all the
> initial-exec hacks and use real TLS, and -mtls-dialect=gnu2 (TLSDESC)
> should be used on archs it's supported on (i386, x86_64, and aarch64)
> to make up for the lost performance, but mesa hardcodes the initial-exec,
> so there must be a reason that probably is better known to mesa devs.
>
> but we 'fixed' it for musl by adding --disable-glx-tls for mesa in OE,
> which uses pthread_getspecific instead and makes is lot slower.
>
> this caused additional problems with security flags on, it get textrels
> in .text segment. Therefore this is 'second fix' to get us through this
> warning.
>
> Cause is some unknown part of mesa's x86 assembly code is broken by
> readonly text segments
>
> [ YOCTO #12918 ]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V3: Disable asm just on x86, since it works well elsewhere
>
>  meta/recipes-graphics/mesa/mesa.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8d0e2cb67c..0dfdfbd5b4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -108,6 +108,8 @@ PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
>
>  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
>  EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> +EXTRA_OECONF_append_libc-musl_x86 = " --disable-asm"
> +
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

