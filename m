Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9D4CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 09:32:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.47574.1695029545549843470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 02:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXrG1KV0;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bffd6c1460so18491381fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695029543; x=1695634343; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gJXzPrccaToOzczHtYVmgsD6YGhSx3s+P6RnQ/bFXY=;
        b=gXrG1KV0esmyA9/mFdrf6Ci7VQ4gv1pl3miinTGCF/PpUYZQEWvaSDfRJgeqZWVsDn
         MfA0jjYFQ8HzQ0V8XMsMgJ9sEiht3Qs/92gbNvO8t2WPUamTNxIonXpXahMRR81sKfty
         bHT4c46Pfho3zpJ314ibBBWEnUA3ZMYF/bQOIi1iNOKdNKC83iuEyFu3W9UW9N/Ox7mh
         DKMUh4feDx+XGup93doSxQd5YncUeSo6weqxA4vXWfJQU+M3gDM+cgb3qsvYtAXlATXz
         CzjkduTqNAtiXE5DIOmbbFQF6bhERGLFkhQq19hrN5vZswCjfJZ5NL+RVGxEfIoEIJDE
         5zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029543; x=1695634343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gJXzPrccaToOzczHtYVmgsD6YGhSx3s+P6RnQ/bFXY=;
        b=jv0yK+XWZDKsxszPw8ofKyHNDm2+r7kO1KDoXiJgYS1qp+GoiP+kqFsDtCRHMKaDws
         IfRIQ2vR0NBNJp28JzpVa98ulsq2YkrlkLR9lq9Wq4xgt2mv9HIF2PdhvlDIgnvFp+fR
         FlW4vj+6hPMJNxDKwG+1ZT3SUrvZKvBHeh5EpBCbUhpfxmEfA8DJ0fxxrgUfe7h7sNE0
         8NlhauQaRygSmDdUsQuV0dDCLDDpdLQsXaHTwTTXyzKJoAhXJ83nKy2kmzxBx4WM59FI
         xZHUR2moqY56I87cmN88LUbJ0tpYGTGZmYsjzltit6S29a4HZENDgZCOZzDqkSgg/Pn2
         BAUw==
X-Gm-Message-State: AOJu0Yyym+Ks4irHS3K7moYBN7MiKX89OsCLAmhPIlwA0T53RMvygwBL
	Os87DWuFReuwhv5+fSVvUZ37jIz6WLx5+N0QBbQ=
X-Google-Smtp-Source: AGHT+IHsZTGHVDsk3q2DZS4ivspGdM1OPiCj/m3Qug/r5IW9BwkEOeRn5E2HAnxe6EhMLZGDJ2rITrf4V5viVijbNaI=
X-Received: by 2002:a2e:1554:0:b0:2c0:1d5:ade7 with SMTP id
 20-20020a2e1554000000b002c001d5ade7mr2200699ljv.0.1695029543246; Mon, 18 Sep
 2023 02:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8T8_iW0mh4ct1OX33cxihSE0O2bZOzG3ra1GTy08w-fw@mail.gmail.com>
 <31570.1695025703079386511@lists.openembedded.org>
In-Reply-To: <31570.1695025703079386511@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Sep 2023 11:32:12 +0200
Message-ID: <CANNYZj9FhE8FsE+nmUE6kxWOZuUUf0=Xx=cRnUfLmk-xr+0Wog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 09:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187822

On Mon, 18 Sept 2023 at 10:28, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> Thanks for your reply.
> There are two ways to add markers. Which one is better?
> 1. add one marker for the hole test of tar (as your suggestion)
> 2. add markers(PASS, FAIL, SKIP) for every case
> sample:
> PASS: 1: tar version
> FAIL: 5: TAR_OPTIONS with string arguments
>       SKIP: 11: --pax-option compatibility

I looked into why the test suite doesn't print those markers to begin
with (GNU items usually do when they use libcheck). It seems that
tests/testsuite is pre-generated with a different thing called
'autotest' that doesn't print them. You need to regenerate the file
with autotest from from the native sysroot (provided by yocto), which
is patched to print the markers:

https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch

and then use --am-fmt option with testsuite so they get printed.

> When try to run 'bitbake -c testimage core-image-ptest-tar' command , my compiling env can not find the testimage task. (ERROR: Task do_testimage does not exist for target core-image-ptest-tar)
> Maybe my compiling env has problems, so could you show me the correct steps for running the command?

local.conf should contain

IMAGE_CLASSES += "testimage"

You might already have it there, just commented out.

Alex

