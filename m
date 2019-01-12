Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 167036C538
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:27:46 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d19so22100727qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PPpIuVYi3jJI8R2g3v/4/hir00MJztV/pTchY1EM+a4=;
	b=NAHp28iy19YbIYPbCx5TJVbscMFdPjzvVlBwDdoxpCR4cW94DHAS926K2XiLpLoH7A
	+81RdwsYeI4oi6H5DJtUeKC87PC04AO3gIwfuFw0jkYfCqpV7vU/w3N+gEIE9asDW//z
	+3D1KiMKTpvDT0xUjY2h3cR0El3L+T9cZqJz0jMZ//+siQdm68XfAM/bP3Qzx8jEVVle
	oR64LMlbllJd9XxIhcyskBY0R+IOPRtCJwIhP/8p5opnveHQrW0VoSSnmec7N6ctcdlG
	sucZTHKs/i3k0/KlckWdT/PZqdOz20vCCwqZX8IysA5ASd10iUgkopvonZSeVvSlnSOl
	QwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PPpIuVYi3jJI8R2g3v/4/hir00MJztV/pTchY1EM+a4=;
	b=HnVrcBQ1MiFj96jTJAFKRd5crnrpB7oKB9tpGmhGf6tbHrZiIW2n1LgjWYCBTVKdCI
	vcVL5mODeZDr1rreBd4sd0wazBHISC2gFh90w+zhrW/UWLVE5pqZUd9gXK1fIBt7tmBT
	nuk8Xf3hPRG2MQpszgHuac3v8KReAS9+bDjTY+4B3ihGwQHYJyyI6YTOU2vLD7YxPgVt
	40Eca/T+fmyqsZS0reC88jzxCGJ84qJZ/IcaTRBIZPXw9VwRR019dbDmv4zY7FbU95Lc
	oMnWgR7JEEp2cVDgxKyKlTr+ww8xbLe71ZbiUDF1VUxVbkP3DzlmgMszgnj9P/QpjvL/
	c3jg==
X-Gm-Message-State: AJcUukddSAa7x09ANjT7CAMcBUMvlIy99zWZito/4iNchFLQrKudyI80
	54ZMLJ+jA0kwzgVx/NZ6edxFzxrWDA6iW8zX0/M=
X-Google-Smtp-Source: ALg8bN6lilUzQspI5ug3PGi3+jZAxH3RJxWcQH+rdkqrpSLxVhU1gcxanEzXxAAgOG3uP7HkSs1pj6khP07s+lF3+Sk=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr17361159qtn.254.1547306867590;
	Sat, 12 Jan 2019 07:27:47 -0800 (PST)
MIME-Version: 1.0
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-3-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1547287913-25526-3-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 07:27:21 -0800
Message-ID: <CAMKF1sqpxZu5VPRqzetoZrKK8oNUdDqKGqYihKsSnuNxvtyuYA@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] binutils: Speed up and fix native builds
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
X-List-Received-Date: Sat, 12 Jan 2019 15:27:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 2:12 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> We need only libbfd, libiberty and libopcodes from binutils native.
> To get them we build entire binutils with --enable-targets=all to
> include all possible output targets support and then remove all but
> these three libs.
>
> This has two side effects:
>
>   1) it wastes build time
>   2) may cause errors caused by --enable-targets=all on some exotics
>      build hosts like PowerPC 32bit
>
> To address both of these effects we can configure binutils in general
> and only required libs and their dependencies (zlib and intl at the
> time). Then build only build these libs and their dependencies.
>
> Regarding to PowerPC 32-bit build host issues we get following errors
> when building on Ubuntu 16.04 LTS for PowerPC with command:
>
>   MACHINE=qemuppc setarch ppc bitbake binutils-native
>
> <output omitted>
> | /usr/lib/gcc/powerpc-linux-gnu/5/../../../powerpc-linux-gnu/crti.o: In function `_init':
> | (.init+0x22): relocation truncated to fit: R_PPC_GOT16 against undefined symbol `__gmon_start__'
> | dwarf.o: In function `parse_gnu_debuglink':
> | dwarf.c:(.text+0x482): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.o: In function `fetch_indexed_string':
> | dwarf.c:(.text+0x8fa): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.o: In function `read_debug_line_header':
> | dwarf.c:(.text+0x114a): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.c:(.text+0x12c6): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.o: In function `display_debug_ranges_list':
> | dwarf.c:(.text+0x187e): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.c:(.text+0x18a2): relocation truncated to fit: R_PPC_GOT16 against symbol `stdout@@GLIBC_2.0' defined in .sdata section in /lib/powerpc-linux-gnu/libc.so.6
> | dwarf.o: In function `display_debug_rnglists_list':
> | dwarf.c:(.text+0x1bf2): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.c:(.text+0x1c06): relocation truncated to fit: R_PPC_GOT16 against symbol `stdout@@GLIBC_2.0' defined in .sdata section in /lib/powerpc-linux-gnu/libc.so.6
> | dwarf.o: In function `display_block':
> | dwarf.c:(.text+0x2486): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
> | dwarf.o: In function `introduce.isra.2':
> | dwarf.c:(.text+0x2556): additional relocation overflows omitted from the output
> | collect2: error: ld returned 1 exit status
> | Makefile:909: recipe for target 'objdump' failed
> | make[4]: *** [objdump] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> <output omitted>
>
> While 'byte_get' is defined in small bss section in elfcomm.o and
> generally can be fixed, symbol from host glibc 'stdout@@GLIBC_2.0' in
> small data section can't be moved without recompile of Ubuntu 16.04 LTS
> glibc.
>

Can you try to add -fPIC to CFLAGS ? this should help in fixing the
relocation spill.


> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.31.bb | 33 ++++++++++++++-----------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.31.bb b/meta/recipes-devtools/binutils/binutils_2.31.bb
> index 51a9748..6796749 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.31.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.31.bb
> @@ -20,26 +20,31 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
>                               --enable-install-libbfd \
>                               --disable-werror"
>
> +do_configure_append_class-native () {
> +       for l in zlib intl bfd libiberty opcodes; do
> +               oe_runmake configure-${l}
> +       done
> +}

lets use --disable-<DIR> instead in EXTRA_OECONF

> +
> +do_compile_class-native () {
> +       for l in zlib intl bfd libiberty opcodes; do
> +               cd "${l}"
> +               autotools_do_compile
> +               cd - >/dev/null
> +       done
> +}
> +

not needed

>  do_install_class-native () {
> -       autotools_do_install
> +       for l in bfd libiberty opcodes; do
> +               cd "${l}"
> +               autotools_do_install
> +               cd - >/dev/null
> +       done
>

not needed


>         # Install the libiberty header
>         install -d ${D}${includedir}
>         install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
>         install -m 644 ${S}/include/libiberty.h ${D}${includedir}
> -
> -       # We only want libiberty, libbfd and libopcodes
> -       rm -rf ${D}${bindir}
> -       rm -rf ${D}${prefix}/${TARGET_SYS}
> -       rm -rf ${D}${prefix}/lib/ldscripts
> -       rm -rf ${D}${prefix}/share/info
> -       rm -rf ${D}${prefix}/share/locale
> -       rm -rf ${D}${prefix}/share/man
> -       rmdir ${D}${prefix}/share || :
> -       rmdir ${D}/${libdir}/gcc-lib || :
> -       rmdir ${D}/${libdir}64/gcc-lib || :
> -       rmdir ${D}/${libdir} || :
> -       rmdir ${D}/${libdir}64 || :
>  }
>
>  # Split out libbfd-*.so so including perf doesn't include extra stuff
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

