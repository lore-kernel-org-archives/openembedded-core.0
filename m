Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.7620.1603147245825910636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 15:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fs7sNmnC;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id p88so976785qtd.12
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3E9D04hm0pozZFNHQ7GMdFUV5UqXg+IL/Po6MdMAnK8=;
        b=Fs7sNmnCJJd6sxT09AWHjc6ZKh0i+3kBfaWaq5Yb3F6mHKAMo/beoyHc8mCzcJRQ3J
         1/q4LHrzsJ6z6sD1rHsjBnQiSyOFCo6pR6Ew+eKzqbfyBtKauXi9fmCyh3qpQz8c3uCs
         Z2VFjNZq4QQLj4JJbKU5Ed6iAOcSSFUmuMAkMKDR9c1/lMsYfwemLYXokGI3TXFn+UXk
         Lfkrjr83BMlQToTzEw75roQ0iCr5DQoKCVNTlj2715LSQDhhHTivI/uFVdNfkyJ7ZeUD
         Muy0VhhdGOv9iX/Q7LKV72NEt7SGeCFMJahzUDmMl9YCOITPq1IMnkO5KguMa84SGntu
         Olhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3E9D04hm0pozZFNHQ7GMdFUV5UqXg+IL/Po6MdMAnK8=;
        b=ltSHcxFAsw1LoO/sEd29ImCtAOQGTrMnOJFhPZrCOYhoWZH1vs15GlxhQtoMeYiWJ3
         4TIoKfEr5kNR+tNPeL4cUg00Aob5q3ApVyUKPTVr+AprxXTwL3nzFwkz9TM87ZWVn3xO
         L+ypWzjJum0vdn4lbhWIgwVJBdXSZcDJvRym4yUtVvHCc9umzrXYPp8pEJ3dZCXNxoJg
         2NAxcb5eLATYsiRQkw2LVWEecyuwGvZrTMXbDyJQu7NxiWxvkywXw6md8EU02Zt/L7gT
         atfGPUb4NjosCBgMrG11BiNPzRZaL3w7fUPO+aB7FdVkOUSzEqxwBepAL1RCszSOl+JW
         Rb+g==
X-Gm-Message-State: AOAM532SWNL41bYFYk/bJBOJNLLbU0yZ6vrOxn4TXUqhZBfrWPdvDV8A
	zs5gjWmed01pjObsvUfxjX34c8q158HrC2V6sJk=
X-Google-Smtp-Source: ABdhPJxEE+wplCP4aucRJUTbjGRrR4oiJieOYwXders2YIKIQ+C8Vc0Eq8jgnHQT+us+pzvAB8Pr4ObhtrduBmbvt8w=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr1792251qte.88.1603147244720;
 Mon, 19 Oct 2020 15:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201019222146.29078-1-kamensky@cisco.com> <20201019222146.29078-3-kamensky@cisco.com>
In-Reply-To: <20201019222146.29078-3-kamensky@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 19 Oct 2020 15:40:18 -0700
Message-ID: <CAMKF1sp673ghzM0fO1uj5q7PGcBA9C5K+sMMjwWViNkEWLb0sA@mail.gmail.com>
Subject: Re: [PATCH 3/3] qemu: change TLBs number to 64 in 34Kf mips cpu model
To: Victor Kamensky <kamensky@cisco.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this looks good to me.

On Mon, Oct 19, 2020 at 3:22 PM Victor Kamensky <kamensky@cisco.com> wrote:
>
> Replace OE private qemu patch with one that got upstreamed
> and solves the same problem: increase qemumips CI performance
> by increasing number of TLBs in CPU model and reduce need to
> run software TLB refill code.
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                |  1 +
>  ...-Increase-number-of-TLB-entries-on-the-34.patch | 59 ++++++++++++++++=
++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Incr=
ease-number-of-TLB-entries-on-the-34.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index bbb9038961..84f600cec0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0001-qemu-Do-not-include-file-if-not-exists.patch \
>             file://find_datadir.patch \
>             file://usb-fix-setup_len-init.patch \
> +           file://0001-target-mips-Increase-number-of-TLB-entries-on-the=
-34.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-nu=
mber-of-TLB-entries-on-the-34.patch b/meta/recipes-devtools/qemu/qemu/0001-=
target-mips-Increase-number-of-TLB-entries-on-the-34.patch
> new file mode 100644
> index 0000000000..5227b7cbd2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of=
-TLB-entries-on-the-34.patch
> @@ -0,0 +1,59 @@
> +From 68fa519a6cb455005317bd61f95214b58b2f1e69 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <f4bug@amsat.o=
rg>
> +Date: Fri, 16 Oct 2020 15:20:37 +0200
> +Subject: [PATCH] target/mips: Increase number of TLB entries on the 34Kf=
 core
> + (16 -> 64)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Per "MIPS32 34K Processor Core Family Software User's Manual,
> +Revision 01.13" page 8 in "Joint TLB (JTLB)" section:
> +
> +  "The JTLB is a fully associative TLB cache containing 16, 32,
> +   or 64-dual-entries mapping up to 128 virtual pages to their
> +   corresponding physical addresses."
> +
> +There is no particular reason to restrict the 34Kf core model to
> +16 TLB entries, so raise its config to 64.
> +
> +This is helpful for other projects, in particular the Yocto Project:
> +
> +  Yocto Project uses qemu-system-mips 34Kf cpu model, to run 32bit
> +  MIPS CI loop. It was observed that in this case CI test execution
> +  time was almost twice longer than 64bit MIPS variant that runs
> +  under MIPS64R2-generic model. It was investigated and concluded
> +  that the difference in number of TLBs 16 in 34Kf case vs 64 in
> +  MIPS64R2-generic is responsible for most of CI real time execution
> +  difference. Because with 16 TLBs linux user-land trashes TLB more
> +  and it needs to execute more instructions in TLB refill handler
> +  calls, as result it runs much longer.
> +
> +(https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03428.html)
> +
> +Buglink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992
> +Reported-by: Victor Kamensky <kamensky@cisco.com>
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> +Message-Id: <20201016133317.553068-1-f4bug@amsat.org>
> +
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/68fa519a6=
cb455005317bd61f95214b58b2f1e69]
> +Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> +
> +---
> + target/mips/translate_init.c.inc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: qemu-5.1.0/target/mips/translate_init.inc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-5.1.0.orig/target/mips/translate_init.inc.c
> ++++ qemu-5.1.0/target/mips/translate_init.inc.c
> +@@ -254,7 +254,7 @@ const mips_def_t mips_defs[] =3D
> +         .CP0_PRid =3D 0x00019500,
> +         .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
> +                        (MMU_TYPE_R4000 << CP0C0_MT),
> +-        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_=
MMU) |
> ++        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_=
MMU) |
> +                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_=
IA) |
> +                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_=
DA) |
> +                        (1 << CP0C1_CA),
> --
> 2.14.5
>
