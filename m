Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web08.560.1622147111956831120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 13:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JvdUm1IS;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id z38so2460257ybh.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zEE4bN2syYqtpuu297kdivtOOgik0FmCv+mtCsMSMMo=;
        b=JvdUm1IS8qPDJpiwyZqLVBpQ9okdvEFXy13zfXPqd0Aflb1ix2npH74E27PTps9KAV
         QZb1JJ3MnA9+v5zfwyy4NLGs/pKoWy1So/Yr+pFkZgXQayh14jM4y2mwgWdjCzuY7wHD
         0Wgm+ZSfeUxgphgiERBzULyX8SHHgnQP8B7NVTGD4mTktk4pDbcqDiuc0xHb6wq9jEvc
         QN60auNKnsFvJcF9TqKyId04usJcAF2oBqio5+UszfGYpbF4mJlUDMLQKAwv6CBpDB+V
         +TYuMepX+t2PYbE4qGdmV7gwx9+Fe7q42MnCpQIS9TPEhSo41BtIhDC6NRNz8pRMTBIb
         RMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zEE4bN2syYqtpuu297kdivtOOgik0FmCv+mtCsMSMMo=;
        b=obip64+34xJKO278KSEtuNiEhv6bpxRfkSiMhSfA32mni98nCQrSe58gklPHINFha4
         KH5GDaGB2lDTbnApmSEIKraoQySEfZN+BaGMcRHgvlnZ5CuvXEd2aNLv6TChAu1vdCGx
         c2a4fStVI1Db31iCp33q9hHQB1WqOGnHbEVfmIgQMGE4WJGDniSqdL5NnECi0lKG1Sq7
         sJDZyDmii8E13rjshwVlxC2vh+EBj5J0RsrKnxbbPCEfSCZ8y4smzbVZFrsXcGsPP3cg
         YoMbZo1CV6rOPRKvR9ajNxeR0n5hWbFkVgZhQast3/rjnxHRu2C2p/aLA0WxGPoZ/juL
         VMLw==
X-Gm-Message-State: AOAM531IYC9WpG/9oPaHft8Qw1tLiMtrd82deJqk1kVlzRNAS7nFkzcu
	QVqjtPbhJfTBtpw8L5lTrTt6J6ADTdlFIPZAj5Y=
X-Google-Smtp-Source: ABdhPJyKxehpFNg6I/wVRaUi8DlEaAsBwGFnM+xGW10hHHzIh9ZGnNSq5WYW4CKPA1/jg/SBkDTg9GogB0pGBBjafmk=
X-Received: by 2002:a25:d1d6:: with SMTP id i205mr7126299ybg.472.1622147111106;
 Thu, 27 May 2021 13:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210527171628.2181867-1-alhe@linux.microsoft.com>
In-Reply-To: <20210527171628.2181867-1-alhe@linux.microsoft.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 27 May 2021 10:25:00 -1000
Message-ID: <CAGDS+nnDGVY-iOwPWD1OD-auRXejkn+eMcMQK4GE20VV9uBZhA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell-backport][PATCH] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Leon Woestenberg <leon@sidebranch.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I get an autobuilder failure on core-image-mingw-sdktest, details here:

https://errors.yoctoproject.org/Errors/Details/585665/

Perhaps we need additional patch/patches from master?

Steve

On Thu, May 27, 2021 at 7:16 AM Alejandro Hernandez Samaniego
<alhe@linux.microsoft.com> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> configured for glibc by default, this helps in creating correct
> compiler defaults for musl based SDK compilers
>
> [YOCTO #13459]
>
> (From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Leon Woestenberg <leon@sidebranch.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 553ef7fe62..c5935b978d 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -139,6 +139,29 @@ do_install () {
>         chown -R root:root ${D}
>
>         cross_canadian_bindirlinks
> +
> +       for i in linux ${CANADIANEXTRAOS}
> +       do
> +               for v in ${CANADIANEXTRAVENDOR}
> +               do
> +                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> +                       install -d $d
> +                       for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
> +                       do
> +                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
> +                               case $i in
> +                               *musl*)
> +                                       rm -rf $d/$p
> +                                       echo "#!/usr/bin/env sh" > $d/$p
> +                                       echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
> +                                       chmod 0755 $d/$p
> +                                       ;;
> +                               *)
> +                                       ;;
> +                               esac
> +                       done
> +               done
> +       done
>  }
>
>  ELFUTILS = "nativesdk-elfutils"
> --
> 2.25.1
>
>
> 
>
