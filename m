Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA1AC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 16:56:02 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.18135.1672937759793461133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 08:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iImPw2py;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id x25-20020a056830115900b00670932eff32so22822790otq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 08:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YondVY/rMc9E3lkXEo4UQa9sJPX4QkAyymCvn+P/cLs=;
        b=iImPw2py1gJvxBy80L6JITkg+NP6obepoN7KDC/utwrAe+JIJDDd0r/9xsx3pXZhno
         A42gw6eMAHm7LJqNacw8VgNXKmT9cq+hcK/pZIc4YiO+YiBoYvQUuT8bi2iXXLbWriAx
         0aeE+5sOoDbWKGKtXFyz+HsfVzOdCT9ful/9EWKyQUBCE3WvsDHJqUi3H5bbnKqlhaeC
         LgqTfWInxxNGeBt3WoY090Y+sX7uh4JGiuiaXVD9MNItMVkH9YIbH817LwqI8VsTmlFn
         pnXMplTeixTxLqWmh2jtJcpLZbT+8bmWQvFqQk5dYm4GUrbKYB/xb4k4kkZGougeQlc9
         PDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YondVY/rMc9E3lkXEo4UQa9sJPX4QkAyymCvn+P/cLs=;
        b=LJLKO21XdfKxHLW+Z+cm9TIg0PhcLwMx+q92ipWmUzluKCQ2hDuZ//+bomJvQGsFTs
         x8SQULOTqEcu6yQ4QFcmAs5zlBB69TPZ0r7szosknhCU70TODkjh0mUZPViQB/TL/ovt
         YnYpjF5GoPB+FMdAG3fISrqUG3nUQ4ognfep0HyZpnbCMB8o5+TSaNX7aSEEWLe9unen
         rgCbGn9od+CDCKmYx2Y+sKT2BT/UQRaqLyyq/l/GhV/dlNz0KzORQ0aaIqmuy9QoPS38
         MQYxBlhEOv3OrVBQnNFM6XOX0viGm+XtFS5fT+zz5Wc+hvytITEB3qCUjQgbqy845y7o
         07JQ==
X-Gm-Message-State: AFqh2koKUtKqqgkmmfU0UR8uO5DQUYMGCiJGLWQ+6Yg5wynBbH+UOhaE
	fovKevdA/CwvkJe6vqQWEEV5HKwwN69m+FZtm3c=
X-Google-Smtp-Source: AMrXdXsW2DtzriL/C7CEqhbtkwtSfRdH3VrS89iYq3FplMI5H1QA3gGABOtYArsKBjBiu2D6rKflmlYQNGmtWiEjNko=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr2991854otk.111.1672937758961; Thu, 05
 Jan 2023 08:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20230104110548.2537259-1-alex@linutronix.de> <20230104110548.2537259-45-alex@linutronix.de>
 <CAMKF1spQg77ziLGXKtB7GaNp1FBFWgf+RrGgHe7ZUVr0NcSiMQ@mail.gmail.com> <CANNYZj_kH9NbG8TEbi9S48Ghg9sKx5n=_ScFhgYsnhKQWPWqhg@mail.gmail.com>
In-Reply-To: <CANNYZj_kH9NbG8TEbi9S48Ghg9sKx5n=_ScFhgYsnhKQWPWqhg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2023 08:55:32 -0800
Message-ID: <CAMKF1sr3V7Qd_GzXKvbLMQYU+mwYF4Dxv5u7k5rf65+QJvCp=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 45/77] python3-setuptools: upgrade 65.5.1 -> 65.6.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 16:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175543

On Thu, Jan 5, 2023 at 7:00 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> I sent a patch for that to oe-devel.

Thanks

>
> Alex
>
> On Thu, 5 Jan 2023 at 04:45, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This setuptools upgrade is regressing nftables build
> >
> > | make[2]: Entering directory
> > '/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py'
> > | cd ../../nftables-1.0.6/py && \
> > |       /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> > setup.py build --build-base /mnt/b/yoe/master/build/tmp/work/cort
> > exa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py
> > | Traceback (most recent call last):
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/nftables-1.0.6/py/setup.py",
> > line 5, in <module>
> > |     setup(name='nftables',
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py",
> > line 185, in setup
> > |     return run_commands(dist)
> > |            ^^^^^^^^^^^^^^^^^^
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py",
> > line 201, in run_commands
> > |     dist.run_commands()
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
> > line 969, in run_commands
> > |     self.run_command(cmd)
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
> > line 986, in run_command
> > |     cmd_obj = self.get_command_obj(command)
> > |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py",
> > line 861, in get_command_obj
> > |     cmd_obj = self.command_obj[command] = klass(self)
> > |                                           ^^^^^^^^^^^
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py",
> > line 158, in __init__
> > |     super().__init__(dist)
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/cmd.py",
> > line 61, in __init__
> > |     raise TypeError("dist must be a Distribution instance")
> > | TypeError: dist must be a Distribution instance
> > | make[2]: *** [Makefile:455: all-local] Error 1
> > | make[2]: Leaving directory
> > '/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build/py'
> > | make[1]: *** [Makefile:478: all-recursive] Error 1
> > | make[1]: Leaving directory
> > '/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nftables/1.0.6-r0/build'
> > | make: *** [Makefile:387: all] Error 2
> >
> >
> >
> > On Wed, Jan 4, 2023 at 3:06 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
> > >  ...ython3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/python/{python3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} (95%)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> > > index 1b5f9c7577..2110c4a877 100644
> > > --- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> > > +++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> > > @@ -1,4 +1,4 @@
> > > -From a0e0873a8ee6674d43e604d66bf66d94fc8eeb6f Mon Sep 17 00:00:00 2001
> > > +From 2e57369593ede5336f947e7b9903ebc673f98fef Mon Sep 17 00:00:00 2001
> > >  From: Hongxu Jia <hongxu.jia@windriver.com>
> > >  Date: Tue, 17 Jul 2018 10:13:38 +0800
> > >  Subject: [PATCH] conditionally do not fetch code by easy_install
> > > diff --git a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> > > similarity index 95%
> > > rename from meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
> > > rename to meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> > > index 8dc724e55a..a8bcb3a602 100644
> > > --- a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
> > > +++ b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
> > > @@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
> > >  SRC_URI += "file://0001-change-shebang-to-python3.patch \
> > >              file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
> > >
> > > -SRC_URI[sha256sum] = "e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f"
> > > +SRC_URI[sha256sum] = "a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75"
> > >
> > >  DEPENDS += "${PYTHON_PN}"
> > >
> > > --
> > > 2.30.2
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#175430): https://lists.openembedded.org/g/openembedded-core/message/175430
> > > Mute This Topic: https://lists.openembedded.org/mt/96047915/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

