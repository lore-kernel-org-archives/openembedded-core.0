Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAD5C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:36:59 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.61646.1702643812531001913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIVlLEeO;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e36848f6c6so5142857b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 04:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702643811; x=1703248611; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk27PKw4cToeAhCsMwBYzEXqHSOvC85UBYjRIbQScEQ=;
        b=VIVlLEeOHBA2NAgvaaSriITrA+Lc/x3uIOv2l39RMGh6y0XyR72bL5077u+YIvZX5j
         XWt/PB7k9sNFV0krFDTtoeZqlpNfZpo3WFu7H+yDuaPMQGgDhSvVDLg1M3QOipG3zoOs
         bYt/5SORRg34KPv80pMJ18eMmj3PJUtJQlvg4yJyGrBKhnKD8EfmFnYle69IDRDRcy2X
         YAGcEwlVFAc7Pq8CAWRGw66Re2WRpUf5KjfXZczfmasK3j0KF2Vlxkn25ddiP/LlKK7N
         CBEFIMecBGIfseGiS3AxHzuoCK9JvsDey3qBA/lwlSTUDrIEnFFLnj+yEbF1lvSDiC5a
         SXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702643811; x=1703248611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk27PKw4cToeAhCsMwBYzEXqHSOvC85UBYjRIbQScEQ=;
        b=J3QF57ypuL/C+O5m8cMKO8Z9LORG323asGwFVC90nNqQAePwUuo2p+m3d30m7BNWzy
         pA67LSv/HtNfCftAu8mYPRuQXCQG/KhTF/HeD2c7mNrJGZv0Yx+dpFO378nTMSeA5ZYw
         zRob54EhZnGWeBqrAkpp2l+4brdBomCBCYaABgJs7kqcTTu2LJN/6qkNej9WF6AVdJjB
         6xvpHFb0OSNK91Xw0XLWZw/t+qs7WbEqTA/kpl6kd8ocGOpcUqMJQMpCV+XTWy4mJfQU
         Q2pxSrFm4kyw5Rn/r3mT/Zm4oG3fy+p6OgDNNw1wzK6pKobt/O9zTAK+gShD0++LEGqj
         o4qA==
X-Gm-Message-State: AOJu0YxEZEeoOoCvgXHz7LIJUt9oKnASOMuqfm9SLcJBa9m+vlVqhKTS
	imdHfyYTEVUmk/JmBwqYX9NV2H+jcS7l7hI3DA==
X-Google-Smtp-Source: AGHT+IHRpHh18AtDF47UmGJZpcrZqBFpydSEzP5N6bZd1c5VzmUMIc98zTcqys/THPqV3KA3r+sIbUNropZFZSk5YzQ=
X-Received: by 2002:a25:baca:0:b0:db7:dad0:76a9 with SMTP id
 a10-20020a25baca000000b00db7dad076a9mr6579192ybk.69.1702643811569; Fri, 15
 Dec 2023 04:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20231206074307.21110-1-johannes.pointner@br-automation.com> <654B156F-66BF-4AE7-A9C8-12FAD78EDEA2@arm.com>
In-Reply-To: <654B156F-66BF-4AE7-A9C8-12FAD78EDEA2@arm.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Fri, 15 Dec 2023 13:36:40 +0100
Message-ID: <CAHvQdo223q=L2H-z1K_rNw5voD_dLE+PbUqQ1d1d=NAT8a2LuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] ldconfig-native: Add usrmerge support
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192429

On Wed, Dec 13, 2023 at 12:01=E2=80=AFPM Ross Burton <ross.burton@arm.com> =
wrote:
>
> On 6 Dec 2023, at 07:40, Johannes Pointner via lists.openembedded.org <jo=
hannes.pointner=3Dbr-automation.com@lists.openembedded.org> wrote:
> >
> > From: Johannes Pointner <johannes.pointner@br-automation.com>
> >
> > If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIB=
DIR.
> > ldconfig-native uses hardcoded paths for SLIBDIR and LIBDIR that are fi=
ne for
> > the not usrmerge case. But if usrmerge is enabled ldconfig-native gener=
ates a
> > ld.so.cache, which is done in rootfs.py, that looks like this:
> > 236 libs found in cache `/etc/ld.so.cache'
> >       libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
> >       libz.so.1 (libc6) =3D> /lib/libz.so.1
> >       libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
> >       libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
> >       libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
> >
> > This breaks for example the Qt QLibraryInfo paths if Qt is configured
> > 'relocatable' and leads to the issue that the QtWebEngine can find the
> > QtWebEngineProcess, Qt WebEngine resources,...
> >
> > Therefore don't let ldconfig-native parse SLIBDIR if it is a symlink.
>
> This still doesn=E2=80=99t explain *why* ldconfig is broken, why the work=
around is a yocto-specific fix in ldconfig and not a general fix that other=
 distros have, and why this isn=E2=80=99t a problem with Qt.
As I wrote above ldconfig-native is broken for the usrmerge case
because it uses hardcoded paths which are correct for the "not
usrmerge case" but not for the "usrmerge case".
Other distros as also the yocto ldconfig for the target system is
configured at build time with the correct paths and works fine.
This is an issue for Qt because it tries to determine the library
locations using dladdr and this leads to incorrect paths that in my
case broke QtWebEngine.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192282): https://lists.openembedded.org/g/openembedde=
d-core/message/192282
> Mute This Topic: https://lists.openembedded.org/mt/103009101/3617353
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [h4=
nn35.work@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

