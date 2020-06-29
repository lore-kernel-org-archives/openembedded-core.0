Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.725.1593449252126041894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 09:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r20EQUV0;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id x13so4869291vsx.13
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8h+qdNzgHiyeN7dhft9Q4pDVVPHuDDHR4IrdcdePiCo=;
        b=r20EQUV0kKVxgcmk+0xVHlSjSa8zuTmBkfW4AGF07BR/xN3f1lw5SHIL9+rchzoO4j
         Jfjp/xs2kDeCOi7mm2EZECiYSARgHBLmee61/4M/WqdvW1dfduxLzMTkA7DDSNfv9vgp
         /aQkdWcpIWuH9z1EWsBZxId0hdESEbcDmkh1jxZxo3qOdbSreF3evgTX4BWmHD5bA6Bz
         mLx61wV9SA/8DtoFyCS3QoCZNtiLKBg9OF19iDb8AkfdIY74tiHdnGG3RoHJ4jjCHETw
         il4SBO5puPvZ+/emr92kDbd6jzsVKvpYaCzVxJ9bPUVmsMfRTGqfb0T5xmA3zlykjsfP
         LvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8h+qdNzgHiyeN7dhft9Q4pDVVPHuDDHR4IrdcdePiCo=;
        b=YX1BRVU3aHlQuYhypxTwVyRmiWaj2r7MJvYkIPLVxWMpwhXkE1qw/zF8/brdIIfI8G
         T3F+qn9djouFKc4q2iWzhxhnUBptoqOTYdYgw7QaQ3CrDUvyCaUkpLQSN4a/gi9ih/MZ
         /fWzMiKOInEprKBJkRkYTNM0ozOPrJuvNdqqxuJLuBDhVArp8ymtEh1McVHq12BDbl1I
         1kva/NHHjzXNFlyld22cQ30fOJN0kLM9nmcyWhEN+Br4rt4pmQEIwzSysRHll4zxmOuA
         ctsVglFcKd1N0ZwYBEDL84a1xVIB8gi9HOimFOuoa11rBih8LOtg2GAUJRzy816sr4cL
         3nrg==
X-Gm-Message-State: AOAM530zch+KZgbVDQb7MgW3UNiRvyNjjnlNi4eI+Nznhl7YQmk/Yywx
	iMc663ENOD1+K0sDI5xwCxWSdVfH+N4+0KHfJuQ=
X-Google-Smtp-Source: ABdhPJzIKmjoLWycGbBOA5nPMMkFgSzbJnGdzgFGeIy536Xr12I67E82tbFVAobFbBQF/p38mBQyzpDySAa46nFQRM8=
X-Received: by 2002:a67:2ed8:: with SMTP id u207mr2190810vsu.11.1593449251119;
 Mon, 29 Jun 2020 09:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200628033328.653958-1-maochenxi@eswin.com> <20200628033328.653958-2-maochenxi@eswin.com>
In-Reply-To: <20200628033328.653958-2-maochenxi@eswin.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 29 Jun 2020 09:47:24 -0700
Message-ID: <CAJ86T=Ur51tgYNgjn94feaXcVxeT1uA2t8aSXkPgD5x0DuZaLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [dunfell][master]: don't select vulkan if directfb enabled.
To: Chenxi Mao <maochenxi@eswin.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, chenxi.mao2013@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 27, 2020 at 8:33 PM Chenxi Mao <maochenxi@eswin.com> wrote:
>
> vulkan didn't support directfb at all.
> So remove this configuration if directfb enabled.

This change doesn't look right. Passing two values to
bb.utils.filter() doesn't imply any dependency between them.

Can you explain what problem you have seen and how to reproduce it?

> Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> index 7a227fed51..aee001e641 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> @@ -24,7 +24,7 @@ inherit gobject-introspection
>  PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>      bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
> --
> 2.25.1
>
> 
