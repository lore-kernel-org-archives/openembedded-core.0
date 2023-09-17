Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE108CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 19:33:45 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.36475.1694979218453733092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 12:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PWDPmxSk;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c00df105f8so3371251fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 12:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694979216; x=1695584016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9MqfwdU6IRnIi+lN2Ugx68pVn7ULoJCg0LizPUFvYyw=;
        b=PWDPmxSkLe94SxvNv0HZ3W6jwdIc3ReUinLrPTQ9Bw3Q6mvWW2iOuGe8wHbltfDeWb
         MjLqvpxl8IBllG5aoDYqRK2onpg1NyobTIxzDuxsqA2ybflybkcS084ei4Xh38btm9qL
         jeRtgRFYD6qfM29L3bhgl3YSR+wnBQ70lGlzWMg5HhoIeXzr7FbqSz26j8tCVigfL29w
         Pz9NgVJU0U7G02A8VNxYUMUY7trzq+NVylpOGxDZrid3Iwn8no5fDgo5fKgf/v/NWQcy
         3zVe8DmrhLfwg58clTGosH8IPGjv6Rp3HCBaaReNFRo/AK/T7kfB5CEWwCR6vQIqzT0y
         kYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694979216; x=1695584016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MqfwdU6IRnIi+lN2Ugx68pVn7ULoJCg0LizPUFvYyw=;
        b=oFaPBfGQCvXpcOGgD0cQDnwml5IE3jsFJcMj+e6xBOJdTkJb8g2104oPdHVUjOR1RN
         gpHbbmwFNyqha7XuKdT+6wKB4+GqV+SW8ZShZcYyJOLDIJMyWKJA8Gwi1r0tw/+iojYv
         zNaoIM/ohyv27L3W3b3twOhom36lXzxwLw59BKqC0XEkb8+y4DgLdNf4ltNyTS3rVGaj
         oRet7q8SVBNwCYaAdU6U0pigUJGuxvxZaJxsKi9FhmYUCWdjTWxIxkZvofX5PqKuVyej
         pDyan9XiIYiKcHnWu0h2v+GEDmaNc7sK3TvudV7URusVvmD23zunQMap7+hVR9Y3+/na
         YlRQ==
X-Gm-Message-State: AOJu0YzNGXo3sES4VulXw/QfE0lJmTxZHI+dCi5XLYD7WVrxKhu0Fjy+
	Mx4dky+qLqHid7uZGnmhbIK2lbOU8Td0N6/ruvDpCX5m
X-Google-Smtp-Source: AGHT+IEizaGbp46S9f5fskn8Pwa0K6jvkzXnnlc8QlhIo0Df0Ov7g0vA5PfNFCEUtMPb75hLq1F5uaLOX48Y2jxR17k=
X-Received: by 2002:a2e:330b:0:b0:2b9:e304:5f82 with SMTP id
 d11-20020a2e330b000000b002b9e3045f82mr5889066ljc.13.1694979216185; Sun, 17
 Sep 2023 12:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230917093901.428214-1-alex@linutronix.de> <20230917093901.428214-8-alex@linutronix.de>
 <CAMKF1sr0p49ESE+KRmS2j4NTYm-gxDQ0YJejjpa+nDpcK61WyA@mail.gmail.com>
In-Reply-To: <CAMKF1sr0p49ESE+KRmS2j4NTYm-gxDQ0YJejjpa+nDpcK61WyA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 17 Sep 2023 21:33:24 +0200
Message-ID: <CANNYZj8o0U1ScpgC7+y9qK2x8XbuADxTEg1MS7Fz10zQPqm54w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/29] strace: parallelize ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 19:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187817

On Sun, 17 Sept 2023 at 18:53, Khem Raj <raj.khem@gmail.com> wrote:
> core-image-ptest-lttng-tools () - Ran 5 tests in 2086.423s
> core-image-ptest-lttng-tools - OK - All required tests passed
> (successes=3, skipped=1, failures=0, errors=0)

I tried to see if parallel testing can be enabled easily in
lttng-tools, but the tests started stepping on each other, bady.
Perhaps we can revisit once upstream makes a new major version, so the
code we use and test is again closer to what they work on.

Alex

