Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE81C05027
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 02:06:58 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.73955.1675735611952664766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 18:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bmJbAH74;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-15ff0a1f735so17434099fac.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 18:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfX/JWLK9EtcsWT3HK18Z3L4GCKcKpJCPX61THyoyK0=;
        b=bmJbAH74ENgMzZdLvqZwXtpIB0Eg5v7nf14wrgGfU4Unqt7Trhko4dYkNSQRjNq8vk
         a4ZcuELdaxWjKGhXvbt13BBNmZJCfr/ZKNpMuVyRcKIgtnj1oy+mgVWwEcdhnpz+0oo4
         Hp6qIvg4Qs4Y+E35A6cUVlRWfm5h9uKV9smncwGO2/Jc2t+eWe1kwmMhK2bWoRxfEAXa
         8+6tNxyEkexr0ENF74lw3FHTfojZyhuv/KCYO6CEH1a6cBs1gpUx7JLbh7KaKTKIYUlK
         rSUIgQy+anSk1XLD8cLJBJ1sAJqNPcB55cKulvci7n+0ZGHxprAJDaCLpcRiFZWyRB60
         +kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfX/JWLK9EtcsWT3HK18Z3L4GCKcKpJCPX61THyoyK0=;
        b=YXGLQshJgNoZfyBRbsorLI4mamHee+oY6xIkeZoQ3lTPtqdZQ00X6MzBAR7s4YY8Vc
         7cHhPifYq9JyNPPm/fmaDUpEE6ZZMVY4N1hO8YhdvoURzs1ObFjfpCzrVGyAh8GlrV7p
         n6FoBZszb9a1oqZGPwiNo/NZPPG6gO4gEIOhr4dA6xwJbDXIPFJXlELpGMYaXgy2dIJu
         4yaqcVYPIRxhLXZwAPezVidK45XDRF6nVswB6srFaaII+t2LbOpgjh67lq9wP4XyVJIg
         EbiHQF7Z6PwBrWs21BKUPG/RbSGRmqzSvjSzXHrOVfSOMluJHKfLVn1OEVaWiVMxtClK
         BoCA==
X-Gm-Message-State: AO0yUKUdKeTDIPto+a6sMb95H+IVptA6DNTRTm7xM1qhjYFE/DdC5UiT
	FesmbTp8N4FYmnqTGYqSx/22c1oDstD6cW5WRZE=
X-Google-Smtp-Source: AK7set/yvlIWfo8O/iVX4kjtz7nOvFPJ/w6e4rjP8+UVBlIodp+JwRYf1H8UdH9N1IUxFMzfv8+jibYAb/+iMj1r9IE=
X-Received: by 2002:a05:6871:4e96:b0:163:d288:863 with SMTP id
 uk22-20020a0568714e9600b00163d2880863mr1573804oab.55.1675735611123; Mon, 06
 Feb 2023 18:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20230206210911.2074894-1-tom.hochstein@nxp.com>
 <CA+chaQcNJc+k_SGvbzOAQPPHdf=6M3397qyiSV49v2eAiRf+ZQ@mail.gmail.com> <DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2023 18:06:25 -0800
Message-ID: <CAMKF1spg0hP5_7ju0XEqavZcKkTCaQP7nctB6wuistKaCmvQ=Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 02:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176800

On Mon, Feb 6, 2023 at 1:36 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> Oops, I don=E2=80=99t often send for non OE-Core and I forgot there was a=
 separate mailing list for that. I usually just cut and paste from here:
>
>
>
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Se=
nding_patches
>
>
>
> Which makes it easy to overlook the mailing list requirement.
>
>
>
> There are several examples in the repo that use this same pattern. Here=
=E2=80=99s one:
>
>
>
> https://github.com/openembedded/meta-openembedded/commit/7163946b56539725=
d5a5868a9318e56e713a4a95
>
>
>
> It has the advantage of not installing the header in the image. Should th=
e -dev solution be preferred?

if these are development headers and libs then yes its better since it
goes with the general philosophy of putting these files in -dev pkgs.

>
>
>
> Tom
>
>
>
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: Monday, February 6, 2023 3:13 PM
> To: Tom Hochstein <tom.hochstein@nxp.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main p=
ackage for SDK
>
>
>
> Wrong ML and why do you want to install empty package? Add nlohmann-json-=
dev to imx-gpu-sdk recipe instead.
>
>
>
> On Mon, Feb 6, 2023 at 10:09 PM Tom Hochstein <tom.hochstein@nxp.com> wro=
te:
>
> The header-only package cannot be included in the SDK without marking
> the main package with ALLOW_EMPTY.
>
> Fixes rootfs problem:
> ```
> The following packages have unmet dependencies:
>  imx-gpu-sdk : Depends: nlohmann-json but it is not installable
> E: Unable to correct problems, you have held broken packages.
> ```
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.=
bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> index 502262820..6cf27755e 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> @@ -18,7 +18,7 @@ inherit cmake
>  EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
>
>  # nlohmann-json is a header only C++ library, so the main package will b=
e empty.
> -
> +ALLOW_EMPTY:${PN} =3D "1"
>  RDEPENDS:${PN}-dev =3D ""
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176799): https://lists.openembedded.org/g/openembedde=
d-core/message/176799
> Mute This Topic: https://lists.openembedded.org/mt/96793459/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

