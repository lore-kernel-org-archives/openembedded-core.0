Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED7CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 20:26:44 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.6338.1712089604391837992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 13:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UtDmdb10;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.41, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-229d01e81f1so3378246fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 13:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712089603; x=1712694403; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlFi1ghSA5BNgR5plmyl5cFHZ0gM31nf1ResvgQTu8g=;
        b=UtDmdb10UDPm6vZpWpTjg+ZQMRwqiYLNjtafHTJ6XSYhmijYSqmGYIm+WMHb8m+OCN
         A8cdIGrOriubL0U5nHSTyO6o5EO1g5Xogymld97HjtX2k00eB5t/t6hBknydCQnrc5zJ
         uvtnjKZjUqHa7tBMEN7YU9TXzrNrYE1yTr9aqI8lme6XGh8Z4Puu8TRK2v+Q2NRNSW4v
         7UFqjaNwI94fJQQntgYUHskWKEnOtSI1BCiVGD9phWw4Axff2NiqfWC4BQd6eNU4fzhZ
         PvWGlYnwsoG/et+S5C9UQszoECK+Af4HdonMoAMggDzJS2rtmblRGlhNm0DTdXz0mNjn
         0ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712089603; x=1712694403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlFi1ghSA5BNgR5plmyl5cFHZ0gM31nf1ResvgQTu8g=;
        b=cGtEF40L1gCppvyFkIv00aQUFG0vmneA0G71dVS17IrXt7OAdYH7DN0AbyDcSRoKH0
         eNNnu7u05iRfejo6j4EotLEoF891EYNuXLDMwhmu2X+pmzT/qe1osOrzPI6pK37DdWdf
         RXZRuaOMDMIIorXEO3CZoqvqG0Wf7oUwUcStDoyJp6K6hv8WkptXpyBkaGbppJgltBfU
         FMwyXdue9jEMFRH4t8qXwn3izQ71rmJDwsuxUrFRBGipTaKe1+LQCU4E2JJPgxh6clf8
         4V5JYwuB1FWIXtRKuA02sHVrMEIuHH9h1n9KoyIAONcaDv5ToNvkNXsY8CCoOhI0c64C
         /IPA==
X-Gm-Message-State: AOJu0Yyf6wC6UinSPNR+RBGQMTmmH4TprzeN+3Yo8IiNrtD4EkC+ByUB
	Cl2EOyY2iNPRMJIayxnCZylHaXV+9jOLLkniaKAc2LQr1b4kXcQaqZf95YsjA6YxgmBG5nBubKw
	OVNh/HEQx1FWzrQup+yO8hCN5MNyPaPfkcR29
X-Google-Smtp-Source: AGHT+IGLCUvXfrwTLLJRGWTjlkgXXX60ScjStOyWjlfZp/0voHqjc5X+k2yfwGk07naB/CXeEy5w06w+Hud4qY7CUb8=
X-Received: by 2002:a05:6870:c094:b0:229:a47f:72cc with SMTP id
 c20-20020a056870c09400b00229a47f72ccmr15822288oad.38.1712089603677; Tue, 02
 Apr 2024 13:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240402180900.2306005-1-jdmason@kudzu.us> <CANNYZj8=QBs13KN1eMWhFb=p26MWRrJorVSQrdRKk7i3PkUFHw@mail.gmail.com>
In-Reply-To: <CANNYZj8=QBs13KN1eMWhFb=p26MWRrJorVSQrdRKk7i3PkUFHw@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 2 Apr 2024 16:26:32 -0400
Message-ID: <CAPoiz9yd6purVmoXU58bs3LMcLjU61FfMpjAA3m8QpF84cHghg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197881

Depends on your definition of "does not break".  Does it run without
throwing errors?  Yes.  Does it give the same output?  No.
Originally, I only tested on a couple of recipes, and not the world.
So, I admit to not running this test prior to you asking.

This output is very noisy.  So, it is difficult to get an accurate
idea of whether the differences are regressions or not.  Also, the
output of the individual recipes and versions is not outputted in the
same order.  Looking at the output (after a rough sort), I do see
different values for some.  Like:
-acpica                    20230628        UNKNOWN         Ross Burton
<ross.burton@arm.com>
+acpica                    20230628        KNOWN_BROKEN    Ross Burton
<ross.burton@arm.com>
-gnuplot                   5.4.3           6.0.0           None
+gnuplot                   5.4.3           UNKNOWN_BROKEN  None
-icu                       74-1            74-2            Alexander
Kanavin <alex.kanavin@gmail.com>
+icu                       74-1            74.1            Alexander
Kanavin <alex.kanavin@gmail.com>

Let me poke around with this output to try to make more sense of it
and see if there are real regressions or if it is something else.

