Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D880CCF9FC
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 12:57:57 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.24561.1761829075037074226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 05:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZSpqndH;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-791fd6bffbaso12653906d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 05:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761829074; x=1762433874; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UA4MBV1EAgBuvOFU8Fj97k5gQHhBGjeEtTCJW+c897g=;
        b=TZSpqndHVWFJ7gfbGZs1hvTXpjmXwwVgHD5DXxiPs/ZmlbBMl6aQlq6I++6wDYZ6NW
         k44KHzjEvUuFa3aLzicPDPFVtSxwMQ1fxXricL3xtvYVKC2esnLRkXTjW9fte1UiZpSG
         PqSYL3lIHOGwRHJKtQ71XsJ8DW4MfuRykm9uozp7TDXkFR8Zn4fNAMctjJhwHYKcZr61
         NzyqfMTl63d7V7aWYINlQyLOVSa0xgl6D7Z/Eqiaz9BTjpPI/JqWZPEyh/s2xCg85iDq
         tT2k8UVXvCt9vQ2zDE4vt7O1lexoU0P/Ha2CmBfmeMbngZt2Wn2WmifqxfWp8PLcnNlR
         Q2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829074; x=1762433874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA4MBV1EAgBuvOFU8Fj97k5gQHhBGjeEtTCJW+c897g=;
        b=AMQ061ZdKCgGMSZ8WVr7kjxoX3e4R9Q6dEJh+sSbF0x2lmnDyMKNlY0ZMtqguzDTPq
         ywKx5PR6vJkPWYi6XBH2WIY6IOQBPVjZAvq6ToeGim8UaQaMgk1GDjgOz7XP+uSQGiZb
         LWQXmGXcgotIIVIvDQ37BxxiHRM3UDhnvnmQE7teMzj2OoAcmalDCt+qWk9KByX2MkJ8
         9c5h27TksRfL+BEC3dnBi0Cp37h6xr0/Af5xS8k3RGhvaJk25nWFJIYPh5s2s0vmJYD3
         QcAwkUtbEkOVEZFfDwmRN0iBaSJiAfhPygfTLFYNtUdsX7R/8zEJJ7/aL83CcSWdaJ4c
         5cIA==
X-Gm-Message-State: AOJu0Yz023MCyK4kBoen/eZh9XP1Cdi9COKZhYvXA4+eAiVIC6zCrT1s
	+hdvKaXW3Ez64aeOV/dnC2NCr2oXnrziTKaRjpPIqCvfc18JE1nSf80LVCn6E6yKkd3NmnESOGC
	laA5vk6GTIRb8JQYvSRj/tijRmrAs3pQZH1sl
X-Gm-Gg: ASbGnctKe8cHOsF7/PbT+xKuA8qluYOz8XN2uom1stia9hdIvBiEA1Bc9ewwhC8zxdo
	lHYoeS/DKot6OJ4wiHzBJCNv5QTl0ejYDJCs+s9UwJs1OIvxQLnLREtwe5j2znuy2owVtRpYz9r
	fYSYgb0fs5wvwilWQjiHkHjtKBSWJAIM3HS7O9QXa87ouE1G8RtqwxU8jKzL2oJ6UulUnqbdrWn
	XvVnQTvehwoeOUjyi+3TIPsTveZ7XUz6WbaCypXvbXyazV1A0NlYnnzrF9fbb6axRbU6T2jmaZZ
	NmJfvk9DLIONTYpK+GkrVzcmM5OyhDAK8JUS2Ji/RiUZzIn+/Ws0tUOSzgD52hrehjfWYTmyFCL
	ib8V2UVlJ4DWQMDdiu08M4ZTb0pD+
X-Google-Smtp-Source: AGHT+IGRHHLP1sIPgIbfZs8OQV3hIS7CUB+kIVTXHk+6uDOUY5tfuycux8H5h3PmiX7mL/2YT9yBFVzTjRsT9AwgClI=
X-Received: by 2002:a05:6214:610f:b0:880:224e:aa9f with SMTP id
 6a1803df08f44-880224ec820mr10367786d6.63.1761829073962; Thu, 30 Oct 2025
 05:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251029202250.270947-1-tgamblin@baylibre.com>
In-Reply-To: <20251029202250.270947-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Oct 2025 13:57:43 +0100
X-Gm-Features: AWmQ_bm_WQoJve4RmmQaB1qHph3R8QMNgLIkOERzG1_JKmJv_JhVEC7n59OpGXE
Message-ID: <CANNYZj9MYVok8co-aRX8qpN2h2YE7woCPZvMfrxwioPz1rD9Jg@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH 0/1] python3: upgrade 3.13.9 -> 3.14.0
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 12:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225493

On Wed, 29 Oct 2025 at 21:22, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
>
> This is a fairly significant upgrade, so I'd like to request some feedback from
> others in the community, especially on the new test skips and _sysconfig_vars
> reproducibility solutions to see if anyone has better ideas. I've included some
> justification in each patch based on what I found during my investigation.

Thanks for working on this! It's good to have several people (and not
just me) who can handle major python updates.

> I'm also having a couple of issues with testing that maybe someone can identify
> the problem with. In particular, the python3 ptests, reproducibility, and
> buildall-qemu results seem OK when I test, but when I try to build ptest images
> for recipes that depend on the python3-stringold package, such as
> core-image-ptest-python3-license-expression, I see errors like:
>
> |ERROR: python3-unittest-automake-output-0.3-r0 do_package: QA Issue: python3-unittest-automake-output: Files/directories were installed but not shipped in any package:
...
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__init__.py

I don't think it's to do with stringold. Rather,
python3targetconfig.bbclass no longer does what it's supposed to
(which is trick native python into reporting target configuration).
You can reproduce for example by building target rpm, and then, from
its $WORKDIR:

with python 3.13
alex@Zen2:/srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1$
PYTHONPATH=./recipe-sysroot/usr/lib/python-sysconfigdata
_PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
./recipe-sysroot-native/usr/bin/python3-native/python3 -c "import
sysconfig;print(sysconfig.get_path('platlib'))"
/usr/lib/python3.13/site-packages

with python 3.14
alex@Zen2:/srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1$
PYTHONPATH=./recipe-sysroot/usr/lib/python-sysconfigdata
_PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
./recipe-sysroot-native/usr/bin/python3-native/python3 -c "import
sysconfig;print(sysconfig.get_path('platlib'))"
/srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages

What is supposed to happen is native python should read
./recipe-sysroot/usr/lib/python-sysconfigdata/_sysconfigdata.py with
these tweaks and use that to report the directory values. So either
the file no longer has correct values, or sysconfig has been somehow
refactored to calculate the paths in some other way.

I have to stop for now, but yes, cross building python is horrible.

>  ...1-test_cmd-skip-bang-completion-test.patch |   31 +
>  ...-test_unix_console.test_cursor_back_.patch |   46 +

These two new patches should also include an upstream ticket links
that report the issues probably.

Alex

