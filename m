Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF5BC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 16:50:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.15135.1711471832848832135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 09:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UxVYG1zr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB62640005;
	Tue, 26 Mar 2024 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711471831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmttqjODgAiApsF4GW2KRC1WMkVyQ8AH9s6nA/Wk30s=;
	b=UxVYG1zrITyyfmJFuCAoE/bCSkaLyzJ43bJRNtMSNtRYuosRqS5nev71uJF8jX9gPjPxFx
	sqxQ272XdVmBh3bZm4cYcjzaSX8TEktPBOY1xF6kxOQSAq4mfhzmhWQJUIAH6YUkoMDwcU
	G1tu+7ZfOzM7BabJ35cKcC6hQW1m0oomWXMMFRR19IqHQ2qU/+L+nKHY77xqN8PezzH1DM
	3WUWNmiyWDVpfzCP7R1C9EMTnJI4LyqPgYGp7wraRD/DfTnQ4l1juSv6MDtxlKOkGu8M4D
	xy8u5L3Sgq2ECwmgPhPL+zqQqYPsBSaaLiu0cfoZNuKsB7UPn7O0Xp+xRwqGPw==
Date: Tue, 26 Mar 2024 17:50:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core] [PATCH 06/34] glib-networking: upgrade 2.78.1 -> 2.80.0
Message-ID: <20240326165030a736ab19@mail.local>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
 <1711413292-3025-6-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1711413292-3025-6-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 16:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197535

This causes ptest failures:

Failed ptests:
{'glib-networking': ['glib-networking/connection-gnutls.test',
                     'glib-networking/file-database-gnutls.test']}

(/usr/libexec/installed-tests/glib-networking/file-database-gnutls:400): GLib-Net-WARNING **: 10:09:00.679: Failed to load TLS database: System trust contains zero trusted certificates; please investigate your GnuTLS configuration
FAIL: glib-networking/file-database-gnutls.test (Child process killed by signal 5)
Running test: glib-networking/connection-gnutls.test

(/usr/libexec/installed-tests/glib-networking/connection-gnutls:402): GLib-Net-WARNING **: 10:09:00.693: Failed to load TLS database: System trust contains zero trusted certificates; please investigate your GnuTLS configuration
FAIL: glib-networking/connection-gnutls.test (Child process killed by signal 5)
Running test: glib-networking/certificate-gnutls.test

I guess the ptests need ca-certificates.


On 26/03/2024 08:34:24+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> - Mark plugin functions as exports on Windows
> - GnuTLS: fix improper use of IP address in SNI extension
> - GnuTLS: major performance improvement: reduce unnecessary trust list creation
> - OpenSSL: properly handle BIO_CTRL_EOF
> - GnuTLS: Add warning when system has no trusted certificates
> - OpenSSL: Fix bug when populating trust store
> - Fix license on dtls-connection.c test
> - Updated translations
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)
> 
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> similarity index 95%
> rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
> rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> index 5060d9fd7a..c8a1355548 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
>  SECTION = "libs"
>  DEPENDS = "glib-2.0-native glib-2.0"
>  
> -SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
> +SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
>  
>  # Upstream note that for the openssl backend, half the tests where this backend don't return
>  # the expected error code or don't work as expected so default to gnutls
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197497): https://lists.openembedded.org/g/openembedded-core/message/197497
> Mute This Topic: https://lists.openembedded.org/mt/105150499/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

