Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC9FC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:29:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.88401.1674772180452008232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 14:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nWUKtO4R;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id me3so9052899ejb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9omRTC7+9dgjzAK/a6urshV0tHH6Rxrkyc7eEKaYDyU=;
        b=nWUKtO4R9v+NLt1K2+8GtAXCwyiCHwXUWNrqa15dNaJTJySp7g9rOv5yzdqVhTWYSs
         ZRUCGzWZsDF5XgqOUt1HZYVHD8GZHTbKYxI8Uw7Z6z3vQX7/8fBGIaaivyXOS2irgYEB
         576byzQnJGR/UNqO5WA0CHY73izymtV6ZQ6aPOjljPXcgUD8ZvTeoHfzlgsO6Rd/ZYwX
         0VBhX2LGjwHce5MpMGN7JT3Hol5Q0C8voAGwHZAw6deJYT9HXubQIKVIQRgaab2KQ2Uq
         o6Q4A3HWV4GHQp3FfFYue1uzo/8pnNwjcJBzycmksdTCy1zpa0rBQyOFU2JzJXLri9eq
         ICbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9omRTC7+9dgjzAK/a6urshV0tHH6Rxrkyc7eEKaYDyU=;
        b=m74RHT4EVNtUXMdeH4UwnLZncggmzSZJTR00Z5N8AH4oiy8uDNEGwkVVGBwD1Fdogd
         y6YSfCB/VhboP8L0bWDabGl/cQokvYyr5LrYY0qrNrhO/V9L7v0SeH8HgpstTsYbDHfa
         VO1bVeMZuDdWZwam9tGAmOiDOR9tRoN68r4U5s7XDCM/7SY9ezsLnesk3rc0anPRHX0E
         qdEsQ0hPhJOzulbuMPTUof1Azj0sO5qAW1NVpV6tK0hXQuHBju0T5x1lGrqqMzc/pnwx
         IL0aTfz3nb1ImH1tS/DTX717E+OUyxFOtR1Jesby2OsQHyUaBxxJH1h1ZZOILFwy2wr2
         4LIQ==
X-Gm-Message-State: AFqh2kqymlbsI50MEIPSBCGEF9BjdI9HIj4ZyUFmVFjmSBOXUDwMXrVk
	5KlTwgIYpxJ9FWdz8CwMGv1HLdAWjNFnLSxtl/864Q==
X-Google-Smtp-Source: AMrXdXvJv9uLxbUbc0WSq2jnw7sejFmL8trQvU8K+yqxloWr2uatUIM6hiRZVjInV/JVHu1qIF7z9L+PGZEEmMZx7Yw=
X-Received: by 2002:a17:907:2c65:b0:7ba:9c18:11e7 with SMTP id
 ib5-20020a1709072c6500b007ba9c1811e7mr5435678ejc.198.1674772178851; Thu, 26
 Jan 2023 14:29:38 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AOE=ZPFuz12WKBWJPFZhDH0s3zr=NkLV16g1zcGH84pA@mail.gmail.com>
In-Reply-To: <CAOMZO5AOE=ZPFuz12WKBWJPFZhDH0s3zr=NkLV16g1zcGH84pA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 26 Jan 2023 12:29:27 -1000
Message-ID: <CAOSpxdZq4C2A0zNr46PMUGrmvkfM3o06mTnVX-Np1YKv_xQcug@mail.gmail.com>
Subject: Re: bitbake: Backport a fetch2/git commit to kirkstone
To: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@denx.de>, oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 22:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176433

On Thu, Jan 26, 2023 at 11:06 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Steve,
>
> Could you please backport poky commit 2ee1fdb8404d ("bitbake:
> fetch2/git: Prevent git fetcher from fetching gitlab repository
> metadata") to kirkstone?
>
> It fixes an issue when trying to fetch mesa.

OK, will do!

Steve

