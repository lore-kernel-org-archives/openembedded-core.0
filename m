Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6216C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 08:41:40 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.4813.1648629699758653258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lh3t7QRc;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id p10so28664229lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o6WMLlwj/5h5UMAveNC5NqL1SdqDTEwF2rczAGn1XfU=;
        b=Lh3t7QRcUPeB5RziU2wzdZdCVQbNIwc+YJ9jZ1002IU7ZqbCFE3pUG5sgkXHee8jNf
         Fxa4eJq4nhIsRwV42dvd9IfjQUOgpHLFqJ3ip73SCW8Sq6h+LVPVDt6DNidLcM49Qlgd
         khd+8HHMzr8tX85Qrn2qp9XTLNfr2qTPOEObvyNSG4m3vC3h5hr5YjXi9nOoNnNkxRs2
         IUHWI1pS/0nafTr+dwGcj/2skYk9SwW/hLfhOFKBpobA+hQ37EKY24enkWXw9JT9063a
         AO9+D2bCxoZd/PP/teMSmTl0BomioYW9Nu5r5nAbWGd0RDbc7tt3GJEmQqJnNZhCtbIn
         idfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o6WMLlwj/5h5UMAveNC5NqL1SdqDTEwF2rczAGn1XfU=;
        b=leCwmBlC35hf737katRHxshXiXuXbDps5w5JnIjv3ArFLgAH7RadpPPvz3YlSMfF41
         YU/l55e4HhiykHTImotRYmArtuZihecZ9px0I4ZqzfvtjuETU6ZsoJCgZNL2GhxjbKrW
         xxD3eCZkTUBCVUCyU7MJ22MhLaeHgL4GsuMTrrFN6b5sugG/rlMY42o4s9sMJGWYzRfB
         3JuqVanxPAQqVGtKL9IBMc6U+uQW4uXlOgL18Vp01eM+fnHosCCAIaQVsBhylyZv6R51
         7IBN5pZRTaKpo52TS/ny3l9BE7NCaCtCgpS2e9fDvKcR+o9XZAIPVUURJBQXqvePkbR/
         UbEg==
X-Gm-Message-State: AOAM533cuPF92SZvSOzzMVZhJmWKWmwfwIGawpxQM/MQZJ7n0tYq3lcl
	ZdvRM56WBi64iEzQlAKiVueUzjJrZTt5esubsbY=
X-Google-Smtp-Source: 
 ABdhPJwK/m4gwNcRAlyh+cYGOaG6CoyoEpNhU+sLoqU+bLGzp8EvGz8zqjnmMXXVVpyi/wIu2j41vn2UKAvTj3VBtng=
X-Received: by 2002:a05:6512:2244:b0:44a:5fab:5ac4 with SMTP id
 i4-20020a056512224400b0044a5fab5ac4mr5733623lfu.665.1648629696537; Wed, 30
 Mar 2022 01:41:36 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Mar 2022 10:41:24 +0200
Message-ID: 
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 08:41:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163776

Mangling PV is more flexibly done with a lambda function in the
recipe, where you can trim and tweak PV to your heart's desire, e.g.
gnomebase.bbclass:

def gnome_verdir(v):
    return ".".join(v.split(".")[:-1])

SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"

Alex

On Wed, 30 Mar 2022 at 10:16, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add a base package version (BPV) variable and use it as default for the
> package version (PV) variable. The BPV variable contains the base
> package version of the recipe read from the recipe filename.
>
> The base package version variable supports an expansion of the version
> from the recipe filename without the need of an immediate variable
> expansion:
>     PV = "${BPV}+git${SRCPV}"
>
> It allows the inclusion of include files inside a recipe file with the
> same version in the recipe and include filename even if the package
> version is different to the base package version in the filename:
>     require linux-yocto-${BPV}.inc
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7705415a4f..d56cf811ba 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
>  ##################################################################
>
>  PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
> -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> +PV = "${BPV}"
>  PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
>  PE = ""
>  PF = "${PN}-${EXTENDPE}${PV}-${PR}"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163774): https://lists.openembedded.org/g/openembedded-core/message/163774
> Mute This Topic: https://lists.openembedded.org/mt/90127138/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

