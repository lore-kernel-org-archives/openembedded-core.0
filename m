Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6B3C369D6
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 12:01:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.14112.1727265657612185571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 05:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WlTOJjK8;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356bb55224so8986111e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727265656; x=1727870456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EnjGi3n2TFrJrz6/xxuf0o+l4G6eHkCGaeb6FB8t3P0=;
        b=WlTOJjK8bp08QgOMgotFWHRd2d+xTDwfdH6ndsoF0Q2sZ8cmOQ8cpqbhD7ar5kLVU2
         YLSuABFP3TrRR4ls6SIakX0LKfeUUilg6sa1QPwTsQl26UnnNTCHg6GaKGG6LOo5vHtO
         wYixcRGSCT4rz6yjcLgpIs1HufEiCuTMtapakcbjOK3dCqjIIVt798NJpOKZAzLaEaXu
         KtaNanbUDfXkMfUbmG4cYYO7SgnSxbkRORf5BuyEGW4QpkO+5F6t5DVgJCBMz6x7AMTe
         yPHhoQibfv1yc+GtO+DoOmPzUqU5VEXKQg9h08NPfNDwAEsCuDtN4nZeRU2mHH1+HM9D
         n2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727265656; x=1727870456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnjGi3n2TFrJrz6/xxuf0o+l4G6eHkCGaeb6FB8t3P0=;
        b=GA2BBHUp48UoibqC72IaEENdYkFaBU88vXk/K0pH7WpaEt3hj0F+rMbmV8K9Egg+vx
         p/VBskV5CzRR0jCrb4wH8eygbjNav80GKmvkCGvBUAcJk+Fw13ksxptt28j6AK1niocK
         Pz7xcZmcMopAioykaHjlr5Lza50CiIlkTCOKiXjmQQbCtA5rpTcZEEHQP1q6E7CEiTUj
         vi5ZVlnzbIZcwmXWJcOutDyD72yxSfahG18o80WgX6m4wAIuM42o00M5flYSCXPG9aBP
         9aGvKSG+1qSM0iNMXS7dgJDLf7MYHMP3/mGwzVfGSq4di8YaY0V2BmT6muk8+4/Zdx0w
         NZyA==
X-Forwarded-Encrypted: i=1; AJvYcCWqswyY9Io2x+/8yfpGyXaBmCKiVVOggZlqRE8Kf4UBcSYwHvEG1nkm8jXn5IQCdJGtFmKWTJ4IKaiT9MJ+JU/APg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbbENShbG0qZxpMynVZj1aV4RdIHLq0FCQ5paNtUfq7G5XSptr
	Vd9L/vxIH6IUyYP0Zo9cWLrfFGPIFwqAqhqo213QVY9QIPHmCbXyMP95Uf3GztWUMXRLQ5rz8t2
	7+CQOTps+KWu0/97q+6q3Rg5ayQs=
X-Google-Smtp-Source: AGHT+IFR9DEd9zFAp9VXWJe2B4MINPO7sTYgazkIYxj4uEFIn9U4I5Rvvl43jtwbK44LvPpZmkIprRpSUeE4NoSZkUE=
X-Received: by 2002:a05:6512:1151:b0:535:6033:265f with SMTP id
 2adb3069b0e04-5387756633emr1420009e87.58.1727265655434; Wed, 25 Sep 2024
 05:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240813031628.1123492-1-tim.orling@konsulko.com>
 <20240814225104ed116094@mail.local> <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
 <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org>
In-Reply-To: <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Sep 2024 14:00:43 +0200
Message-ID: <CANNYZj-KdJNX8g=RKeEhWtSnC-1jk9P5wPik6Js9NM5VYPyxHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade 42.0.8
 -> 43.0.0
To: richard.purdie@linuxfoundation.org
Cc: tim.orling@konsulko.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 12:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204948

On Thu, 15 Aug 2024 at 10:08, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> They don't look that different. The RECORD file changed and the lines
> look to have changed ordering as I think the same lines are there,
> e.g.:
>
> cryptography/hazmat/primitives/hashes.py,sha256=EvDIJBhj83Z7f-
> oHbsA0TzZLFSDV_Yv8hQRdM4o8FD0,5091
>
> and
>
> cryptography/hazmat/primitives/hashes.py,sha256=EvDIJBhj83Z7f-
> oHbsA0TzZLFSDV_Yv8hQRdM4o8FD0,5091
>
> but different ordering.
>
> So the question is what is writing that file and is it doing it based
> on something like "ls" output which just lists the order on disk? If
> that is true you can thrown a sort in somewhere...

Note that neither is sorted. I just built this with the in-progress
python 3.13 update, and with that the entries do seem to be sorted, so
it seems the problem will disappear with that update.

Alex

