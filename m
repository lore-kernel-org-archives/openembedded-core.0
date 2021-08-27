Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.465.1630105977651263988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 16:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y5ICEhs2;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id s15so3264473qta.10
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cHxQ6O8SjiwT7oHtgo8/SAWq1RiVk1+IpM6XaKtAp4=;
        b=Y5ICEhs201WMoyp9QhvNHeOw/V7gLrpPvNotUG5PaCZDsQw9xzUlGoW2UJbLAOWETt
         +oLxww9cKUVH2MEtuaCM60SbkOHhDYpa1MmW5puIeoJVukxVqbBkR8o117rUcppUU4xp
         D3B2j9Oq3GR+MVc8zfMC8Xl69MPemLuY+Av+BMuq3VR82oSiN8gYu80EZ/rLt5ZQDbfl
         Gfrel6h3/CXhGFzQ4GkaQx38pGozOSkitLAS8dwdyBcakYjqdC7weEI6G3iysY2Uazeb
         Ry2tLISP7toPHPzRYI3iHXx3L/MNJMfpSdviTuDgOrfaDWBb42WjT5pInLQNfqDaeSP+
         1eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cHxQ6O8SjiwT7oHtgo8/SAWq1RiVk1+IpM6XaKtAp4=;
        b=PCBsqbjok4eYcyJef4sUu7eN21Gz7SiKVO7LLRUQmsKRvnuC+SIlupUtGMF3Z2ETSX
         Be3thQ+ZXNHrtPqQSCEZWmFfUiVZ8px2xm/JUEKLQUAuQcAkQmjFmezMOLKfMNUTkFAh
         F0ifdCA6JAiTwBrmLANM7VrBULXjqfba5lFYTo+6wkz9hvPWP0KiEoSaqLwBoJRUOJw0
         f0WXnsUDxQcF3PksdlOBpZ4pRxWzb349uxDssAZ8SrwoBVMuhf8qrG/F3O1zu6l/gO6J
         YnGUCspmZSR1tadZNBhOMiJ5pLNJPKOvbje93CP5rOgHRtL0pkgnzwq1YxMv1A4xIxIc
         IXcQ==
X-Gm-Message-State: AOAM531uJ7PxZMcCePV3Oug/MyAS9f5YhPqpbLwkXIv+YnzQ7rzMUxYv
	WuZhQKMGrhRTUxqJZPoo1lN7Jbh5yfNpo5Yhz0HPKPGQBKQ=
X-Google-Smtp-Source: ABdhPJzjc8NrkKYONy2nTWoe2CgcePipIj23o8V7UOuDDMt3II41PgHRZdRYIX1K32cRYoioz0yJqSFZZl/LTVM5bYA=
X-Received: by 2002:ac8:b82:: with SMTP id h2mr10682455qti.214.1630105976619;
 Fri, 27 Aug 2021 16:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210827215743.2027466-1-saul.wold@windriver.com>
In-Reply-To: <20210827215743.2027466-1-saul.wold@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Aug 2021 16:12:30 -0700
Message-ID: <CAMKF1sp4+ODRvGgAUSoiJQo0Hdo4Ju45y3qeEwY66wVNzRa4PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libtool: Only package libltdl for the target
To: Saul Wold <Saul.Wold@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 2:58 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> The libltdl package is not needed for -native or -cross, so make it's
> only packaged for the target class.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.6.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> index 6748d7468e..38982bf67f 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> @@ -43,7 +43,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GREP=grep"
>
>  DEPENDS = "libtool-native"
>
> -PACKAGES =+ "libltdl"
> +PACKAGES:prepend:class-target =+ "libltdl"

We dont need =+ with prepend and add appropriate space as well.

>  FILES:${PN} += "${datadir}/aclocal"
>
>  FILES:${PN}-dev:remove = "${datadir}/aclocal"
> --
> 2.25.1
>
>
> 
>
