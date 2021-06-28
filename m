Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.5236.1624841479244314420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 17:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHbhjmfk;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id e3so12419115qte.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 17:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqqO6nrvGvzKO7J45HQnHMNVcVoAO8RbgrEWNTU6v9U=;
        b=IHbhjmfkupcGfmz6I7q+2/mYyCiB1dVIyM1splEsjsdk4vP94tcKIl0LaQL7hRlf3e
         PhOhpMnlcwec/+Z0xdq7x1yRwVcD/3bbEQW2OlDhRGG6X8eozAJzmmFD4TXiVXljSnje
         zdjaiuLoi9FLlnYIUrZq+QJ4TMY0UcRSy4dJmf2sjGFYN8S32pos79xMORymHxYEQVhI
         MCUI9USVkWduOzQCrXsII+oi0i7R0lrt8pnOpFEjMs6GPnFFFcpKn581ccKztseDyp8n
         JTMtE/bT5Xczq9GUTq5sETR1FRnT/PCm2lCPTcEIYuvvEq3CTk6NHWUUAd+7ytXZNbKT
         JU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqqO6nrvGvzKO7J45HQnHMNVcVoAO8RbgrEWNTU6v9U=;
        b=FCGM6lc/O/KaZw/Pyx9qDHeTRNVlZ3BuW9TA2sKKJqeyIYmjVzuvSSSsNByrYU0ne/
         Im1C8XIJ+QpX9jm0z8CEQ867g7Edc6a3ZAaosgVxFucH7EwDPUuuteCM0ukgMNAA3FLf
         gkjSG8P73VK/sZ9Lg8eikqDc2ToihnHyyN1yrntd3nP/iIy7EEeuc2LsViKpalsk9Pov
         kIM/OFFWLqBFQ9w5Bf0MulVfOsl+X5E3TtjtxPsBLMd3eOjA3uJeqL2Lp/CA0DorWP5c
         6/34tSqeLIz04woBAetLjbFBnX50w+fXu1JDWXVoNvRHHTZzQnj7T13YWWl17GwpukDZ
         bz0Q==
X-Gm-Message-State: AOAM532oZu9j2nvAvOnG2CaWiZBL4KoLhXrXJHtDuxwWf0+edHRPfvvA
	zUL1Uig2bI/mFJtbOG5VjOoE1Z+7ES8U+DcNqOc=
X-Google-Smtp-Source: ABdhPJwdqMsu+tPcpDGGRS6IC9by7rHg6f/BjUmskUV4xbKi+dI5109rKe4oxKrVae4QgI42gwkFrT/pOUsYKOlM1TE=
X-Received: by 2002:ac8:678f:: with SMTP id b15mr6674897qtp.214.1624841478395;
 Sun, 27 Jun 2021 17:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210628004446.2045624-1-cmuellner@linux.com>
In-Reply-To: <20210628004446.2045624-1-cmuellner@linux.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 27 Jun 2021 17:50:49 -0700
Message-ID: <CAMKF1soFaEyyXs4pHANk2ywb0P_HJrZom41C1qbQCdwHDuZ=0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add RISC-V support
To: Christoph Muellner <christophm30@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Christoph Muellner <cmuellner@linux.com>
Content-Type: text/plain; charset="UTF-8"

this looks good.

On Sun, Jun 27, 2021 at 5:44 PM Christoph Muellner
<christophm30@gmail.com> wrote:
>
> The current version of ldconfig does not support RISC-V.
> Let's add a patch, that adds the required constant definitions
> (from upstream glibc) and the necessary case statements.
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  .../add-riscv-support.patch                   | 79 +++++++++++++++++++
>  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch
>
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch
> new file mode 100644
> index 0000000000..fc41aee264
> --- /dev/null
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-riscv-support.patch
> @@ -0,0 +1,79 @@
> +From fd50228cc213d2d87f5e3cf1f123acb3fda9b04e Mon Sep 17 00:00:00 2001
> +From: Christoph Muellner <cmuellner@linux.com>
> +Date: Mon, 28 Jun 2021 00:34:12 +0200
> +Subject: [PATCH] ldconfig: Add RISC-V support
> +
> +ldconfig-native does not support RISC-V at the moment.
> +Let's pull the reqired constants from upstream and add
> +the required parsing code.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> +---
> + cache.c      |  6 ++++++
> + ldconfig.h   |  2 ++
> + readelflib.c | 10 ++++++++++
> + 3 files changed, 18 insertions(+)
> +
> +diff --git a/cache.c b/cache.c
> +index c4f5411..a3b9e70 100644
> +--- a/cache.c
> ++++ b/cache.c
> +@@ -125,6 +125,12 @@ print_entry (const char *lib, int flag, unsigned int osversion,
> +     case FLAG_AARCH64_LIB64:
> +       fputs (",AArch64", stdout);
> +       break;
> ++    case FLAG_RISCV_FLOAT_ABI_SOFT:
> ++      fputs (",soft-float", stdout);
> ++      break;
> ++    case FLAG_RISCV_FLOAT_ABI_DOUBLE:
> ++      fputs (",double-float", stdout);
> ++      break;
> +     case 0:
> +       break;
> +     default:
> +diff --git a/ldconfig.h b/ldconfig.h
> +index 6a8a750..2e5e379 100644
> +--- a/ldconfig.h
> ++++ b/ldconfig.h
> +@@ -38,6 +38,8 @@
> + #define FLAG_ARM_LIBHF                        0x0900
> + #define FLAG_AARCH64_LIB64            0x0a00
> + #define FLAG_ARM_LIBSF                        0x0b00
> ++#define FLAG_RISCV_FLOAT_ABI_SOFT     0x0f00
> ++#define FLAG_RISCV_FLOAT_ABI_DOUBLE   0x1000
> +
> + /* Name of auxiliary cache.  */
> + #define _PATH_LDCONFIG_AUX_CACHE "/var/cache/ldconfig/aux-cache"
> +diff --git a/readelflib.c b/readelflib.c
> +index 9ec0a54..a01e1ce 100644
> +--- a/readelflib.c
> ++++ b/readelflib.c
> +@@ -33,6 +33,10 @@
> + #define EM_AARCH64    183             /* ARM AARCH64 */
> + #endif
> +
> ++#ifndef EM_RISCV
> ++#define EM_RISCV      243             /* RISC-V */
> ++#endif
> ++
> + #undef check_ptr
> + #define check_ptr(ptr)                                                \
> + do                                                            \
> +@@ -331,6 +335,12 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
> +       /* see sysdeps/unix/sysv/linux/arm/readelflib.c */
> +       *flag |= FLAG_AARCH64_LIB64|FLAG_ELF_LIBC6;
> +       break;
> ++    case EM_RISCV:
> ++      /* RISC-V libraries are always libc.so.6+. */
> ++      /* NOTE: This does not correctly handle soft-float binaries */
> ++      /* see sysdeps/unix/sysv/linux/riscv/readelflib.c */
> ++      *flag |= FLAG_RISCV_FLOAT_ABI_DOUBLE|FLAG_ELF_LIBC6;
> ++      break;
> +     default:
> +       error(0, 0, "%s is a 64-bit ELF for unknown machine %lx\n",
> +             file_name, (long)elf_header->e_machine);
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> index 919d11417d..fd1630b73b 100644
> --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> @@ -15,6 +15,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://endian-ness_handling_fix.patch \
>             file://add-64-bit-flag-for-ELF64-entries.patch \
>             file://no-aux-cache.patch \
> +           file://add-riscv-support.patch \
>  "
>
>  PR = "r2"
> --
> 2.31.1
>
>
> 
>
