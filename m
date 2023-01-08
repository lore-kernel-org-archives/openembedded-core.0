Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D25BC54EBC
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 02:08:58 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.36728.1673143734881518842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 18:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d7Mfo4y5;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id n8so4416622oih.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 18:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vCFCzsSo91WjgLvO2np4Va7fwZVTPE/Lr6q/ts9d4Y=;
        b=d7Mfo4y5f0KBi4BQJXAuba16MwklRXVA7H81ByJY1RRyyhMqtGfk/rgbm/EoWENMxW
         Q3OgSecFAjFE6QgPUFyO2GCQ+2Fc/aeF2Xru4FND9999wktgdxnsXx61t9D6nUVsXMoI
         6XSejVbwDh3NEKS8rW2t9eFrxnDsCU1091aDhsVlVf3ZAHEE7bMU1VTFiXfJW1jDw8YY
         Ih7cirXUmyGISmr587kcTPUvCwuiBmkUYUpAmS9VZ2hxyq3Iw/Xj9HirjGTdBevfMhNN
         EXGS6eXDWQDtEgWsjz/nqdXRcTT/7WAfS4WgJP3Xv8Ef4II30gYGSmkjjGro5X+3FrFb
         mE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vCFCzsSo91WjgLvO2np4Va7fwZVTPE/Lr6q/ts9d4Y=;
        b=1Yfkja63qDTU6571AoRVXY1ti3KILuzQ90F4y3prQaLvwA+9mUtTygUDbs61idn+BC
         PYO/lxxVoar23WK9aOrwiNhhq+CXrMgDPNDXog9myLW1Yb4nRqQvrKN0B7y99HTOxNjc
         GBIEC97P403lba66A0lrtvMEuYQrIAFq98xJ9XAgMaQWgy1nDVy8yyCOcUwOtMOzEXps
         lqHLwlCLuOc35tJ1ifUjvXbdUj3pHVqs8ezsDRFxSR3xK8uFhQwRO/WjBu0vkg49Irxj
         FKAG7vNFJRmB4hAc/aeMvd5luaczRDQRWq/kyNy+yDy+rMLuFnvNd6cVzr4rWlkXap8U
         hA6w==
X-Gm-Message-State: AFqh2kr9497O3G6yLK+kbt9/sw2IpEVO1MlyTOCaN2GxAEKVBsttcjqn
	s19Hr8s89twEftNgfokeaPrbdQ34d2D5q0Lp7u0=
X-Google-Smtp-Source: AMrXdXviHepQyI2pT0a4WP2nJ7IPvV80211DXl4oHXvoGALDXZokVY5D3Urmu+Q3zkhe4y8ahk+6Gagbfi4zKTOjgG4=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr3464241oia.262.1673143733889; Sat, 07
 Jan 2023 18:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20230107000831.1253334-1-raj.khem@gmail.com> <cb42a161e6768fccfbe86308791f3e19bd8a19ef.camel@linuxfoundation.org>
In-Reply-To: <cb42a161e6768fccfbe86308791f3e19bd8a19ef.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Jan 2023 18:08:27 -0800
Message-ID: <CAMKF1sr_w_YB+S3t1ggtdGA2UR_EaT-EJhP8VBhfFmucVJKZZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] site/common-musl: Set ac_cv_sys_file_offset_bits
 default to 64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 02:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175623

On Sat, Jan 7, 2023 at 12:13 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-01-06 at 16:08 -0800, Khem Raj wrote:
> > off_t is always 64bit on musl regardless of 32bit or 64bit
> > architectures. autoconf has AC_SYS_LARGEFILE to detect correct off_t
> > size but it only work with glibc since it defines feature macros
> > _FILE_OFFSET_BITS=64 and _LARGEFILE_SOURCE but these macros are
> > not used on musl headers.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  meta/site/common-musl | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/site/common-musl b/meta/site/common-musl
> > index 86aed4a38c..23e50ef749 100644
> > --- a/meta/site/common-musl
> > +++ b/meta/site/common-musl
> > @@ -15,6 +15,8 @@ ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
> >  ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
> >  ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
> >  ac_cv_func_strtod=${ac_cv_func_strtod=yes}
> > +# off_t is always 64bit on musl systems
> > +ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
> >
>
> Not sure if this failure might be related to this change:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6496/steps/12/logs/stdio
>

Yes its a side effect of this. We should have added
--disable-lfs-alias always. sending a patch for this package

> Cheers,
>
> Richard

