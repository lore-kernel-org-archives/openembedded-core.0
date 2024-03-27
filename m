Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5265EC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 12:55:07 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.36790.1711544100883732896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 05:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FeppenET;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d23114b19dso97910071fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711544099; x=1712148899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emhogf4SeoHxa7xQ3MsJ2DPuBVt80NJrsnAQU3zonGI=;
        b=FeppenET9jcElRKChnwommoP4e8hID+UHL60IFE05U9PMIQ/gGxgCv30+rFajguV5z
         0cSxfdIUWQb+pB0TXXiEk+N51ov+QXY//b6YEUh/5azIAI0iQXDVzs7qTprao7+1AQ5G
         MRKzdaGxfacd7gdJq2VsOaDu19gwF93rSyaTy5GhDj5cTGVrZVLs2JiqWCcCQR29z4f5
         L59hWPtC0Y/UZn6xbU1PgONfFBVr11eswi2VSehqzcMmsd5fce3jnxeSY6nkRzYoaATF
         fxJ4MzJ9vMy2GA91erLDMK3TW2FWpUDnmyJtthU6h0/hRMjYqaoPVkti4TNa4QjQXplg
         Vjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544099; x=1712148899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emhogf4SeoHxa7xQ3MsJ2DPuBVt80NJrsnAQU3zonGI=;
        b=YYftHFTq6D6fvTtNfM2jTToQkgiaP/BArqMwgRpYfTD2LCNCwFrwuXgM/eqxDy3er/
         73jsjkIuTPf0w8C9xB2xdQxy4WFAYZYA4oSyNj8+3R2ZpynEKyWUbihCLZrOeb4JmC7a
         xJ6+hZ4+EHiLlAchgpchQ/iHhwV37y750XWxcp+Jpk0pwHPOOVMQsuYZSsbmoIcB4YNG
         1dNuvxUs0WH2+1xcKCcJ9M1G5a7s4fHh90BqFqsqfVDx6aM3ytesdA/WtKOH0NmvV834
         a9fKy8VOKECkF+VzDsEUvhm9xtD8x5/O9qPfSAKa1Hgnu12L2CSMFb67AOn0ZuBDUQJL
         RdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNCQZ2314K2AywB/b0pGL25EvqKvvPKu7JRw9esH8lFzeP8z3yIVo+ieR4kU+Zcr0PNLSxjBtt3bTCm1yg2T4iMVEiSH3cYxEscYteWsmYtlGZ1k9BR2l0
X-Gm-Message-State: AOJu0Yz4BYrzOCPqhsny4LV04U1jQw/UCEsu+dMpqhYY8D5LAckl+ZMr
	4LEvaHZOKQLaD+8b3mxqhzh1wXzssLQEFmh5/VJ7wPpCPxofJFFKz+LL8cqiEaDtHLPGYt917/z
	SSp4a1VEm99fxvnX1zC/sMFg22UQ=
X-Google-Smtp-Source: AGHT+IGYe6RGoPzuATk7qMapTNgLQjcG3yQdnj6iKvBUKA4/fwYU1LUo0nLe4voIAJ4BThjwH3OcotLTLjxBkSUone8=
X-Received: by 2002:a2e:9ad3:0:b0:2d4:9201:d4ff with SMTP id
 p19-20020a2e9ad3000000b002d49201d4ffmr4221281ljj.5.1711544098807; Wed, 27 Mar
 2024 05:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
 <1711413292-3025-31-git-send-email-wangmy@fujitsu.com> <CANPvuRm4rOYNstWRR1d+koEigLJvnzCsnNrBhEOU-naEx70TuA@mail.gmail.com>
 <20240327124547d0f35755@mail.local>
In-Reply-To: <20240327124547d0f35755@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2024 13:54:47 +0100
Message-ID: <CANNYZj_Zk22yEqh728Ed4Ayp05ytybWPYu6YDsnirbk=b-oK3A@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH 31/34] spirv-tools: upgrade 1.3.275.0 -> 1.3.280.0
To: alexandre.belloni@bootlin.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, wangmy@fujitsu.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197557

This should all be squashed into a single commit, because otherwise it
will break bisection, if the bisect process lands between those
patches (or just take the original v2). I'm fine with not having
upstream changelogs.

Alex


On Wed, 27 Mar 2024 at 13:45, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On 27/03/2024 11:34:42+0000, Jose Quaresma wrote:
> > Hi Alexandre,
> >
> > I see this is still on
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next=
 but
> > it should be dropped
> > because it is included in the vulkan v2
> > https://lists.openembedded.org/g/openembedded-core/message/197546
> >
> > This spirv and glslang recipes should be updated in lockstep with vulka=
n as
> > printed by AlexK on
> > https://lists.openembedded.org/g/openembedded-core/message/197529
>
> Note that I took the spirv patches only once there was the vulkan
> update so it is not *still* there.
> This is super frustrating because the vulkan upgrade commit changelog is
> not a replacement for the spirv upgrade commit changelog.
>
> >
> > Jose
> >
> >
> > wangmy via lists.openembedded.org <wangmy=3Dfujitsu.com@lists.openembed=
ded.org>
> > escreveu (ter=C3=A7a, 26/03/2024 =C3=A0(s) 00:37):
> >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > - Add tooling support for SPV_KHR_maximal_reconvergence
> > > - Add support for SPV_KHR_float_controls2
> > > - SPV_KHR_quad_control
> > > - Fold 64-bit int operations
> > > - update image enum tests to remove Kernel capability
> > > - Support operand kind for SPV_INTEL_maximum_registers
> > > - SPV_NV_shader_atomic_fp16_vector
> > > - Support for SPV_QCOM_image_processing2 (#5582)
> > > - Fix access chain struct checks
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../spir/{spirv-tools_1.3.275.0.bb =3D> spirv-tools_1.3.280.0.bb} | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-graphics/spir/{spirv-tools_1.3.275.0.bb =3D>
> > > spirv-tools_1.3.280.0.bb} (96%)
> > >
> > > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > > b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > > similarity index 96%
> > > rename from meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > > rename to meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > > index 05c6de1b50..d2b6acf946 100644
> > > --- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > > +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > > @@ -7,7 +7,7 @@ SECTION =3D "graphics"
> > >  LICENSE  =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> > >
> > > -SRCREV =3D "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
> > > +SRCREV =3D "04896c462d9f3f504c99a4698605b6524af813c1"
> > >  SRC_URI =3D "git://
> > > github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmain;protocol=3Dhttp=
s"
> > >  PE =3D "1"
> > >  # These recipes need to be updated in lockstep with each other:
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> > >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197556): https://lists.openembedded.org/g/openembedde=
d-core/message/197556
> Mute This Topic: https://lists.openembedded.org/mt/105150547/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

