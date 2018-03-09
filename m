Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF14178066
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 08:33:19 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w128so2431876wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 00:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1jMwMYnzIR+unuUVM5wVtZfRQa5+fdWIYts6gssSTpI=;
	b=JBKwkFoP9+50a8v6GUf27Yq/Rotx2cm0OpAEPKAsl91mWZsDG2+ISJjwIEhb4CmDyn
	F5Jmwdz3Z8fWCTsr1221j9h1KXzPXMHMH7RgONbsi8yYCcMnLZSQxPvDIFeDfONr6jS3
	Ay0v/1dkm6MoSCwGckNBzCUmVYORR841ysW6Amhc468MUYTpD7h2335ynkifvuPgA5mi
	fY1rL4gyLvy1BSbV1g7qAW8KPuDwJKiTk3VICJMb6otrecNNUz1vkb5RYLu/pWQNzJJy
	gbFa4NBk6rkLFRs4jKp2pifELaeKjp8dCyJ49uM69JtaliCYt8RiFKazJGOi2P/1Bgo0
	1KWg==
X-Gm-Message-State: AElRT7E8e7aw+tYZ3Keu+J1zS1B4FP7Vmn07lP4VBOBL5HhT5SL8PaOk
	EQSgY4v1dDZqDIRZwPb1+Rt2ksnz
X-Google-Smtp-Source: AG47ELuD2gE5hZ8RGGQvFL34/v9Jocn+S0slm4Vv/XKSRVSG69n6cneJsLBCoaumBlB3X+c0aRXA2w==
X-Received: by 10.28.65.213 with SMTP id o204mr1398941wma.97.1520584400103;
	Fri, 09 Mar 2018 00:33:20 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n49sm834611wrn.90.2018.03.09.00.33.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Mar 2018 00:33:19 -0800 (PST)
Message-ID: <1520584397.4868.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Mar 2018 08:33:17 +0000
In-Reply-To: <20180303024705.1391-1-raj.khem@gmail.com>
References: <20180303024705.1391-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] systemd: Explicitly add hidden attribute to __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
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
X-List-Received-Date: Fri, 09 Mar 2018 08:33:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I see this, too.

BTW, some more info:


This looks similar to
    https://github.com/systemd/systemd/issues/234
and was worked-around in systemd commit aac7c5ed8bc6
("build-sys: hide magic section variables from exported symbols")
until reverted in commit 780950a2ba58 ("Revert "build-sys: hide
magic section variables from exported symbols"") because binutils
was fixed since.
This error should only ever happen with old versions of ld.gold.
In addition, gold should be fixed by now:
    https://sourceware.org/bugzilla/show_bug.cgi?id=18548
    https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5417c94d1a944d1a27f99240e5d62a6d7cd324f1
but something is amiss here.

ld -v gives
GNU ld (GNU Binutils) 2.30.0.20180208

so this is a bit strange...


Cheers,
Andre'

On Fri, 2018-03-02 at 18:47 -0800, Khem Raj wrote:
> These symbols appear in dynsyms of libsystemd.so and musl loader
> doesnt like it
> 
> Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-
> r0/recipe-sysroot//lib/libsystemd.so.0: __start_BUS_ERROR_MAP: symbol not
> found
> Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-
> r0/recipe-sysroot//lib/libsystemd.so.0: __stop_BUS_ERROR_MAP: symbol not
> found
> 
> [YOCTO #12577]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 34
> ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_234.bb           |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-
> __start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0001-Hide-
> __start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-
> core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-
> __stop_BUS_ERROR_MAP.patch
> new file mode 100644
> index 0000000000..2cffc426ed
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-
> and-__stop_BUS_ERROR_MAP.patch
> @@ -0,0 +1,34 @@
> +From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Mar 2018 18:00:17 -0800
> +Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
> +
> +for currently unknown reasons they get exported to the shared libries
> +even without being listed in the sym file
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +
> +Upstream-Status: Pending [ Conditional on master needing this, 234 does
> need it ]
> +
> + src/libsystemd/sd-bus/bus-error.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-
> bus/bus-error.c
> +index 378f7a377..49d797abd 100644
> +--- a/src/libsystemd/sd-bus/bus-error.c
> ++++ b/src/libsystemd/sd-bus/bus-error.c
> +@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map
> bus_standard_errors[] = {
> + };
> + 
> + /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP
> section */
> +-extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
> +-extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
> ++extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
> ++extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
> + 
> + /* Additional maps registered with sd_bus_error_add_map() are in this
> +  * NULL terminated array */
> +-- 
> +2.16.2
> +
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-
> core/systemd/systemd_234.bb
> index d12e94f463..b15e5a41db 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -51,6 +51,7 @@ SRC_URI =
> "git://github.com/systemd/systemd.git;protocol=git \
>             file://0001-meson-update-header-file-to-detect-
> memfd_create.patch \
>             file://0002-configure.ac-Check-if-memfd_create-is-already-
> define.patch \
>             file://0003-fileio-include-sys-mman.h.patch \
> +           file://0001-Hide-__start_BUS_ERROR_MAP-and-
> __stop_BUS_ERROR_MAP.patch \
>             "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-
> device-timeout-to-2.patch"
>  
> -- 
> 2.16.2
> 

