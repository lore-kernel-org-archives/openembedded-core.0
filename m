Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32B3C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 14:36:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.46800.1671719784214297206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 06:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=brrE6L6N;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id u19so5322373ejm.8
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lPBrKO4OGaTSB7j7NFivJ6z10DR6gorqUXgOBKrsZO8=;
        b=brrE6L6N/OTYJqKkdYekTSu6Fq8Jl472m7a1/VBygrzbrk2f3jGwROCCIj41j+EZW0
         kLa5XlFSP8XAc9qFqrwQ/w9D7WowWsjodix6obmPSGJU2GU1y2u/IgaRWP9JP/M7ziau
         n/pw/eq3onpxLqIcpAFfnMCSYmrYQrRD5xS9TKHHDQTonsz1zxEUQc+4i14u/L6/bOvh
         srGWqfOhPRqBRD1F1FZKcXO8+iGsUXVtzZt4b7ujAYCRUj/MkAcRsKD7B5OrSAEnH0Kz
         3L1gpIzGXFRnOVYVCcDK2O82c/STkLej5/DK7Tm/TthbMXuxEzlkTSpc0fpAu1TOnd9c
         p4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPBrKO4OGaTSB7j7NFivJ6z10DR6gorqUXgOBKrsZO8=;
        b=2QsG7cZ3DFrmA1BFAhYqwpbLA8T+SQqrDU1/0NmfGdb2+JNGj5fVb8WDcb9S58PuoM
         mxcatYd6ehQOoBcuV9oZXiUh3gSjtfYpguN+WiMhq9S/UnwvmKp/pKW3kgS/z3d5qFyr
         BrOEbE+BeJCtyzXTgi1i0rWBNvce6U2cHwuzYwTG0VAPbSbt66H2j7eyfxN5VrrvwnKM
         ytm40yNwT2934M/JOkhfrvjMEvkuvnf5gCtc5otn6aeFfB9t+reW+hN1hvQcv4J4IncO
         Z8hElBb1RTtMCkASEhuOCuepQftTu8NtJn2Pz5+c+qu/Zxz82PqdY9galKSGH5SZaqhj
         RrHA==
X-Gm-Message-State: AFqh2kqQmwC7Kio8K/ICGtiAkTek9TsxO5F+U50JudplVONwvDlrpjD/
	SsWxQkBnOQR1HIjLmXQy19a+q8JivfcJdCs+K69BTQ==
X-Google-Smtp-Source: AMrXdXuNUYn1YtUcGlCkVir2YJc820XjiroME7Qd74KfliD1ClG6Y8SaxYVKiiEBZA9UziUoaVEbNhUj/soQXCz/yKQ=
X-Received: by 2002:a17:906:dd1:b0:7c4:f90e:186e with SMTP id
 p17-20020a1709060dd100b007c4f90e186emr365465eji.357.1671719782458; Thu, 22
 Dec 2022 06:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20221221181121.255767-1-yashinde145@gmail.com>
In-Reply-To: <20221221181121.255767-1-yashinde145@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 22 Dec 2022 04:36:11 -1000
Message-ID: <CAOSpxdaHK23XBsLeQpU6LKydSn9wXi+YRPhVu+gfbzvtn_mQ+Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH] binutils : Fix CVE-2022-4285
To: Yash Shinde <yashinde145@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 14:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174962

On Wed, Dec 21, 2022 at 8:11 AM Yash Shinde <yashinde145@gmail.com> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0019-CVE-2022-4285.patch         | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index c1904768dc..0a4a0d7bc1 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -42,5 +42,6 @@ SRC_URI = "\
>       file://0018-CVE-2022-38128-1.patch \
>       file://0018-CVE-2022-38128-2.patch \
>       file://0018-CVE-2022-38128-3.patch \
> +     file://0019-CVE-2022-4285.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> new file mode 100644
> index 0000000000..e29bdaca00
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> @@ -0,0 +1,37 @@
> +From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 19 Oct 2022 15:09:12 +0100
> +Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
> + containing corrupt symbol version information.
> +
> +       PR 29699
> +       * elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
> +       of the section header is zero.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> +CVE: CVE-2022-4285

Missing Signed-off-by:

Please submit a V3 for kirkstone.

Thanks!

Steve

> +
> +---
> + bfd/ChangeLog | 6 ++++++
> + bfd/elf.c     | 4 +++-
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index fe00e0f9189..7cd7febcf95 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
> +         bfd_set_error (bfd_error_file_too_big);
> +         goto error_return_verref;
> +       }
> +-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
> ++      if (amt == 0)
> ++      goto error_return_verref;
> ++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
> +       if (elf_tdata (abfd)->verref == NULL)
> +       goto error_return_verref;
> +
> +--
> +2.31.1
> +
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174936): https://lists.openembedded.org/g/openembedded-core/message/174936
> Mute This Topic: https://lists.openembedded.org/mt/95785266/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

