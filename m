Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3515CCA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 06:53:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.44150.1725432808858420680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 23:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwueFpRy;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso7975062e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 23:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725432807; x=1726037607; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4shDVJKT/7bLM/yJnM3YjaIMM6dDr1F7a6JZMzTLmZM=;
        b=MwueFpRyD/uIEwcgAQqqqzY6mPO/HYslziw1NoRorf272Ti9x5D5nKyJsApn6h/pfE
         QCSsxmMdPLlwKUHSjeGYk31Br5Cwk8BKgO5PyBx1V0eqEaDBjrwhNG0WIppZpX6W7pLP
         pm0cEX1Qo71G86polGoho7pWcLSJM1XBoZRYFBiggm5KWcc5OJat8QszkAXCiQesiuSE
         RqlMnVOioR5ZobRA7a1EmXPVnr5hgayePYscFWz2Vj4HM+VhGpFmmC/YD67nuwYUfUnR
         5U7GMwfTzCEHfWRFDNmoJSX9iibXFuCIVZJX9Z569JdYTW1bKaS+NvqDDPGj/X849UsT
         WceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432807; x=1726037607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4shDVJKT/7bLM/yJnM3YjaIMM6dDr1F7a6JZMzTLmZM=;
        b=bgRQxz4fMxQRzk5+aWjKJaFkOCaRCGA1InBWh6fSgpEHJILXuCCKPrK/OzrDiMW64m
         Oi27CpOXJgoehi3K5uLoYFnSJcxKY9iZ3Ou6cPBi6txXnr/qkAUq9n9VSuH3gdUVIFft
         YDd7fU1SOs6mrqrAsV7hGbT1oWHqd23Z96MwRe/DvAZ8jJrmrilGpCmYtn9XzUCfg40m
         ddRkvQkLAyz9ZMPVhp6wOs2b1KpEdpZrL4WOP3GigiuYcTtR7bXjJL9bdLiGz+kUWBV9
         JkJshIY+l7+ZBnHXtkLmENwGlwC31Vq75KsFimN2JdwtFsuH130GLVv2MpqisSqjYIh/
         w3hw==
X-Gm-Message-State: AOJu0Ywi93zb4jTBoeUPSgJDG86umkxBLv60pQShkQhk2S6U2Y/YNahy
	Eq4wM24WR50fZfsPhY9lc8rxCGtpRofCHPnuikutHp0159J0nHB778x5aPwKPTILQoFVPExp5/e
	vM92Egje0MxDyvMZU20Mu1R5uCvY=
X-Google-Smtp-Source: AGHT+IEVoOVQxkvYIZ0irR4Fc+93sqidyn4zNdO/BoaPVnvdvw1QPTqzpi0W4ebR7mI/R6O4jVzzcOYOoQtA63QXgfA=
X-Received: by 2002:ac2:51c7:0:b0:535:65ce:e901 with SMTP id
 2adb3069b0e04-53565ceea78mr1152722e87.4.1725432806164; Tue, 03 Sep 2024
 23:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <17F17A442A5285BD.17352@lists.openembedded.org> <17F1F7644487505D.17352@lists.openembedded.org>
In-Reply-To: <17F1F7644487505D.17352@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Sep 2024 08:53:12 +0200
Message-ID: <CA+chaQcUf_Uw=uQD0fdheV_Cu7ohrpk6qudfaadBYz4hGZBMvg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: DEBUG_PREFIX_MAP: move
 STAGING_DIR_NATIVE before STAGING_DIR_HOST
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204192

Some related info I've found now:
https://reviews.llvm.org/D148975?id=3D516863
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109591

maybe affected by -fcanon-prefix-map used since gcc-13:
https://git.openembedded.org/openembedded-core/commit/?id=3Dabe97fa74b10c2c=
71d79bc3573d4edb509b111f5
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8

and I was also using ccache which used to have some issues in this
area (but the python3-matplotlib issue is IIRC reproducible without
ccache as well):
https://github.com/ccache/ccache/issues/163

We might need more experiments before this is applied (I'm glad I've
sent it only as RFC). I'll try to find some time next week.

On Wed, Sep 4, 2024 at 8:42=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> Please be aware that:
> https://git.openembedded.org/openembedded-core/commit/?id=3D593ffffc3baf0=
64b982891d61dacebd08aed3e96
> claims that these options are evaluated right to left (last one first)
> and even shows the same issue as what I was seeing as a reason to do
> the opposite (move STAGING_DIR_NATIVE after STAGING_DIR_HOST) and I'm
> basically reverting that change (which I didn't noticed until today).
>
> So either the processing order changed since 2018 with gcc-7.3 or
> something is wrong (at least the comment above DEBUG_PREFIX_MAP would
> be wrong if the processing order was changed).
>
> Regards,
>
> On Mon, Sep 2, 2024 at 6:29=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > * and add -fmacro-prefix-map as well
> >
> > * the default STAGING_DIR_NATIVE starts with STAGING_DIR_HOST and the
> >   only difference is '-native' suffix at the end
> >
> > * this can lead into replacing STAGING_DIR_NATIVE path with just -nativ=
e
> >   if STAGING_DIR_HOST is listed in DEBUG_PREFIX_MAP before STAGING_DIR_=
NATIVE
> >
> > * I've noticed this by accident in python3-matplotlib where buildpaths
> >   QA warning was triggered only for lib32-python3-matplotlib and it was
> >   because pybind11 path to STAGING_DIR_NATIVE was mapped to only
> >   '-native/<path>' in python3-matplotlib build (which doesn't trigger
> >   buildpaths QA and lib32-python3-matplotlib the macro path wasn't
> >   replaced at all, because of 'lib32-' prefix in:
> >   -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-=
linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> >   -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-=
linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> >   -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-=
linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
> >
> > * more details in meta-python fix for lib32-python3-matplotlib:
> >   https://lists.openembedded.org/g/openembedded-devel/message/112074
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> > Sending as RFC, because I haven't build whole world with this
> > and there might be better way to do this or more buildpaths
> > issues triggered by this than fixed
> >
> >  meta/conf/bitbake.conf | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d8252c5b82..ad152ffb6a 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -653,9 +653,10 @@ DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> >   -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> >   -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> >   -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > + -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > + -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >  "
> >  DEBUG_LEVELFLAG ?=3D "-g"
> >
> > --
> > 2.46.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204190): https://lists.openembedded.org/g/openembedde=
d-core/message/204190
> Mute This Topic: https://lists.openembedded.org/mt/108229773/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

