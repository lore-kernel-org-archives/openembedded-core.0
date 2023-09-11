Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA26EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:22:54 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.62173.1694445765566246298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 08:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XmQa1dnB;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b703a0453fso77455651fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694445764; x=1695050564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=92g0HamXzcU2hLksXb1Y3pNRDegxTZ1uj7PM+mOfRrU=;
        b=XmQa1dnBfZyn6MDimR16rK+HFNItSiARrcl4GsrdQ5Yb+uUt1t1Rsj612w4PN9GGET
         7zRMifIdBArGy6WN5QvfDsA+dSuIFooV/4pIDVvlouwZddFAuYNOVVMIl3KKJZD73a2E
         yDzwpffipc5eE8WsaeIDE8ef7sL47VbhOGyGvISZPSR07/ULJTCf2EAHHX6BIX5T0xYB
         TZnIaBfrGDUBJ8qV7mp7c6xGPOK7gh9YfakernLKZQ+OWYzblVodaM8ZIrcrc4aTsUzO
         xj6yzRi2+aySJGlCpC76uWCVUhyXZxgqCoBg/J9GgutckR66Ae5XSe4MRLeN8+9qy1l4
         f6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445764; x=1695050564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92g0HamXzcU2hLksXb1Y3pNRDegxTZ1uj7PM+mOfRrU=;
        b=PeusBnXV3xrCZ3P6cHZLWNOynzrjx9J/IZ1PiirpxWaU6UuAcWIp2m1+UaA2e2ub2J
         S1B4ZQLTd7sRCu+EWbwgjEgzrloT9Q185YyvM4yB1CqHbugOOAu/J8ONa5nJoED+S5T0
         w7FNvgF4X25n0lJVN0g9z6pkxxBTlRZsvioJtfAe2KH9++UxiRpfOSE0G2AGptb9b+NW
         2kPUOpJ6Axwniv5bl7s4qXL0j1AXh9Y76FrOcUmmMy43WQwnmQkJX475vXXuZUehl/ps
         rR1UmhikpFVob8Hs3zpPsY1xFX6q7CkRQM3vKXJyGkxxmqWB+D/Z8jZx9D7QFynWvWFs
         j8rA==
X-Gm-Message-State: AOJu0YxxjP0tQ+d4mjiTqfi7F+qbPWsUN8hqjbYt5b4Pp7GKyioDq1Hk
	4F9EuU8FgbpgYbDQpF7J10FIGPiXD/HH4Zfj2UycLY5T
X-Google-Smtp-Source: AGHT+IGSTnEVimO5rUJV68EuCQS2anDiUJdxFkBQOzo0cBxSebbynCCN/YEDfjCfFdesDXOMKIr3KvOU05zjlJwZHPI=
X-Received: by 2002:a2e:9cc7:0:b0:2bc:d889:2d89 with SMTP id
 g7-20020a2e9cc7000000b002bcd8892d89mr7910774ljj.44.1694445763400; Mon, 11 Sep
 2023 08:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230911133950.2618970-1-mikko.rapeli@linaro.org> <20230911133950.2618970-2-mikko.rapeli@linaro.org>
In-Reply-To: <20230911133950.2618970-2-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Sep 2023 17:22:32 +0200
Message-ID: <CANNYZj-MF-xBzefpk8eg+fBVtU7uN7usWxe=NYS=3Y8CUrTP6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] openssh: improve banner ptest failure logging
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 15:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187493

We can probably output the logs from run-ptest as upstream suggested?
That'd avoid having to carry a rejected patch, even if it can be
removed (maybe) after the issue is fixed.

Alex

On Mon, 11 Sept 2023 at 15:40, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Log the input and output banner files. Output seems to
> contain more lines than input which fails the test but
> it's not clear what is in there from the ssh command
> stderr. So print them out to dig deeper into the root
> cause.
>
> Upstream rejected previous logging patch so they will likely
> do the same for this:
> https://github.com/openssh/openssh-portable/pull/437
>
> Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...h-log-input-and-output-files-on-erro.patch | 61 +++++++++++++++++++
>  .../openssh/openssh_9.4p1.bb                  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> new file mode 100644
> index 0000000000..2c14014fed
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> @@ -0,0 +1,61 @@
> +From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Mon, 11 Sep 2023 09:55:21 +0100
> +Subject: [PATCH] regress/banner.sh: log input and output files on error
> +
> +Some test environments like yocto with qemu are seeing these
> +tests failing. There may be additional error messages in the
> +stderr of ssh cloent command. busybox cmp shows this error when
> +first input file has less new line characters then second
> +input file:
> +
> +cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
> +
> +Logging the full banner.out will show what other error messages
> +are captured in addition of the expected banner.
> +
> +Full log of a failing banner test runs is:
> +
> +run test banner.sh ...
> +test banner: missing banner file
> +test banner: size 0
> +cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
> +banner size 0 mismatch
> +test banner: size 10
> +test banner: size 100
> +cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
> +banner size 100 mismatch
> +test banner: size 1000
> +test banner: size 10000
> +test banner: size 100000
> +test banner: suppress banner (-q)
> +FAIL:  banner
> +return value: 1
> +
> +See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +---
> + regress/banner.sh | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
> +
> +diff --git a/regress/banner.sh b/regress/banner.sh
> +index a84feb5a..de84957a 100644
> +--- a/regress/banner.sh
> ++++ b/regress/banner.sh
> +@@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
> +       verbose "test $tid: size $s"
> +       ( ${SSH} -F $OBJ/ssh_proxy otherhost true 2>$OBJ/banner.out && \
> +               cmp $OBJ/banner.in $OBJ/banner.out ) || \
> +-              fail "banner size $s mismatch"
> ++              ( verbose "Contents of $OBJ/banner.in:"; cat $OBJ/banner.in; \
> ++                verbose "Contents of $OBJ/banner.out:"; cat $OBJ/banner.out; \
> ++                fail "banner size $s mismatch" )
> + done
> +
> + trace "test suppress banner (-q)"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> index 2c85780e4d..1cf6937038 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
>             file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
> +           file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
>             "
>  SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187491): https://lists.openembedded.org/g/openembedded-core/message/187491
> Mute This Topic: https://lists.openembedded.org/mt/101292700/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

