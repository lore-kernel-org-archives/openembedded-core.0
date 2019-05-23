Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 392197E417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 10:17:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so5645034wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 03:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=U86rvebNoWFJ6+CVjEYHf/0kyfOoxmUpQeAf9jPSmRY=;
	b=S89vmnyOZb3TuUUfM3fzwWtbmxtJhn0qGcAeG7W3hhHLA+eK4Uesg35eRv46VdQSvh
	Uba4/rWa9+Bc+sLEyKYjqXQClodk1MYcKhmzOS3v4vhOaKlQq32rihF4GmE01ay7zGwd
	L3uijLM374k6vE7OC4f3Y96hg8RR8ZlHLwU64j5Fko7eYeFCYS+hH3bzMiq+PL4ikoph
	tzWFBBaj+92srGnDJ9LYwXpX0VAb8ua8mnekt6nKd8NYZBurFKt2eihiUOk8Ud0+XdPx
	fTJX5ickLsHDlUoQSfuNvBE3PuaYY2pN7QL+8DHzORjPmMtI83i4WkBgLq09jLX4VqXx
	0s6w==
X-Gm-Message-State: APjAAAXbC+mYEkmQUx3PsDGrPFw/g3hobbH8cmCcLdbLuGNv9Kpa77sH
	x1R+UGGgW1Y9gxjeqWGILVQKLT4a8m8=
X-Google-Smtp-Source: APXvYqxL+itR/FOyuEoeRzNQaATn2xEofeUP9x/VG9uYfpr9e4Yej8mt/triR7DylAP7Lf8FG8zdPQ==
X-Received: by 2002:a5d:5743:: with SMTP id q3mr18225830wrw.92.1558606677629; 
	Thu, 23 May 2019 03:17:57 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i17sm27904864wrr.46.2019.05.23.03.17.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 23 May 2019 03:17:56 -0700 (PDT)
Message-ID: <a52097c84c0a6835ccd1ae2811c49ae8311ff011.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 11:17:56 +0100
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
X-List-Received-Date: Thu, 23 May 2019 10:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-23 at 08:47 +0100, Nicola Lunghi wrote:
> musl > 2.21 changed the implementation of the freeaddrinfo() function
         ^^^^

I think you mean 1.1.21 here and in the commit subject.

A.


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
>  
>  SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
>  SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
> -- 
> 2.19.1
> 


