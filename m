Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70F8C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:21:48 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.20622.1747909308299503196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMXNxmUN;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f8b10b807fso85169046d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747909307; x=1748514107; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZsHZNFoiGMR6k+l1B+J3AYq8kYDJROdSam6QrqqlpQ=;
        b=aMXNxmUNYXuUvNnu0nFzE5o5wNwFNZDW2N8fP8GBPmRlYKBaxPGv1E8QLjfaeexC5+
         mkErZwAmFxDSx5EbJbD5y8+ezwACtHZdVEIv/axr2TDMwCjft/fjBd1GXPXXRyRe4Hw3
         Nupcgkf/S83goEUPvp1fT8UxTWN9qFJFIkwAAzJGIUBgNXI4wdAQjyto2hIO86J3AF3p
         hG5bT2Hft3haa8+5xbZXJuf4NFC6wOhRUx9kFWhrtlPjG0SIIL5nli0Qo8zLKK5eMUtz
         qRkdDBjW9PB7nlaSSEn0ucCaIUuu79oNtiIaPnF4rSTFbgstg1q4zTwD31IIJe2Ri3NI
         PdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909307; x=1748514107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZsHZNFoiGMR6k+l1B+J3AYq8kYDJROdSam6QrqqlpQ=;
        b=tuseo2se/tsWa9tvpZBb50WYqAw3sE6d9D/JEjbauKUPu03bYhiZWcU5Jwwwt104Q4
         dWQpOMRQHc1o5pY5jym6R6jPdcKwr12kgucU9Y8D8GB1ii26QZh+WvdWHNVVYgtJfxVi
         O0ujYMcj+bezBcTbrhqBCDu3u4hpjD5lE9snVYfvryYtmDfQBTol0AI/YjZomgTymuBB
         doGBbpD7/FzTHkbea3yNlukFj0TE/kB6GHTZGWV+4oqcCSp2etK+Snj8WF+LMUiftqC0
         VZXEh+00PT4aDJC5tbfPXQMA5lR/VfDy6PYnq7xuibxTpkQjEWNV7IHgWBc832h58r9C
         dl7A==
X-Forwarded-Encrypted: i=1; AJvYcCUZMUyJf3y/5/J5q0u1KkU1LJQKujnzhFNv2JBsZXd86tIm1Rqt524J8dVpKRuVfGY4v+/IgI7JL1kTkR/IyN8AlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHBuUVvAGk2xCqE2KkWZF5VvxG26SeXC3Lw2caZDBrzP91jSAr
	KmV8juzRQ1ATER7DcAe7p34I8WctWozPcIapOX/6m4RTydj5iA8KBmAWjVxEERfHuFTXIrQ/7UE
	00B0St4CxyStc6m9bdryxvyljO7NNprg=
X-Gm-Gg: ASbGncvkFLBK4MDuXsWSCeKQ3Na1leaWdz0TvHKPM1YRl/JrYo9hdxNJM2GhJPYnISw
	jcp2OS/vP/Zyhf4ti4nq2QcgWzWw5UUrxvQzdbSaxDx7ID1q90oCPy9jmBOJwS66DR575gLoO9R
	/Hzf9bECEd9FvaiFk+1rSZvntR6AMZTtZJHQ==
X-Google-Smtp-Source: AGHT+IFZmv4zfV+N2gaIIu7l6ccuf8PplrZ+I95lmJsstkztvRaShwtZka8r0GqQ8MGMRzFZlejgrC9Th83N0SiTsb8=
X-Received: by 2002:a05:6214:2304:b0:6f8:8df1:651 with SMTP id
 6a1803df08f44-6f8b084b249mr310223546d6.1.1747909307225; Thu, 22 May 2025
 03:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 12:21:36 +0200
X-Gm-Features: AX0GCFuVLPp244spR2ACmPdYkA5xB8X-ntMoSvMW7xoTFG0_IU457Wsefzd9zvA
Message-ID: <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
To: liuyd.fnst@fujitsu.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217082

On Wed, 21 May 2025 at 05:14, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
>
> Error: Transaction test error:
>   file /usr/include/clang/Config/config.h conflicts between attempted installs of
> lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
>   file /usr/include/llvm/Config/llvm-config.h conflicts between attempted
> installs of lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64

What is the actual difference between the headers and where does it
originate? Before any multilib fixes are applied, this does need to be
investigated. This is repeatedly being asked in response to similar
patches, and it would be good if such investigations happen up front.

Alex

