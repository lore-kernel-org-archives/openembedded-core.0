Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63512C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 11:46:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.6256.1648640810091052481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OGyRgZDu;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id a30so19834450ljq.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mlQerqHsYTaHLl6kxuQ+GMz2hA3lTN/ex7mjXBC3fjA=;
        b=OGyRgZDuvIgDk8+EJDYtzPuIjOgbyvtwsLUIQ2MCMf7h2e4YukRaaxms57msAy5OWl
         0vxByP2WIHvVZ822pVohHFdiy4SyjnPlU0Ey1XTuBiiBvhdLd+cHygmkrIen+KFd+Tg6
         QQ636dp9/h9CSFBLoDpsRvD3YW6ozDVzS+k3U3Wg19/UpA7AQaFV0Cu75LTe84tqDKqC
         HoqZOnPGNfCD5HAXwlhgesK533g+Dx/WFM2U9r+EzRMU0ehNHxMdF2cRVdypETg0iR/H
         kKM4QQEp2eSqhDtdY5kxOSpFyuAEY3vIazzlgGib/0YUdpY8WtNyFtdtuzGZ1Gwi16bK
         zG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mlQerqHsYTaHLl6kxuQ+GMz2hA3lTN/ex7mjXBC3fjA=;
        b=7O5PZ34Ky8AEQg/Z6rgRQV960dzuga0v84DNSNc3xk27HI9KvL8eFxVJzjcqvfdYgG
         7N4KqkmmmEI5+Su5cP5eKFp73TtM6obkxGsu9q1i848W2hb0U/lfNW3SxxXb0o8Xus9U
         V++qUfb4b6jfxf7nA6DzTtqC6mM258jO7T6UmQGWqcFOUjuLIZdr0wWSe34vUqY0cspz
         TClIGtA6BSn837waLOwqPt5ddMLPwUttLTSs8CK4IHamREv2BSe8kLoCtgaQZLSXXw0E
         h/+XzNy3MMWQXsyNhxPpmFhyxYdbPYmxAJ2Qe3ubDGzxqyacDEn+I19J+QxamFlb8Bl5
         SwPQ==
X-Gm-Message-State: AOAM530UJuAa/unonDpN9HaJtSdXxS+GCrsI61YCJlLYBiTPveTxyy/G
	ddH6/Ch6alO6IVCTZ1qewy0ubk4wEilw3hG0Cys=
X-Google-Smtp-Source: 
 ABdhPJzYbQHqBx+VHlumTdhp2lFhqxtvinB7CZ7dWv3Gah0OZ9IJpwM6b/O74e6VeUIvrFDl0X5r9Q0bbsEgyiO7agU=
X-Received: by 2002:a2e:888a:0:b0:249:8e84:65b8 with SMTP id
 k10-20020a2e888a000000b002498e8465b8mr6296953lji.56.1648640808216; Wed, 30
 Mar 2022 04:46:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
 <192b477d-bac4-0c02-2345-74d2c3dbde28@weidmueller.com>
In-Reply-To: <192b477d-bac4-0c02-2345-74d2c3dbde28@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Mar 2022 13:46:36 +0200
Message-ID: 
 <CANNYZj_Gzfx5UOr0Z47JsKne9kRO_LpwXzn92WkLws=7HkAtAw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 11:46:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163783

The intention is that changing bitbake.conf is heavy handed, and the
use case is not well presented. Why and where this is needed?

Alex

On Wed, 30 Mar 2022 at 13:42, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> Hi Alex,
>
> Am 30.03.2022 um 10:41 schrieb Alexander Kanavin:
> > Mangling PV is more flexibly done with a lambda function in the
> > recipe, where you can trim and tweak PV to your heart's desire, e.g.
> > gnomebase.bbclass:
> >
> > def gnome_verdir(v):
> >      return ".".join(v.split(".")[:-1])
> >
> > SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
>
> What is the intention of your comment? Do you recommend a function per
> recipe and thereby code duplication?
>
> Or is your objection that the base package version isn't always the file
> name version and the variable name is wrong?
>
> The advantage of the BPV is that you can change the PV outside of the
> recipe file:
>
> PV:pn-<package_name> = "${BPV}+git${SRCPV}"
>
> The `PV .= "+git${SRCPV}"` assume that the PV is the base package
> version but couldn't ensure it.
>
> Regards
>    Stefan
>
> > On Wed, 30 Mar 2022 at 10:16, Stefan Herbrechtsmeier
> > <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> >>
> >> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >>
> >> Add a base package version (BPV) variable and use it as default for the
> >> package version (PV) variable. The BPV variable contains the base
> >> package version of the recipe read from the recipe filename.
> >>
> >> The base package version variable supports an expansion of the version
> >> from the recipe filename without the need of an immediate variable
> >> expansion:
> >>      PV = "${BPV}+git${SRCPV}"
> >>
> >> It allows the inclusion of include files inside a recipe file with the
> >> same version in the recipe and include filename even if the package
> >> version is different to the base package version in the filename:
> >>      require linux-yocto-${BPV}.inc
> >>
> >> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >>
> >> ---
> >>
> >>   meta/conf/bitbake.conf | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 7705415a4f..d56cf811ba 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
> >>   ##################################################################
> >>
> >>   PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
> >> -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> >> +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> >> +PV = "${BPV}"
> >>   PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
> >>   PE = ""
> >>   PF = "${PN}-${EXTENDPE}${PV}-${PR}"
> >> --
> >> 2.30.2
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#163774): https://lists.openembedded.org/g/openembedded-core/message/163774
> >> Mute This Topic: https://lists.openembedded.org/mt/90127138/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

