Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B94CC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:42:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.10103.1633516928634468077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=C0a+FDhV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id v17so7393865wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQTNvCJhxeHE26bCrQ2JVxsLPtLtsiq8idh7Nft/iy0=;
        b=C0a+FDhVS+TPenyRBXJ3QxKqV5ovkCqcRphX+eecAxDwYoYRAJ6hEB1wRX+VTFxcCE
         sAIU++fE3Yha4bB0IP2TurEQIgOVllOA26Pzllen+87HJiIhX48y9BTDA4sgI1UvyJJH
         bNs7VA1SJTUSZK0ParbieCivNPzs5yH0MS6d/8GJ0pUEkoQn/P2xxrcR0I+5v8N7YUbr
         dYNlunH2liM15vtQnhxLTWX0vqoqjSCcnA2Ck4gxK6SLSrtTmrlXcmaAZ3OJHIAyCmbp
         R33+lO0ptDFr+aUwN4neSYL3LH26vwOXpmlv+XD0KwQlh2eI2eUd8jmlZqlf3IwjLHh5
         ugQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQTNvCJhxeHE26bCrQ2JVxsLPtLtsiq8idh7Nft/iy0=;
        b=N6YAhgMXuh//nQCdVhLCbLFVihschU6s+cngHESxZl+7dFbZqKi9MmgQRXH12kJEc0
         yhT6wkn7koUW06Xg2iutPQLpq3GAreiWNrFx6KQtum1+EXomG511gVgx+Wqcku1WuUby
         B7xhjzosyrZwygt5t11w2Kix3GnBWcNARUQkPR7o+QysGlIKyeDE0J0ThKc/iflch6m9
         tncfC2skqwi8Vr/l8HWqiTnkkTc2iQEbEKhx3BuTfilUx2y2Bd+PCKwtFx88kxPMxLRA
         /qwK0inVwNITX9Wvt0ciVk2w9g4VzElihwDTCvvwnG22Q5fo8JaP+4WbPynpl9fwE/6F
         hsrA==
X-Gm-Message-State: AOAM530f4wHtaUDOl+1mmch3NYxnRMoZCiSt2VzU4wmfADmeqXUy1hki
	5Icdsnz8Ewvq7wb5nFZ55Krl0rXzH6stC7oN/hkamQ==
X-Google-Smtp-Source: 
 ABdhPJw6b3BzwhFkjEVkp7lgADc/B0yvxePha7PAebohGBqwfVvdJlHRPtWpifQ/qbEWT8GVKGYECW+6Vg39vIC3uvg=
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr8855617wmq.62.1633516926746;
 Wed, 06 Oct 2021 03:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 6 Oct 2021 11:41:55 +0100
Message-ID: 
 <CAAnfSTsLvK-Hm47UNQ7M6iB34P73t3cb11PM3qRGVUGfSuJfRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:42:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156687

I should have put this in the commit message, but here's the failure
when using an external toolchain:

2021-10-05 12:52:14 - INFO - | HOSTCXX
scripts/gcc-plugins/arm_ssp_per_task_plugin.so
2021-10-05 12:52:14 - INFO - | In file included from
/builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/gcc-common.h:103,
2021-10-05 12:52:14 - INFO - | from
/builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
02021-10-05 12:52:14 - INFO - |
/builds/persist/toolchains/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/plugin/include/builtins.h:23:10:
fatal error: mpc.h: No such file or directory
2021-10-05 12:52:14 - INFO - | #include <mpc.h>
2021-10-05 12:52:14 - INFO - | ^~~~~~~
2021-10-05 12:52:14 - INFO - | compilation terminated.

On Wed, 6 Oct 2021 at 11:12, Ross Burton <ross@burtonini.com> wrote:
>
> On Wed, 6 Oct 2021 at 11:10, Ross Burton <ross@burtonini.com> wrote:
> > This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
> > any of the default configurations.  meta-arm builds a few kernels with
> > defconfig, which does.
>
> Sorry, brain still not warmed up yet.
>
> CONFIG_GCC_PLUGINS needs to be enabled, but the real difference is
> that using the normal GCC pulls libmpc into the sysroot via implicit
> dependencies.  If you use an external toolchain (like
> meta-arm-toolchain) this doesn't happen, and the dependency needs to
> be explicit.
>
> Ross

