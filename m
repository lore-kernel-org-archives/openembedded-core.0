Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.32056.1605034056388964150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 10:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bbea4p//;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id p12so9337204qtp.7
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J9N6q1ZVIPrFjYQRI7/9tLMu8IRbmDNDREmCKqBTSXY=;
        b=bbea4p///CGy3HSJIkd1VIAm0i4OO3clgCDiJidZe0wGZ07OpmwnNxtFaf/UsVTThX
         ChHO1DmAlXCccDO6h1ZSon+MN5p0Vitt1vs+aF88Dk4mIekRLFCYT8xbtig8bElpDCkr
         rFPv1D/vWFPcQ2ZHAuISJ+EW0fLLgThHMjMd7uZmsoFeh72Et8reC5JW896krqcRX571
         ec2xKdA96RyyzsZPw81j2NV+9+S6NlF7/0FvVYeSrs2qd9x5Aip6G81QGgqOEjS4QENf
         IpdkVkr9eGdpqHbntHimqxWi4wdkwYvQK6wGYGJymiJdEFasjsdGE5QBTRNbW45bzk0V
         jdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J9N6q1ZVIPrFjYQRI7/9tLMu8IRbmDNDREmCKqBTSXY=;
        b=ksHHqHplijLc+L/JPEWaEJrfP177oPwaQCOVMTIabn/+IZfGLCRETJ8fDyuSY8f64s
         z1JVcpyuct0ps4gJZGlmhsanIAlkP4BDOALnsp6F08TKnOW6VQtNHZUeS6Eq+uo3KZgg
         3R/LStoYFTxwriHspznj8X86rQ2Hm+Q9l8TgcOAB7rjpNgI/Z11wtzMwGTsg8ElXX2r7
         JgciFETNbg6wxCEUHh6hr/IwzgGDnDtkcbKvX3+j95235NITQNfbO2LpXX2hzoCehNUR
         AWt4n2lbPDduJNplTvWFFrlxe6ZIVeAqaFO2r/4zgM+jsc97HX1mrGJ/b55VPBd4xkUO
         ZyuQ==
X-Gm-Message-State: AOAM531JL/ZKCJ8rPQvI3errVe2t38oZDZLuBCdor30jcBTAQdfBTXyw
	cLGPM1RXPhbLCcyhhFL1WpIWXrq3ye5q3kcI/TE=
X-Google-Smtp-Source: ABdhPJwZNYf3Kxq9gB830c1y+5cnpf4aXwBSMf4qzuAtke8IMK0FYDQCs2mG9h/bJyBa6mQs2ZDN/npVeVOfIInRDNk=
X-Received: by 2002:ac8:3805:: with SMTP id q5mr19927826qtb.53.1605034055339;
 Tue, 10 Nov 2020 10:47:35 -0800 (PST)
MIME-Version: 1.0
References: <1605032052-91580-1-git-send-email-dzagorui@cisco.com>
In-Reply-To: <1605032052-91580-1-git-send-email-dzagorui@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 10 Nov 2020 10:47:09 -0800
Message-ID: <CAMKF1sqMhUQRY7riVpBqZdmZ4qZpZCMcpsdVeismjO-x39Y0VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: reproducibility: reuse debug-prefix-map for stabs
To: dzagorui@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This looks good. Can you also propose it for dunfell?

On Tue, Nov 10, 2020 at 10:14 AM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC@Cisco) via lists.openembedded.org
<dzagorui=cisco.com@lists.openembedded.org> wrote:
>
> powerpc 32bit Linux Kernel widely uses .stabs pseudo-op to
> produce debugging information in stabs format. Faced an issue
> that during Linux Kernel build with Yocto build system for 32bit
> powerpc platform resulting vmlinux contains absolute path in
> .stabstr section that cannot be remapped with -fdebug-prefix-map
> option.
>
> Yocto uses scripts/mkmakefile Linux Kernel build approach that
> allows to store all generated files outside of kernel source
> tree. With this approach each compilier invocation is performed
> with an absolute path to a file that will be compiled and this
> absolute path is recorded in init stab. There is no way to remap
> this path.
>
> Reuse remap_debug_filename api to make -fdebug-prefix-map flag
> aplicable for init stab.
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.35.inc   |  1 +
>  ...-reproducibility-for-stabs-debugging-data.patch | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/recipes-devtools/binutils/binutils-2.35.inc
> index 5ae9ec4..bc9107b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.35.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
> @@ -41,5 +41,6 @@ SRC_URI = "\
>       file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
> +     file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
> new file mode 100644
> index 0000000..42e0c1c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
> @@ -0,0 +1,35 @@
> +From aa6586e80fc6fcd739aa959a71e4cf064cdef072 Mon Sep 17 00:00:00 2001
> +From: Denys Zagorui <dzagorui@cisco.com>
> +Date: Mon, 9 Nov 2020 15:39:10 +0000
> +Subject: [PATCH] gas: improve reproducibility for stabs debugging data format
> +
> +       * config/obj-elf (obj_elf_init_stab_section): Improve
> +       reproducibility for stabs debugging data format
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0541201782c006c09d029d18a45c6e743cfea906]
> +---
> + gas/config/obj-elf.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
> +index de22b5a1da..2025df8542 100644
> +--- a/gas/config/obj-elf.c
> ++++ b/gas/config/obj-elf.c
> +@@ -2374,12 +2374,13 @@ obj_elf_init_stab_section (segT seg)
> +   p = frag_more (12);
> +   /* Zero it out.  */
> +   memset (p, 0, 12);
> +-  file = as_where (NULL);
> ++  file = remap_debug_filename (as_where (NULL));
> +   stabstr_name = concat (segment_name (seg), "str", (char *) NULL);
> +   stroff = get_stab_string_offset (file, stabstr_name, TRUE);
> +   know (stroff == 1 || (stroff == 0 && file[0] == '\0'));
> +   md_number_to_chars (p, stroff, 4);
> +   seg_info (seg)->stabu.p = p;
> ++  xfree ((char *) file);
> + }
> +
> + #endif
> +--
> +2.20.1
> +
> --
> 2.7.4
>
>
> 
>
