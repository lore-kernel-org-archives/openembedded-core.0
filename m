Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72950CD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 13:32:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.16747.1711719131975015922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 06:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ibvoxqhK;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61149e50602so15251167b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711719131; x=1712323931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB3LLyv1N6XcU8enK22WjjiR2M3UDKB1KQ2IPWCo2yM=;
        b=ibvoxqhKu2DoX0mIzPBl0+VBLfgwye/1ygQ/RGyo3Pq6Z00Wgl4lPCmnWwhxWkEzqO
         rDnQzi6DFNgpOoDg/Y9GKfpEyQy/LCYVyufBxILi94lWi0s5+KfsGhbpU1f6bMur58CL
         8bxTmd+QFZucGC8swCSiteVlp1Q8DZitI3tpSxb9JTRa3Hs8aW6FlOeqpPz2PozkalNQ
         BdLvwwSnAF0gKe1cMXIJ8ItCfAdYofUHJB4iqHxbopxtGSQ3odDag6mkoqKvupg6omXb
         kIx0Cat/TgNj1XaUbDpHwYhq3Y7nZR8MwdmD4lTKcn3YpJFQhFoYSw25bwhZnPRFtGVY
         6nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711719131; x=1712323931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iB3LLyv1N6XcU8enK22WjjiR2M3UDKB1KQ2IPWCo2yM=;
        b=gJ+p5NtDvTpa5+ANRz7ZOFKIISnOQsv/TQ3AJQqL492OUU6m+h6pmpW97FYP7PzjrL
         oMquJf/2Xl4VpNzA3iTnzCsa2Xasow40hlKQFyfBcMJ/H8J5kkV0sq6lJBFI7rLrSLQ1
         jT8mMk7DkOgeqfKbp6K3WqpZ9iGCQjvzyKFGZdU/+gDTl2++slhteK754W3EP3rR1RVz
         ekFhGLHuaIutuwZKL27iGQTG9KNUF9NtjDpwzOWH18b0iRagOstEUshxcJk98fsKxV8z
         iqBwKeCUJ3qfrujg/gSXv71s9UCjRQzCMPxbHwIzpVgEwiuJ5XNgpyEdrYBbnb9QLevQ
         FQSQ==
X-Gm-Message-State: AOJu0Yz1EvLNJCoMoqpA0+tLqHr0lZnz+uF6Wr9Ino/vnrr/SW9ywESq
	+B3HQxKRFee+Bnn5pSvh0w4eNA+/17SO4Hnth/s6ww4x0n/Ttn2ABfvUQvCw3FKaP9fJmrcNV9l
	d8R2rUXbD8leJF7CDxbJpKsdtW+ysCPSVz9M2d3hLh41ZodtIAlA=
X-Google-Smtp-Source: AGHT+IGLoIuvvaxaZN4qq5HuTaeZpyTAB6SrhsvEsoxlfVxGqNmmOYrWVqS5jjkGmhqr7tdw/RUbSCubUAAICF5X0LQ=
X-Received: by 2002:a81:7bd7:0:b0:614:35a7:4c40 with SMTP id
 w206-20020a817bd7000000b0061435a74c40mr1514582ywc.22.1711719130960; Fri, 29
 Mar 2024 06:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240327111523.855715-1-ross.burton@arm.com> <29693.1711684265473117694@lists.openembedded.org>
In-Reply-To: <29693.1711684265473117694@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Mar 2024 03:31:59 -1000
Message-ID: <CAOSpxdbCRMVfXhf7jOVYA5rgu1nayGW03NiDk5yWj_kJBU24jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][kirkstone] openssl: fix crash on aarch64 if BTI
 is enabled but no Crypto instructions
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, vkumbhar@mvista.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 13:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197630

Sorry for the delayed response, but I found the same issue with the
kirkstone version that Vivek did.

Awaiting a V2 :-)

Steve

On Thu, Mar 28, 2024 at 5:51=E2=80=AFPM Vivek Kumbhar via
lists.openembedded.org <vkumbhar=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Kirkstone-nut openssl compile error:
>
> Error Log:
>
> ERROR: openssl-3.0.13-r0 do_patch: Applying patch 'bti.patch' on target d=
irectory '/home/vkumbhar/kirkstone-nut/build/tmp-glibc/work/core2-64-oe-lin=
ux/openssl/3.0.13-r0/openssl-3.0.13'
> CmdError('quilt --quiltrc /home/vkumbhar/kirkstone-nut/build/tmp-glibc/wo=
rk/core2-64-oe-linux/openssl/3.0.13-r0/recipe-sysroot-native/etc/quiltrc pu=
sh', 0, "stdout: Applying patch bti.patch
> can't find file to patch at input line 23
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |From ba8a599395f8b770c76316b5f5b0f3838567014f Mon Sep 17 00:00:00 2001
> |From: Tom Cosgrove <tom.cosgrove@arm.com>
> |Date: Tue, 26 Mar 2024 13:18:00 +0000
> |Subject: [PATCH] aarch64: fix BTI in bsaes assembly code
> |
> |In Arm systems where BTI is enabled but the Crypto extensions are not (m=
ore
> |likely in FVPs than in real hardware), the bit-sliced assembler code wil=
l
> |be used. However, this wasn't annotated with BTI instructions when BTI w=
as
> |enabled, so the moment libssl jumps into this code it (correctly) aborts=
.
> |
> |Solve this by adding the missing BTI landing pads.
> |
> |Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/2398=
2]
> |Signed-off-by: Ross Burton <ross.burton@arm.com>
> |---
> | crypto/aes/asm/bsaes-armv8.pl | 5 ++++-
> | 1 file changed, 4 insertions(+), 1 deletion(-)
> |
> |diff --git a/crypto/aes/asm/bsaes-armv8.pl b/crypto/aes/asm/bsaes-armv8.=
pl
> |index b3c97e439f..c3c5ff3e05 100644
> |--- a/crypto/aes/asm/bsaes-armv8.pl
> |+++ b/crypto/aes/asm/bsaes-armv8.pl
> --------------------------
> No file to patch.  Skipping patch.
> 4 out of 4 hunks ignored
> Patch bti.patch does not apply (enforce with -f)
>
> stderr: ")
> ERROR: Logfile of failure stored in: /home/vkumbhar/kirkstone-nut/build/t=
mp-glibc/work/core2-64-oe-linux/openssl/3.0.13-r0/temp/log.do_patch.152571
> ERROR: Task (/home/vkumbhar/kirkstone-nut/meta/recipes-connectivity/opens=
sl/openssl_3.0.13.bb:do_patch) failed with exit code '1'
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197620): https://lists.openembedded.org/g/openembedde=
d-core/message/197620
> Mute This Topic: https://lists.openembedded.org/mt/105174962/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

