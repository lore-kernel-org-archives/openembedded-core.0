Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED8C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 08:01:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13732.1706601709522010378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 00:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hkxMjWDc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C82640002;
	Tue, 30 Jan 2024 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706601707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRBpp3nxY3mxGg7CQ88mVAD/F2X/Q2wMxaz+G2AvwxE=;
	b=hkxMjWDcXMB0rqRBK97V+5nBJIgEADDnBqjq8HNjFWrv0uiQjVQEPX+OniJ/UqzlsjaDYs
	OZaR0e9Qt7mg2jL/QFiTXofdMjjWVw5w296o/c4Xd4ydeP8btLYaBbDtoDoPnqb2WnDPfS
	teXL8mK1zyZ0BrU5ljpfb6iDxsXEdp57JHAB+UXbqH/q6o3dKG6rKJimSSZPN+NGoJ9+os
	UXQkCUMWL+kZ6VzWo2dvwsTfPSbFvkokouy5JKMpdrblZAK9ezlBbIyCnheXAQeAn4nIAA
	wUrfKi1PWsRsK7npUDk7E+G4xBCoDvb/eCIyjnAZWMBQ/TYDvhWk4FGuWYikqQ==
Date: Tue, 30 Jan 2024 09:01:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc-runtime: Move gdb pretty printer file to
 auto-load location
Message-ID: <202401300801463ac1e737@mail.local>
References: <20240129223250.42872-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129223250.42872-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 08:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194490

This breaks on mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8517/steps/12/logs/stdio

On 29/01/2024 14:32:50-0800, Khem Raj wrote:
> When debugging a C++ program on target using libcstdc++, gdb does not
> find the pretty printer python support, this is because the init file is
> installed into /usr/lib which is excluded from gdb's default list of
> directories to load config's from, where as defaults to load from
> datadir is still on, it therefore does not load this file
> 
> warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading has been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".
> 
> This leaves the libstdc++ pretty-printers disabled even though added via
> IMAGE_INSTALL += "gcc-runtime-dbg"
> 
> Add missing runtime dependency on datetime python module for the pretty
> printer to work/load successfully.
> 
> Once the pretty-printer gdb file is moved out of libdir, it may become
> empty therefore delete it if its empty.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 64b6168ba76..403ad76b5f2 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -85,6 +85,8 @@ do_install () {
>  		cd ${B}/${TARGET_SYS}/$d/
>  		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
>  	done
> +	install -d ${D}${datadir}/gdb/auto-load/${libdir}
> +	mv ${D}${libdir}/libstdc++.so.*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
>  	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
>  		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include 
>  		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> @@ -99,6 +101,9 @@ do_install () {
>  	if [ -d ${D}${infodir} ]; then
>  		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>  	fi
> +	if [ -d ${D}${libdir} ]; then
> +		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
> +	fi
>  }
>  
>  do_install:append:class-target () {
> @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg = ""
>  
>  # include python debugging scripts
>  FILES:${PN}-dbg += "\
> -    ${libdir}/libstdc++.*-gdb.py \
>      ${datadir}/gcc-${BINV}/python/libstdcxx \
> +    ${datadir}/gdb/auto-load \
>  "
> +# Needed by libstdcxx pretty printer
> +RDEPENDS:${PN}-dbg += "python3-datetime"
>  
>  FILES:libg2c = "${target_libdir}/libg2c.so.*"
>  SUMMARY:libg2c = "Companion runtime library for g77"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194483): https://lists.openembedded.org/g/openembedded-core/message/194483
> Mute This Topic: https://lists.openembedded.org/mt/104038368/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

