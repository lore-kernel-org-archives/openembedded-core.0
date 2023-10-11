Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DACCD98FD
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:07:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.11843.1697011628193518642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbDQ/6rt;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c007d6159aso77759221fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697011626; x=1697616426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/JJ5KD6okCqhZaBzQY46s3hXFNriHajr8LJ1Iu5g2nA=;
        b=hbDQ/6rtjmv0Oddi7od9l1+mCgp1auKuvH1c50XDwN5mlvupiPwbdlExMcbNOidCZg
         D8glNXS9aFDuohngMX8LlvdwvQT4bP+5Ph9WHojGiLgiZ/td5HbxupCt5FKegshqmEFc
         YMtYv1LOjFKERippxhgHVG8C7vO+ep8BE1OG7/VjISdU3XZDu2LonDdVlMBbYcUGwzr2
         XXAVvVPKIR4xgmsIvPIFrRpg0FTu39aWzRGXgMqaSARwGT8tJ70uUgYUi1Xec1YlfqpZ
         ciX9yR4wedcQ7aHujsfq+gjIF/HZBOHyoeDf1S03EfwF5afD40OvATyuEo4joCH9ylgC
         HKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011626; x=1697616426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JJ5KD6okCqhZaBzQY46s3hXFNriHajr8LJ1Iu5g2nA=;
        b=s6nr+xXplXWfudDEEKK+qHpzYX3mkbTphMR/hsCKE6CmOaKI20DFU0WZwxaQwny41I
         IwnOiHf1iZG5jTa8/eWK5V4Mi4yWcdzcsW9LM2cYyXy3rc1EHQuElWIsBmlJ3QovB9bQ
         v6xw167Rvih/uR22iFaCJFYMaI4cq15tbYxoANOsyGFLVomdkE+amstnCcgWW+A/CbXe
         deL6O7nRVtMbbRFgQSE06gbkg8OgAPNQJ86+7tgyO3Wly6bjxc16DnXBSsg5e9isMgkn
         56rqOUjtYLYsQI9i7kILlLaUWQ5gFUxEOL0/p+GjzEkJeS4Bo7mNrC/mYRr3b1fwvnH6
         eZpw==
X-Gm-Message-State: AOJu0YwdzaTbodMOpYatov/xGhEbyJmPK4/Prvdo1mu+9/qPtQoMT+fo
	P2WkBpcU0ybEvadBHLmJ7AurGkNwu5AvxrFsUUQ=
X-Google-Smtp-Source: AGHT+IHFshOSsFsP8IBIcVxvQ9THealMhc1j1tWDeMEgwHHJHYLCzg62UoU1BFdU6bTFoveWzH52DfLdKkuN17y3MNE=
X-Received: by 2002:a2e:9589:0:b0:2bf:af49:daf7 with SMTP id
 w9-20020a2e9589000000b002bfaf49daf7mr18127069ljh.42.1697011625876; Wed, 11
 Oct 2023 01:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231006211404.4161211-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20231006211404.4161211-1-Randy.MacLeod@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Oct 2023 10:06:54 +0200
Message-ID: <CANNYZj_HMEeL97CQaZfY0gGca+7CvkazbYsR+xJMO5-V=x74Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] strace: skip so_peerpidfd test
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188946

Is this a recent regression tied to some other commit or is this
intermittent? What does the output look like? Is there an upstream
ticket?

How the failure occurs to be better documented, and upstreams do need
to be notified, please don't just add pending patches to quickly
resolve AB fails.

Alex

On Fri, 6 Oct 2023 at 23:14, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> The so_peerpidfd test is failing due to a difference of square brackets
> in part of the log file. Skip the failing test until the difference is
> understood and fixed.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
>  meta/recipes-devtools/strace/strace_6.5.bb    |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
>
> diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> new file mode 100644
> index 0000000000..76f93ab613
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> @@ -0,0 +1,25 @@
> +From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
> +From: Randy MacLeod <Randy.MacLeod@windriver.com>
> +Date: Fri, 6 Oct 2023 12:08:23 -0700
> +Subject: [PATCH] skip tests/so_peerpidfd.gen.test
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +---
> + tests/so_peerpidfd.gen.test | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
> +index 64ad3a2..f89da9f 100755
> +--- a/tests/so_peerpidfd.gen.test
> ++++ b/tests/so_peerpidfd.gen.test
> +@@ -1,4 +1,5 @@
> + #!/bin/sh -efu
> + # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
> + . "${srcdir=.}/init.sh"
> ++skip_ "Test fails due to apparently trivial log format differences"
> + run_strace_match_diff --trace=getsockopt -y
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
> index 8f90c35925..d6475e8db9 100644
> --- a/meta/recipes-devtools/strace/strace_6.5.bb
> +++ b/meta/recipes-devtools/strace/strace_6.5.bb
> @@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://skip-load.patch \
>             file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
>             file://0002-tests-Replace-off64_t-with-off_t.patch \
> +           file://skip-test-so_peerpidfd.gen.test.patch \
>             "
>  SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
>
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188786): https://lists.openembedded.org/g/openembedded-core/message/188786
> Mute This Topic: https://lists.openembedded.org/mt/101806877/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

