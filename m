Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A549C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 22:00:50 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.167773.1672178442515890389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 14:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+MBulpQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x11so14926137ljh.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 14:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJbMIEqo7stQ9TnuWA1eVsI5wOnnBqgy92JiDsqPXxM=;
        b=Y+MBulpQGLWl4KOq1022vSrnm6Zrg+G+vNKQ/0K430AkvEMW5/1YVvKE5Eeiybeh5T
         0vARMlAiWckBP+JY5EmCE5Cfv9BSpFJiC04oz/yPTqnfowu0VQxFePBCj4VKRqjPt8qK
         aIj7HGC9Lv1ei734OwcnUuh7KT9W5b3BDu2MGuANgDicT34v93unGqhhY63wskXzPgnx
         L6Pkhsh9Vpku6GGuZ3kE9AvbAjwX6XIntVDy1rOB8phM4aYnmKXhFoPZgxeSZ9kKGbqi
         vbz7ihVfk9hmFqiHi0oZsWv4nyFtO+f/7m4kazs8UPZnh7TbDFI9BBhwha61+W3YcFu9
         bBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJbMIEqo7stQ9TnuWA1eVsI5wOnnBqgy92JiDsqPXxM=;
        b=Otw+XlKCl0x8wbcklaF3QADzlxrTd/6BymmI96JW9W97ohu8tLemcvYX6zRfn0Jrkv
         zoqPRUmuDnuPTQL8bIbt5K5oUMKj7YYKQXlEdriK9PrNgKl6UoR2sYYjjINQhkKOjJ2I
         JsS4+95L3SgM5F1iNSj+oYUVwK+50XFfFd1pTb7esoxBJkwavNFezGVyYD+u+v/7XdsB
         Lt5p80WcBXQ8gGL9CJZlaGG8VcGPuBHz1MzVfouNVaq+PQSBaEg+H9zE98MMkZ3bF5nB
         b/r2crGlE99yMMyn0Gc6gYMXV+eC0RLyd7frqKP1iR4xsGfm5GirYYVWIPm1ILLs6Tj+
         7KZw==
X-Gm-Message-State: AFqh2kpSkmfr4mT91jdsR5KSkWwmZQL8qHvrZm0VgRILb8lqpbITK9Lt
	TPXxDLW1KE9YA0yRklZ4JK9Zk/wxm0KIN1N3WBI=
X-Google-Smtp-Source: AMrXdXvdrFB1wZwutGUSC2oS+gqoVeuRsYku0ViBIFiLKoE8N0MyFHLUavaKtF3RRTzVps5IRjL6XXNHJibo2IXtCQg=
X-Received: by 2002:a05:651c:14a:b0:27f:7635:9526 with SMTP id
 c10-20020a05651c014a00b0027f76359526mr1069837ljd.222.1672178440405; Tue, 27
 Dec 2022 14:00:40 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-4-alex@linutronix.de>
 <CAMKF1spOeeVjL=xudaCoUwx+7YTYU_FCupHdMUw=O6v8Ribqgg@mail.gmail.com>
In-Reply-To: <CAMKF1spOeeVjL=xudaCoUwx+7YTYU_FCupHdMUw=O6v8Ribqgg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Dec 2022 23:00:29 +0100
Message-ID: <CANNYZj_h0bsS5zB1Eq_wDB+wWq369h50cGhyiv55o=g6rjN93Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] python3-native: further tweak to
 sysconfig.py to find python includes correctly
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 22:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175035

That's annoying. The case I was fixing was for *finding* headers in a
sysroot, but if installing them needs to work too, then there's no
option that works. I'll take a look a bit later.

Alex

On Tue, 27 Dec 2022 at 19:41, Khem Raj <raj.khem@gmail.com> wrote:
>
> This is regressing following recipes from meta-openembedded
>
> python3-uefi-firmware
> https://errors.yoctoproject.org/Errors/Details/685605/
>
> python3-greenlet
> https://errors.yoctoproject.org/Errors/Details/685600/
>
> its installing the headers in wrong place
>
> On Sat, Dec 24, 2022 at 9:00 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Without this, sysconfig would report the target location, which is not
> > what we want in cross-builds. This is used in particular by
> > latest autoconf-archive m4 macros, which have migrated from
> > (removed in py 3.12) distutils to setuptools.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...py-use-prefix-value-from-build-configu.patch | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > index 2f519e4917..5ca855e7ed 100644
> > --- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > +++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> > @@ -1,24 +1,23 @@
> > -From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001
> > +From 45548f40668d429adcb7532d35db1ac16fe74562 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex@linutronix.de>
> >  Date: Fri, 10 Sep 2021 12:28:31 +0200
> > -Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
> > - file
> > +Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
> >
> > -This allows correctly substituting them for target installs using
> > +This allows correctly substituting them for target builds using
> >  native python.
> >
> >  Upstream-Status: Inappropriate [oe-core cross builds]
> >  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >
> >  ---
> > - Lib/sysconfig.py | 5 +++++
> > - 1 file changed, 5 insertions(+)
> > + Lib/sysconfig.py | 7 +++++++
> > + 1 file changed, 7 insertions(+)
> >
> >  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> > -index 93c6f73..ff399e2 100644
> > +index 93c6f73..a87870f 100644
> >  --- a/Lib/sysconfig.py
> >  +++ b/Lib/sysconfig.py
> > -@@ -668,6 +668,11 @@ def get_config_vars(*args):
> > +@@ -668,6 +668,13 @@ def get_config_vars(*args):
> >               _CONFIG_VARS['VPATH'] = sys._vpath
> >           if os.name == 'posix':
> >               _init_posix(_CONFIG_VARS)
> > @@ -27,6 +26,8 @@ index 93c6f73..ff399e2 100644
> >  +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
> >  +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
> >  +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
> > ++        _INSTALL_SCHEMES['posix_prefix']['include'] = _CONFIG_VARS['INCLUDEPY']
> > ++        _INSTALL_SCHEMES['posix_prefix']['platinclude'] = _CONFIG_VARS['INCLUDEPY']
> >           if _HAS_USER_BASE:
> >               # Setting 'userbase' is done below the call to the
> >               # init function to enable using 'get_config_var' in
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#174986): https://lists.openembedded.org/g/openembedded-core/message/174986
> > Mute This Topic: https://lists.openembedded.org/mt/95864507/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

