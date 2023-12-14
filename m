Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A29AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 22:21:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.41940.1702592474887580640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 14:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OKnTEiOi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E138F60004;
	Thu, 14 Dec 2023 22:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702592472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AANqdSTcvlYUusPgPxgzTK2AiWYFUUvw4bsTmvpYjkQ=;
	b=OKnTEiOiD/g560f+gj6Pl14pT8V3yBvM3SO8KJFGii3BySZ119kd0t8UpaQRznbxVV+bot
	Uj4//HPOMsihrsQmcQgqTdaQ1httD1FnxjkjT6YS79ShS9jXRTGDQOkagZ6DvwK3wr0fP9
	eb5iAzeKw5ASL19Gua4V6CR2DWAc3nrJQ+m/vJ/nRplJCxQcuo/PoXqPiMBHSaOvjbGjVs
	x+d1UK77lHbSV1qUyIvkKuGQMre1u4AUZEKrhfj44QigPfhd4jLqNxNCvbly4tczMOZIeM
	I4AJcJzRQmpq3EgtoFFE0dMleS8Ns/2zlz5t0XGEAUiWupb76XjqE2pfaX49MQ==
Date: Thu, 14 Dec 2023 23:21:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] elfutils: upgrade 0.189 -> 0.190
Message-ID: <202312142221115139798a@mail.local>
References: <20231212013801.3632055-1-zangruochen@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212013801.3632055-1-zangruochen@loongson.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 22:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192407

Hello,

This still fail the ptests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5854/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6040/steps/12/logs/stdio

https://autobuilder.yocto.io/pub/non-release/20231214-20/testresults/qemux86-64-ptest/core-image-ptest-elfutils/log.do_testimage.4168180.20231214094628


On 11/12/2023 17:38:01-0800, Zang Ruochen wrote:
> From: Zang Ruochen <zangruochen@loongson.cn>
> 
> The following patches have been fixed:
> 0001-libasm-may-link-with-libbz2-if-found.patch
> 
> Refresh the following patch:
> 0001-dso-link-change.patch
> 
> Add srcfiles to TESTFILES because ptest needs it.
> 
> NEWS:
> libelf: Add RELR support.
> libdw: Recognize .debug_[ct]u_index sections
> readelf: Support readelf -Ds, --use-dynamic --symbol.
>          Support .gdb_index version 9
> scrlines: New tool that compiles a list of source files associated
>           with a specified dwarf/elf file.
> debuginfod: Schema change (reindexing required, sorry!) for a 60%
>             compression in filename representation, which was a large
>             part of the sqlite index; also, more deliberate sqlite
>             -wal management during scanning using the
>             --scan-checkpoint option.
> backends: Various LoongArch updates.
> 
> Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
> ---
>  .../{elfutils_0.189.bb => elfutils_0.190.bb}  |  5 ++-
>  .../elfutils/files/0001-dso-link-change.patch | 14 ++++----
>  ...libasm-may-link-with-libbz2-if-found.patch | 36 -------------------
>  3 files changed, 10 insertions(+), 45 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
> similarity index 97%
> rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
> index d69828131e..0bd96c1e0f 100644
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
> @@ -67,7 +66,7 @@ PTEST_PARALLEL_MAKE = ""
>  do_install_ptest() {
>  	if [ ${PTEST_ENABLED} = "1" ]; then
>  		# copy the files which needed by the cases
> -		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip"
> +		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
>  		install -d -m 755                       ${D}${PTEST_PATH}/src
>  		install -d -m 755                       ${D}${PTEST_PATH}/lib
>  		install -d -m 755                       ${D}${PTEST_PATH}/libelf
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
> View/Reply Online (#192187): https://lists.openembedded.org/g/openembedded-core/message/192187
> Mute This Topic: https://lists.openembedded.org/mt/103122542/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

