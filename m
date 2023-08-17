Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67964C3065C
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:49:56 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.385.1692287395829655428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OymxuTsX;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a81c593206so599213b6e.0;
        Thu, 17 Aug 2023 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692287395; x=1692892195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edl2ZbJd3EqmjhNCK3DriOZklrDmBMaiFKUAfya+OWA=;
        b=OymxuTsX+t2CUaAqrlwdEc6GmxQRZW0mR+Q5IVUqlDf/d/xzspc4wqEei9Z37R19bl
         ePKjBUykMWT/pCNBXeoAwxaKP6Qj9+ezKZFvmzAbB59MbwU7OF8WGK9FFoJIO2FOejs2
         PWSvlfQyADwC/FRm3ya6aZilLPZa7oiAcgwq5c4OjLYO18PvYPn+TgERuE1eIHg2yG9L
         R/+rK7vAQZd3F74PE3ZWFPLh6ZxfSoBAy4HdeigXwgMlWpmA27ubhCpLp9MwAfGFonOC
         dncxiaBJxY/xqHnnakjGwKtVftyItW4mRA9S7EBSzNdyptyBWFzqTSJtCCnIBqXAcvKt
         ILPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287395; x=1692892195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edl2ZbJd3EqmjhNCK3DriOZklrDmBMaiFKUAfya+OWA=;
        b=D0DDoo1TY0/eFRRkS1R939Q/FArPE036UxoXlHKtuxjZd9CxgOdLT0m8+eWyYN8RSm
         FvYT303eF0pGSI26lIK2CwJRiYUXXmC0I2hDBm6OYm9/v7O3+qlUjhEoROqmp7tMp6Mx
         fLNL15v98TMLs2tt4hGJh6eGy5d5KgYqMVwQu9qkD6ejZqAs1xArY+MHHFQkdkYwCELN
         POdRI4L+8KSxraDCzJrWUAv3oZIJSrzM8Ws3SqQ4cRa/EDVXTlYQA2MioLLRZ2Hyt4t3
         QsN7QxEvVDqvaTn5arTASyM0VxrXAm264W1axW8w5heSuH5fcps8uFvR4kdbHTfa0rFB
         diew==
X-Gm-Message-State: AOJu0YxpYrNsuCBaJl1V0SVLsd+9P6En+ew4JM7LuWGVDiUtiaE9Klb3
	8rfOTSF0WbNHICHu+FPNe+rXR21Tff4WvUSi5RU=
X-Google-Smtp-Source: AGHT+IFYdagSUk21iEqL94nt3iwUi6tAEIUbGGFZvlOVv0ErWGHg6Y1Tz16C52YtJTtaUC07ayRfY+zYNYhRA7c3hx8=
X-Received: by 2002:a05:6808:144d:b0:3a1:f10c:f071 with SMTP id
 x13-20020a056808144d00b003a1f10cf071mr2480478oiv.18.1692287395038; Thu, 17
 Aug 2023 08:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230817090115.3043-1-Angelo.Ribeiro@criticaltechworks.com>
In-Reply-To: <20230817090115.3043-1-Angelo.Ribeiro@criticaltechworks.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:49:29 -0700
Message-ID: <CAMKF1so6t1smWfqGcYYw1Gpvoqi6AxdrGqvf=DX2QrpmH9+gSg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] ccache.bbclass: Add allowed list for native recipes
To: Angelo.Ribeiro@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 15:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186326

wrong list, please send to oe-core ml

On Thu, Aug 17, 2023 at 2:01=E2=80=AFAM Angelo Ribeiro via
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
> index 66b8e2f24f..fc1b4978fd 100644
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
> View/Reply Online (#186298): https://lists.openembedded.org/g/openembedde=
d-core/message/186298
> Mute This Topic: https://lists.openembedded.org/mt/100796920/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

