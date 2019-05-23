Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4836F7E397
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:18:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r7so5376563wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 02:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=R2R3ZkpEsJ7TCQQwq8WJCtdnFAepkGi3OgX5eC9xOys=;
	b=HWOFJomUTHgq28xU/o+FijIsrYKx6CdxRsSXkMkQQDIvKvWa2jVbptbnZo/sfMbkJh
	2xCcjnnQmOB7K2TAsuVZs2QqBEIrcQ5kVOJmUjvNEnbfzFHRKdK5kxpu0Y+8zjOHTIGr
	0TG25w8fzBUVHOpH/N1fcknDmndJW6Pb1qorDM/a9ZaiSKjUZPVXPMG0hdwYMut+a3sP
	L/V0OnrG0r4Xv/3cxr5AzmS0me+l2hLqdssPlDA8P3qCwgQSDvx5QF4N9EiHRSNXO5aF
	kXV7C9sOMny9ZmhxvWK/8KMa3MyHLsIpvJEXvz4qQCp7Br0Hx1C2O2FoVTEDmzn0DGt5
	HFVw==
X-Gm-Message-State: APjAAAWoeuBg6xJv8Q5fPrpDBMpTl/HFfIJz/67u4Vzwag4h3gY4NI5I
	+ier0+taj+A2am+VzrLbm7+SCXz3S7Q=
X-Google-Smtp-Source: APXvYqxI7HLqQJbb+77SBfjQvulzSNe4C4zY6HIRX+YAYjxmKyjJmskoIpA2HbActRhydAw1i+Xg2A==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr7640967wrs.310.1558603080788; 
	Thu, 23 May 2019 02:18:00 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m206sm10467173wmf.21.2019.05.23.02.17.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 23 May 2019 02:18:00 -0700 (PDT)
Message-ID: <7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 10:17:59 +0100
In-Reply-To: <20190523074703.17145-1-nick83ola@gmail.com>
References: <20190523074703.17145-1-nick83ola@gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH] connman: fix segfault with musl >2.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 09:18:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-23 at 08:47 +0100, Nicola Lunghi wrote:
> musl > 2.21 changed the implementation of the freeaddrinfo() function
> not allowing anymore to pass null pointers to it.
> This was causing a segmentation fault in connman.
> ---
>  ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
>  .../connman/connman_1.37.bb                   |  5 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch b/meta/recipes-
> connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> new file mode 100644
> index 0000000000..43b43bc9f8
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> @@ -0,0 +1,34 @@
> +From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
> +From: Nicola Lunghi <nick83ola@gmail.com>
> +Date: Thu, 23 May 2019 07:55:25 +0100
> +Subject: [PATCH] gweb: fix segfault with musl v1.1.21
> +
> +In musl > 1.1.21 freeaddrinfo() implementation changed and
> +was causing a segmentation fault on recent Yocto using musl.
> +
> +See this commit:
> +
> + https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
> +
> +Upstream-Status: Submitted
> +---
> + gweb/gweb.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gweb/gweb.c b/gweb/gweb.c
> +index 393afe0a..12fcb1d8 100644
> +--- a/gweb/gweb.c
> ++++ b/gweb/gweb.c
> +@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
> + 	addr = NULL;
> + 
> + 	result = getaddrinfo(host, NULL, &hints, &addr);
> +-	freeaddrinfo(addr);
> ++	if(!result)
> ++		freeaddrinfo(addr);
> + 
> + 	return result == 0;
> + }
> +-- 
> +2.19.1
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
> index 2cf904cd85..f52b21cae3 100644
> --- a/meta/recipes-connectivity/connman/connman_1.37.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.37.bb
> @@ -7,7 +7,10 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>              file://no-version-scripts.patch \
>  "
>  
> -SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
> +SRC_URI_append_libc-musl = " \
> +            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
> +            file://0003-gweb-fix-segfault-with-musl-v1.1.21.patch \
> +"

This fix is not musl specific.

Cheers,
Andre'

>  
>  SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
>  SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
> -- 
> 2.19.1
> 


