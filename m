Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE76C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 19:16:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.124368.1719170185127601877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 12:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AlFFztuG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7D1AE0005;
	Sun, 23 Jun 2024 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719170183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9qEwqNZch54PMqEX17gOqkX5bj2wtfp45zrnuA1cww=;
	b=AlFFztuGmYhmomusAR8ZSCTg2zbhdT9U2OB0vcEAIr2IlBSYWwZQV6maiSVqK9wJ7wH3M+
	E5Ps2hvFe+fV4eDzeO81juND/BUsVRHlRIZjlMOOJF0OPYmseUxqlE8kDAKarqSYmBpGT3
	XgHvn+9WcNJHltSPN3glBTxn3fM6u4/F3zsId7TO29zUOfrf2nrL5OkLOPovNO/25+uQrP
	qty009Q9lP1fR8w6nOjM5WBwYOSLj7QzJu+hZdFILM/hTgg7dVkud1K0PoxC3/E5ZGVaFu
	la35WeXjx+1bBzb2tf8HIDJIp+7/t86AuKHaoKY+EONceXaxbW3AsK+cqgjnGg==
Date: Sun, 23 Jun 2024 21:16:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org,
	=?iso-8859-1?Q?Jo=E3o?= Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: Re: [OE-core] [PATCH 11/22] glib-networking: upgrade 2.78.1 -> 2.80.0
Message-ID: <202406231916228eeeda40@mail.local>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
 <1718936206-8080-11-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718936206-8080-11-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 19:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201057

This causes new ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6563/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6740/steps/12/logs/stdio

Failed ptests:
{'glib-networking': ['glib-networking/connection-gnutls.test',
                     'glib-networking/file-database-gnutls.test']}



(/usr/libexec/installed-tests/glib-networking/connection-gnutls:400): GLib-Net-WARNING **: 21:17:59.992: Failed to load TLS database: System trust contains zero trusted certificates; please investigate your GnuTLS configuration
FAIL: glib-networking/connection-gnutls.test (Child process killed by signal 5)
Running test: glib-networking/certificate-gnutls.test

(/usr/libexec/installed-tests/glib-networking/file-database-gnutls:406): GLib-Net-WARNING **: 21:18:00.068: Failed to load TLS database: System trust contains zero trusted certificates; please investigate your GnuTLS configuration
FAIL: glib-networking/file-database-gnutls.test (Child process killed by signal 5)
SUMMARY: total=4; passed=2; skipped=0; failed=2; user=0.1s; system=0.0s; maxrss=8684
FAIL: glib-networking/connection-gnutls.test (Child process killed by signal 5)
FAIL: glib-networking/file-database-gnutls.test (Child process killed by signal 5)


https://autobuilder.yocto.io/pub/non-release/20240622-19/testresults/qemux86-64-ptest/glib-networking.log


On 21/06/2024 10:16:35+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> - Mark plugin functions as exports on Windows
> - Updated translations
> - GnuTLS: fix improper use of IP address in SNI extension
> - GnuTLS: major performance improvement: reduce unnecessary trust list creation
> - OpenSSL: properly handle BIO_CTRL_EOF
> - GnuTLS: Add warning when system has no trusted certificates
> - OpenSSL: Fix bug when populating trust store
> - Fix license on dtls-connection.c test
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
> View/Reply Online (#200988): https://lists.openembedded.org/g/openembedded-core/message/200988
> Mute This Topic: https://lists.openembedded.org/mt/106792587/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

