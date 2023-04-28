Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9996AC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 22:03:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.34579.1682719387212668695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 15:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F5lecz2i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE2771C0002;
	Fri, 28 Apr 2023 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682719384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EUvXwO7fWc7xU1Mw/ZYM0MTrv1/4R8PPFXZ3icTWdjA=;
	b=F5lecz2iGy18Bhs/tGvkxwAEj+CzuUu9cu6EwqDGLw+xvMfziKwKF3IX5gSXfymG8UVysa
	qcqSgVxHYvqpufvb/2SOQA77lgghkB5sEHRjevCVl+desiOo2wf5ocAriLVSvk33n79THm
	zdL7ME493tvNwn4u7fvTgW63eP3hP/gfhBZNzbKK0D7z+JiMdoCbciY8HJjYvQkYabuvaP
	0+LrcF3AzZgibjcZ2SxIwTB6MAxXwrB8cJmmHgoXsM9xtwyU3uJ3cu1d/v81zhFL4D7CZh
	E6+nzFBERX6XnT7BI5tUgkMAtVtVA0qEwubpqqj2SA5CD5sSiwOqTRFU+ZfaPw==
Date: Sat, 29 Apr 2023 00:03:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2 11/11] insane.bbclass: enable 32 bit time
 API check (as a warning) on affected architectures
Message-ID: <2023042822030330c67128@mail.local>
References: <20230428084352.836515-1-alex@linutronix.de>
 <20230428084352.836515-11-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428084352.836515-11-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 22:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180536

On 28/04/2023 10:43:52+0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> 
> ---
> v2: downgrade to a warning from an error
> ---
>  meta/classes-global/insane.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 8788f58fc5b..6479fc0964b 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -34,6 +34,7 @@ WARN_QA ?= " libdir xorg-driver-abi buildpaths \
>              missing-update-alternatives native-last missing-ptest \
>              license-exists license-no-generic license-syntax license-format \
>              license-incompatible license-file-missing obsolete-license \
> +            32bit-time \
>              "
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -44,7 +45,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-path \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz patch-status-core\
> +            patch-fuzz patch-status-core \

This unrelated change creates a conflict with your other series. Could
you drop it if you need to respin?

>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> @@ -512,6 +513,11 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
>      """
>      Check that ELF files do not use any 32 bit time APIs from glibc.
>      """
> +    thirtytwo_bit_time_archs = set(('arm','armeb','mipsarcho32','powerpc','x86'))
> +    overrides = set(d.getVar('OVERRIDES').split(':'))
> +    if not(thirtytwo_bit_time_archs & overrides):
> +        return
> +
>      import re
>      # This list is manually constructed by searching the image folder of the
>      # glibc recipe for __USE_TIME_BITS64.  There is no good way to do this
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180522): https://lists.openembedded.org/g/openembedded-core/message/180522
> Mute This Topic: https://lists.openembedded.org/mt/98554692/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

