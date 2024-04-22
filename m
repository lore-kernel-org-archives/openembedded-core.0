Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075DCC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 10:47:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.15580.1713782829274545175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 03:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LgavFyFT;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so73820351fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 03:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713782827; x=1714387627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HybTQwEUCOS+cFfEYkP9p1gEJXqbpMwVc9HT/9UC+kc=;
        b=LgavFyFTb5SJG7FluXToM7CvRZ/cXUSQgyq6BjpQAR7TEhG12l16xOiR0/ZGZsyXDL
         gQRe2W7QFykAoQnx0c6E8kAURtPstYK9DjwswZBHxZRBNnBU8znfHWbEOIX1eTud9B/y
         MsbwbqCXQpdQwgvU9+E+U91tD/fZ3Mh71tgfEMmEfecKclhgl0AidycFqHvuSN980Tp5
         q0O0OG4lghhnkF5l8h6usq9TSzj2etAokMFcTPrdlElRRYifx3yhpfr1rkmi7JeGeMWr
         nIzzLODDBtbmJDbYpoNVrDQ0rrF53R/uS9uaSxBVIRxUrhBPcsfWT72pdPM6VYNbQ+J5
         1rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782827; x=1714387627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HybTQwEUCOS+cFfEYkP9p1gEJXqbpMwVc9HT/9UC+kc=;
        b=hezZvKeox1+eEM+u8xy/BBi93jGyHJ3ySmjaecGT1XnoHBvtH4pj2ug1QZfmhE98Z6
         ctiZcEdDgQfoDZ3IFo/eHlt/h6mXnkZFLTfRGvhyoTO0GUNGQ+V7CENAyJGTtz/SvoH7
         BsRfFwlYeq9ttox7gXoCZE5Ibf7/ImqS+d5CrV6qn8AQ5HUnxSEoTXf6xUDsxYaltA44
         6jPidYMf3sz5GktBKG8isVc7CTznxvbO0ev6ra/JhmKBzkKj8fRdyVQeFxRFroT61OuV
         jYFX0ZL42Ry/KfY8+6JGee3g3IhXXRAZ8arwh3+4izcfzGYtnvTXSKExBWnnH1j87/CT
         JqJw==
X-Gm-Message-State: AOJu0YxLubPb4mph55uDj+n6hhA10eQkoIdpI5SL1wHizVcmkpp0U1rl
	yJMTmThoZbBXmG0SV6XSaSgkom6xEelO4BCN+6Aq3ydelTTrjCY9Sp1Zq06tAoQukPXyH2a75Dj
	pyOU8EYMfKLthBopWa2Hk18naJ4k=
X-Google-Smtp-Source: AGHT+IFHaozoYNtdHn4kAu/AFG/5krAugLFoGgot2mwcFFAdKBIOBjsPixQwwk2L039rRatTxRySFz7AeHNbC/lAdm4=
X-Received: by 2002:a05:651c:210a:b0:2dd:bc53:e80 with SMTP id
 a10-20020a05651c210a00b002ddbc530e80mr1116437ljq.51.1713782827119; Mon, 22
 Apr 2024 03:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240419121945.1920944-1-alex@linutronix.de> <20240419121945.1920944-4-alex@linutronix.de>
 <5e15b3d150e684bde770d7e1ec14806fb33a01d0.camel@linuxfoundation.org>
In-Reply-To: <5e15b3d150e684bde770d7e1ec14806fb33a01d0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Apr 2024 12:46:55 +0200
Message-ID: <CANNYZj89CW=LjyZS9wPUNdakFQwPowcSkj8hj6Hg0mWvWBAPQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/19] swig: merge .inc into .bb
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 10:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198583

On Sat, 20 Apr 2024 at 14:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> This seems to have a reproducibility issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4685/steps/12/logs/stdio

I have to show you the issue, as it's a face-meet-palm-ish new way to
thwart the build path checker:

#ifndef YY_YY_HOME_POKYBUILD_YOCTO_WORKER_REPRODUCIBLE_BUILD_BUILD_ST_REPRODUCIBLEB_TMP_WORK_CORE2_64_POKY_LINUX_SWIG_4_2_1_BUILD_SOURCE_CPARSE_PARSER_H_INCLUDED
#define YY_YY_HOME_POKYBUILD_YOCTO_WORKER_NO_X11_BUILD_BUILD_TMP_WORK_CORE2_64_POKY_LINUX_SWIG_4_2_1_BUILD_SOURCE_CPARSE_PARSER_H_INCLUDED

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240420-_5niux5i/packages/diff-html/

Alex

