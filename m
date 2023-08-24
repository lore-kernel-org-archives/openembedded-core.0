Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8805C7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:12:46 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.6844.1692868361456775683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UYw6MTaV;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so61594591fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692868359; x=1693473159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zeQ2zRFjAqfbYxR9LZ0bwGC+I/JZpzQUDfCsl9B4j34=;
        b=UYw6MTaVyKFBxYJ6UaLZpxhCGbwh3MOc3km7t33hdkFKUDslGflazAoKu1ucfd8evD
         QVu+mwljnbjcmNEtNRYRax3x6w1d/U1TUbBGGp7RC4WKD3ZQXZpg5WGFDxuogQuQhuv4
         LvRSWM99igX8ghuRMDyuTF/qmdeQWuargOd0Yd9VS+BIhnwgEUJQExPJKpc1jSVykRxO
         hlN0YM1nOVHDK7ARyYJs4/SlC9vb2XQEMrBhCHLk0gGm3yOTKePzpzkSeLFhzctIP4BB
         UWN+bXElzAvg34UQ4y8bKxTM1wp5xdJExv6Dg4oPKGzfx949UMyH9VUNd7qWXq/n5Fm2
         L3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692868359; x=1693473159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeQ2zRFjAqfbYxR9LZ0bwGC+I/JZpzQUDfCsl9B4j34=;
        b=FVltEkv3Alc6oNRMqdJ3aP7XUg+aiQJW+Orpa+8CYNmVBcrDys6ffWxD+Y1RfXa1IZ
         hZNWAuV34/weXYZa4CYScitCF4TeajIr+syu7WcC5psj2Fz+KAwFpRIXq6y8KLMMXuej
         tGAHJoxFPDgZjy+hWQ+9YC0SmXeQtdoedTVvwFAZYdXG2BOMZrvD5N/r1EAsa7LzYJBj
         wJA6YcjBEEZOHyET3fax3jp5Ci2uiG7fSp0dx4VwkJp+cPqDJ6oTWHPElLElT4Zto1S+
         Vl3xbRE1GDA9HJXGYvg7Vkzwy3KHh9As89uxEQw2USqONgElH0goR7LxncSzAfRX8R+0
         4IpQ==
X-Gm-Message-State: AOJu0Yy9/m7BAH3gzrb/X4893CbZLuI0oxWsP3TSgbFjpUO0v+t5hguP
	v/lr9I+ISIO72mYFpD9d/8WrB9H2U0dm4cQDq38=
X-Google-Smtp-Source: AGHT+IGMp5MFWV33qQSRi/3vfMgb8FYowy8CUNv4PsYr0ocGxTAV0qqdkHh+h+ZuEWSeZfJWlylNCJYrYa+rNH3da5k=
X-Received: by 2002:a2e:8905:0:b0:2bc:e51e:b007 with SMTP id
 d5-20020a2e8905000000b002bce51eb007mr1439308lji.41.1692868359103; Thu, 24 Aug
 2023 02:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230824090414.9198-1-f_l_k@t-online.de>
In-Reply-To: <20230824090414.9198-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Aug 2023 11:12:27 +0200
Message-ID: <CANNYZj_oj1JDbpTm3ev4nKGKr7Or0+bBiWwg=6B9-oJdhiOmFA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] qemu: fix libudev packageconfig for systemd images
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186651

On Thu, 24 Aug 2023 at 11:04, Markus Volk <f_l_k@t-online.de> wrote:
> -PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
> +UDEV_PROVIDER = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'eudev', d)}"
> +PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,${UDEV_PROVIDER}"

Both systemd and eudev contain
PROVIDES = "udev"
so the dependency can simply be changed to udev?

Alex

