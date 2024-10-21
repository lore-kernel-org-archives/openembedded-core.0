Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CD4D0E6EB
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:36:07 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.43410.1729506964737136187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1J+eYd2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fbbadf83so5380833e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506963; x=1730111763; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EfjiKJxf5ByLxLpYuPapShuSERSAjtTgliQjOjvFw2Y=;
        b=D1J+eYd2j8W4o0ZyfxOzg7l3vVhUeXjAA+psoEqA0c1LVKuZia/BbnZJfTleNk52Az
         5PMlPb2ML+7bCF5vzoKvjX+iLAreVTEEG2nKli8ZPN8+woBq9SOQepOb7QbUvUx6n11N
         oV/Lc97j+Ay3eA3Gso/cdpHqXrQDYTHQsAPwRUbXrviDRUSJ37ohhQ58hiHhDjqh8/Hu
         NC6x6nSLWUjEWMYuzMXmjJT4ZuQIE6KZcbRl+cBlkJbC4Fash27eCLHBTywa+U3uRKaJ
         ebm62tQ3Mn2DvQd4hy6I5wkncq8tLy0VSBL2sV8oKdzXY36+KDDDd0Q7jVN1pUJ8j549
         U+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506963; x=1730111763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfjiKJxf5ByLxLpYuPapShuSERSAjtTgliQjOjvFw2Y=;
        b=l2mY6V2fDM7Xtkv6xUL2KrFjZA20atyx8WzQWNhOwYEP/LSBaA87VDHe1HY77ccjfO
         FhDzhXE1JUDyYnimKluqJ22X/JEWsfp2iSddURDg+8K7mHhxf8ZMyHAfZYc6X+D+lX9l
         QEDRoKmP2OwljJR2htMzE1JV35UgeQPC31KVXk3LgVW4W18O/iDiB3rW7QuSkp6BYa2h
         dBZ9lFFBNyGEiVkdly0gD+pQJSXY8+BH83pU6cXESL+QTgwOdQblqoF42z0feW9wWVpm
         /z7+uSM4Bi8SJarFwGca2yLKUSV+4UXVqcd4gleIHdhpjZwXidK1xz24wnSLmseXGzGE
         3Y5w==
X-Forwarded-Encrypted: i=1; AJvYcCXIgNPtXh5xDYFa5ymEBBhzPncHWa6zSwKmoL0KV47GGkfJdBeImG3TKH64EeGkluzuGcyUMQ0CXsk5ZjLQhOxwww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHEAwyjukpcQQkuF4dNKJnU24h5tpNPjy1eB5/LQQysOOyz+1H
	Oht2QvW8H1ul9YljXxDNo7U4PvRXwBUJdsmJKuXv9l8WrqefFcJIlIPAwQ4f1RfBGVR4GA2mTyo
	dzYi9N27uRNyvDTrbQRk7XU441rk=
X-Google-Smtp-Source: AGHT+IF5nnBwUE2+A1AYZQrIQexGMV8me9DmJ0BBP1iAI1tgbAhrb/M6/c3yoAQzSDNaMYOI6ZzJ0gks4OeQentX/z4=
X-Received: by 2002:a05:6512:3d08:b0:536:53a9:96d5 with SMTP id
 2adb3069b0e04-53a15462371mr3992610e87.17.1729506962632; Mon, 21 Oct 2024
 03:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241018092605.219447-1-zboszor@gmail.com> <12b5b746-3a77-4f0d-ba61-e28b9e5ea136@cherry.de>
In-Reply-To: <12b5b746-3a77-4f0d-ba61-e28b9e5ea136@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:35:51 +0200
Message-ID: <CANNYZj8jOZdGnAFwaRx+iOFgNcaM82DW2q6N-FQHQf-MqBNb+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: Upgrade to 20241017 and
 allow compressing firmware
To: quentin.schulz@cherry.de
Cc: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206108

On Mon, 21 Oct 2024 at 10:38, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> Which build issues?
>
> Which breaking changes?
>
> Please extend the commit log to provide more info on those so we know
> what we're talking about and if this is indeed the best way to handle
> those issues (now, or in the future). Also, adding comments in the
> do_install where we disable check_whence.py would be nice.

There's now an alternative patch for the version update which is far
less invasive, so I'd suggest that is taken first, and any
still-needed changes from this are rebased, and split into nice,
reviewable commits.

Alex

