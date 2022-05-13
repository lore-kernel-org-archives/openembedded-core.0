Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC222C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:56:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.8582.1652450160511819768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qXVmPJjT;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t25so14661299lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HdrF4cWWWC3m2UC5PBDpP1KEOfolmJJfQ/0QIRJ7LB4=;
        b=qXVmPJjTuboPBGyBOVYSjYKS/0BcKzh+l+BcoAQmHXRrrFtIYvj/NLy+IRBtTT4FWJ
         1q/NGF96Ux0dTvit84+miFnyhITwU3hfDPddPSlvESagw4y0G0nzlLf8aWq8b+psX07H
         +G0T1RRIHrTFyCm6GBt8pltfMfk74QmhM2hNVXdpooZrD2IgE0c5SCH4Ze/ResJU6Ota
         lGRfBZufeVB1dikE3PON09Kn4eEi2PBxpq4xoMC9xqbDpiUihvz4NiIsf2DQ8/h2Z/WE
         YM6d76qRZRe/tBr3gBR2W/Uv720eGJ8mUlwJ9dbnmWih7kk6xpAjmag7ae5CzYg81x5U
         w6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HdrF4cWWWC3m2UC5PBDpP1KEOfolmJJfQ/0QIRJ7LB4=;
        b=TAQyOJlyvS2y0FBINGUZrITXbO4/CByOQVpokKpQytDp/EGaTIP95Vn8ktGiFIVe5a
         nubhMqFTigtk+/g8QdS7aMcgtM3fnQ0VPeh/fynZSxaaV7StMyM88B2zsNbxEpLyLDH/
         EMfbXzjzgN6nGhjNtZbiwcD9GGcIGlBSWyFm1BFwmWhxveSQkrEXOQi2x4MjX1AcndeI
         4Ab1WD16fuyqgWIsgsuRH28c1bgDaixAUyDbiZxVXLAYDPYlUzYrNnzLFQIdWdqSrCvL
         hnjp5kWAnB+IoqzNckySZucR59RSTUGZUStB7H/+/6l0BAnx0AKAY0dFw0sjcSCTklgx
         Ym8A==
X-Gm-Message-State: AOAM530kVpONsD4k98JpBcx3lNO1wmRzfkceqR9HO2Cpx+bLHIj6AhjD
	K6dTBG7igD96AiT0xRgfmhCw55w0Y+gSY9tX0ehFb2UKHgE=
X-Google-Smtp-Source: 
 ABdhPJyRVmpomkM7JQhinawgcOo0uUtlVx/1L31olNdFOON4trtbBPvU1rTtUBV5FrW088AowAAKuynJirq9v616yJM=
X-Received: by 2002:a19:504a:0:b0:473:b6da:52ee with SMTP id
 z10-20020a19504a000000b00473b6da52eemr3353234lfj.665.1652450158745; Fri, 13
 May 2022 06:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220513134829.1895574-1-zboszor@pr.hu>
 <20220513134829.1895574-3-zboszor@pr.hu>
In-Reply-To: <20220513134829.1895574-3-zboszor@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 May 2022 15:55:47 +0200
Message-ID: 
 <CANNYZj9-ZWBBo=+FLAECu=Eg8ZtumcuijWQ8_mU0D-hkSRZEWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] staging.bbclass: Ignore installing multiple
 symlinks of the same name
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:56:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165568

Apologies, but special-casing this in staging class is not right
either. The problem should be addressed at the making of
sysroot-destdir/ step from the npm class.

Alex


On Fri, 13 May 2022 at 15:49, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Recipes using "inherit npm" install the same /usr/lib/node symlink
> that points to node_modules. When a recipe DEPENDS on multiple
> npm based recipe, do_prepare_recipe_sysroot() fails.
>
> Ignore this symlink in a way that the set of ignored symlinks
> can be extended later if needed.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/staging.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 9fc8f4f283..f7b6056219 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -528,6 +528,7 @@ python extend_recipe_sysroot() {
>
>              with open(manifest, "r") as f:
>                  manifests[dep] =3D manifest
> +                ignored_dests =3D [ ''.join([d.getVar('nonarch_libdir'),=
 '/node' ]) ]
>                  for l in f:
>                      l =3D l.strip()
>                      if l.endswith("/fixmepath"):
> @@ -545,7 +546,10 @@ python extend_recipe_sysroot() {
>                      hashname =3D targetdir + dest
>                      if not hashname.endswith("/"):
>                          if hashname in fileset:
> -                            bb.fatal("The file %s is installed by both %=
s and %s, aborting" % (dest, c, fileset[hashname]))
> +                            if os.path.islink(hashname) and  dest in ign=
ored_dests:
> +                                bb.note("The symlink '%s' %s wants to in=
stall is already installed by %s, ignoring" % (dest, c, fileset[hashname]))
> +                            else:
> +                                bb.fatal("The file %s is installed by bo=
th %s and %s, aborting" % (dest, c, fileset[hashname]))
>                          else:
>                              fileset[hashname] =3D c
>
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165566): https://lists.openembedded.org/g/openembedde=
d-core/message/165566
> Mute This Topic: https://lists.openembedded.org/mt/91080993/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

