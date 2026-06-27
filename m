Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AD6C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 15:16:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2824.1782573383221719782
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 08:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eE2rhMt8;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ee88fce476so2759566d6.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 08:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782573382; cv=none;
        d=google.com; s=arc-20260327;
        b=CSdwFQ6l+pexN3pExMnTMNixSPoxH0zgmJZe9HPAc4hJVCr/7koR6/qw8GXwu9xCNd
         0XKMFb/PFrsIc7dl8kf5JMHlUvana+sopk6qjZyQin3zUIg5QqXFQWgJQ6J8GUXHnPvO
         KsIAR/DddhdYe+dudtQxERoyav5QVqW9ufPyufnMKUQKaXUXQp9iXzwCRar+nlQUJH43
         SVEvqp+VB+9t60kUT5jQfaV9x/Zq3ve4DTsh9keJrVkoUdZ4+CKkBCz0mbsJYYXvzr9H
         l/1/sb93rrgRYxTG9tFVVaQ9QDlKFO4viEEsD76cynOWO//l6WDDdNkh+zCnojKw4MMe
         ae8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G+CUFER6qJDHugf6KWD/lYo6kq1hF9gQHq3qsydSm1I=;
        fh=ydN80OVXL/Geam8lM55wCsCwJshcesBoEk21wk6VDRQ=;
        b=JK5v6VsHeQd0xdUUBcQ52CcBbwjAKr4Z3Z2OEnkg2q3Bui3Cel19+Pdmpfa26WJgSg
         cmRV4hAoh0Rtn1aypBtqfu79m7XOmd4LZC2sq8EUyrueAtfmq3eDW1o5UYNKVFmlu3+T
         +R1Tku45wd5FSr4vONmroamrCDZNLCyxzdkWoy5XKGg9mjmBipIIneT8+0Z2wdwkr6le
         I3pqY03pCbzcGFSd7+9gBXB3uIjSQSDDE4YBp20tbg+Fmpev/du/3jKtj4CzPE6kBqnD
         eao/BUQzNtZBlzm+1QgcT7GGlH0zxc/DCbkYvi+zSn68XinBKJ9fdsS6ROjTxDvkRqcf
         lHrQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782573382; x=1783178182; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+CUFER6qJDHugf6KWD/lYo6kq1hF9gQHq3qsydSm1I=;
        b=eE2rhMt8295rSi4l8RCHApIfbvljcwASp6NAgsk0UtOwTBAEa/vSJdozNI3Jwjv7za
         giAMQzW/mW10aMw/MBPmDcl7Aj/wdNGgP1GjZ2TSluKgpJbrUszbcuRBqL6Z+6mwd8J4
         L3rJm/cxW4InixY0nz/NkQPv512Hz3PuZMT/1BqgLuLnTxd/pW1arc18s5ak0AwYk8sw
         2DzVn+rHUz5PXShkWu4JjUtBp5gC66vogjOlCsIhP1iuw2zPvfQ/Mt5QkeuxaxFgFNiu
         qnXWjjsqFICZMPUQk49xorNagEV691d0yASkS+Co7rA/f1TxLGAxcD2f0zAMs0oTB2f0
         vynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782573382; x=1783178182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+CUFER6qJDHugf6KWD/lYo6kq1hF9gQHq3qsydSm1I=;
        b=tLQ8Es4YYdxGAqZ2dEc8IWoS2ttPV9+o0Pvz5EVTxNv7fijRzLw+eJilJuRlzgi1J/
         ncoyBjPpo0XgjLduFqz9JY6GK9A9Cdc0CscztMngFPe1APQrRABZ7/Snwa8H+cSvXGKm
         SReA2WrnvUSIWIu0NQDtbak6CNx0cpqfrtkb7EYVIfJ1q+2V2A1CPpigp9tA5WDUtsYN
         WgYixCRNoPoWkPVapw59pKjnOIHY7bAJUGXT/K79oNrT9LPAjb3rglsVVTF79OTgBkwM
         cY+Vczt0Prjzo4ceiGZtTj6Cby4UWjLue+dWjrZ8T5rBnuZ00EYawkuMuIwQxmW/uYGN
         qdPA==
X-Gm-Message-State: AOJu0YyaYWs5v6DYQaqXSNEboZJfbAPbDa1aiFLXfDkpJWxe9sO4cmMV
	2osEwbZ1CiTA4y4rn+9ehockRICznVYfyS6DNkGmn09jEmcp9SYPrR/TgFX39YPX27/Po9zFk8i
	H4Khd7Ruf7LGX4JTDhUTSsPUR+0UPPhI=
X-Gm-Gg: AfdE7cmJ/eLFxsXBal8IoQMoAVS47JOPSbCvWwGkX/FjDqqtZzdWEmbtpQGvt9ePVHT
	Jq0TCnaiVCsiDbyEmtMCsSVofkknXS0j3Vo8bu3AlEiRK1jgWGhAUrOe0jwjpIRE3Mu/HCDYEyY
	lomiIxU+k6Q0QOglJYaVsG8KdmlW2mZ4nqdyg5/pboiYLch34bJlE8i6IFeZqVQzqlc3F0jekhX
	8AtqsQV+GMAmDffrpyNX+Uv13UI+Ai6FLm0zwgYKKrN0XqFexdlD+Z5ysCFsXmuqfd15o7F0Q==
X-Received: by 2002:a05:6214:448c:b0:8de:b9ed:a101 with SMTP id
 6a1803df08f44-8e6d57c200amr189149576d6.24.1782573382158; Sat, 27 Jun 2026
 08:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
 <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
 <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
In-Reply-To: <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Jun 2026 17:16:10 +0200
X-Gm-Features: AVVi8CfKaVFGarpbkfJCjkyrBpurk2xmNqjAyPi53REomt5hIEajhcTsX4hcogA
Message-ID: <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, ccasciato@21sw.us, 
	paul@pbarker.dev, randy.macleod@windriver.com, ross.burton@arm.com, 
	sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
	Alexander Kanavin <alex@linutronix.de>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 15:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239696

On Sat, 27 Jun 2026 at 15:29, Yoann Congal <yoann.congal@smile.fr> wrote:
> Hmm, it looks like we have the problem but around the bootstraping rustc
> compiler:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4033/steps/12/logs/stdio l45466:
> |   process didn't exit successfully: `/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src/build/bootstrap/debug/rustc [...] (exit status: 254)
> | error: rustc interrupted by SIGSEGV, printing backtrace
>
> I checked: it does not dynamically link to libLLVM.so
> $ ldd $BUILD/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src/build/bootstrap/debug/rustc
> /bin/bash: warning: setlocale: LC_ALL: cannot change locale (fr_FR.utf8)
>         linux-vdso.so.1 (0x00007fffc78b9000)
>         libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f50950b2000)
>         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5094ed0000)
>         $BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f509516a000)
>
> I'll pull on that but suggestions welcome!

The log is misleading. The actual crash happens in a different, later
rustc, which does link to libllvm statically via librustc_driver:

| error: rustc interrupted by SIGSEGV, printing backtrace
|
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-cf7d845e2aab959c.so(+0xa75206)
[0x768caf675206]
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6(+0x3b8e0)
[0x768caea4c8e0]
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-cf7d845e2aab959c.so(+0x637aaa0)
[0x768cb4f7aaa0]
|

Alex

