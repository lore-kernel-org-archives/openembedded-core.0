Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57219EE49A0
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 22:14:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4112.1692656076289166778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 15:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=R65RLGP5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c353a395cso509873266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692656075; x=1693260875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06bdSx7wayfZgqtwuIzheRHDg1AnyTRaAMkxffhNLto=;
        b=R65RLGP5eeCZur1RV4fqj+kSCxdGe93RtMkidAj+2bcL2oJE+b0cEaZj35TKE/oG0V
         8nGnucoP/nwMVzcMH8dX+eqEzKzpMLhu/C6H/izs9ItlGzP/o11MCRH7rl/Z2rFW/7zi
         LcwSPrthXuFtDwexfklaIJyc5qVijbH3z519aXhyzGQJTGGFr+cT6t0aDUitUeSAXGSJ
         05e+mcQ0irB4TR2F9YFsC515qzRMC3O6OkBNdUoJO7pvn/1cCz59didBiOMefAo97ZNB
         jC0jF2O7vSASDkh3xnzQ+SVxD0X93QShR1pXzUxr3LVZo1yzdjxLRrxHLsXJ72M5wVeP
         RPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692656075; x=1693260875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06bdSx7wayfZgqtwuIzheRHDg1AnyTRaAMkxffhNLto=;
        b=TcRvydPH7X6wPoIvOeb2iXDOOWN2HLAPxJOesk7zIwRN4zyWcVczKP7IX3UwQnYLeo
         L6py6/3mGBmYi0KoBGVvGlvWExYGEjZ7yp6JfdhMGsMPDO3T7Ru02aLkUFaWigh8ycTJ
         6YENP5n9KnYkJcknhSXJGkYNH7TvSK5K6yoLzO+qh/7Qjc/49+hGRkUq4K5fkCv+Jl4/
         SMgV+iZBPrQiWzWKjEV0b5Kjlk9q144WK4YeK5EgmxRLP9TrD1kxEJH//ozAKiY+ZG4Q
         lGL/ncnTSALrU2oj4TFGEIvypSf7qAQ/36WqUSRYTKHw4JlQmiDta60g6fnQn8XeT97L
         XZ8A==
X-Gm-Message-State: AOJu0YxezDrbPbUThkAYO5heDnQvUoaQPivjImo61Ly4qpvtmKLPjTNX
	425DSOESNsxVoQXui46dGsCiE+MTLzMxxKY3EONz6w==
X-Google-Smtp-Source: AGHT+IHX+jDappFQy3IikJ+1cFW0rI4Fotcd7KUvrFn9HcBV7C808fBYetdw4QmXqL1H+zNaH7Uwyj44sEpD30AkOOw=
X-Received: by 2002:a17:906:3d22:b0:9a1:6bc1:b540 with SMTP id
 l2-20020a1709063d2200b009a16bc1b540mr5481525ejf.26.1692656074605; Mon, 21 Aug
 2023 15:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230821123611.1448-1-Angelo.Ribeiro@criticaltechworks.com>
In-Reply-To: <20230821123611.1448-1-Angelo.Ribeiro@criticaltechworks.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Aug 2023 12:14:23 -1000
Message-ID: <CAOSpxdZ395m5xo-ceaOBid8d4N94k7JorB-AbG=Gy3YZXSB39Q@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] ccache.bbclass: Add allowed list
 for native recipes
To: Angelo.Ribeiro@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 22:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186487

On Mon, Aug 21, 2023 at 2:36=E2=80=AFAM Angelo Ribeiro via
lists.openembedded.org
<Angelo.Ribeiro=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
>
> From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
>
> Native recipes are not able to use ccache currently, due to a circular
> dependency between ccache-native and cmake-native.
> This affects also other native recipes, but not all, imposing a
> limitation in build time optimizations.
>
> The introduction of CCACHE_NATIVE_RECIPES_ALLOWED allows the user to spec=
ify
> which native recipes should use ccache, keeping it disable by default for=
 all
> native recipes.

Sorry, I can't take feature additions to the stable branches.

Steve

>
> Signed-off-by: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
> ---
>  meta/classes/ccache.bbclass  | 11 ++++++++---
>  meta/conf/documentation.conf |  1 +
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 34becb69d1..262db6672c 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -28,6 +28,11 @@
>  # be shared between different builds.
>  CCACHE_TOP_DIR ?=3D "${TMPDIR}/ccache"
>
> +# ccache-native and cmake-native have a circular dependency
> +# that affects other native recipes, but not all.
> +# Allows to use ccache in specified native recipes.
> +CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
> +
>  # ccahe removes CCACHE_BASEDIR from file path, so that hashes will be th=
e same
>  # in different builds.
>  export CCACHE_BASEDIR ?=3D "${TMPDIR}"
> @@ -54,9 +59,9 @@ python() {
>      Enable ccache for the recipe
>      """
>      pn =3D d.getVar('PN')
> -    # quilt-native doesn't need ccache since no c files
> -    if not (bb.data.inherits_class("native", d) or
> -            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> +    if (pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
> +        not (bb.data.inherits_class("native", d) or
> +        bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')))):
>          d.appendVar('DEPENDS', ' ccache-native')
>          d.setVar('CCACHE', 'ccache ')
>  }
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index a27d7a53c3..7279e89e63 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -106,6 +106,7 @@ BUSYBOX_SPLIT_SUID[doc] =3D "For the BusyBox recipe, =
specifies whether to split th
>  #C
>
>  CACHE[doc]  =3D "The directory holding the cache of the metadata."
> +CCACHE_NATIVE_RECIPES_ALLOWED[doc] =3D "A list of native recipes to use =
Ccache, this variable is useful to bypass a circular dependency between cca=
che-native and cmake-native that inhibits to use Ccache in other native rec=
ipes."
>  CFLAGS[doc] =3D "Flags passed to the C compiler for the target system. T=
his variable evaluates to the same as TARGET_CFLAGS."
>  CLASSOVERRIDE[doc] =3D "An internal variable specifying the special clas=
s override that should currently apply (e.g. "class-target", "class-native"=
, and so forth)."
>  CLEANBROKEN[doc] =3D "Specifies if 'make clean' does not work for a reci=
pe (and therefore the build system should not try to use it during do_confi=
gure)"
> --
> 2.34.1
>
> The information in this communication may contain confidential or legally=
 privileged information. It is intended solely for the use of the individua=
l or entity it addresses and others authorized to receive it. If you are no=
t an intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution or action in reliance on the contents of this information =
is strictly prohibited and may be unlawful. If you have received this commu=
nication by error, please notify us immediately by responding to this e-mai=
l and then delete it from your system. Critical TechWorks is not liable for=
 the proper and complete transmission of the information in this communicat=
ion nor for any delay in its receipt
>
> This e-mail is environmentally friendly, just like Critical TechWorks, wh=
ich lives in a paper-free atmosphere. Therefore, please consider the enviro=
nment before printing it!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186437): https://lists.openembedded.org/g/openembedde=
d-core/message/186437
> Mute This Topic: https://lists.openembedded.org/mt/100871843/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

