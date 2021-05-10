Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.5374.1620689000532206953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 16:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nobcw0bN;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id p6so13321356qtk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 16:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wCxtYDb19b70dmnZdYgO3h7XbxselwwKb6s5lxPaBj0=;
        b=nobcw0bN/W1U7sEhRnThQ3oTR4kBUOg5l8cbZeVs4JXPtHoJm3+omeVNJDClWQO/i+
         2vVxwNiKyPp9NIOFnknnxXXF2pKqOdYdhug7KwwD5kJPG61g3EJzY2+yn5SqLZ7I/mjR
         cyYTbpt0IkGdbuoq1GM4e4b89NRp5r57qgAGjuGK43U+9db6AlGS5TFTbjkalJALKFb4
         D2vuG1DZlDl3cHr7NQfI/eJ+ccT75+LmFyB5Hyug4l4J2xxVV2ZNp+72hEBtg2Sk12rL
         nxIstsdRZ/qWCjsJAqWbA3fNGn/LBL6zQysyaVd5SeSVqUmszIZvxhJWctPv6kL2R8jD
         5/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCxtYDb19b70dmnZdYgO3h7XbxselwwKb6s5lxPaBj0=;
        b=X8ds7UjQasZNGZaPCQzUJO4ztF6IkB6tAO/R4J8cPLlkJxI6WZuVrCF57ak71XKG4w
         SOVdKyhsdinvO1V3VWxne1L1s57+i/O8E7UjY2PLbul0RClMaKATkW0nCy7DiwWijzAq
         FhjUIcM8WFGgTe2Maoy+yG/QYfjCtYnNE8QiqgvFj7pJeaYuzxuyqjdnDe0a947U7sMd
         03DURgoGl0tHtseBBwavgRlhmJE936bYLaqtc1rOwYEoqy8QWeOFUPD+7uZq3X/NclrH
         PHBTCcI3FQKemPMa72/10jjMmX6puYMxJYt7JyA49SC3prG58fW7TehMLQaGaojhJ/CS
         HRmA==
X-Gm-Message-State: AOAM533Ww4J9gf5iQyfPQuWFBhauNXu9sBQSE9lakeWtPiDlIzSnlh0O
	Ls0Fc2eJaFWCoWYuufGYED4WBhCWjq48A2wX7hA=
X-Google-Smtp-Source: ABdhPJxjnaCbVdGy6X2oIAiO2dou38zcTzug8uojVMsXC/ZeU6hZ7t+NXJYQX239AwBDs/FLip+hzZYk5atbvx1yyiY=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr24528791qta.214.1620688999584;
 Mon, 10 May 2021 16:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130110.939820-1-alex.kanavin@gmail.com> <20210510130110.939820-4-alex.kanavin@gmail.com>
In-Reply-To: <20210510130110.939820-4-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 10 May 2021 16:22:53 -0700
Message-ID: <CAMKF1spMMvvdfj-veY0TXNZ+BqmFv+URCM3AnCuUa4LySvFDLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] ffmpeg: update 4.3.2 -> 4.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021 at 6:01 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop mips64_cpu_detection.patch as upstream
> has changed the code in a way that's difficult
> to rebase. I have confirmed that builds on qemumip64 still
> work, and the patch does not say clearly what was the
> way to reproduce the failure it's aiming to address.
>

this fail on mips see https://errors.yoctoproject.org/Errors/Details/580763/

MACHINE=qemumips bitbake ffmpeg

should reproduce it.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../ffmpeg/ffmpeg/mips64_cpu_detection.patch  | 32 -------------------
>  .../ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} |  3 +-
>  2 files changed, 1 insertion(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} (98%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
> deleted file mode 100644
> index 69429af8f0..0000000000
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -It will add -mips64r6 and -mips64r2 to cmdline which will
> -cause conflicts
> -
> -in OE we user mips32r2 and mips64r2 for mips arch versions
> -so there is no benefit of detecting it automatically by
> -poking at tools especially in cross env
> -
> -Fixes errors like
> -
> -linking -mnan=2008 module with previous -mnan=legacy modules
> -failed to merge target specific data of file
> -
> --Khem
> -Upstream-Status: Inappropriate [OE-Specific]
> -
> -Index: ffmpeg-3.1.1/configure
> -===================================================================
> ---- ffmpeg-3.1.1.orig/configure
> -+++ ffmpeg-3.1.1/configure
> -@@ -5220,12 +5220,9 @@ elif enabled mips; then
> -
> -     # Enable minimum ISA based on selected options
> -     if enabled mips64; then
> --        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
> -         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
> -         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
> -     else
> --        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
> --        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
> -         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
> -         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
> -     fi
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> similarity index 98%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> index 08be38ca50..19a8e58370 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -24,10 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> -           file://mips64_cpu_detection.patch \
>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             "
> -SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
> +SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
>
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>  ARM_INSTRUCTION_SET_armv4 = "arm"
> --
> 2.31.1
>
>
> 
>
