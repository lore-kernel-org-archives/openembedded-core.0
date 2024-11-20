Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F6AD743F7
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:57:43 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.2547.1732147062529423733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iAvlFKrS;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-856e7566b2cso148889241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732147061; x=1732751861; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJshmsUPpk5IWVwjznZFc1NpCKeqLUeGFS7TfqWdOqE=;
        b=iAvlFKrSPk/vFHmRKDVZmGEXfembQVowNlkspdQwqVK19F3AAVPFp/cWOlye3JQ+RJ
         cmQXS53gdjJnWDqnCXPyiMTcbx2JRhsaPUcnEjBrEvTUNFHBMboqd5AzzV5A4lYaxwei
         kKkdOZ6syqOe2YdH28X21gYcTbiIiPDd4KxOWkRXCiYvKQDi4Ru66RCScx/VmJYzk0wZ
         +q5jJkEkMUjkgPhWOYsgd+DyRPV0AOJ6VIKwPNL+Mvn/PbjJrXN46t83kXHlXH5Kl26N
         cSWmITiEgwu60SQzxHPtxYODZ/lDxuArussEgA6u9sYQqM8HUukIefCwYS0Ue2qmPJHX
         M5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732147061; x=1732751861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJshmsUPpk5IWVwjznZFc1NpCKeqLUeGFS7TfqWdOqE=;
        b=jsVIRZ/pw3hrGdEh001K75NHZZB8YXZE7gibozM+OcQMdMKeZWkzCkiM68ZHZUl6PF
         FlH1SYb8Fnrp6EF+uXsSpTxbyna5Gpqabg3nFAvqCAHxk0kcaRcEde1dCXdW+Cr5gcrm
         E1o7IyR50VCyOa0wxbPfxkJPRACXWdakGnGI5rqWDCsLkVQHk4txVOkbYxYMvRqOVPun
         5qe1ySwBDajZSC1ZJJ/dWqNzLgO7685yZY8Ht0O9L9aYLNTuZ7UuAUSzCjwHCzt+wC6P
         Znlui0yrh/m3nzNKHeKL2zZ3Yw12VhiGnbabMKxHWjFg+Eaj7+1jaG5ifflJkRjQwAXh
         1zsA==
X-Gm-Message-State: AOJu0YwN201rN0aFGXs/yk9tJGF8SVHtzZkwAXBs5BC12KyaB/2twnKt
	Ks9vBoJcu0xCRhKRBHaT0sVPonTRiCZBBVwMKjKcb8DjlEQwMSvE
X-Gm-Gg: ASbGncs9VP68bOoo4WRKToRACv6Z7IkYBlua8/lohXYlkNmDgyQvQ45xWG5Qk4Le4cK
	xhTzbckM039SN6lZ+fra+KW216m/992F6sAae3AkJAD0IQsDAn5Y2HM1WDTMwwVtE2lK3vcgGlc
	AoR5xj+ZyJzPNkjzJq/GmjdNL35A4FBRfaUe/sIAkClsMKgQp1cJooDtlBE2cV4Pqp+CpXoigtP
	jgFHQUu2OO0y1TXXHNByCFEbVVz7bV0ZzwqI5I+FGnmjbE=
X-Google-Smtp-Source: AGHT+IHyphxQ20UyRpznQXxIiSJO7LYmQBYC+Nlzu6CF16eYvq/HvV1QypsznqFfyXPJIaqyQYNrGw==
X-Received: by 2002:a05:6102:2d0c:b0:4a9:6380:894f with SMTP id ada2fe7eead31-4adaf415b2bmr6126763137.5.1732147061530;
        Wed, 20 Nov 2024 15:57:41 -0800 (PST)
Received: from hiago-nb ([146.70.98.136])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ad648c6957sm1831273137.22.2024.11.20.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 15:57:41 -0800 (PST)
Date: Wed, 20 Nov 2024 20:57:37 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH 1/2] libdisplay-info: add recipe
Message-ID: <20241120235737.4oqnasclzp77buy6@hiago-nb>
References: <20241120203005.1802141-1-hiagofranco@gmail.com>
 <20241120203005.1802141-2-hiagofranco@gmail.com>
 <20241120230058.GW20070@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120230058.GW20070@denix.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 23:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207493

On Wed, Nov 20, 2024 at 06:00:58PM -0500, Denys Dmytriyenko wrote:
> On Wed, Nov 20, 2024 at 05:30:04PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > libdisplay-info is a EDID and DisplayID library. Goals:
> > 
> > - Provide a set of high-level, easy-to-use, opinionated functions as
> >   well as low-level functions to access detailed information.
> > - Simplicity and correctness over performance and resource usage.
> > - Well-tested and fuzzed.
> > 
> > Since commit a16598b038b2 ("backend-drm: make libdisplay-info
> > mandatory") from Weston, this library is now mandatory in order to
> > build weston 14.0.1 and newer.
> > 
> > This recipe depends on hwdata-native, which support has been submitted to
> > meta-openembedded layer at [1].
> 
> OE-Core cannot depend on meta-openembedded and based on the changes being 
> submitted, it is a hard dependency and is not optional. If it cannot be made 
> optional, hwdata will need to be moved to OE-Core...

Got it Denys, should I then move hwdata here and make a patch to remove
it from meta-openembedded? What do you suggest?

I would add myself as maintainer of libdisplay-info and hwdata.

> 
> 
> > Therefore, add this recipe.
> > 
> > [1] https://lore.kernel.org/all/20241120160005.8473-1-hiagofranco@gmail.com/
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc             |  1 +
> >  .../libdisplay-info/libdisplay-info_0.2.0.bb         | 12 ++++++++++++
> >  2 files changed, 13 insertions(+)
> >  create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> > 
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index d61b88f7de6c..81989506e19c 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -324,6 +324,7 @@ RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
> >  RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > +RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
> >  RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
> >  RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
> > diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> > new file mode 100644
> > index 000000000000..b98d2e4452a8
> > --- /dev/null
> > +++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY = "EDID and DisplayID library."
> 
> A minor nitpick - SUMMARY shouldn't normally have a trailing dot, as the 
> default DESCRIPTION will end up with two dots...

Thanks for letting me know, I will fix it in the v2 patch.

> 
> 
> > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/libdisplay-info"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
> > +DEPENDS = "hwdata-native"
> > +
> > +SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
> > +SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit meson pkgconfig
> > -- 
> > 2.39.5

Regards,

Hiago.

