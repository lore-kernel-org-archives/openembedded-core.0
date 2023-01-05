Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91C4C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:10:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13371.1672927795615495673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Htka18A5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EFAE0E000B;
	Thu,  5 Jan 2023 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672927793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+8+eHnxzzF9dr9StZPiDsGLF/ujh9jza+j+RdzCMTU=;
	b=Htka18A5wbHt1FQNWwE5bjnP7f+tVXM+5BB0D6avBK8m8C6rFuipclR3cwLFX8z6hHR9Da
	hBFZ7HMMbl85B2AAv/B1TKGwObai0nmIv5gIsHChwJOO/ki45O6NiGEduwPMM8dK957TVd
	RoLrmYHzlvfe4DxKkIOOFwVySqBl6g5CAAnfmW+AqgR0w4pLJ/VQoIsxr+GJIIYwzwO4iF
	4rVkYPqVmj2cxIvTdQgluw9odXtEw0IKK59dwqWk4RBN0FZ0Pgmw5FKbdgz9t13eUh3Nml
	DKXc4KTax06l0uDz8XO8siB0EQBJovJUEBWAfn0zStMr4CQm19Jm+26eMHq/fQ==
Date: Thu, 5 Jan 2023 15:09:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Message-ID: <Y7baMI4MLdLKahf+@mail.local>
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229023442.2520067-2-changqing.li@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175528

This fails on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4580/steps/14/logs/stdio

| checking run-time libs availability... failed
| configure: error: one or more libs available at link-time are not available run-time. Libs used at link-time: -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-109066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/curl/curl_7.87.0.bb:do_configure) failed with exit code '1'

On 29/12/2022 10:34:42+0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
> libcurl, but it needs http2 support, otherwise it will fail with
> error:
> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> 
> Enable nghttp2 to fix above error.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
> index f5e3e7235d..6cee548f35 100644
> --- a/meta/recipes-support/curl/curl_7.86.0.bb
> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_header ptest
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?= "/dev/urandom"
>  
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
> +PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> +PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
>  
>  # 'ares' and 'threaded-resolver' are mutually exclusive
>  PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175090): https://lists.openembedded.org/g/openembedded-core/message/175090
> Mute This Topic: https://lists.openembedded.org/mt/95931602/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

