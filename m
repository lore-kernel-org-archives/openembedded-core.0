Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3203CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 00:45:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.155050.1712709912545875762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 17:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X8K4iLRO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5491720003;
	Wed, 10 Apr 2024 00:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712709910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBCLtUxmA6n0R6cncRXCMyeQZdfqYK5FV7lizpJNvS0=;
	b=X8K4iLROgAbG4bKdKfISoRGnKqWyae6NgICXSwbxld4xba9pV1ZirV4eJPYi/0zQF55DgL
	es2Pg5A6M1p0PVsBkjiqkOD7/FzWT6u1Eje8oTZsTbIzXYDGFSe1EomqzsOafiYSpL7jYc
	IbWTLOSWGFpV8k3B1Xv4V5HZAGxaUjDLFPreJ2fepEMmbtS3eEWuTW1JuIKWLboRmPH0hy
	ScBaHyN/686a0mXwH1FhNVAwqd/8G3Ihfg5HWTPZOISTB5pfjlPM+l9vFbC2TsPu3O+xPb
	cajTSKUCS8vh2bRvLL9R7DFmkaAnScbEW9Tpn2MLNyQEiiFGow7DSoo9hE8vyQ==
Date: Wed, 10 Apr 2024 02:45:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
Message-ID: <202404100045092623c1a2@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 00:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198072

Failed ptests:
{'gnutls': ['alerts',
            'cert-status',
            'ciphersuite-name',
            'dtls-etm',
            'dtls10-cert-key-exchange',
            'dtls12-cert-key-exchange',
            'keylog-env',
            'mini-chain-unsorted',
            'mini-record-failure',
            'mini-overhead',
            'mini-record',
            'mini-record-2',
            'record-retvals',
            'rehandshake-switch-cert',
            'rehandshake-switch-cert-allow',
            'rehandshake-switch-cert-client',
            'rehandshake-switch-cert-client-allow',
            'rsa-encrypt-decrypt',
            'rsa-psk',
            'rsa-psk-cb',
            'rsaes-pkcs1-v1_5',
            'tls-etm',
            'tls-force-etm',
            'tls-neg-ext4-key',
            'tls10-cert-key-exchange',
            'tls11-cert-key-exchange',
            'tls10-server-kx-neg',
            'tls12-anon-upgrade',
            'tls12-cert-key-exchange',
            'tls11-server-kx-neg',
            'tls12-server-kx-neg',
            'tls13-cert-key-exchange',
            'tls13-server-kx-neg',
            'version-checks']}


On 09/04/2024 15:09:57+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Add-ptest-support.patch
> refreshed for 3.8.5
> 
> Changelog:
> ==========
> * libgnutls: Due to majority of usages and implementations of
>   RSA decryption with PKCS#1 v1.5 padding being incorrect,
>   leaving them vulnerable to Marvin attack, the RSAES-PKCS1-v1_5
>   is being deprecated (encryption and decryption) and will be
>   disabled in the future.
> * libgnutls: Added support for RIPEMD160 and PBES1-DES-SHA1 for
>   backward compatibility with GCR.
> * libgnutls: A couple of memory related issues have been fixed in RSA PKCS#1
>   v1.5 decryption error handling and deterministic ECDSA with earlier
>   versions of GMP.
> * build: Fixed a bug where building gnutls statically failed due
>   to a duplicate definition of nettle_rsa_compute_root_tr().
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-support/gnutls/gnutls/Add-ptest-support.patch | 8 ++++----
>  .../gnutls/{gnutls_3.8.4.bb => gnutls_3.8.5.bb}           | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.8.4.bb => gnutls_3.8.5.bb} (97%)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> index 1152d3797f..8edd31d6b9 100644
> --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> @@ -1,4 +1,4 @@
> -From ff6a345235b2585c261752e47a749228672b07dc Mon Sep 17 00:00:00 2001
> +From bfa70adcbda4e505cf2e597907852e78e0439ee2 Mon Sep 17 00:00:00 2001
>  From: Ravineet Singh <ravineet.a.singh@est.tech>
>  Date: Tue, 10 Jan 2023 16:11:10 +0100
>  Subject: [PATCH] gnutls: add ptest support
> @@ -26,7 +26,7 @@ index 843193f..816b09f 100644
>   
>   include $(top_srcdir)/cligen/cligen.mk
>  diff --git a/configure.ac b/configure.ac
> -index d6e03cf..e3f15fb 100644
> +index 934377e..4406eae 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> @@ -39,10 +39,10 @@ index d6e03cf..e3f15fb 100644
>   
>   hw_features=
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index fb9e55a..c2d226a 100644
> +index e39a3b3..861dd63 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -658,6 +658,12 @@ SH_LOG_COMPILER = $(SHELL)
> +@@ -663,6 +663,12 @@ SH_LOG_COMPILER = $(SHELL)
>   AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
>   LOG_COMPILER = $(LOG_VALGRIND)
>   
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
> similarity index 97%
> rename from meta/recipes-support/gnutls/gnutls_3.8.4.bb
> rename to meta/recipes-support/gnutls/gnutls_3.8.5.bb
> index 20139b4dd4..21506a04dc 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
> @@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://Add-ptest-support.patch \
>             "
>  
> -SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
> +SRC_URI[sha256sum] = "66269a2cfe0e1c2dabec87bdbbd8ab656f396edd9a40dd006978e003cfa52bfc"
>  
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198029): https://lists.openembedded.org/g/openembedded-core/message/198029
> Mute This Topic: https://lists.openembedded.org/mt/105417636/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