Thanks,
Jon


On Tue, Apr 2, 2024 at 2:22=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> Have you confirmed that this does not break 'devtool check-upgrade-status=
' ?
>
> Alex
>
> On Tue, 2 Apr 2024 at 20:09, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Currently, get_recipe_upstream_version blindly takes the first entry in
> > SRC_URI to see if the recipe is at the latest version.  If
> > UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
> > be used to check for the latest version.  Use that as the first check,
> > otherwise default back to the first entry in SRC_URI.
> >
> > wget was doing it's own check for UPSTREAM_CHECK_URI.  Removing this in
> > favor of the common one now being done in recipeutils.py.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  bitbake/lib/bb/fetch2/wget.py | 37 +++++++++++++++--------------------
> >  meta/lib/oe/recipeutils.py    |  9 +++++++--
> >  2 files changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget=
.py
> > index dc025800e659..0342f895646d 100644
> > --- a/bitbake/lib/bb/fetch2/wget.py
> > +++ b/bitbake/lib/bb/fetch2/wget.py
> > @@ -629,27 +629,22 @@ class Wget(FetchMethod):
> >              return ('', '')
> >          bb.debug(3, "latest_versionstring, regex: %s" % (package_regex=
.pattern))
> >
> > -        uri =3D ""
> > -        regex_uri =3D d.getVar("UPSTREAM_CHECK_URI")
> > -        if not regex_uri:
> > -            path =3D ud.path.split(package)[0]
> > -
> > -            # search for version matches on folders inside the path, l=
ike:
> > -            # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${P=
N}-${PV}.tar.gz
> > -            dirver_regex =3D re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+(=
[-_]r\d+)*)/")
> > -            m =3D dirver_regex.findall(path)
> > -            if m:
> > -                pn =3D d.getVar('PN')
> > -                dirver =3D m[-1][0]
> > -
> > -                dirver_pn_regex =3D re.compile(r"%s\d?" % (re.escape(p=
n)))
> > -                if not dirver_pn_regex.search(dirver):
> > -                    return (self._check_latest_version_by_dir(dirver,
> > -                        package, package_regex, current_version, ud, d=
), '')
> > -
> > -            uri =3D bb.fetch.encodeurl([ud.type, ud.host, path, ud.use=
r, ud.pswd, {}])
> > -        else:
> > -            uri =3D regex_uri
> > +        path =3D ud.path.split(package)[0]
> > +
> > +        # search for version matches on folders inside the path, like:
> > +        # "5.7" in http://download.gnome.org/sources/${PN}/5.7/${PN}-$=
{PV}.tar.gz
> > +        dirver_regex =3D re.compile(r"(?P<dirver>[^/]*(\d+\.)*\d+([-_]=
r\d+)*)/")
> > +        m =3D dirver_regex.findall(path)
> > +        if m:
> > +            pn =3D d.getVar('PN')
> > +            dirver =3D m[-1][0]
> > +
> > +            dirver_pn_regex =3D re.compile(r"%s\d?" % (re.escape(pn)))
> > +            if not dirver_pn_regex.search(dirver):
> > +                return (self._check_latest_version_by_dir(dirver,
> > +                    package, package_regex, current_version, ud, d), '=
')
> > +
> > +        uri =3D bb.fetch.encodeurl([ud.type, ud.host, path, ud.user, u=
d.pswd, {}])
> >
> >          return (self._check_latest_version(uri, package, package_regex=
,
> >                  current_version, ud, d), '')
> > diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> > index de1fbdd3a8c8..a42609060cd9 100644
> > --- a/meta/lib/oe/recipeutils.py
> > +++ b/meta/lib/oe/recipeutils.py
> > @@ -1041,8 +1041,13 @@ def get_recipe_upstream_version(rd):
> >          ru['datetime'] =3D datetime.now()
> >          return ru
> >
> > -    # XXX: we suppose that the first entry points to the upstream sour=
ces
> > -    src_uri =3D src_uris.split()[0]
> > +    # If UPSTREAM_CHECK_URI is specified, assume it is correct and use
> > +    # it.  Otherwise, use the first SRC_URI specified to determine the
> > +    # latest version.
> > +    if rd.getVar('UPSTREAM_CHECK_URI'):
> > +        src_uri =3D str(rd.getVar('UPSTREAM_CHECK_URI'))
> > +    else:
> > +        src_uri =3D src_uris.split()[0]
> >      uri_type, _, _, _, _, _ =3D  decodeurl(src_uri)
> >
> >      (pv, pfx, sfx) =3D get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri=
_type)
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197876): https://lists.openembedded.org/g/openembed=
ded-core/message/197876
> > Mute This Topic: https://lists.openembedded.org/mt/105293221/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

