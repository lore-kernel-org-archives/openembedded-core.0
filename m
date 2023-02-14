Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D678CC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:38:23 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.3533.1676371097356330223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 02:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okHBecmJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id l3so17878482ljo.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B40N9RaAOYoPHpWluC/KITGrXFtcw702FHctYRWEbpo=;
        b=okHBecmJftDWH0IslkXFeE0s2dJkQ7nqg6p3bnOtNjKqXSUAn1QFXf18pV3C8o1Tg1
         JrRNsIVuKRwyB7llYFvpN3bYiTjKf20qfWp0SehfcbvlQrfA/G2FMStRBg5fA2IgXd8d
         Kh9xXC4a2115PncKTMFKg/hFCgBoKvOA67b84rzUgGLNwYBc+SQH0gVD9EPF474axPr7
         ZmUfi3UQqEpH+DIJsWl34EC51SMv3e+6fRAXcjRm5g8J31iCadrdPJdM/Ak49D6XAGKl
         aWEcsigc5wYq/q52TH2HrBmSfrPuiNDvkC20dXPepa5bNFMNOdi87QGOKzsdhX/98XFy
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B40N9RaAOYoPHpWluC/KITGrXFtcw702FHctYRWEbpo=;
        b=L69IwGU7YqQTrs4ArRFs8+Z4EvbeoqZ/tl2BNWLNJeDXgyr8UJUnYWZsC2EHdv/bBw
         pS6NBC5wO8eZbuDABaQiaqZeRWJzwAM++QcIRP0MfI9mIgyhEbB9xkQZHGyFpxMHWoOh
         iR3IdGv2SUINPLBSuMCRIpskYIIC/lFKxHkv7H4rE0I7VNLS0qC6/C1q6g4JEhkY+JN3
         dcSL4kA8jmdW7HUwlwGB91VpxuAYB8bC7hOe025kGbJCc6T9He0/Xg1GpVv0Om61rDPo
         +7c9sxdHolFJKnwtJByae/TEKwHOkS24/IwrzQ9fY5Fm6MNgNdJA+M/vBdWlTk3dL2F6
         +fHQ==
X-Gm-Message-State: AO0yUKXKvSYg2O7wWR2S5OCFNrmMr+0uRKrcJnkTPMQ01xnswbRVdj75
	8dT4oAb/KLXCkFI0xAdKStNz1P4QWWBSuBmIkFE=
X-Google-Smtp-Source: AK7set+1POinFu2aq6qzycRCQbSpWyLgIiul/NWJLHnVejt3Mb717Yi7D4D5Jw0KabPo2fh+ZeFJ1mQidZ7/bf2Zf9A=
X-Received: by 2002:a2e:a36a:0:b0:292:8597:6142 with SMTP id
 i10-20020a2ea36a000000b0029285976142mr211113ljn.5.1676371095516; Tue, 14 Feb
 2023 02:38:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676363203.git.liezhi.yang@windriver.com>
 <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
 <ff0ea75fcce5de13f380fb9fa3abaa80d1cb2506.camel@linuxfoundation.org> <4e074d0e-a609-9c16-d11c-0cc285c16216@windriver.com>
In-Reply-To: <4e074d0e-a609-9c16-d11c-0cc285c16216@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Feb 2023 11:38:04 +0100
Message-ID: <CANNYZj_PLXE1S8ssawoPbATF04qiSyW_8J83puKnLQ5u28Gx_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it
 is not defined
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177138

On Tue, 14 Feb 2023 at 10:12, Robert Yang <liezhi.yang@windriver.com> wrote:
> This is used for online package feeds (When PACKAGE_FEED_URIS is set), the
> default PACKAGE_FEED_ARCHS is None, so "dnf install/upgrade" or "apt-get update"
> doesn't work by default, we must set PACKAGE_FEED_ARCHS to make it work, but
> it's hard to maintain PACKAGE_FEED_ARCHS manually since we can't add more/less
> archs:
>
> 1) When add less archs in PACKAGE_FEED_ARCHS, "dnf update" can't find the missed
> packages.
>
> 2) When add more archs in PACKAGE_FEED_ARCHS, "dnf upgrade" will report
> "can't find package feed" errors.
>
> We must set the accurate package feed archs to make it work correctly, but
> different builds may have different values since recipes can set PACKAGE_ARCH.
> Set it automatically (when not set manually) can make it work smoothly.

Tests for online package feeds exist in
meta/lib/oeqa/selftest/cases/runtime_test.py and they work without
setting PACKAGE_FEED_ARCHS, so something isn't quite right on your
side, or the tests aren't covering your local setup (and maybe need to
be extended for it).

As I said, you need to tweak existing code that handles empty
PACKAGE_FEED_ARCHS, not add a whole another overlay function that
clobbers that.

Alex

