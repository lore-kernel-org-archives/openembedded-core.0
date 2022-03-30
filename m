Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC266C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 17:32:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.862.1648661547261782894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nnOTVieu;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id kk12so17370674qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=blKiHI0mWBsIl+dPLxb1WnKD6J4zG6SX5KyPKtP+cxI=;
        b=nnOTVieuyvFTMhsSRcwAelMMldu083qd+5fz1lUozIeGvIOq8bPKdh1ZWgcaaYFc2/
         98+nowbCz1Y6Rd8MekTllHWMZbk5tnJwonxQf8nAU31tSDyIsxEwLenznBFrgNn1/dM6
         WAhwGzUlWwzbMkME6cunsAw1D8Hktmv/5b4qxcYmEq7792+IJO3nRtpSVV88L4oaiQRS
         BH1BhfeTkyVRMtGJ1hCI9rQWBkBNavAriLR9QWHoE0HfOS2pgKMPiZuT3+/xlbDkCgHY
         UWH7A27DNCZoWA2yZ+Un7lEymXDxE5EHiCYWVyjMBKBzpcsLIUGotbKNsCYy3DbEL2Rw
         RdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blKiHI0mWBsIl+dPLxb1WnKD6J4zG6SX5KyPKtP+cxI=;
        b=UuZk/2XPdln0IzwrXxMS5+ji9Q5/YIXjSbKe6bvtEJZrHDO4LE9lfZupr1ygPB3ild
         ctcx+3ZtaJACptly7yHIoehWjFV+UjrTcdrNtGWNe9IQGjT+MzJ4ippCtYJrqbpmZPQi
         VYgASHH+X0v1YquIuCb3Ve4HsiNdL6x97AM/nmPBSexdNaRLxRM2Pm8pGYDNkIjC2F3m
         dAPvOnm0gFwVtPk7GmLdPTUPL8MDMQng1ye7rQeLg7LebTXNFyMfcV3QH2MY9kyzH060
         s8JJhQK8EeZTlHSSCjb3bXh3z2nIKOE7l9O8gampbpjvYskiGSuv0fiaBgDztTUOcsFh
         NOqg==
X-Gm-Message-State: AOAM5303JghJi5Ba/fpLeQr2gcy/T0khSkE27/mWBheBggsycBf86qID
	I4G+i1M6zqrNJVd3EnWZmMN7d7uWAH8OhCVI1tc=
X-Google-Smtp-Source: 
 ABdhPJwRIROke/LDk2CLaabA5ID0z9hrFEUkBWYgQ/qphmz5jXtb7d5tqkCTNw2BtPBoufhH5b8Arszp8W7yctT55nA=
X-Received: by 2002:ad4:5848:0:b0:441:4092:c385 with SMTP id
 de8-20020ad45848000000b004414092c385mr502894qvb.24.1648661546160; Wed, 30 Mar
 2022 10:32:26 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Mar 2022 10:32:00 -0700
Message-ID: 
 <CAMKF1soT09dWVxf0idTF5O-u5wWMuVGAxcrC+Z1wJYkoJ1NtDQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 17:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163790

On Wed, Mar 30, 2022 at 1:16 AM Stefan Herbrechtsmeier
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

how many such usecase do we have ? seems to be quite errorprone too.

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
> Mute This Topic: https://lists.openembedded.org/mt/90127138/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

