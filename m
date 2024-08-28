Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E8C7112F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:34:36 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.6457.1724877273836351521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ODbFh8hF;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so77543881fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724877272; x=1725482072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yHSpKOd7bCaxvIiFz74SWLYIIj6+5yqw7aZIVoJL0DY=;
        b=ODbFh8hFh5eoASt/EagmVR+WbKkqMz6OO/VhII/OUjphcD5CD8ykt2wQ1I5/Ga1J6k
         syG9gLRqkmb44jNumncO0yNhBR+kHhPpwrUHRLzG3ABbyFWCb67nYmPBoq1Q6CF9NIy/
         WsMHb4IlosenF6L3KjA79fJINc8Tc8GiOm1F58tfMCpm6FeuEoeeFKEiz9YnYmxZkJzK
         9XhW09YnrLM4gq1qIPHvnVQgGybLaBsS1SfCBFVMSuJMVTzR0GgUZ4d1SEATn/KoHnmd
         nFyLHbbkoT03BN2g/Hp2VGqDBYejvvUybaJ2Z5tP+XTzvu5eJhRnXQtEFDEJ4u4PcGGD
         9orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724877272; x=1725482072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHSpKOd7bCaxvIiFz74SWLYIIj6+5yqw7aZIVoJL0DY=;
        b=GpCbPPfiAeiXwPhee+NVde5OPAzMp/FhKNftobbThbF8rwFYEVVZmqHzXYU0zueKsG
         GmxoleODArj66Iy/0PEnxp1VwXN4tdgVU3chIS9MUhuMT8jtdFa+3bwBP+AZv1oKMGpk
         7ZySt6uw7mTXa3mu8CX16mNx3jFeQ/Ae4w5ZYbWfoOFRPbPgVs5zivVbE+UTspfhxlvy
         AkZcgGbY7um7J1Qv+kbXhXHZrBM5hNgLcIOB9QeWBsAffF4WxPYK4gRcICJ4yLAWQMzg
         GhXuovLqe/A/Zd2r2uFaena6NKsn6LgZJahkgcdzqe8OPy7Hnu7LA1CAJyNAUa5nx/dT
         BE7g==
X-Forwarded-Encrypted: i=1; AJvYcCVEfOyUc947B+BMwjOcX6Yx6ohYize1PzpEwb3IQ4/Bcb1uT5Ll/uqReuxM/nk0eNRcaUbDrMhoJ7VeK8O02nPlkA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEiu0hOglc6aIitvQ0cCb2InC34uJzvTz1QKNwHD4juhXB47/2
	qNpwMqrXL3v2DJ1eytuZ11fFFWuWi5UVXmR25nbiBRc7ZS+Za6EFDcSc093p0+T+VfOumSi3hbM
	Xyc5igH/7L+Bj/NjHdDZsr53eC00=
X-Google-Smtp-Source: AGHT+IHFG5UO8WYC7imyu80S5u7mmfRa9XHJNd5no10iR/39Ve9RfHS6BWKcpVnqZ2r35iWK6VEwUpqepfTigikV218=
X-Received: by 2002:a2e:be06:0:b0:2ef:2fcc:c9fb with SMTP id
 38308e7fff4ca-2f6104cec9amr5801161fa.36.1724877271321; Wed, 28 Aug 2024
 13:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <17EE19F35A1C7F50.9439@lists.openembedded.org>
 <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com>
 <05f406ce-1e4c-4fc6-97a8-2b6c28df96cc@baylibre.com> <CANNYZj9qf6FKiMaQP9NnXLKMM1gmX2+mDPNPipuDUQ6k7-pBPA@mail.gmail.com>
 <4c294c8b-233c-4105-9b6b-e8e5e5974f73@baylibre.com>
In-Reply-To: <4c294c8b-233c-4105-9b6b-e8e5e5974f73@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 22:34:19 +0200
Message-ID: <CANNYZj8P9eNNwENfo16_vkxiXwnjdNOKdfD_dHkwmM9zrJJCUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: martin.jansa@gmail.com, wangmy@fujitsu.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203893

If numpy 2.x update was prevented by lack of recent piglit, that has
now landed in master.

Alex

On Wed, 28 Aug 2024 at 22:31, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>
> On 2024-08-28 4:19 p.m., Alexander Kanavin wrote:
> > On Wed, 28 Aug 2024 at 22:05, Trevor Gamblin via
> > lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> > wrote:
> >> Even with that workaround, I see a more serious issue:
> >>
> >> |DEBUG: Executing shell function do_compile
> >> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:60:
> >> RuntimeWarning: NumPy 1.26.4 may not yet support Python 3.12.
> >> | warnings.warn(
> >> |Running from numpy source directory.
> >> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:75:
> >> DeprecationWarning:
> >> |
> >> | `numpy.distutils` is deprecated since NumPy 1.23.0, as a result
> >> |  of the deprecation of `distutils` itself. It will be removed for
> >> |  Python >= 3.12. For older Python versions it will remain present.
> >> |  It is recommended to use `setuptools < 60.0` for those Python versions.
> >> |  For more details, see:
> >> | https://numpy.org/devdocs/reference/distutils_status_migration.html
> >> |
> >> |
> >> |  import numpy.distutils.command.sdist
> >> |Traceback (most recent call last):
> >> |  File
> >> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py",
> >> line 483, in <module>
> >> |    from numpy.distutils.core import numpy_cmdclass as cmdclass
> >> |  File
> >> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/core.py",
> >> line 24, in <module>
> >> |    from numpy.distutils.command import config, config_compiler, \
> >> |  File
> >> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/command/config.py",
> >> line 19, in <module>
> >> |    from numpy.distutils.mingw32ccompiler import generate_manifest
> >> |  File
> >> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/mingw32ccompiler.py",
> >> line 27, in <module>
> >> |    from distutils.msvccompiler import get_build_version as
> >> get_build_msvc_version
> >> |ModuleNotFoundError: No module named 'distutils.msvccompiler'
> >> |ERROR: 'python3 setup.py bdist_wheel ' execution failed.
> >>
> >> I think we'll need to wait for the numpy upgrade to go in.
> > I don't understand. This setuptools update did make it to master, and
> > numpy 1.26.4 builds fine with it on the autobuilder and in my local
> > builds.
> Sorry, got my wires crossed. I'm trying setuptools 74.x, which I only
> mentioned testing in IRC...
> >
> > Alex

