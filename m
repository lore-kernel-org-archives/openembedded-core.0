Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF0AC71121
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:19:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6095.1724876383424885779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SEXU79n0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaebso8675902e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724876381; x=1725481181; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lCMGSolqZMtJFa+J+n1gFN7SsMxSN21qk6BVj8KcxqI=;
        b=SEXU79n0C3ru3zN2dBNa9sXT9HUVjL027Q7KlvG/qP2q5akwAq1bPbefbpwdofIdmp
         mHqbs7UjqiT+uX5EZKp8GBkEAGPkZJ4zX4z+fDKonOoJzCayAjPJIx8Oymk9I5Zu5PaV
         K8C8bzGJu+efkbxLkYkuTJkpthLmtsXx1u16mpOc+JuQ9OfZ4VNQCxTSxgUZfnqyZPmW
         6lsY67LJOGcf79MF0gmpMXlLCw7ca5vq5rqHP/I1F/6yGWleF0MQQPnLoIa3fh/4eAwM
         OXVCQ3lK8xuseZLmEl7hsxChAIZtsxW7M6q0OfrFFNoUUSsqE/8n6K7atvbf8nA7rhWj
         TS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876381; x=1725481181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCMGSolqZMtJFa+J+n1gFN7SsMxSN21qk6BVj8KcxqI=;
        b=uOhI2q/j+MRYnXEDRQZXylV0/pKpjRJWz1Zza3eKDB2HLMCofWiB3omD7rhqLn4FJm
         H5SJFK5kZ7LssOeH7ei4h9YB3+zmUGGzzgORqI9p1QpIjblgaOnBIbzBLQNLuNNX7WRi
         x49PM/JOc3dBpMRExdNWo/uOco5AAtbfFoXLGbnlJhYbjwvau8gM/KSLnOOprlp/GomL
         h4jfpF7Jc1tg+mTWsE6dgIcesQf5bHng14FHE+0q2b6ywR5MQGsKtDV0gs45T2NvhRwX
         DISEAkm2gzyDZ7W4Gz512fn/z/90pmfPcXm6KETbB/rzBOUBSWBhOvMBjgAJ8p2LfLr7
         UMHA==
X-Forwarded-Encrypted: i=1; AJvYcCX/QUvvMgaTL1G7AvGv1nqpFBs2IagckqvaZj7vJIvwDUB2CTyEbzwRJXsYmsM5RHSDARBwJECjjwStMFh0PaPnog==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC3+/gZna7L18z0jE9WlM9hdpt/fKfBvGfz8J2ZDOqczs0yUHr
	3bn+YEXRxmrvcG5ynULLZ89al0RXkjNE9JQCXLOVH3r6r9wkkrkbsF0AgP15Au3vFPitEzWd4q+
	ULUVur1IjZZuj20v1BwOnimS5DRI=
X-Google-Smtp-Source: AGHT+IFXu9gv7S5PXGdjzSZDcZGwz4Gq/rIK/34YvHSmTPIGiG+PRBm1L+9VeE1C9EablWg8gAJWfY6EZ3yJ6l7otxw=
X-Received: by 2002:a05:6512:ac6:b0:52e:6d71:e8f1 with SMTP id
 2adb3069b0e04-5353e5b815amr236081e87.53.1724876380896; Wed, 28 Aug 2024
 13:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <17EE19F35A1C7F50.9439@lists.openembedded.org>
 <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com> <05f406ce-1e4c-4fc6-97a8-2b6c28df96cc@baylibre.com>
In-Reply-To: <05f406ce-1e4c-4fc6-97a8-2b6c28df96cc@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 22:19:29 +0200
Message-ID: <CANNYZj9qf6FKiMaQP9NnXLKMM1gmX2+mDPNPipuDUQ6k7-pBPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: tgamblin@baylibre.com
Cc: martin.jansa@gmail.com, wangmy@fujitsu.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203891

On Wed, 28 Aug 2024 at 22:05, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
> Even with that workaround, I see a more serious issue:
>
> |DEBUG: Executing shell function do_compile
> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:60:
> RuntimeWarning: NumPy 1.26.4 may not yet support Python 3.12.
> | warnings.warn(
> |Running from numpy source directory.
> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:75:
> DeprecationWarning:
> |
> | `numpy.distutils` is deprecated since NumPy 1.23.0, as a result
> |  of the deprecation of `distutils` itself. It will be removed for
> |  Python >= 3.12. For older Python versions it will remain present.
> |  It is recommended to use `setuptools < 60.0` for those Python versions.
> |  For more details, see:
> | https://numpy.org/devdocs/reference/distutils_status_migration.html
> |
> |
> |  import numpy.distutils.command.sdist
> |Traceback (most recent call last):
> |  File
> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py",
> line 483, in <module>
> |    from numpy.distutils.core import numpy_cmdclass as cmdclass
> |  File
> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/core.py",
> line 24, in <module>
> |    from numpy.distutils.command import config, config_compiler, \
> |  File
> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/command/config.py",
> line 19, in <module>
> |    from numpy.distutils.mingw32ccompiler import generate_manifest
> |  File
> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/mingw32ccompiler.py",
> line 27, in <module>
> |    from distutils.msvccompiler import get_build_version as
> get_build_msvc_version
> |ModuleNotFoundError: No module named 'distutils.msvccompiler'
> |ERROR: 'python3 setup.py bdist_wheel ' execution failed.
>
> I think we'll need to wait for the numpy upgrade to go in.

I don't understand. This setuptools update did make it to master, and
numpy 1.26.4 builds fine with it on the autobuilder and in my local
builds.

Alex

