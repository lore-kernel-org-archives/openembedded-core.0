Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B30CC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:08:19 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.21268.1747912098619816003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 04:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxLsnlqL;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so78483576d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747912098; x=1748516898; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ayhs1LUMz63ssWSCxNaqmCS2/kos7q3Tm+wV5O86kys=;
        b=bxLsnlqLqLtyM+1widx8nlvR2Mw6qnoVRSUOfOux3u4WzI8hU+XljFl+49AMDwHzbX
         b5n2xNe6Mp+JKZlUOc9ov7BjdkivItlaZcoT5dfG4/PmmPA1btHSXj65WVEytljeYd5U
         Yp11TnN3kZt96BPpzsfwduBbl5oT8hwSg1D0W14g0q3jd0vG4l2Yf4w+Ew55K8ozp5Ky
         lnN+ncx6vafg7q3eqNJLoBlJD8C7UBuqIzdR6RUr1+lYrpRYmvz97XKcQesB6FCOvtZx
         d5T7EJH0O1mRd4BTaH1lNAqo5DpiszFrsCH0RSJmtNDGm7MQ+NsF5mWNpkCy9kcs14Es
         XApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747912098; x=1748516898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayhs1LUMz63ssWSCxNaqmCS2/kos7q3Tm+wV5O86kys=;
        b=uS2ThNHG1yXrRYi6jJ5XqOy3fsYBYj1Tg3o4bxC8/u74LT1sYy65dwb5p33o4E9wMi
         5hjBPl1iDXJCh2dRkA0gy4wBG7t6FnN8r5YaEBAeK2vBEhNM0M6zh2f1pZWC2pgRu1dM
         fZZrh051KtkYZdYbLh1pV502+M08YXy86xjrw5Hzno5QpgFKHz9HwdUQZkL7LzMH/q6e
         2QtmUD98q4ujGRuSYxVJdlWdpsDT0o4Ki+qbm2AELFl6KgFDRyajbu1IXNvSxkiaZsAs
         OOLgh6WLuFM7+UsZVZ4yY9kJIzBeMWfW3uL6R2IhcAa07hfUw9tZshurt8450qxqzCKX
         QVsg==
X-Gm-Message-State: AOJu0YzPA81PM81qOLrOU34PsRY8rKQwBDRqIRIaCGULFkh/2qq3DV58
	xb7el4KqJPDw0zO9Nh9IayizvYNd6WwIrfAhedvenEAo9HoxUv/xWeH9/tKeMi9DjVAY4K+kYj/
	qjIyOqnZaWTCNaIsN0PvntI622mnyCcUGxA==
X-Gm-Gg: ASbGncsuOyAX6Bla98UwaaEGiIW/yMiAQ65PKCzRJfZnp9f33QmR83TyP0mrYf42wGY
	ttd+U+g/WQEOtGhHv9whAwCOSC4tFmiFZtn0CqZAksPnWQmCN7p9T2cXoIQpfCwS1AkJB7auP5k
	+7earAi2lguwBgAG2yZg3cUmuDNcxVMq4EQg==
X-Google-Smtp-Source: AGHT+IF9cldj747lSQP3UsgZeSwNHjJlH1cqGWcJ85Ka0JIAN2RxYPM1QWRReEeU5OE1fb/5ZLqwfQFfCNc6Z1X5+aM=
X-Received: by 2002:a05:6214:da6:b0:6f5:e2b:988a with SMTP id
 6a1803df08f44-6f8b126373emr397728336d6.13.1747912097675; Thu, 22 May 2025
 04:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250521184906.181219-1-mikko.rapeli@linaro.org>
 <CANNYZj-8WFy0CWocfy911Gqc4nKYOfyZt4cPKx8PizOZxPNc+Q@mail.gmail.com> <aC8DFDTWfC_xGQ8s@nuoska>
In-Reply-To: <aC8DFDTWfC_xGQ8s@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 13:08:05 +0200
X-Gm-Features: AX0GCFuYDgnzpgUR1Cso6xaOo7wHo-I6T1nnpqunxUplmyKuCpxiMtWjTtyOClc
Message-ID: <CANNYZj9kdZm5JhoH50w6DfEWP_AxK5_8dqrEhzCnx-c+-fX0nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: disable CONFIG_BLOBLIST on
 genericarm64 and qemuarm64
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 11:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217087

On Thu, 22 May 2025 at 12:57, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> We're following this up with u-boot upstream maintainers.

Confidence in the patch would be greatly improved if the link to this
upstream conversation is provided in it :)

Alex

