Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA84ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 14:47:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.7379.1662130037419532023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=boT1Rhp5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id n17so2628670wrm.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=pYhRRA7mJ0+k5Wb3sl4EYdJQJf04GdCB4RpZSqX0Els=;
        b=boT1Rhp5LZqTrkGrG65yBsG8YSS/+a3T0gA8H/2cldl5xywyCWrSyUoSmj37RFG3oK
         lsr2jLDZiNoid/bPjNGiw4ZQv/Ttue+5eXePCAi15Cyc1d6XOjwcIiCF/n/Rccf+1snJ
         /peCh3JKAajoQIeBvjUzcqhdWZH/6pDW6PlFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=pYhRRA7mJ0+k5Wb3sl4EYdJQJf04GdCB4RpZSqX0Els=;
        b=fxJXM9ZFvN0lKrqFJSj+BQy9Ykz1By5iivK5dC8pEsZkj+y/kfryPcAiFzWp2oNUL4
         ebLJ3Q1wVK2YENtBEAb4dO0IiSQwlgTOca+ADyZkMO1yiPdNwM1rXheTLXVMaYj+CBdB
         qFGxJD8DkAHMh17sQtNiFyKU0BtiIv/JmmA9JKoN8imN4IILaOfKQuu5Yv+SybcVpqf1
         3G7W9lBXdjLRWqSaNRIUx6Ar5/jdWNo98ip5dVY7DE2sdHqE8X6HdMLLyu1ms6CD+yJV
         ZbQBmWMrVf81znnjQZb1O0lP+3DhSIMB4CL8RLjEbv9iAWvBoyu3z+sizezu4RWFsnpe
         9ADg==
X-Gm-Message-State: ACgBeo2u9FvkUHBeNTllcuQ9IcBEG3bpndZVBtnkAqwtGsD7GtmTWn8d
	z9PPOO3Hsrcp1j2eIOcEq06i3Q==
X-Google-Smtp-Source: 
 AA6agR6YBYqZJ0bVXupVrbzQ+YqFC49etMPEMpdyJyOFKY+LMeFU6SYqT/INpu+RvpdXTChVAAragQ==
X-Received: by 2002:a5d:4988:0:b0:226:d424:4b28 with SMTP id
 r8-20020a5d4988000000b00226d4244b28mr16442895wrq.443.1662130035781;
        Fri, 02 Sep 2022 07:47:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbec:572b:ff3a:e320?
 ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6b41000000b002250c35826dsm1727656wrw.104.2022.09.02.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 07:47:15 -0700 (PDT)
Message-ID: 
 <ce837e16269eae046f24845d5b353b8a98210294.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] baremetal-image.bbclass: avoid inheriting
 incompatible IMAGE_CLASSES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	openembedded-core@lists.openembedded.org
Date: Fri, 02 Sep 2022 15:47:14 +0100
In-Reply-To: <20220901234206.419429-1-alejandro@enedino.org>
References: <20220901234206.419429-1-alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 14:47:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170250

On Thu, 2022-09-01 at 17:42 -0600, Alejandro Hernandez Samaniego wrote:
> There could be IMAGE_CLASSES designed to work on images which arent
> necessarily compatible with baremetal-images, one example is the
> license_image class which relies on the package managers functionality
> during do_rootfs, for baremetal images no rootfs is created hence the
> package manager shouldnt be invoked, we need to avoid inheriting such
> class to fix this behavior.
>=20
> inherit BAREMETAL_IMAGE_CLASSES for baremetal images but set the default
> to IMAGE_CLASSES, whilst removing undesired classes in an intermediate
> step to avoid incompatibilities.
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
>  meta/classes-recipe/baremetal-image.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
> index d3377a92fa..2f07dec4ac 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -18,8 +18,15 @@
>  ## Emulate image.bbclass
>  # Handle inherits of any of the image classes we need
>  IMAGE_CLASSES ??=3D ""
> -IMGCLASSES =3D " ${IMAGE_CLASSES}"
> +BAREMETAL_IMAGE_CLASSES ?=3D " ${IMAGE_CLASSES}"
> +
> +# The license_image class relies on package managers used on do_rootfs
> +# these dont exist for baremetal images since no rootfs is created.
> +BAREMETAL_IMAGE_CLASSES:remove =3D "license_image"
> +
> +IMGCLASSES =3D " ${BAREMETAL_IMAGE_CLASSES}"
>  inherit ${IMGCLASSES}
> +
>  # Set defaults to satisfy IMAGE_FEATURES check
>  IMAGE_FEATURES ?=3D ""
>  IMAGE_FEATURES[type] =3D "list"

This is going to become a usability nightmare. Can we patch
license_image to just silently do nothing for baremetal?

Cheers,

Richard


