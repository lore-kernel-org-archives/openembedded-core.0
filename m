Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B984C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 12:00:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.36549.1669032045982818624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 04:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J9u3fRE4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F14D0C0002;
	Mon, 21 Nov 2022 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669032043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=izy+h7HbVW0IdOndW5b3Fljr+u5N5aXSVCO0CfQtPwM=;
	b=J9u3fRE4YII6UyvgdepaQHViiWLKTKbvovQicB9+ayzF78LOVN/9gOiWdXbaGzvsvdOTEp
	mv4OGcQ7JKLnYdeI2wNdxVquNynIL7CeL1xMWtqPwU9XgZzCsUyNoYMpzSrcFLTrmakqeQ
	8+lKqmpyOHybUQdw7P4DAYe3IAAQF+NnuMB+YsFPczZdfqRaeAZ10cR1egngTzY0HYY2Kc
	o0DWC04DfTg6fpCNAZ4YbmXotwHlVjGVgvIbEhtokgAS/QYSfLBA7JAh0P5jSYFIJ8nJwC
	bo1STxU4rNas41mxfNY7sR9ANA3kKhGIPqKn2K4boISnuqFgDn77j5QFIsSwbQ==
Date: Mon, 21 Nov 2022 13:00:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] python3: add ${bindir}/python symlink
Message-ID: <Y3toaqE7jvGlerH2@mail.local>
References: <20221120181041.351136-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120181041.351136-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 12:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173651

Hello,

On 20/11/2022 19:10:41+0100, Markus Volk wrote:
> Currently /usr/bin/python is provided by the python2 package. If python2
> is not installed, the built image lacks a provider for it.
> This results in failed scripts when using '/usr/bin/python' shebang.
> 
> This patch adds a /usr/bin/python symlink for python3 to fix this issue.

I think this is the cause of the following error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/5098/steps/11/logs/stdio

> 
> The link is created with relative path because using an absolute path would fail
> for native and nativesdk.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>  meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 64203cf0fc..7b6f509a45 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -203,6 +203,7 @@
>          "files": [
>              "${bindir}/python${PYTHON_MAJMIN}",
>              "${bindir}/python${PYTHON_MAJMIN}.real",
> +            "${bindir}/python",
>              "${bindir}/python3",
>              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
> index 92a1f69320..fec6705105 100644
> --- a/meta/recipes-devtools/python/python3_3.11.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
> @@ -144,6 +144,7 @@ do_install:prepend() {
>  
>  do_install:append:class-target() {
>          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> +        ln -sf ./python3 ${D}${bindir}/python
>  }
>  
>  do_install:append:class-native() {
> @@ -156,6 +157,7 @@ do_install:append:class-native() {
>          # (these often end up too long for the #! parser in the kernel as the
>          # buffer is 128 bytes long).
>          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +        ln -sf ./python3-native/python3 ${D}${bindir}/nativepython
>  
>          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
>          # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> @@ -213,6 +215,7 @@ do_install:append() {
>  }
>  
>  do_install:append:class-nativesdk () {
> +    ln -sf ./python3 ${D}${bindir}/python
>      # Make sure we use /usr/bin/env python
>      for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>           sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> @@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
>  
>  # For historical reasons PN is empty and provided by python3-modules
>  FILES:${PN} = ""
> +RPROVIDES:${PN} = "${bindir}/python"
>  RPROVIDES:${PN}-modules = "${PN}"
>  
>  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173641): https://lists.openembedded.org/g/openembedded-core/message/173641
> Mute This Topic: https://lists.openembedded.org/mt/95156519/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

