Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D7CC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 19:51:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.82669.1718999496996880788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 12:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d5YdyJTe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDDB7FF802;
	Fri, 21 Jun 2024 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718999495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxlLPmQSG/ZSelNDgjKRAxNvMZJFpprxWRMucASbBtU=;
	b=d5YdyJTe056oL41CDpZePkYTGySrbrwbNQPEVR74gYi+I2ksKVAsP5XUl48MnP5MM6QJZI
	8jxIKU2m6l6QHn+2ewUWr8BmZn9fBimeH6IxA5a6duwut4iIVM5cW4shFENAtCMJ1bTDdz
	KMEe+UXcLbds1wrcpQ9suj8RIkEWPaVBNjIsOF+/L2LFl2NZmBPGo1CuxWbzoEtCZuLDny
	EN6C9l0wvCjiScuB5J/I4pLXLzbYofL79DRfIw48K/GdLxt0Zr3IzIIzOb6KOTHWeE92MX
	UXmyulUzCyRQXmgQP/UzMR+hlQTY2TpxidSHEGu9TbBmBcfzQ0HwDWPKvEdx7w==
Date: Fri, 21 Jun 2024 21:51:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [OE-core][PATCH 3/3] go: move to a single binary bootstrap option
Message-ID: <202406211951348908bcd0@mail.local>
References: <20240619103406.276716-1-jose.quaresma@foundries.io>
 <20240619103406.276716-3-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619103406.276716-3-jose.quaresma@foundries.io>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 19:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201034

Hello,

This caused:
AssertionError: 
Unable to find recipes for the following entries in maintainers.inc:
go-binary-native

On 19/06/2024 11:34:06+0100, Jose Quaresma wrote:
> With the drop of the old 1.4 bootstrap C version we can
> move the go-binary-native to go-binary and drop the PREFERRED_PROVIDER
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/conf/distro/include/tcmode-default.inc                   | 4 ----
>  .../go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb}    | 2 --
>  2 files changed, 6 deletions(-)
>  rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb} (98%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 4fb6e47b7f..a9724d7621 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -62,10 +62,6 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>  
> -# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
> -# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
> -# go-native.
> -PREFERRED_PROVIDER_go-native ?= "go-binary-native"
>  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb b/meta/recipes-devtools/go/go-native_1.22.4.bb
> similarity index 98%
> rename from meta/recipes-devtools/go/go-binary-native_1.22.4.bb
> rename to meta/recipes-devtools/go/go-native_1.22.4.bb
> index 61da51be3a..ee094435a7 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
> +++ b/meta/recipes-devtools/go/go-native_1.22.4.bb
> @@ -5,8 +5,6 @@ HOMEPAGE = " http://golang.org/"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  
> -PROVIDES = "go-native"
> -
>  # Checksums available at https://go.dev/dl/
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
>  SRC_URI[go_linux_amd64.sha256sum] = "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200907): https://lists.openembedded.org/g/openembedded-core/message/200907
> Mute This Topic: https://lists.openembedded.org/mt/106757823/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

