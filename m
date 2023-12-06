Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C8EC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 11:51:47 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.29457.1701863497828947461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 03:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+oDuKO2;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: andrey.z@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ce93552cb5so210215b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701863497; x=1702468297; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg9AuB5jlkyckeFWJbsjtdfGLYyUllCuoOGT5SWKCwg=;
        b=R+oDuKO2tl/+vqX2N3Yt/leJi9say25/dELJ8G6r9o+N82tz19rxcuSIPMRZD6x0PU
         SfTEMBe31pTjLwNrMnmroNclmsXWxCtPhXcqEW9GdgVayzzA5l67lAwH09dPoliB7GAh
         6PiLbnCbGZjY6kunoSnzASRZmlh4/kBMg61+TVbbQbRQjLeWsZXkT3/mHmXeF8X2qtQ/
         cxj14TwWALCdK5pe5eOYm0ijmyUX2qhP+rGxwdmwwPbTpGJhjJEMuv3sv7AM520mMbLT
         jT/dmGrK77/lHCIWGvDbTR1MJrqvioLEIwIHgrl5RysMhvHcnpVYo+a+aaBfqcTpAVJy
         IZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701863497; x=1702468297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zg9AuB5jlkyckeFWJbsjtdfGLYyUllCuoOGT5SWKCwg=;
        b=r0M4ygUt6+ZriX3Wbw7ATOda/ddD2OFpleVBkpv2Z7abE3cHcGKTTdoLWE+cBVTDvW
         TUN5ShXwDe+qKCYmmfqW9OHN1uHbUYfvfuHUvO+SWLAK5b+Q7DAU3kj8K02GJP0o3IWf
         G6bvV8+Uu1CsVNcs9bKIQDjVXcZEhz8xSLGJq1FC8Xjay0QyyOc/gCA/4isHo4Rbw1mJ
         FXPnrwzmgajGwtl9c5FFoEG8nR+hBAp6vWLpoXfpSt2GIkqywkjLRAJ8z53tesW8Qh1f
         uTjP7jyAm3JlFyj2DjiDalftIV3JsST4XThMrBwLd950tLwa5K17y6zO/QS4GctMODFv
         AhGw==
X-Gm-Message-State: AOJu0Yyz6JzGXXqMuCdOtCA8yOXH4ICiodHlcELdgBhDnG/xZR0DPWPU
	TmLyKGS9weCEI2fskQFojk0hkWimGWkUYW/8WAA=
X-Google-Smtp-Source: AGHT+IEP0AriuxmnnE4Nkb2/rqvWLYdW9k7kHVo4kDm978knx0tOJ2lR1syy6iGVKqYJIxpuIzjH9Lw8zrXsFIO2Q3I=
X-Received: by 2002:a05:6a21:a59b:b0:18f:97c:5b9d with SMTP id
 gd27-20020a056a21a59b00b0018f097c5b9dmr443316pzc.107.1701863497108; Wed, 06
 Dec 2023 03:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com> <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
In-Reply-To: <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Wed, 6 Dec 2023 12:51:25 +0100
Message-ID: <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jermain Horsman <jermain.horsman@nedap.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 11:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191883

Hello Alex,

On Wed, Dec 6, 2023 at 11:08=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Unfortunately I have to say no to this. The problem is that this will
> update to latest revisions on all the layers, which I believe is not
> what people would want, as everything including poky etc. will be
> shifting uncontrollably.

Correct, and that is exactly the reason why this mechanism is only
offered via additional switch. If it is not supplied - then behavior is
exactly the same, and this is intended. Only those users who would
really like to exercise the shift would use it.

I've also prepared a patch for documenting this switch, but held it back
until the functionality is in. There I do explain the case for CI systems
which would want to capture updated setup of all layers in collection.

>
> Conceptually, I would not want oe-setup-layers to suffer from feature
> creep and become bloated and difficult to maintain. Every little
> enhancement is pushing in that direction. It has a json, it does what
> the json prescribes, end of story.

In this regard I think that json prescription is too strict.

While this totally suites the needs and purpose of passing over the layer
setup to any other client, it really limits the usability of setup-layers o=
nly
to that specific case. If this was originally an intended design, then
perhaps a note in documentation would be needed.

>
> We've previously discussed with Jermain how this can be solved on the
> bitbake-layers side, e.g. that tool would write out a json where some
> layers don't have a hardcoded revision. I think work to implement that
> has stalled, not sure. But it's not difficult to add.

Is there any mail thread or patch stack where this has been discussed?

I would like to take a look at what was proposed and perhaps re-use and
re-establish that part instead.

Thanks a lot!

>
> Alex
>
>
>
> On Wed, 6 Dec 2023 at 10:25, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Current script implementation uses revisions recorded in JSON file to
> > replicate previously recorded setup. While this is useful for complete
> > layer setup reproducibility, this does not allow the setup "upgrade" wh=
ere
> > this script can be used to use remote branch information and latest HEA=
D,
> > have the setup restored, and then saved using updated revisions.
> >
> > Add new '--skip-revs' parameter which can be used to obtain the updated
> > layer setup.
> >
> > Following set of operations could be executed to achieve this:
> > 1. Restore initial layer setup using remote branch HEAD instead of reco=
rded
> >    revisions by specifying --skip-revs.
> > 2. After layer setup is created, JSON file containing updated revisions=
 is
> >    retrieved via `bitbake-layers create-layers-setup`
> > 3. Updated JSON file can be checked in to bootstrap repository and used
> >    later without '--skip-revs' to replicated updated setup.
> >
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > ---
> >  scripts/oe-setup-layers | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> > index 6d49688a32..a4941450d3 100755
> > --- a/scripts/oe-setup-layers
> > +++ b/scripts/oe-setup-layers
> > @@ -69,6 +69,13 @@ def _do_checkout(args, json):
> >          remotes =3D r_remote['remotes']
> >
> >          print('\nSetting up source {}, revision {}, branch {}'.format(=
r_name, desc, branch))
> > +        if args['skip_revs']:
> > +            if branch and (branch !=3D 'HEAD'):
> > +                print('\nSkip revision option used, remote {} branch {=
} HEAD will be used instead of {}'.format(r_name, branch, rev))
> > +                rev =3D branch
> > +            else:
> > +                print('\nBranch info is missing in json, --skip-revs o=
ption is not used')
> > +
> >          if not _is_repo_git_repo(repodir):
> >              cmd =3D 'git init -q {}'.format(repodir)
> >              print("Running '{}'".format(cmd))
> > @@ -108,6 +115,7 @@ except subprocess.CalledProcessError as e:
> >
> >  parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Where =
to check out the layers (default is {defaultdest}).'.format(defaultdest=3Dd=
efaultdest))
> >  parser.add_argument('--jsondata', default=3D__file__+".json", help=3D'=
File containing the layer data in json format (default is {defaultjson}).'.=
format(defaultjson=3D__file__+".json"))
> > +parser.add_argument('--skip-revs', action=3D'store_true', help=3D'Skip=
 revisions recorded in json manifest, and use latest revision on branch to =
restore setup')
> >
> >  args =3D parser.parse_args()
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191879): https://lists.openembedded.org/g/openembed=
ded-core/message/191879
> > Mute This Topic: https://lists.openembedded.org/mt/103009912/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Regards,
Andrey.

