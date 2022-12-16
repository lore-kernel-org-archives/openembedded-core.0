Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B9CC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:42:23 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.10017.1671187339482820043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 02:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kKKpQ9Mu;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id j28so1043590ila.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 02:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/lsZUCiktBsXbqNG1qWyj4P5kbReRErOWpsgdaPYjU=;
        b=kKKpQ9MuIn5lS5aKy/c4SMqPXQkOWeanGncJWj8UOJaOZnPfgBoHog0hUFSBCnoE7l
         Hi0JT3mPJMnkP8jITMAjV0IoYFsCCrY4XwBeOky1choDk/GEyk+iTG2M9EU9iPHGvizO
         +dNeuLK1c1QsU11JCWRhJoRSFmuKniZnzkBXOsgeUKyen5JBXrZKwoIN4SQJGPlltuCF
         XtnIf8BAMcdptla6UAnUvGd95e1uTjtuSW4qi8qYjVNRdG+YqJ/tX/FvpY82DIcNglMq
         Yh7by+4ER4np7MtJ+mwmzfB6RjIJBk9zbLPEXTHoAmLoI32mfx5o/FWsJqPOJj/UAkiA
         Udow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/lsZUCiktBsXbqNG1qWyj4P5kbReRErOWpsgdaPYjU=;
        b=7Rgzx7KFEx8Z6CxekebwmZ+W8W666GiIVlXrprw81Gu9yhDyPkpndupqi5lsDfTube
         JC8r659Iap2e9B/4BRRsscQgWdlxWomtQ7dvla/GozbnT8ppFTu1t3SOw/q9lQ5TiH6I
         iEO7ZI16hb47B/LQjjD1DR548KAELexRYRVGhXB0sRly5DVkcb8IoWiV4wPRKN6K0Abk
         LMKuiY5pEKkn8Fo9kmyCqauFSpdx1/5kCwvpwudCqBnuPhN/qZCv9S1FN8vits4Tdoaq
         rbzmRX0fUGSLs9lKK6lSl/vM3gjmnSw4845yB9Z4nmD89dUOokf4Ld4HFG6Q0OU0Uukb
         +GLQ==
X-Gm-Message-State: ANoB5pmeELwi54UZs2CSLsGL4o2nfeSGBZtLNCFUb+48ud1kw2UBBzAA
	k4mTnXB1COv6BCw8xz5HeHlTAyfTSYSqWxCLkf1hzqn/+rQ=
X-Google-Smtp-Source: AA0mqf42dvxJBRQQT7O0dcZUagWtL8BrBAhFitYu1PyZeCra29zhuIPUzIsJ4lkXvJJLpEhyEX0DTcLSP5pWPcbHQIQ=
X-Received: by 2002:a05:6e02:544:b0:303:9598:a121 with SMTP id
 i4-20020a056e02054400b003039598a121mr1825294ils.48.1671187338690; Fri, 16 Dec
 2022 02:42:18 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 16 Dec 2022 10:42:07 +0000
Message-ID: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
Subject: Target rust
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 10:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174735

Does anyone actually use target rust? I thought we had some test
coverage, but I'm failing to find it.

After the thread on stable/beta/nightly, I started playing with it on
target and so far have:

* we're missing the rustlib/<target>/target.json
* we don't have gcc/binutils in RDEPENDS so there's no linker
* no libc-dev/libgcc-dev

I'm not sure how target dev tools ever get used/installed as it's not
something I've ever touched, so maybe the last one/two are expected?
But the missing target.json just makes rustc bail on startup - looks
like 16b4ac3f558f ("rust: Enable nativesdk and target builds + replace
rust-tools-cross-canadian") might be where it got dropped, just
checking.

-- 
Alex Kiernan

