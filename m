Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.4456.1610729645322221233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EMWC8Ho/;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id s11so2961472edd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8AW+0FxUwugVde+zyTjAwNukdBHbEceSAY6oTVC0u1E=;
        b=EMWC8Ho/sohASqS7irYBuK5a3a+EzLpuHccdawAoz6IhJ88egGNHmPJ5PWy8vLVGeH
         0hhJozjeOssRgpG9c3LX3cXR0QpbJEJV+9xYzEJErWiZvKQ2CcxTu+7UGNj3IJRi/l/Z
         uwdWJGJx+B2bxlnujwEGGAI2GrfvGZtMranjCmDXWO4iDOuQmOqYfnPogfk7nxCVswtu
         dsJeEeHk+LecBB636si44bXCXiQ6Dt/q5usF3HSuQ66eR8lxcvwivPNmULCqoFXw2oqH
         TKlEtB8VEhGxd0+Z/NANjUPtI0I96mGwW+VvSgGMiA8kBAhmau0MC3wt2LLEtP0doF4D
         0Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AW+0FxUwugVde+zyTjAwNukdBHbEceSAY6oTVC0u1E=;
        b=Tj2unefbj+GeS8kbwYQN5bdUxcc5B3HWgf2ve9d9zIlEpN/8nXZIaF6FAyR7rXp594
         su9eQ4QgIQMRWa8j1kFWdL1HjuR27lh8uywsDk7SafjxUSPBlWFs0D1pbLyFXAFWjhLX
         Tt6djT5FiNihm24XyFmke2aKGOSDQTho6FzjPcB1V/My+RVN58UhAyMxOHf0lvKMUhfw
         oWOIadBNwnTkbREOJ9gmqIlf4CTIRI/Ercnf6lmDKrxkQ1JL0/dkIzM08qDNuFIW+rw2
         80PKfVFZmuOSod4ZqOP2GIkq8/fs/gPwDE4YkFmuaYhOdAj3HOf/cGe3XJQpDjeNtrof
         dlxw==
X-Gm-Message-State: AOAM533kFlJHE3SmRVggovgw8hdwyFhTHdM3TaJEalI5QkStxDsfDFBu
	HfQ4Wi2PZoUqcuSmpDojnVC63swELsnH0Od3pGOeKA==
X-Google-Smtp-Source: ABdhPJz3G8j2sGX6NFXbOujgA5xlY9jjIMUEusoZUFwC2AuCEbXaWjLFQrEZFIQzIslia0CjWEfJtU35AXS3W5FCSfg=
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr10044901edr.216.1610729643685;
 Fri, 15 Jan 2021 08:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20210115143224.38513-1-yifan.yu@windriver.com>
In-Reply-To: <20210115143224.38513-1-yifan.yu@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 15 Jan 2021 06:53:51 -1000
Message-ID: <CAOSpxdZ0yGs7MQbR5Fw6UcJGwp0saLVwbTcbDgM9rJ0OT=Ak7Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] binutils: Fix CVE-2020-35448
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 4:32 AM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> Fix related to a buffer overflow in bfd library
>
> CVE Details https://nvd.nist.gov/vuln/detail/CVE-2020-35448
>
> Upstream Tracking https://sourceware.org/bugzilla/show_bug.cgi?id=26574
>
> Patch from Upstream
>     https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;
>     h=8642dafaef21aa6747cec01df1977e9c52eb4679
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  .../binutils/binutils-2.35.1.inc              |  1 +
>  .../binutils/binutils/CVE-2020-35448.patch    | 78 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.35.1.inc b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
> index c92cb75543..775af2b8f2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.35.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
> @@ -43,5 +43,6 @@ SRC_URI = "\
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
>       file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
>       file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch \
> +     file://CVE-2020-35448.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
> new file mode 100644
> index 0000000000..3b0f18bdb1
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
> @@ -0,0 +1,78 @@
> +From dc40540e4b4b1771182a9c0fc6ba5f1a830802bc Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Fri, 4 Sep 2020 19:19:18 +0930
> +Subject: [PATCH] PR26574, heap buffer overflow in
> + _bfd_elf_slurp_secondary_reloc_section
> +
> +A horribly fuzzed object with section headers inside the ELF header.
> +Disallow that, and crazy reloc sizes.
> +
> +   PR 26574
> +   * elfcode.h (elf_object_p): Sanity check section header offset.
> +   * elf.c (_bfd_elf_slurp_secondary_reloc_section): Sanity check
> +   sh_entsize.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=8642dafaef21aa6747cec01df1977e9c52eb4679]

First of all, thanks for helping with CVEs!

You are missing the CVE and Signed-off-by tags in the patch.

Please see the "Patch name convention and commit message" section at:

https://wiki.yoctoproject.org/wiki/Security

Steve

> +---
> + bfd/elf.c     | 4 +++-
> + bfd/elfcode.h | 8 ++++----
> + 2 files changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index fe375e7346..9f29166399 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -12527,7 +12527,9 @@ _bfd_elf_slurp_secondary_reloc_section (bfd *      abfd,
> +       Elf_Internal_Shdr * hdr = & elf_section_data (relsec)->this_hdr;
> +
> +       if (hdr->sh_type == SHT_SECONDARY_RELOC
> +-    && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx)
> ++    && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx
> ++    && (hdr->sh_entsize == ebd->s->sizeof_rel
> ++        || hdr->sh_entsize == ebd->s->sizeof_rela))
> +   {
> +     bfd_byte * native_relocs;
> +     bfd_byte * native_reloc;
> +diff --git a/bfd/elfcode.h b/bfd/elfcode.h
> +index f4a7829f27..54ef890637 100644
> +--- a/bfd/elfcode.h
> ++++ b/bfd/elfcode.h
> +@@ -568,7 +568,7 @@ elf_object_p (bfd *abfd)
> +
> +   /* If this is a relocatable file and there is no section header
> +      table, then we're hosed.  */
> +-  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_type == ET_REL)
> ++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_type == ET_REL)
> +     goto got_wrong_format_error;
> +
> +   /* As a simple sanity check, verify that what BFD thinks is the
> +@@ -578,7 +578,7 @@ elf_object_p (bfd *abfd)
> +     goto got_wrong_format_error;
> +
> +   /* Further sanity check.  */
> +-  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_shnum != 0)
> ++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_shnum != 0)
> +     goto got_wrong_format_error;
> +
> +   ebd = get_elf_backend_data (abfd);
> +@@ -615,7 +615,7 @@ elf_object_p (bfd *abfd)
> +       && ebd->elf_osabi != ELFOSABI_NONE)
> +     goto got_wrong_format_error;
> +
> +-  if (i_ehdrp->e_shoff != 0)
> ++  if (i_ehdrp->e_shoff >= sizeof (x_ehdr))
> +     {
> +       file_ptr where = (file_ptr) i_ehdrp->e_shoff;
> +
> +@@ -807,7 +807,7 @@ elf_object_p (bfd *abfd)
> +   }
> +     }
> +
> +-  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff != 0)
> ++  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff >= sizeof (x_ehdr))
> +     {
> +       unsigned int num_sec;
> +
> +--
> +2.29.2
> +
> --
> 2.29.2
>
>
> 
>
