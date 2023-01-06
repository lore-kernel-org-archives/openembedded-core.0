Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B70C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 06:20:38 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.8127.1672986030071251554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 22:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MKCsKYAT;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id s22so590463ljp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 22:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qb06f3r5+Gke5A4RuxWJYShPb4xuJKiLHiahQGaLysY=;
        b=MKCsKYATB6LyRdHgLER+BmGBrbr5gcs7AlrOOk5SYaO3pgsvwemD7Houm9a7XoET5l
         VpaPxKhe6T40K5HxlNo2S/vO9WuyTPMYztibj0XgniDHrDv4gS4jMaOHArZtL3GGNoNt
         L3e55h3p/vopywPnxkvsz1p/AEE2dZ6m1XAwKUqJeUBnJKL8D7FlneaUdq/YE4XFGtt6
         pDNufUVs+SLU/HqYYG//wuYGtessypaDGHgnOo3UHHH/wm3fnUCxDCTC9YmWEtLY2n95
         jUlqLQNtlAsT76yk4e1E9SjtB5nuVF/bdqJ8pRQN8XrxNgnLFprtow+clJZ0nWeSLaiY
         WSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qb06f3r5+Gke5A4RuxWJYShPb4xuJKiLHiahQGaLysY=;
        b=UfMfTE0/wid+AZpy8N0R1bhnagcUWwVN9X3sZM5JDM0AX+eMQ254s3S//ydiFbrYSW
         iasArKT62sVqYFo/TGWmRCBhI3JKEVfwQ8LDh2FUiT5Sl2X7tLSR9XFe06IVQD5BRlI8
         zm7zLD/k+tY31Lv16qM24mtySww9Fnn0DyE3qxp1fkn4I408MC/pnZFsmDbvmSMjmfUB
         +vy2qjluhP45Osb+h6ZOMpKyBI/DIp1wKlXaBDjnIDHHQuDT/PLl0EXbsqQfljFnvrVE
         0UGw2vkwdWunsH6yfUcPNDcYFmnSLZ+cRPH1bfHiSSel3bpOzCpL4e+GoEMuDN+5jl9h
         V05Q==
X-Gm-Message-State: AFqh2kom5Y0Xmtg2/kwoMtx2/ehbIhVWyTCCxP5fLIt9wnpVfaQXeAIP
	9h4HP7Iib8obAh7FMTtrC6seznLY2Swe50k5Icg=
X-Google-Smtp-Source: AMrXdXuRWWpCYopZLoU+6kB2nDiMrk1FAPq1gjIdfeB/zClNpEwMXg6eHh8ghkvszMC9GQPw5GYE/iPuYg8XPfG/634=
X-Received: by 2002:a2e:2246:0:b0:279:bf32:34dd with SMTP id
 i67-20020a2e2246000000b00279bf3234ddmr4490064lji.31.1672986027686; Thu, 05
 Jan 2023 22:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20230101132326.398971-1-f_l_k@t-online.de> <CAMKF1srnx4w1Vm=KxmM+LCnLdOCbWgOj6BkhpVZTx133P0_95Q@mail.gmail.com>
 <CAMKF1sp2ekBLcmKBJm59pd_cD+nxawh1i77z1iWEp1bpoEruHg@mail.gmail.com>
In-Reply-To: <CAMKF1sp2ekBLcmKBJm59pd_cD+nxawh1i77z1iWEp1bpoEruHg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 07:20:16 +0100
Message-ID: <CANNYZj_YDsN=o=teQgBikE8RpwUfVzp9O4kcCfP4JMr9JA7AAw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk4: update 4.8.2 -> 4.8.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org, 
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 06:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175557

On poky the issue does not occur. It's better to reproduce and look
into where the difference come from before asking to unstage.

Alex

On Fri, 6 Jan 2023 at 04:15, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jan 5, 2023 at 11:57 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I am seeing native build failure
> >
> > https://errors.yoctoproject.org/Errors/Details/686967/
> >
>
> A deeper look into this reveals that issue is tiff recipe upgrade to
> 4.5.0 and not this upgrade.
>
> Alex,
>
> Perhaps restage this patch but unstage tiff update patch [1]
>
> [1] https://lists.openembedded.org/g/openembedded-core/topic/96047877#175554
>
> > On Sun, Jan 1, 2023 at 5:23 AM Markus Volk <f_l_k@t-online.de> wrote:
> > >
> > > Overview of Changes in 4.8.3, 12-22-2022
> > > ========================================
> > >
> > > * GtkText:
> > >  - Claim gestures more selectively
> > >  - Prevent unexpected notify::direction emissions
> > >
> > > * Accessibility:
> > >  - Remember if we don't find the a11y bus
> > >
> > > * DND:
> > >  - Prefer file:// urls over other protocols
> > >
> > > * GtkMountOperation:
> > >  - Work on Wayland
> > >
> > > * GtkListView:
> > >  - Cancel rubberband if not handling drag
> > >
> > > * Wayland:
> > >  - Fix button masks
> > >
> > > * Windows:
> > >  - Fix resizes with native decorations
> > >
> > > * X11:
> > >  - Fix some ordering problems with surface destruction
> > >
> > > * Translation updates
> > >  Abkhazian
> > >  Basque
> > >  Dutch
> > >  Hungarian
> > >  Interlingue
> > >  Georgian
> > >  Persian
> > >  Russian
> > >  Spanish
> > >  Turkish
> > >
> > > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > > ---
> > >  meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >  rename meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} (98%)
> > >
> > > diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > > similarity index 98%
> > > rename from meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> > > rename to meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > > index fe18fa2ffd..6101905128 100644
> > > --- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> > > +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > > @@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> > >  UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> > >
> > >  SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> > > -SRC_URI[sha256sum] = "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c864333a983a692a9"
> > > +SRC_URI[sha256sum] = "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74"
> > >
> > >  S = "${WORKDIR}/gtk-${PV}"
> > >
> > > @@ -106,7 +106,6 @@ GTKBASE_RRECOMMENDS ?= " \
> > >      adwaita-icon-theme-symbolic \
> > >  "
> > >
> > > -
> > >  GTKBASE_RRECOMMENDS:class-native ?= ""
> > >
> > >  GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175555): https://lists.openembedded.org/g/openembedded-core/message/175555
> Mute This Topic: https://lists.openembedded.org/mt/95987319/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

