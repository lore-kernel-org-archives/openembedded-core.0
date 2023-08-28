Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99220C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:16:25 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.4.1693242984166669882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nxVppYtX;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a85cc7304fso2600681b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693242983; x=1693847783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeLjJOl/pRxBuXmx2wgpZx+Zh+0KTikhBxR2VQfj/HU=;
        b=nxVppYtXFVnLhRFgtj1ReXZ1PtrD2U4BpAzpUlEeI46+kb44vdo/m2WaJQjLQGYQFx
         Npnlc8D+ay7GvZ8/XH06uwW2/rnOTzWmWaojAYRCrPW5rzp+5ymXBevXzMotz7YbBpb0
         m0EyqU6utPc0I0ijlK2bb/7VAxOo1zKnWr0+/82fR2KXo+ItCsAdwc2tClZWsAi5eU0x
         GWH91jTVjVNdFbNynKwdtvfWcATLLDbPe58xNhasgLF7XIE9NkFL1pQyetTTJTX6qYwj
         9mRdLMWu0jPmge0iJK8Ol85txbIXq7Skr2R+0Ii/5ajXBoVqCll385/mhG5WRhxjZyN/
         7+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242983; x=1693847783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeLjJOl/pRxBuXmx2wgpZx+Zh+0KTikhBxR2VQfj/HU=;
        b=YZofUcXcLsm5Vh0+juT8+aXxCsPvRDb3RTvlZ7p7y9SzYI6cQIPTqaZ1hXrJ100zZx
         qd/emeBQFS839s27yVRVLc7ECXRPLdtp5lFzegjuK8lQxQWoQT+znRSRf33xf+lJ34TG
         Ws+zXlhc2/S1Okp828C0hEhsYenMloAXbDUagOVrfaqf32qboOc4mIQK4RHbwWMs2ddd
         DH9jStfY/rCFGbtq7t/CsR+57ZMkoGKoxlxQ9f74Bn0ZMmoBDNO1yPNhAIZCPsNnMcL+
         KskTuUXuW2fFPEHNuQKhmzQi01eqeGry+wtQdMj3pvZM1w7Sun/P43gqemDOYimFYMpt
         fsbA==
X-Gm-Message-State: AOJu0YxZFqKMLw+7Y4WI/r26NPsQg/+nbHxXsx4P0gp+KYnPzGHfXn2L
	dgPrnmKpvyO0NG88aWu6gFaNtLew/Pbv+u3w/kISdO12Hm4=
X-Google-Smtp-Source: AGHT+IHG+uiLMOGGDdPZF9wTuJqd+Ex35KHWfoD7E04k8GxY/iZR0ZQy2ug2wrHgz2A33vdiTKgOd0I8pJPeuU2/BRI=
X-Received: by 2002:a05:6808:2185:b0:3a4:357a:ebf4 with SMTP id
 be5-20020a056808218500b003a4357aebf4mr15482856oib.0.1693242983294; Mon, 28
 Aug 2023 10:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230828124834.376779-1-martin@geanix.com> <20230828124834.376779-3-martin@geanix.com>
In-Reply-To: <20230828124834.376779-3-martin@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2023 10:15:57 -0700
Message-ID: <CAMKF1soPeynqxqQs6tsxdvbOXriZOGByDJijU76a3eodcqE91g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with GNU
 Make jobserver support
To: "Martin Hundeb?ll" <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186840

On Mon, Aug 28, 2023 at 5:48=E2=80=AFAM Martin Hundeb?ll <martin@geanix.com=
> wrote:
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

This is a little concerning, as we are pointing to a fork here and
quite a lot depend on ninja now
a days. so I wonder whats the status of the patches and likelyhood of
them going upstream
in anycase, we should pick the patches instead of switching SRC_URI

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
> Mute This Topic: https://lists.openembedded.org/mt/101009093/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

