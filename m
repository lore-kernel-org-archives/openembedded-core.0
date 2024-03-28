Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816DBC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:13:59 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.19132.1711638836997930972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 08:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JIPj+up9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.49, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2297d0d6013so654090fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711638836; x=1712243636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ8lR9V9ZwhW+ueS7HNGDdEBLYlrpBCPRC8QZFJJrTM=;
        b=JIPj+up99IKqVMjIiN77qCpSqu1KNGlytHZ5z6Ctil0rDLEMjrat5F6kD8e2/RxTs5
         q6NBD4lqTHDLmNYSVQrt0xurV/uTXuRTngJf/tfIb+cI6W/zaWQcRQY++FlnPTN0GD2F
         pK2Btu+qaH7pa+MLxqgAdrgbaLXERGoCPX5tYt8RfK3vKmDx66x5247PQ7zJyYGSTgHD
         f3aQu5UcbGdh4I/yLh8rNm9A6RS+ANehHfhYl/CQ5BoVaUmLja/VRsSIL82w+z8HKnze
         4PPal8Iwj1wri7yw0U+kKpr7DVE4hVNKFmNLWzncYj3qclBMCv7xpKLOyU1M9yEt0vUY
         Impg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638836; x=1712243636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ8lR9V9ZwhW+ueS7HNGDdEBLYlrpBCPRC8QZFJJrTM=;
        b=BpsOxLaUoLMeUmo9ouRXbKRCXoq5WXgZiTyVFv7Z13j8urbEsw+Jdp8l4+zk3hPifA
         WuBvFH/ZC8nQ5QS3z+D39nI9Zay74N18cwcArGGPfU4cnHixBIWiHiAo1CmFrhPPBWqW
         mdvd/BH+Y9TEH9c+uwZFeJ6SmblwlhrY6wC9+Eh9NMv7eintxd3sLbwUoxZyikJ2Oqfw
         B91X5FEtguFA9K3UhwWpMvYuIMZg2d5+3mJwB8PTtktqBdXTa25fRbUrADXvYksLvkg7
         BGk3tvmxmMgyI9GHp8hNmIU++Is5oUdv5FnhorvVsuxAK2BroD1iHMm5yfctWju+//BE
         AJXg==
X-Gm-Message-State: AOJu0YykvRp7laBoC+66qqxycTHdfe/XJY5HNe/XJ+6bERpB5/Y/6luQ
	MpMSxi9fODoamnvDxw4ghVVxqeB9Mp4xFCKKb/3TCs/sS93hELcBS2Q34xsuw2ob1DuXqXBYagp
	2EKPJB79nb0Rn6XF7Xxpr14N7hKjsy/72qN2M
X-Google-Smtp-Source: AGHT+IH3R+KraqIuy0iJSC+NQTSC7jOWWP5tGKNBbHdXnKCgRSJ3QhlQdEeGh2NHKKxqZHajNpYd/ltX+vNF7XPcp1Y=
X-Received: by 2002:a05:6871:5b02:b0:229:e6c6:1f13 with SMTP id
 op2-20020a0568715b0200b00229e6c61f13mr3250904oac.14.1711638836210; Thu, 28
 Mar 2024 08:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240327184532.226557-1-jdmason@kudzu.us> <CANNYZj-E54SLLKpSorLjTotEWMX8oZK=oQzq6JAi4CFiQgzx2w@mail.gmail.com>
In-Reply-To: <CANNYZj-E54SLLKpSorLjTotEWMX8oZK=oQzq6JAi4CFiQgzx2w@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 28 Mar 2024 11:13:45 -0400
Message-ID: <CAPoiz9zOU_j=MJe2feYXUcMpXd0-6MnRheuW1eA9PTAcLoEgZQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] recipeutils: check for SRC_URI name in get_recipe_upstream_version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197578

On Wed, Mar 27, 2024 at 4:31=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I wonder if adding another variable is really necessary if instead you
> can set UPSTREAM_CHECK_URI to anything, including entries in SRC_URI?
> What is the specific example where you ran into the issue?

Wow, I feel stupid.  You are 100% correct.  Changing recipeutils.py to
use UPSTREAM_CHECK_URI is exactly what is needed and the change is
almost trivial (at least for my use case).

The specific example I'm having an issue with is sbsa-acs in meta-arm,
which requires edk2-firmware (which has the first entry of the
SRC_URI). Since sbsa-acs specifies the destsuffix, it cannot be
prepended to the SRC_URI to be first (and even that would be a hack).

