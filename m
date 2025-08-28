Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAEACA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:51:15 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.20231.1756385474164739680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTFUwv7H;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-70ddadde48fso8852926d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756385473; x=1756990273; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=20c3wVp9k5Q48RR2eDg/f+H+7ceI+6daJGi99e91sGA=;
        b=KTFUwv7HzgWQ1Hug2MGbt4M0gHWr+6pm3mh2KwaEs0skTGz1QwT0xABDpYeH4tFNCd
         eCe+qrKIHJkLWJCZfih7yOH4O+nficf6F/LeIQwsLrIDkxwXkHwL6+mB8WKL4krcfloR
         nbCr9D6StUHJHIBeZ1vFvzfusJgIF2ulgzlLB+zu0UZvntfz2St4jXju2/CPsrWVgYXq
         QYovzls1LNcfxg30S7Jkvr+G1Z6hhPhWse+Tpp61AykB+amI82+gQomIF8bMUEE3/s+P
         /wH1Z03ilbCWU+mZ9t6govDthLtb4wfpJ07ukdjnIY3Ycd1aTMTOKI+xFDHoggkbwH1D
         tecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385473; x=1756990273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20c3wVp9k5Q48RR2eDg/f+H+7ceI+6daJGi99e91sGA=;
        b=Zxj5efs5jNkZEnVpErIAOYbBSkOu61RkkxkbhARgLYdGCnZaPBZvlK8jx2Tnz8dnEe
         /zyYf4a17OuCgeYNQBGHjcZuYgVvGmVQNYpBXuTc1/aj6Q4BlN/X2vj/OBDUjf4w+FAx
         a3XVbPut/xAsLPQVGu/+/l0yAF68fSyiSPHWK+ro2BuWYQknsB+xc2GrVw3rLMWk6VU8
         62Nb+E7eArM54+hxD/nJR195mhxPyVLfIZBNMUYDrQ83I09abFmLmBfk8duW+oNnVrIb
         zeB5ti5u7F1fCfpDFHdL30eh/MP189FiJnd1ytr5VCZceEG6RUjW+YRqXfebP82QcwBN
         nc1A==
X-Forwarded-Encrypted: i=1; AJvYcCXBRNa36cD4PXk9573Tb6GrCjHucfvcwm/VazNJh3dmusRwCAJXWbsFVwvYkf+fI0PlvWlSY5pRFEVenAKw43cnZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+FS7Pt/E4tkIsr4tsHSe0+J5IyRRvWD9ByRwGQS9cdbOluert
	h1wwSOiPQZLQDZ37em9cCeVkJHNsV/0BvJhe8zlCCCs8DlNtuvxGFW/7FcxdOyKMMr/p/tdWQ2i
	c/vbeAzzBfAPhDtqPR3lwVtnUxNRu1XY=
X-Gm-Gg: ASbGncumw4BGt4UyA5KF0M3IBTTZSGEiQb/ewNc4pUmLB3zvOaOnzz4p2YLYJm2mHZ7
	YoWXYuLKj8nf7w0jNyEGTM3WBU+zXoH1/bgoRo14ktxn/me3upKKSuRD5kxGDfFAFSCYBBicvIk
	63N608vpvYCDcqa6vTEXKKLq5cZhfMSF/wc88ZhTw2ce00xNCO2Z8RqZSiqXO2p5Zr0anC1fV5H
	3dR/A==
X-Google-Smtp-Source: AGHT+IETmpsNHaFcMgD3qih3S6QxjWILMSF2seGrStwqpwJiRTFrVJfwUEeLeTnZQ12oE0CxiqkNMnkH1lkwl/J8TRs=
X-Received: by 2002:a05:6214:21ca:b0:70d:d779:9a5a with SMTP id
 6a1803df08f44-70dd7799ed5mr100329696d6.3.1756385473026; Thu, 28 Aug 2025
 05:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com> <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
In-Reply-To: <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 14:51:00 +0200
X-Gm-Features: Ac12FXzjWjaVsJ-HD5_iiZMqn44e2anx_4ZHR4fcJFlLYN4Jheyo4RC3TQicwXs
Message-ID: <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest support
To: yoann.congal@smile.fr
Cc: a-christidis@ti.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222571

On Thu, 28 Aug 2025 at 08:56, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> You should explicitly return 0 (if all tests succeeded) or 1 (if any test failed).
> If I read correctly, your script will always return 0 (success) because the last command is an 'echo'.
>
> See https://docs.yoctoproject.org/dev/test-manual/ptest.html#running-ptest (that was added recently)

The documentation does not impose such requirements on run-ptest. It
can exit with 0 even if something failed (and many run-ptest examples
in core do exactly that). I think you misread the exit codes for
ptest-runner.

The only requirement on run-ptest is that it prints PASS and FAIL markers.

Alex

