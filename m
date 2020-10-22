Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
 by mx.groups.io with SMTP id smtpd.web10.1917.1603394808005249265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 12:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVIaTIu1;
 spf=pass (domain: gmail.com, ip: 209.85.221.194, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f194.google.com with SMTP id t67so640290vkb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 12:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yD/C2nzhIPPXoaIILxePU3Cxvob5eXZUYm9duqo9SAk=;
        b=DVIaTIu1sSM8pDFNwpcrGAh9UhNV5uF4xklLDEyZiQ52XCICDs4JdgKTPo+qMesVKi
         AwFhmPfS04IK7qKRoQVKbmtFnmiTX/AHM5JGC1muH0SvzrcjWuADwJiQqQEE6/TYEHUV
         VfU33h07O61Ob38wpXT3NaCW18vZflFb7+lT2CiSze0I4jwUxj2K7VGjz6KnxrupSVxy
         CN/BZJBZn+GWKufBfy/rlV+uvyV4AcIKAgV8SlKpcQ2R/cQx6xcLunUl983WCljhh83i
         QwiiF4C9Y8Hz6cq1xxSXmYKPnUI36gDiBCXIIHky96AsrSW8rtid/PG5u6llAPyqHH3u
         JWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yD/C2nzhIPPXoaIILxePU3Cxvob5eXZUYm9duqo9SAk=;
        b=CPmAzLtLfl9ilCEvV+ghki3ocycNyHGqONX9rpmucScerTSGXu4xzZRVywKk7Pa9Gr
         CLuKRpUsw3CVnsFAjSUKeV7bdVMrDKVRYjtL/88xr0Whmlv1bCkgRU3y6KAQ4j4ZojdA
         V0nkU79v3jkpZK2uu4zvxhvR/sa5nLjWOQ9D6mNbanMX3m1F77wQlmz13XF8x/4nmEI1
         IPkUuC87K9Pv4Q8xnhr5IAm2bHOZDdxkm/S1xp5T3mKA4X7IDlteu+jVveVaObxyOlkI
         fSXXpS5T5wkdQ6a22aN5Owtx3GJvZCy+8QK4VCi5PPqPknP456LN7PimXZLkHDbk99r4
         Wf2A==
X-Gm-Message-State: AOAM533WHv0J4naUruRxzmqzQ+J4b/gS7fOZPxcKh2GPfVMp1HbqsnnE
	ZEk6pvN1Oy8p4B/s89WigpXQEz9TMXfnXC+HbNM=
X-Google-Smtp-Source: ABdhPJyKhqrkbXBUFlLsq9H1NrCEIZgymrUlcG9Y9a9kRfLbF+lj5roP196S058AemMRoCIuPxN46kogb3m+zCaAbck=
X-Received: by 2002:a1f:38cb:: with SMTP id f194mr3092156vka.22.1603394807004;
 Thu, 22 Oct 2020 12:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201016095531.140098-1-Martin.Jansa@gmail.com> <20201016095531.140098-2-Martin.Jansa@gmail.com>
In-Reply-To: <20201016095531.140098-2-Martin.Jansa@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 22 Oct 2020 12:25:30 -0700
Message-ID: <CAJ86T=WdocqoYgd_nZ0M8mn372ERZsDG_Lrh26HuWzSwtYfW3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] tune-ep9312.inc: add t suffix for thumb to PACKAGE_EXTRA_ARCHS_tune-ep9312
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 2:55 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * broken since:
>   commit 805dd4807d322dc70cef97edd68fdb3142b60fb1
>   Author: Andre McCurdy <armccurdy@gmail.com>
>   Date:   Fri Aug 23 13:51:36 2019 -0700
>
>     feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX
>
> * since this commit the 't' suffix is set ARM_THUMB_SUFFIX by
>   armv4 override (which does apply for ep9312 tune) instead of

This doesn't sound right. The armv4 override is being added to
MACHINEOVERRIDES (it's even shown in the patch context below). Is that
somehow not working?

>   armv4 in TUNE_FEATURES - so the comment in the file was no
>   longer correct and ep9312 wasn't usable
>
> * fixes:
>   scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/tune-ep9312.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
> index 11fd266ba0..5e1a0e5791 100644
> --- a/meta/conf/machine/include/tune-ep9312.inc
> +++ b/meta/conf/machine/include/tune-ep9312.inc
> @@ -8,6 +8,5 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '
>
>  AVAILTUNES += "ep9312"
>  ARMPKGARCH_tune-ep9312 = "ep9312"
> -# this tune does not include TUNE_FEATURES_tune-armv4t, so there is no armv4 TUNE_FEATURES => no 't' in ARMPKGSFX_THUMB
>  TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
> -PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
> +PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312t"
> --
> 2.25.1
>
>
> 
>
