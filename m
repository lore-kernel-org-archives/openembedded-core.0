Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52E7C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 11:43:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.12593.1675338177223568334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 03:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MTcc9feC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id n13so1158270wmr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 03:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA5i/YOv56HVYRUFErv6hIjFxoJU5lw5V0Jkx1O9YwM=;
        b=MTcc9feCzuhH+oEI9BvCixmTuwa78IojxHNdQzWAWD/PX32zHN0PspenWX4GW8jVUs
         AhP67Y73udnZzI1RcWwAOhrTK67ytfiwXDQOJWwiGv3wMFwdu8qAvIHBSusPLyuwjUyK
         gS5/QK8HwsAwxbUWuFWPyY8r4EC3XVIk4vk10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DA5i/YOv56HVYRUFErv6hIjFxoJU5lw5V0Jkx1O9YwM=;
        b=7nfSyPmum8wwg1uNyZOKk53BIyJDZo5yV4WWJ8hpKfR8a3XKmxfRisu5P+3F+SFshv
         JZfDx/y1BYZYIlRvZdtleYLoDBfMggzVWogJXupDKDJZ6h3Z5ZaFXzKBGysTVMhID7kD
         lsX+UQi9N8bbWHPL6WMEFfP68hc7jxJUT0YfoykBiLXy/6TByvZAiANf1Li8acfjg/aQ
         BqA/A3R2K8+ah6aTWXCm0JkWKnQR5ncjQjIfOyD5xbNu6ne4NRzQUx/TnoEA1STIG/b2
         lT76RBeoFTCBIZwsFjzVhOAEtWM0friUZgPEKLOJiUdSz51NniLv88au/bs88WQiA4ZG
         OxXw==
X-Gm-Message-State: AO0yUKWfecyuQAlHd7WTb+Tc8RexLtKOyXpfLJQQTZO3Xrx/tZoT1iFt
	i56TO4P6pQkiJemebVbzFUZ7og==
X-Google-Smtp-Source: AK7set8uQHcZJ5Qzq0V+TmzVo1gp8xsj3Z0gK27geGvwUah5/n7ivSuVDYnzs52k2SgomaXSDh8vjw==
X-Received: by 2002:a05:600c:1d04:b0:3cf:85f7:bbc4 with SMTP id l4-20020a05600c1d0400b003cf85f7bbc4mr5426415wms.2.1675338175484;
        Thu, 02 Feb 2023 03:42:55 -0800 (PST)
Received: from [172.27.250.62] ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003dc48a2f997sm4079623wmf.17.2023.02.02.03.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 03:42:55 -0800 (PST)
Message-ID: <78aa81ec86a05f1b6da3afd1c7af73e97de3aa58.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 10/13] native: Drop special variable
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Feb 2023 11:42:54 +0000
In-Reply-To: <47a2634831f907d83ec40ad010351c923ef67f0d.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
	 <47a2634831f907d83ec40ad010351c923ef67f0d.1675289652.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 11:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176689

On Wed, 2023-02-01 at 12:16 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Back when it was merged in https://git.yoctoproject.org/poky/commit/?id=
=3Dc4257ed8b1040a5a0e9a95846d81961741239116
> it appeared special handling in setVar was necessary. Likely due to
> other fixes and improvements it no longer appears to be. The results of
> "bitbake world -g" before and after this change are identical for oe-core
> and meta-openembedded. Therefore drop the "parsing=3DTrue" special parame=
ter to
> setVar() meaning overrides can now be cleared.
>=20
> This means that something like:
>=20
> DEPENDS:append =3D " bash"
>=20
> now functions as expected, adding bash to the target recipe and bash-nati=
ve to
> the native BBCLASSEXTENDED version.
>=20
> Without this change, it would add bash to the native version as well as
> bash-native which is clearly incorrect.
>=20
> [YOCTO #15010]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 99a5105f7b5303cd36077b5910c662a865c1782c)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/native.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index fc7422c5d7..4de96cd59b 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -153,7 +153,7 @@ python native_virtclass_handler () {
>                  newdeps.append(dep.replace(pn, bpn) + "-native")
>              else:
>                  newdeps.append(dep)
> -        d.setVar(varname, " ".join(newdeps), parsing=3DTrue)
> +        d.setVar(varname, " ".join(newdeps))
> =20
>      map_dependencies("DEPENDS", e.data, selfref=3DFalse)
>      for pkg in e.data.getVar("PACKAGES", False).split():

Steve: Did you check "bitbake world -g" is the same before and after
this change for kirkstone?

Cheers,

Richard


