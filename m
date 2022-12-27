Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC1C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 22:48:50 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.169988.1672181329095810788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 14:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1+O8wHr;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id x37so8140003ljq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 14:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hwnC+zLYzP+WE9onKX2ZJGMF8KELVhSy9BjIWZfKLdY=;
        b=X1+O8wHrSdfQaXymZf5lKNW0sl8IK2F2lx4v8+wJ+6qc9oYcuJ2y/kHZXZ2Kwxy7nx
         Bq8ggcJUfyU66sRtILehf8SXcGKoVgtx0T+2a+xTMgBIfa5LpdDxbWsU/xb99nGhdb+S
         XdJlJwJNYVRs5nNn74wSLK862U3OvenD5/GEHgiJj9AFvToDvg/mox6FEf5Ta02Iq0R0
         Sd4nNuipvrmL2NZSHb3bIt+MvjeuHP6OZxGYdf5Xc495mJCLMB53bx0t946Vj9+0Au5k
         ctAmLuZz++CCjqpjhEn4sg1k33vC7ZEMzYq+MsT7THWPeXPHHvERj1gwx90og5iP00KW
         qXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwnC+zLYzP+WE9onKX2ZJGMF8KELVhSy9BjIWZfKLdY=;
        b=vVRy2tNZm2os9y0XHQfI5Yl+g0mgyEwEqr6i4a11R2qteiyiOpBVchi+xoK/ojFe9c
         h5sjCafS3594qlRg/25gzLA8qBj6gz3mnNMUZXDcLvVyvpgUcqCeYufXote+C3q1I6fX
         1MPlyGf7gaOi+TKc9I0ARrttrIuqB2YWnyi5nJ8S+EeeXJ74Xy1AiAwy0pcg9IZu0GfV
         4NcqP3lrY3dm8y7rbyiXFbE1E1bacF0dt/Ho1dxEHvDYfxiU9AkQyEv/7Zt31Gk0mNJg
         nHWSVtmdW12qyiBCBSIGRMdSjs3WL+rz+t+QvKi0jB5dsyQz/qnk/lw4ewYP1fhfRYPF
         QEfA==
X-Gm-Message-State: AFqh2kqzESII9ltezQ0HrOgqzSMO0hMxlYJlUDW9TAYYL+SCZ6eXZp4S
	UYu6VMibJcCUov9WTj2jFdbBRzefpN0vEiXcJow=
X-Google-Smtp-Source: AMrXdXujFlAyAJswxHk2ALQydd78xOoV980qd+jpHxh1d7ZiAGUoDiwFb5JZedpYqPMJ8jlgblqz3e/OZyQ8RjxEQUk=
X-Received: by 2002:a05:651c:168a:b0:27a:2285:411b with SMTP id
 bd10-20020a05651c168a00b0027a2285411bmr1834066ljb.33.1672181327276; Tue, 27
 Dec 2022 14:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-4-alex@linutronix.de>
 <CAMKF1spOeeVjL=xudaCoUwx+7YTYU_FCupHdMUw=O6v8Ribqgg@mail.gmail.com> <1734C56F2C623C3D.12545@lists.openembedded.org>
In-Reply-To: <1734C56F2C623C3D.12545@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Dec 2022 23:48:35 +0100
Message-ID: <CANNYZj-VOXCSd5PJ2jdf2mjXXjZVQUq+WJ=E4BLpuz0X2X91FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] python3-native: further tweak to
 sysconfig.py to find python includes correctly
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 22:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175036

I'll be submitting a revert, for now. There's no case of using latest
autoconf-archive in the wild yet (where the problem is), so let's
stick to default behavior which does not break setuptools.

Alex

On Tue, 27 Dec 2022 at 23:00, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> That's annoying. The case I was fixing was for *finding* headers in a
> sysroot, but if installing them needs to work too, then there's no
> option that works. I'll take a look a bit later.
>
> Alex
>
> On Tue, 27 Dec 2022 at 19:41, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This is regressing following recipes from meta-openembedded
> >
> > python3-uefi-firmware
> > https://errors.yoctoproject.org/Errors/Details/685605/
> >
> > python3-greenlet
> > https://errors.yoctoproject.org/Errors/Details/685600/
> >
> > its installing the headers in wrong place
> >
> > On Sat, Dec 24, 2022 at 9:00 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Without this, sysconfig would report the target location, which is not
> > > what we want in cross-builds. This is used in particular by
> > > latest autoconf-archive m4 macros, which have migrated from
> > > (removed in py 3.12) distutils to setuptools.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  ...py-use-prefix-value-from-build-configu.patch | 17 +++++++++--------
> > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > > index 2f519e4917..5ca855e7ed 100644
> > > --- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > > +++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > > @@ -1,24 +1,23 @@
> > > -From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001
> > > +From 45548f40668d429adcb7532d35db1ac16fe74562 Mon Sep 17 00:00:00 2001
> > >  From: Alexander Kanavin <alex@linutronix.de>
> > >  Date: Fri, 10 Sep 2021 12:28:31 +0200
> > > -Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
> > > - file
> > > +Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
> > >
> > > -This allows correctly substituting them for target installs using
> > > +This allows correctly substituting them for target builds using
> > >  native python.
> > >
> > >  Upstream-Status: Inappropriate [oe-core cross builds]
> > >  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >
> > >  ---
> > > - Lib/sysconfig.py | 5 +++++
> > > - 1 file changed, 5 insertions(+)
> > > + Lib/sysconfig.py | 7 +++++++
> > > + 1 file changed, 7 insertions(+)
> > >
> > >  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> > > -index 93c6f73..ff399e2 100644
> > > +index 93c6f73..a87870f 100644
> > >  --- a/Lib/sysconfig.py
> > >  +++ b/Lib/sysconfig.py
> > > -@@ -668,6 +668,11 @@ def get_config_vars(*args):
> > > +@@ -668,6 +668,13 @@ def get_config_vars(*args):
> > >               _CONFIG_VARS['VPATH'] = sys._vpath
> > >           if os.name == 'posix':
> > >               _init_posix(_CONFIG_VARS)
> > > @@ -27,6 +26,8 @@ index 93c6f73..ff399e2 100644
> > >  +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
> > >  +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
> > >  +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
> > > ++        _INSTALL_SCHEMES['posix_prefix']['include'] = _CONFIG_VARS['INCLUDEPY']
> > > ++        _INSTALL_SCHEMES['posix_prefix']['platinclude'] = _CONFIG_VARS['INCLUDEPY']
> > >           if _HAS_USER_BASE:
> > >               # Setting 'userbase' is done below the call to the
> > >               # init function to enable using 'get_config_var' in
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175035): https://lists.openembedded.org/g/openembedded-core/message/175035
> Mute This Topic: https://lists.openembedded.org/mt/95864507/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

