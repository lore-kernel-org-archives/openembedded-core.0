Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE00AC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:00:08 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.10106.1716976802288005592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 03:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyD2rV+Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2347550e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716976800; x=1717581600; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8uhZLTl1rJ822/BFB5I7ZmLK+6kVzmPohHbgZNwWHc=;
        b=IyD2rV+Q8L/h/QV5hX1eeeS5jY3ZV3RTg8o2FgG9ymUKfi30HUlHhBFu+3+jwRravU
         30YAjsQjUGf3pQACnKvrBIaArMQEOb+1ndMRaVTAzfFcgWsAYbEP+b3H2afoPqwA0B5k
         RGA+ltZqa7bPpoPXAp3Bbkjt8HN1iSeAqf+MvvG/4mXO9KHWSSLQeNwECj5CPJyCEw3o
         Rrxd2JNbE8Dvw5ImkpBuF/NLo5qI7S3KLP6mTo4beRQlG24wXx3H58l40YzyhALH/lpq
         4pkVZRCL2j/GhWTR2bPr5kE62My5xxIpNB6gSWNY1Vb6D3rt43ioN2mWznVJx1DyDnX3
         nvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716976800; x=1717581600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8uhZLTl1rJ822/BFB5I7ZmLK+6kVzmPohHbgZNwWHc=;
        b=SjpPY2Yy4akvQRmBZFYnCuxZOFAyUzgFUtOzp1cobMdzORitF+tm2HqFykGnBgyi2m
         ufPoiVTKUW41JwskdgolH1W15+1+OYrdZcsL3VlV/J2mUQZ3eE534fyusii90D0QaPHi
         15QALPhNHtAqTIcB9qJvE6tlfb6ge8wDYaHqqYPAZ7jFJ1PAozN+M4bstVyoLn84EI3V
         Oy4xRbSwXOujM97gU35ndBSytcSNvC3kqll7Azg4zMrQtpWvP+Bof5xfMommQqbMxfD9
         pDm8LemEZeCPyg4tCopIdvicv+FsshmAc0klXzTJMFJDU6I4TZmyyYCJbtYWLPzQsATr
         wWrg==
X-Forwarded-Encrypted: i=1; AJvYcCUMaS5yA94VUd3LOECVU3GC9WZD2IADHXl6EML3AJOfhw5fU7FOOJBViatBlInXMHaYuwRMkVaMjFXKPqnmeoBidSLd1Wi+uq9pfTghWkDRfj2m0O3eBBZN
X-Gm-Message-State: AOJu0YwiFna6QFxC+d8HHUYflLcfCH0Pv27AWvF1brjitXiNoPA8McYs
	Hej6l3nSYTuqtQwecEqsXrpTJCSMsFXkutEvuL6j+F3elXJ99qJTBNiIy3U5P2rB7xvOjzC7c7m
	VYSwv/a4JwUy2CkmMrTT9+qfFXsw=
X-Google-Smtp-Source: AGHT+IGWfHFfPC+9byRUk1RJx/aaiJmk/duX6HANj0eGdGkxOZN+2kF1UgUBzAMVhxF3HeZzw8rjPMgoT+LgFOS3+bM=
X-Received: by 2002:a2e:990a:0:b0:2da:b59c:a94b with SMTP id
 38308e7fff4ca-2e95b1dbd90mr87935201fa.25.1716976800278; Wed, 29 May 2024
 03:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240525050348.2443339-1-Qi.Chen@windriver.com>
 <20240528180621277ecf41@mail.local> <c92cb41a-8d19-6d7f-bd6d-6a583096ac0d@windriver.com>
In-Reply-To: <c92cb41a-8d19-6d7f-bd6d-6a583096ac0d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 May 2024 11:59:49 +0200
Message-ID: <CANNYZj8+BSsHL4A=y5JTE1OxuziwgefoEJDPEVR5BXDvbEnh7A@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
To: Qi.Chen@windriver.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199998

On Wed, 29 May 2024 at 04:45, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> Looking at the contents, I don't think the above fix is appropriate to
> backport to 255. So we have two options:
>
> 1) Modify meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt to
> include the above error message so that the parselogs testcase does not
> fail. We'll then remove it when we upgrade systemd to 256 in the future.
>
> 2) Hold this util-linux upgrade until systemd 256 is released. I'll do
> the upgrade and check this problem again at that time.
>
> Which one do you prefer?

Thanks for investigating. My preference is to wait for a systemd
release that includes the fix.
(they might still backport it to 255.x)

Alex

