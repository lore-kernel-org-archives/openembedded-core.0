Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DA7C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 22:35:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.85083.1701729333775317149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 14:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dQP+Bqvb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF6431C0002;
	Mon,  4 Dec 2023 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701729332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jm6xaRH3MX/zAWjHt8QoSD0gVjRm8XSwCjLLwHXrmjY=;
	b=dQP+BqvbRjBlTihSPmsFkWEzNSxfjRyGPLqSUnoD+9w0UF/T+P17HOubePnEziQ6SbdJ2l
	3/74v4bDBMD7nYFUtSEJtbVu54ioCmEoq6xUHrXEBK8lUVoBuy7T8eclqFlq91VvQQqhfD
	+DgJLDb3lCYPjTGdx0l/tlLMxE9lNZJyrivVTxNAL2fTF8aZr28F6ihUH3R3bIzIJDlUac
	FiPM/+whqvTQMXT0vwb/4WIs+A97IIL50NeKXzgAsDi8nie6dyu1AKJlmaAkNjW/rNPZg8
	tZB3e1hwrU2XVRdPOWU426XbYbwBzCHpv3kulFkfSrD8gdrIl2kiJxbzHVoFdg==
Date: Mon, 4 Dec 2023 23:35:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [OE-core] [PATCHv2] elfutils: upgrade 0.189 -> 0.190
Message-ID: <202312042235301e989686@mail.local>
References: <20231204023551.3588992-1-zangruochen@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204023551.3588992-1-zangruochen@loongson.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 22:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191769

Hello,

This fails with musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8232/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8262/steps/12/logs/stdio

New ptest failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5988/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5808/steps/12/logs/stdio

On 03/12/2023 18:35:51-0800, Zang Ruochen wrote:
> From: Zang Ruochen <zangruochen@loongson.cn>
> 
> The following patches have been fixed:
> 0001-libasm-may-link-with-libbz2-if-found.patch
> 
> Refresh the following patch:
> 0001-dso-link-change.patch
> 
> Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
> ---
>  .../{elfutils_0.189.bb => elfutils_0.190.bb}  |  3 +-
>  .../elfutils/files/0001-dso-link-change.patch | 14 ++++----
>  ...libasm-may-link-with-libbz2-if-found.patch | 36 -------------------
>  3 files changed, 9 insertions(+), 44 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (98%)
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
> similarity index 98%
> rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
> index d8bf82b022..8657080830 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
> @@ -16,7 +16,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
>             file://0003-fixheadercheck.patch \
>             file://0006-Fix-build-on-aarch64-musl.patch \
> -           file://0001-libasm-may-link-with-libbz2-if-found.patch \
>             file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
>             file://0001-skip-the-test-when-gcc-not-deployed.patch \
>             file://ptest.patch \
> @@ -25,7 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>  SRC_URI:append:libc-musl = " \
>             file://0003-musl-utils.patch \
>             "
> -SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
> +SRC_URI[sha256sum] = "8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692"
>  
>  inherit autotools gettext ptest pkgconfig
>  
> diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> index 6acc036406..8ccfcb7bd5 100644
> --- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> +++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
> @@ -16,18 +16,18 @@ more details.
>  Rebase to 0.170
>  
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> +Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
>  ---
>   src/Makefile.am   | 2 +-
>   tests/Makefile.am | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index 88d0ac8..c28d81f 100644
> +index d3d9d40..ea61616 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
>  @@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
> - libelf = ../libelf/libelf.a -lz
> + libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
>   else
>   libasm = ../libasm/libasm.so
>  -libdw = ../libdw/libdw.so
> @@ -36,11 +36,11 @@ index 88d0ac8..c28d81f 100644
>   endif
>   libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index c145720..72afd0e 100644
> +index 7fb8efb..71c1a61 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
> - libelf = ../libelf/libelf.a -lz
> +@@ -680,7 +680,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
> + libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
>   libasm = ../libasm/libasm.a
>   else
>  -libdw = ../libdw/libdw.so
> @@ -48,3 +48,5 @@ index c145720..72afd0e 100644
>   libelf = ../libelf/libelf.so
>   libasm = ../libasm/libasm.so
>   endif
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> deleted file mode 100644
> index 09c9d3ea24..0000000000
> --- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 4 Oct 2017 22:30:46 -0700
> -Subject: [PATCH] libasm may link with libbz2 if found
> -
> -This can fail to link binaries like objdump
> -where indirect libraries may be not found by linker
> -
> -| /mnt/a/oe/build/tmp/work/riscv64-bec-linux/elfutils/0.170-r0/recipe-sysroot/usr/lib/libbz2.so.1: error adding symbols: DSO missing from command line
> -| collect2: error: ld returned 1 exit status
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index c28d81f..951e978 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
> - CLEANFILES += make-debug-archive
> - 
> - if BUILD_STATIC
> --libasm = ../libasm/libasm.a
> -+libasm = ../libasm/libasm.a $(zip_LIBS)
> - libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
> - libelf = ../libelf/libelf.a -lz
> - else
> --libasm = ../libasm/libasm.so
> -+libasm = ../libasm/libasm.so $(zip_LIBS)
> - libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
> - libelf = ../libelf/libelf.so
> - endif
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191719): https://lists.openembedded.org/g/openembedded-core/message/191719
> Mute This Topic: https://lists.openembedded.org/mt/102964021/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

