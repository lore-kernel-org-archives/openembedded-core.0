Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3281DC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 14:53:03 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.11858.1661352780431966648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3SbQjxn;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id l8so6819172lfc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ETxezZ5Cd+uZZZhgQ5yR3U9VfbmdM0LyGyPF3i+J598=;
        b=Z3SbQjxnWBufDKgR1YOga896SIlwZUkg8IJixeKqFeiHMxYnT+ik+6vQF9g/PiOjD+
         GRL5Z5cX+3X8Ewcw3MMnKhlbnj/ALqLkcgUXLKOs6ziDYkh+u6wc1YjuIx41T59OvGGw
         LLuXogjDyFAmMmcSM5zy4dpPreuQdpnR1oLNgs8faRFLn09oj10jck0Infu7tA2TRo81
         JEeQIsaajV1GAJWHf3PYCItMVGzx9bAxsHzFeC5TWQ3PAZumma2t7ZDLocuXb0ROadAv
         ak3LhKkywQLXViwfcst/FuvMMryBAqP8PDIt68ebBqUIq8a2EOOd8VDa0EjyHkZWwmQh
         wc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ETxezZ5Cd+uZZZhgQ5yR3U9VfbmdM0LyGyPF3i+J598=;
        b=BFIWYVa6SED69yNZRdmUjar7saEnEARRFWek5yYrlCJHLH5KNTdRjhg/e0SCFIgAW2
         +gOAZ1rUZ6Fqm8r/WaaXhYAAnz6SBtOoVO9gZlpUz3PhWuhN4O9dTFP8bu9FrE2vhXHY
         ObqCFB6b6+FMJTko4lR9op2b04rO6Ngc9rXIXZUXtG9AgXkyZdEw5okzK9xvF2xnS3kB
         ruE0V3GggoDktT2dQzEmD7vA3jb/gMgw+bkIBISA8J8ItAIhFcBU9pCWPnl4ECMaRTR9
         tAK2O6CsrXNGZC1K6lerROkE1FINQLN0JAM/Ws8VsLS4Cj0pDYefY8i+bGHxDw2CDjES
         kdlA==
X-Gm-Message-State: ACgBeo07vIRI9uxOof7K2vDKH15ZQPytWFiwgUAqlVQAILt4oaJRPijj
	Ba75kvkIJsqjZUDlbK1qSIz9kIb5vs/X4TBH8/E=
X-Google-Smtp-Source: 
 AA6agR5uDXxGJfm5x62HkgwpXFaTTVyJNBKKpf1TRBguC1ZZk9BPQ3wGrey1OW9xJ2HIMwvv61unhRxRBUg49Kzsf8A=
X-Received: by 2002:a05:6512:3697:b0:492:e5a5:648b with SMTP id
 d23-20020a056512369700b00492e5a5648bmr4630379lfs.521.1661352778634; Wed, 24
 Aug 2022 07:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
 <aa755beb07f143619c3c7fec974ce2a3@axis.com>
In-Reply-To: <aa755beb07f143619c3c7fec974ce2a3@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 16:52:47 +0200
Message-ID: 
 <CANNYZj-FYOOBqPBs3sZuXQqse1nrtRZXeKrKjMg=YZgt2neSKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 14:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169822

On Wed, 24 Aug 2022 at 16:43, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> We create the sample files in a small wrapper for oe-init-build-env
> so that to the users, everything works just as described in the Yocto
> documentation. And since the OE scripts expect TEMPLATECONF to be set
> and contain sample files, that is what we create.

Actually they don't expect that. You can simply create the configs
directly into the target build directory in your wrapper, and drop
TEMPLATECONF altogether. Then the OE scripts will detect that the
configs are already there and will skip the step of copying the
templates.

> Sure, that is fine. But the expectation I have is that TEMPLATECONF
> refers to the directory that has the sample files needed to set up
> the build environment. And that is it. As long as the sample files
> exist where it says they should be, why do you need the scripts to
> fail because the environment around the directory does not look
> like what you happen to expect? It is only the contents of the
> directory that matters. Or am I missing something?

We are trying to move towards standardizing build configuration
management. One step towards that goal is that config templates must
live in meta-some-layer/conf/templates, and aren't scattered around,
or generated on the fly. This rule only makes sense if there is some
way to enforce it, which is what this change does.

Alex

