Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6CCC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:07:44 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.2169.1712081258485000434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kV2p/PUc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-22988692021so46453fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712081257; x=1712686057; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqMWmMuLBkB36hRyuNeghAw9yULSZkW/0v+P2o95oDo=;
        b=kV2p/PUcj4sokh1G/YEsVJP4M0BWllcEjtANOtxPljUrTcmhH7TrHRLcPxRd2Nd0gm
         Lss7Fl+QKHk9WMAmLIzOd+ekEveOLmbpTSS7CK+agzizdWlH+Flcz3+kAL1HTEwaqE3U
         KFDQNzYFr5zRyOXSVpdyMCs3ZM2a+vVCYlfdZJrheUOnlu/NOOpesrj9ekXxh3LdPpat
         lkok29QkB3NXErXXBKFKhvngshWTvpPjcVO4Ui5xholVlzF1wur7ZDwzBKyH5iaGFQDM
         Ts9prD0zHc3tRcEbmRBl3wJH9BVh81N/NN/1bO+GlRTjqH3izVKUAEfM7qRgpqcnD/R9
         L3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081257; x=1712686057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqMWmMuLBkB36hRyuNeghAw9yULSZkW/0v+P2o95oDo=;
        b=DOt762sLS/toiWz1ZQq55Jqnhza/Qrgu4dy7KITzUcS4FP3+WfbxC92sDTIIfV3ZJ5
         qJfMZy6HCg6FpoUIifkmpmWcUX4ly+/gVd7ra6EZzQhtLKHcSbMoDc/3TjiLSJX3DLRU
         tJE+pjGT59LC2X41ykyyWUFy36eUcRWzpSfAtUdtO6vPM3/1xI1XKxv89/0hQttf5AvY
         /Z7AChmmCg11BM5FRyuqTu5B/e+dHTlX6cp4luhOiNWJF/qP8RI1d3DbHZR5fzMvlCzQ
         MISNp+On5+y5tmibKtFMGPZIHUWRUSME7EZAs6XwhLxAaMopuh2ruf9oyicmYF+FB4XT
         Pc3Q==
X-Gm-Message-State: AOJu0Yyu9qrmq8PPcwHUT+y0v+8Z5R3Z1OBsJRHUZOvegQKrCr7ctXek
	BamSjthg67egyem4eNwCM557Dto72HGpjLwpYzaslcAHybON2BRMoCjNaDCR6wzYOTSynyze2af
	Q0SzJU9C/H1EVa/AVSoUJOaklYWvETiS9DETr
X-Google-Smtp-Source: AGHT+IH/atURWaTBbPQAqsjQksE5h3/Wi0dylrkAqH86JM0hpk/p+ZI4+OAudWDlEwRqzCo8ynKo54NFMdPlJI9fzfQ=
X-Received: by 2002:a05:6870:3287:b0:22e:8e2d:7c10 with SMTP id
 q7-20020a056870328700b0022e8e2d7c10mr104256oac.13.1712081257683; Tue, 02 Apr
 2024 11:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240328153243.4101823-1-jdmason@kudzu.us> <CANNYZj_n5bf=Fh1Pq1eb1HeTNfW6a4krFcyrC0Vt_f7kPQT4VA@mail.gmail.com>
In-Reply-To: <CANNYZj_n5bf=Fh1Pq1eb1HeTNfW6a4krFcyrC0Vt_f7kPQT4VA@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 2 Apr 2024 14:07:26 -0400
Message-ID: <CAPoiz9w+uapagR4TTW+mfuBripUPq3Wv5FdMZ8TuZRAcrDh81Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 18:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197875

On Thu, Mar 28, 2024 at 11:54=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Unfortunately this isn't correct either. UPSTREAM_CHECK_URI is already
> checked by the wget fetcher to override the default (which is first
> entry in SRC_URI), so if you need it in other fetchers (e.g git), you
> should either add support for it there as well, or remove the code
> from wget fetcher at the same time. Otherwise, this change will make
> things very inconsistent and confusing.

Since you can specify a UPSTREAM_CHECK_URI that is a different fetch
methodology (e.g, git, cvs, wget, etc) than the SRC_URI now, it is
already inconsistent.  Performing the check for UPSTREAM_CHECK_URI
should be done in the get_upstream_version, so it can then use
whatever fetch methodology is specified.  So, I think it best to
remove the logic in wget.

I'll do a v2 to make the above change.

Thank you for taking the time to review my patch, and providing guidance.

Thanks,
Jon

> Alex
>
> On Thu, 28 Mar 2024 at 16:32, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Currently, get_recipe_upstream_version blindly takes the first entry in
> > SRC_URI to see if the recipe is at the latest version.  If
> > UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
> > be used to check for the latest version.  Use that as the first check,
> > otherwise default back to the first entry in SRC_URI.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/lib/oe/recipeutils.py | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
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
> > View/Reply Online (#197580): https://lists.openembedded.org/g/openembed=
ded-core/message/197580
> > Mute This Topic: https://lists.openembedded.org/mt/105198896/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

