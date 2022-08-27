Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F6ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 19:00:34 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.51838.1661626833461221600
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TB5iKdVL;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bt10so6060913lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=SXUr2DNKU/4KSDLCdRCADiuXlVLs/YHIoPFWL6a1RU8=;
        b=TB5iKdVLvEsw80uI1wBHajn6TSqWs+gWCg7bCeg5ZcIpZFyrKW+GmQbhElxq4b15He
         sCY0LyxFzeR6mRQoisUEmeFRw2fb5hT3idslJkYGRS8z0a9TYApSZWqwa/fadh8bRGTq
         vqP9xxQrRzv1/0yTdGrMEGGeClyfXf8MK8raQ156GV69ykKWN3GnhhSz7Tphb4XD3fqC
         0L0mvx0UD2I1fuAw9JD4kD4K+rOHYExJMpk+yHEX9OJyYC8GWmheULPHeU2b9KoAsThp
         YrTQAzhS9bU5u8EGMgMki/BQ7jU7X9z859pKquj+epBv4jpHxfs51+mtseBDyQP0d12H
         3eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=SXUr2DNKU/4KSDLCdRCADiuXlVLs/YHIoPFWL6a1RU8=;
        b=QKLQ5nmKcCvOV+9HjZeJ+A8SICHGCZ7T78bjcXIQNiA+jsWGdrNAcqU3Pkvk9hes0E
         hVFgY6qsJpdsrnFwxBWWgfBhf8QjIXE2/j9/frbQWeInqahw8v3p0cvawGkwagqixu8e
         5K+1P280QvgS4PiLajixFHoAK/26axVUAHi5qLAN0bqJBMEi2UetppgBsuEZxnj4eqiE
         f2NfgvujbMDYnE0yg5CCi861IuSMIMUQMF7sbvsdLgs5cGtZHVuefreZDDrvEvyhVboY
         DNsPj5leMnGHrd201kyPDFfxgQX5oPPOxnDNWL/3meevip8J3DTE0eTUMAk4amJuJccr
         SsqQ==
X-Gm-Message-State: ACgBeo3cm+22f0MtGrczupYR1kxfyneNRLDOOBZJ1qQW0iLYM/0RbnY/
	juXQrgM2nzRrUy0cKiBSbb6+0zednfYhZJU/0wA=
X-Google-Smtp-Source: 
 AA6agR7fRgF2J+fDt6rBpWjkW5u+Jvj8PwKBDInFqPZD5KFztGfPEFRiM4jq2xLUIohklqUPTkABMNTBwXC5wEbFeQ4=
X-Received: by 2002:a05:6512:3e1a:b0:492:f9e8:dab with SMTP id
 i26-20020a0565123e1a00b00492f9e80dabmr4400633lfv.358.1661626831809; Sat, 27
 Aug 2022 12:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
 <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
In-Reply-To: <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 21:00:20 +0200
Message-ID: 
 <CANNYZj8Wa7-u08yzSNEYUOtJBMYO5hNEiWWjAPjB0ieytSBQbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin@etorok.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 19:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169967

On Sat, 27 Aug 2022 at 20:45, Edwin T=C3=B6r=C3=B6k <edwin@etorok.net> wrot=
e:
> I don't think it is currently possible to limit the number of 'xz'
> processes though.

This is a general problem and has been discussed many times over.
Bitbake historically doesn't limit the amount of compiler instances or
any other processes that may start, and makes no promises about
avoiding OOM situations. If you find yourself in one, you need to
tighten BB_NUMBER_THREADS/PARALLEL_MAKE until OOM goes away, or add
more RAM. More conservative defaults will never be conservative enough
for every user, so we stick with defaults that make use of every
available CPU core.

That said, there are recent bitbake patches to track 'memory pressure'
and (I'm not sure exactly how) try to hold back if memory gets tight,
so you're welcome to take them and run experiments.

Alex