Thanks for the insight, v2 coming as a proper patch.

Thanks,
Jon

> Alex
>
> On Wed, 27 Mar 2024 at 19:45, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Previously, get_recipe_upstream_version took whatever the first entry i=
n
> > SRC_URI was for determining the upstream version.  This does not work
> > for recipes that append to the SRC_URI, as theirs will never be first.
> > To work around this, add a new variable to specify the SRC_URI name
> > field and use that to match.  If nothing is specified, it will use the
> > first SRC_URI.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  documentation/ref-manual/devtool-reference.rst |  4 ++--
> >  documentation/ref-manual/variables.rst         |  8 ++++++++
> >  meta/lib/oe/recipeutils.py                     | 11 +++++++++--
> >  3 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/ref-manual/devtool-reference.rst b/documenta=
tion/ref-manual/devtool-reference.rst
> > index 9319addc3c61..b774dcb1092b 100644
> > --- a/documentation/ref-manual/devtool-reference.rst
> > +++ b/documentation/ref-manual/devtool-reference.rst
> > @@ -340,8 +340,8 @@ being able to upgrade it, displayed in a table.
> >
> >  This upgrade checking mechanism relies on the optional :term:`UPSTREAM=
_CHECK_URI`,
> >  :term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
> > -:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
> > -variables in package recipes.
> > +:term:`UPSTREAM_CHECK_COMMITS`, :term: `UPSTREAM_CHECK_SRCNAME`,  and
> > +:term:`UPSTREAM_VERSION_UNKNOWN` variables in package recipes.
> >
> >  .. note::
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index 435481c9aa12..12372c1e67f3 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -9686,6 +9686,14 @@ system and gives an overview of their function a=
nd contents.
> >
> >           UPSTREAM_CHECK_REGEX =3D "package_regex"
> >
> > +   :term:`UPSTREAM_CHECK_SRCNAME`
> > +      By default, the first entry in :term:`SRC_URI` is what is used t=
o
> > +      determine the latest upstream source code version.  If this is n=
ot
> > +      the desired behavior, the :term:`UPSTREAM_CHECK_SRCNAME` variabl=
e
> > +      is used to specify which of the other entries in SRC_URI should =
be
> > +      used for this determination.  The value should match the specifi=
ed
> > +      name of the :term:`SRC_URI` entry.
> > +
> >     :term:`UPSTREAM_CHECK_URI`
> >        You can perform a per-recipe check for what the latest upstream
> >        source code version is by calling ``devtool latest-version recip=
e``. If
> > diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> > index de1fbdd3a8c8..6fb9fbbc6abc 100644
> > --- a/meta/lib/oe/recipeutils.py
> > +++ b/meta/lib/oe/recipeutils.py
> > @@ -1041,9 +1041,15 @@ def get_recipe_upstream_version(rd):
> >          ru['datetime'] =3D datetime.now()
> >          return ru
> >
> > -    # XXX: we suppose that the first entry points to the upstream sour=
ces
> > +    # If the upstream name has been specified, take that one.
> > +    # Otherwise, default to the first URI in the list
> >      src_uri =3D src_uris.split()[0]
> > -    uri_type, _, _, _, _, _ =3D  decodeurl(src_uri)
> > +    if str(rd.getVar('UPSTREAM_CHECK_SRCNAME')):
> > +        for s in src_uris.split():
> > +            ud =3D bb.fetch2.FetchData(s, rd)
> > +            if ud.parm.get('name') =3D=3D str(rd.getVar('UPSTREAM_CHEC=
K_SRCNAME')):
> > +                src_uri =3D s
> > +    uri_type, _, _, _, _, _ =3D decodeurl(src_uri)
> >
> >      (pv, pfx, sfx) =3D get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri=
_type)
> >      ru['current_version'] =3D pv
> > @@ -1127,6 +1133,7 @@ def get_recipe_upgrade_status(recipes=3DNone):
> >                   'UPSTREAM_CHECK_COMMITS',
> >                   'UPSTREAM_CHECK_GITTAGREGEX',
> >                   'UPSTREAM_CHECK_REGEX',
> > +                 'UPSTREAM_CHECK_SRCNAME',
> >                   'UPSTREAM_CHECK_URI',
> >                   'UPSTREAM_VERSION_UNKNOWN',
> >                   'RECIPE_MAINTAINER',
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197567): https://lists.openembedded.org/g/openembed=
ded-core/message/197567
> > Mute This Topic: https://lists.openembedded.org/mt/105183205/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

