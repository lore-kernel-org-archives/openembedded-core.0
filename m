Received: from forward3-smtp.messagingengine.com (forward3-smtp.messagingengine.com [66.111.4.237])
 by mx.groups.io with SMTP id smtpd.web12.38984.1608557763976917926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=bmYADDAC;
 spf=neutral (domain: iki.fi, ip: 66.111.4.237, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id 4270019433AC;
	Mon, 21 Dec 2020 08:36:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 21 Dec 2020 08:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=FHKOBbCcawkdBcFcSx9nOMYtmHM9vudvx1XTWM9iS
	mo=; b=bmYADDACo76DQtV2gj/KwMMYr1KFnWAGryCAFUg21Q2apwdrBFwMA/xGN
	U5GXCUAO79ohqOhYt97GKclCrDVs0AmSFh4aikSG5V2LbJrqA/68NFL9WUTz7QJc
	oLtI59yt3AB2UArwZbySLTkDqlSig9pvDTy2s5Muh/ne++fqP7/JxvdRK7I2Xx87
	bAKACbPAFINa8Z19pma9wgrDPoVD2cYqwP1bLVPLVkfm3iG/eszY+z47tR7r15hl
	fRhdT5mShE3fRamiNXgQoK10kXd/IDxXcTDnaeLJguiZcQnL8duN4TU72n8KgBI9
	AYoaYn8MjPBCKJgxhd7cdlCPI8C7w==
X-ME-Sender: <xms:wqTgX--j5L9NNNEPbmrUmf9sO0ln2W3zsAygrNOWoiBOg0PktGauKg>
    <xme:wqTgX-ui7Mng9hBQFgw7O41Lp3EUrAEEkM_SRr1APgnxlcFjXDEZZRZM_fBU9f1MU
    65eNMtmIGgCjJHT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epjeefffelkedutedutedtvdetgfelvdduudektdehudelhfehfedvkedthedtieejnecu
    kfhppedukeekrdduvdeirdekledrhedvnecuufhprghmkfhppfgvthifohhrkhepudekke
    druddviedrkeelrdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:wqTgX0DYJIZ-2zXedwazaF2-_qgi7PreAo7-DnXwJVbuZIAsfNJ41g>
    <xmx:wqTgX2f_3FcHPExp1vB5P5OGxU_F6b1GXh_r-QROMtDc5vdvBF9CcA>
    <xmx:wqTgXzMNx_fv4VOG_VszdJ3YmZ5SjvvkMjJTKtc7AYmVKdAOiLRJTw>
    <xmx:w6TgXyYobPGlWn3zUMDYN2U4KiuvPdDwJn-WzVQHzZSZMt4EbzD48g>
Received: from laptop (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 416C5240057;
	Mon, 21 Dec 2020 08:36:02 -0500 (EST)
Message-ID: <8295223f3962b746c98dd5e2531b846f21ece7ce.camel@iki.fi>
Subject: Re: [PATCH] pulseaudio: Fix build with clang for non-x86 target
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2020 15:35:58 +0200
In-Reply-To: <20201220160535.746798-1-raj.khem@gmail.com>
References: <20201220160535.746798-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-12-20 at 08:05 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tanu Kaskinen <tanuk@iki.fi>
> ---
>  .../0001-meson-Check-for-__get_cpuid.patch    | 82 +++++++++++++++++++
>  .../pulseaudio/pulseaudio_14.0.bb             |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
> new file mode 100644
> index 0000000000..c9d8abcbf2
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
> @@ -0,0 +1,82 @@
> +From 9d0dc8aedd08d77797f90fa6075a59613f18bf0d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 20 Dec 2020 07:56:07 -0800
> +Subject: [PATCH] meson: Check for __get_cpuid
> +
> +checking for presence of cpuid.h header alone is not sufficient in some case to use
> +cpuid related functions. e.g. when using clang which is built for
> +multiple targets will have cpuid.h header as part of compiler headers in
> +distribution but one maybe compiling pulseaudion for non-x86 target. The
> +current check in meson succeeds and then compile fails later because
> +cpuid.h is x86-specific header. Therefore checking for symbol that is
> +needed makes this robust, so even if header exist it will try to ensure
> +the given symbol can be used
> +
> +Fixes
> +src/pulsecore/core-util.c:113:
> +| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/pulseaudio/14.0-r0/recipe-sysroot-native/usr/lib/clang/11.0.1/include/cpuid.h:11:2: error: this header is for x86 only
> +| #error this header is for x86 only
> +|  ^
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Tanu Kaskinen <tanuk@iki.fi>
> +---
> + meson.build               | 5 ++++-
> + src/pulsecore/core-util.c | 2 +-
> + src/pulsecore/cpu-x86.c   | 2 +-
> + 3 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 2589627..5f5127e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -185,7 +185,6 @@ endif
> + check_headers = [
> +   'arpa/inet.h',
> +   'byteswap.h',
> +-  'cpuid.h',
> +   'dlfcn.h',
> +   'execinfo.h',
> +   'grp.h',
> +@@ -243,6 +242,10 @@ if cc.has_header_symbol('pthread.h', 'PTHREAD_PRIO_INHERIT')
> +   cdata.set('HAVE_PTHREAD_PRIO_INHERIT', 1)
> + endif
> + 
> ++if cc.has_header_symbol('cpuid.h', '__get_cpuid')
> ++  cdata.set('HAVE_GET_CPUID', 1)
> ++endif
> ++
> + # Functions
> + 
> + check_functions = [
> +diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
> +index 601b1d1..6f34e7c 100644
> +--- a/src/pulsecore/core-util.c
> ++++ b/src/pulsecore/core-util.c
> +@@ -109,7 +109,7 @@
> + #include <sys/personality.h>
> + #endif
> + 
> +-#ifdef HAVE_CPUID_H
> ++#ifdef HAVE_GET_CPUID
> + #include <cpuid.h>
> + #endif
> + 
> +diff --git a/src/pulsecore/cpu-x86.c b/src/pulsecore/cpu-x86.c
> +index 4e59e14..86595d4 100644
> +--- a/src/pulsecore/cpu-x86.c
> ++++ b/src/pulsecore/cpu-x86.c
> +@@ -24,7 +24,7 @@
> + 
> + #include <stdint.h>
> + 
> +-#ifdef HAVE_CPUID_H
> ++#ifdef HAVE_GET_CPUID

There are more instances of HAVE_CPUID_H in core-util.c and cpu-x86.c,
they all need to be replaced with HAVE_GET_CPUID. Could you update the
patch?

When upstreaming, I think this change needs to be ported to the
Autotools build system too as long as it exists in PulseAudio, but I
can take care of that.

-- 
Tanu

