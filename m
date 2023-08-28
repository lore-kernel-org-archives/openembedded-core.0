Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E70C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:57:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.12742.1693227463481977338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=G3MddsR7;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso4914657e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693227462; x=1693832262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJZiOyNfPBbRejTXbLc8lmBs5vwrj0t+heB+j7+W5pE=;
        b=G3MddsR7FBfhBefEzW45wKcgFOQBeA9AJ41Ador5RwlIxTc5Kbaps9H58MRC6hOg3v
         1cAEH8e7leDyIyhnZh8aWvfIo+hgfbsUgSWAtf/AapNha2AqQnjaMKYFal1d0uLfIXOv
         JAnUt0Ffzix2QhNMoyO4GSTDBHn/PZrTeoMhOvLC1y6TjdAF/O4UkGJCX/qRk4QgOS59
         qeXp5QNAeS2qii0yWJfQhzW/LRo/1aC7QAADUhLCNlFACf0so27dfkMLDxmi/dS70PRH
         Xjop+WpSHAQ2Hq3PQYvZwL6t9A+TUguipX6R05cd9Obf8/UFhBk3W/IbGt7RzpoM3OyW
         fBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693227462; x=1693832262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJZiOyNfPBbRejTXbLc8lmBs5vwrj0t+heB+j7+W5pE=;
        b=G7psm1D2V6U+eIH6wIlpMFm6iC1+d3q+d8dHFC7VH3arbNFzW6rsu02/3qjt4LRCo7
         R2Bvr5e4OC4mG1Xy8zATJjuF3+6zCPtiIMZDDI9+mxxTz3f/AUMSH48F/d4gibBv6OqY
         QI7eaIZFMR75NyeZK15KSHTPc1un/h/xrOQBRnY/q5FSZwhvPgsFvYu6SRwgQGPrrjBq
         7K41FWGH/vr9OAx4NY4pya5gPQU/GWp2PROsjUvxb2WLuhsSL/4mXkh/oMGMYr0PCvBu
         2qcwd2kSYYnCGkITTtATDuK8vAQnqqWn1M60W0OlTYzU3M4dbqjm058QzSurJuifB3fl
         bwTQ==
X-Gm-Message-State: AOJu0YwgKOhqWN+NIlwAL5HStiG2Sa8RZjjRBEZps1EMSLxnrb3JPlKy
	WEfc3CXNTh70fyYBKv2iBYnN/T0QnHMwi/WLe0M=
X-Google-Smtp-Source: AGHT+IESkW2sR4C39o4cjSAukSTaV4NPERwRQt5hGzJiZ5/D87f9psNBoAGSNVH+zhnX6K+mWDg24Z9ybSzzxkgiSdw=
X-Received: by 2002:a05:6512:114d:b0:4fe:551:3d3c with SMTP id
 m13-20020a056512114d00b004fe05513d3cmr23450382lfg.36.1693227461389; Mon, 28
 Aug 2023 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230828124834.376779-1-martin@geanix.com> <20230828124834.376779-3-martin@geanix.com>
In-Reply-To: <20230828124834.376779-3-martin@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Aug 2023 14:57:30 +0200
Message-ID: <CANNYZj-iEBSOzp5_CbfhPuvhvaJ9KkdwZiLrLgPL=jaLzBJt8w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with GNU
 Make jobserver support
To: "Martin Hundeb?ll" <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186828

Thanks, make/ninja jobserver is something we've been talking about
since forever, and it's great to see actual code.

I suppose the biggest obstacle is that ninja support hasn't yet landed
upstream, and I'd like to ensure it does. Also, a link to the pull
request is missing? :)

Alex

On Mon, 28 Aug 2023 at 14:48, Martin Hundeb?ll <martin@geanix.com> wrote:
>
> Ninja doesn't (yet) support the GNU Make jobserver out of the box, but
> there is a pull request adding that support[1]. Switch the SRC_URI and
> SRCREV to point at the source of that pull request, to make ninja play
> nicely together with the recently added jobserver class.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  .../ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb}                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb=
} (84%)
>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-d=
evtools/ninja/ninja_1.12.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
> rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
> index 8e297ec4d4..9abdd40a92 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e4=
76c791cda7e2f2c52e"
>
>  DEPENDS =3D "re2c-native ninja-native"
>
> -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
> +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"
>
> -SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease;pro=
tocol=3Dhttps"
> +SRC_URI =3D "git://github.com/stefanb2/ninja.git;branch=3Dtopic-issue-11=
39-part-3-jobserver-fifo;protocol=3Dhttps"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186825): https://lists.openembedded.org/g/openembedde=
d-core/message/186825
> Mute This Topic: https://lists.openembedded.org/mt/101009093/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

