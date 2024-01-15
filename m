Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B724C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:55:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.86888.1705337756163983751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z5/3De/R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDFF5C0006;
	Mon, 15 Jan 2024 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705337754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ux4/N5ArgyCu5dsLWE8TkF5Dwm7HedkpOGGWD6RYgDs=;
	b=Z5/3De/RHODcUNvxHi1cYbAbLEmbNqr+O0k0JO9DvkE7B078lfDSu1+DNOUwBo0O+TqwS4
	tkSMvb5V8UoTgqjP96kBIHQzUpc6gOtxZJy8KLHfYkzuX/KmGvd2x/fO4RUby77r8zv6St
	Y+IZsUsCf7UdhM5VR7BzVbTcogAL+AJA7jknP77Y6n1XopNj+e2nOI+DqrxsIW/T2RBJOY
	0GNQLUkTMuNVK1k4xviiimCE5+57DiD4yj7rGoSaH89cPYNwvQSGJSVyjN7FTt1Fmb3IFs
	dyKUlsUGlpqQ3ajhVLKaJxubsrpI1CP9h5PoF9VkBgA+/zbz5O0NplsPZikGmQ==
Date: Mon, 15 Jan 2024 17:55:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/3] insane.bbclass: Make
 check_32bit_symbols check for file functions too
Message-ID: <20240115165552bd7f2545@mail.local>
References: <20240112151403.3810910-1-olani@axis.com>
 <20240112151403.3810910-2-olani@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112151403.3810910-2-olani@axis.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193689

This causes a bunch of warnings on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8306/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5587/steps/11/logs/warnings

stdio: WARNING: lib32-openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'
stdio: WARNING: lib32-python3-numpy-1.26.2-r0 do_package_qa: QA Issue: /usr/lib/python3.11/site-packages/numpy/core/_multiarray_umath.cpython-311-i386-linux-gnu.so uses 32-bit api 'fallocate'

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8499/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5675/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/8382/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8363/steps/13/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/7305/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/295/steps/12/logs/warnings

stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/sbin/sshd uses 32-bit api 'mkstemp'

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7404/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/7327/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/5743/steps/13/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/7174/steps/13/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2749/steps/21/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/8386/steps/13/logs/warnings

stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8436/steps/12/logs/warnings

stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/lib/openssh/ptest/regress/unittests/hostkeys/test_hostkeys uses 32-bit api 'mkstemp'


On 12/01/2024 16:14:02+0100, Ola x Nilsson wrote:
> Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64, also check
> for functions redirected only based on _FILE_OFFSET_BITS and
> __USE_FILE_OFFSET64.
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/classes-global/insane.bbclass | 31 ++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 69741a6a79..1ff6a319c4 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -598,6 +598,37 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
>          "fts_set",
>          # /usr/include/netdb.h
>          "gai_suspend",
> +
> +        # Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64,
> +        # also check for functions redirected only based on _FILE_OFFSET_BITS
> +        # and __USE_FILE_OFFSET64
> +        # /usr/include/bits/fcntl-linux.h
> +        "fallocate",
> +        # /usr/include/bits/resource.h
> +        "prlimit",
> +        # /usr/include/sys/statfs.h
> +        "statfs", "fstatfs", "statvfs", "fstatvfs",
> +        # /usr/include/sys/sendfile.h
> +        "sendfile",
> +        # /usr/include/sys/resource.h
> +        "getrlimit", "setrlimit",
> +        # /usr/include/sys/uio.h
> +        "preadv", "pwritev", "preadv2", "pwritev2",
> +        # /usr/include/sys/mman.h
> +        "mmap",
> +        # /usr/include/stdlib.h
> +        "mkstemp", "mkstemps", "mkostemp", "mkostemps",
> +        # /usr/include/stdio.h
> +        "fopen", "tmpfile", "freopen", "fseeko", "ftello", "fgetpos",
> +        "fsetpos",
> +        # /usr/include/dirent.h
> +        "readdir",
> +        "readdir_r", "scandir", "scandirat", "alphasort", "getdirentries",
> +        "versionsort",
> +        # /usr/include/unistd.h
> +        "lseek", "pread", "pwrite", "truncate", "ftruncate", "lockf",
> +        # /usr/include/fcntl.h
> +        "open", "openat", "creat", "posix_fadvise", "posix_fallocate",
>      }
>  
>      ptrn = re.compile(
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193589): https://lists.openembedded.org/g/openembedded-core/message/193589
> Mute This Topic: https://lists.openembedded.org/mt/103684364/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

