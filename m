Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE63C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:55:45 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.55521.1718628942290064309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9CJxaUr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c525257feso5614275e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718628940; x=1719233740; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MVf2J505rBilzGspQVfnkhZxzIgpsQ1h4mVOPqtpepA=;
        b=J9CJxaUr0dFjowO6nj1KOX/ixA7fhLc5683OwS5aFkeboVVK3+ynoKZhn3UQ+z1ilB
         W9j52Nh8tRHfUbXL8M2kQKG8Hyg5R1Ql4ki6RJd668lZDPhSU53rbvOwrsx0TH0OSY8V
         ZiLjxNtwUSdmdUtNMlwPgNtjufI5qwin/dekC12fj6WuRDkEZ81DBjAladkXRBAz626h
         8UUlz8CEouHffgI5jiPctQfppCgLSTOoTLUt+YA1jK9omIxZE7KtoX3pHgZjEFro253v
         MkBDWZxsQ+6NjScYGHsUeGXUtGiXmmKrfclDFxw+HuTOscxf3kPu6ONJYEjq11tCxCmW
         CbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628940; x=1719233740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVf2J505rBilzGspQVfnkhZxzIgpsQ1h4mVOPqtpepA=;
        b=sTzNEKcKmNYZ4wvNEpG4GifJUrXoxj8lRBF8ie39vmqjzrhuTRCPRNanP8wlBJ9CR6
         povHQRGRD2z3vCkssvAag567189V+UgrRcF44m0ixxyIpPfkc7nmUrWaH4czrWb0TEaZ
         sX5VPKZXcCE8KLi5rIE9ZVlzIDwFb7NlKOST+k09nguDn1yJ229wKJjLtp6WD8QaF1+C
         iUL4yMMby+NmY7q/RdSEfgJ4pEmf62fNW1HBengXKFiBiIei3oNmtLmAXy2X1QUW1yRt
         YdScvVcoMZUqqGXyG7ttph/CMdpRsjV0qH5vLS+7+JH09oi7zJNbmiQgThBCUTdBTjvM
         5wYw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Mnc4s7Sel+UvNHYJAI+5stKrtpGZV3GuNUgJvhSnA59ekrVaYDWov0yd7rdqMwW+7XRSYQj39xHLV4FdQ4tH91Fx5wGNpja5ZW7NIf9rigI579UZ31NT
X-Gm-Message-State: AOJu0YyIyVLRSNSK1lTuagmvtIc2WXZiVsd6lcBdVlXR3fx56gDsTFS/
	OeOexS7zgtqO+MzYvi2rujxHy8kf2LYHaRK8G87T8A60aPlZ0rEk2XUky7r82voCo9h67QQmeDM
	tOL7jC3SxvdFeMhwSwmkc0CrAybk=
X-Google-Smtp-Source: AGHT+IEdkagyL9pq+9OIzOCqUzipim/hPpwWiLeNHjfPfzH0ujiduIRf44giAYAeD/a5KQm71VPnTp4mhCCiyLNABlI=
X-Received: by 2002:ac2:4e04:0:b0:52c:ab2c:19d0 with SMTP id
 2adb3069b0e04-52cab2c243bmr6494951e87.1.1718628940182; Mon, 17 Jun 2024
 05:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
 <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com> <be5f8301-f4a5-45fc-b784-9209d904c591@prevas.dk>
 <CANNYZj9QZPAm+3kow-jxW6XZi+hZG4BGiG2F2oB=_tBqhC1-hg@mail.gmail.com> <e9960d69-16f1-48a9-89e5-037df6530357@prevas.dk>
In-Reply-To: <e9960d69-16f1-48a9-89e5-037df6530357@prevas.dk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2024 14:55:28 +0200
Message-ID: <CANNYZj-sV-Z385_NxMqawJ-+76QNywHKLHgpaR3iz2J1LUv89A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] findutils: split into packages
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200835

On Mon, 17 Jun 2024 at 14:29, Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> I really don't see how this is any different from any of the dozens of
> the existing recipes that show up if you do "git grep 'FILES.*bindir'".
> iproute2, e2fsprogs, psmisc, openssh, mtd-utils and lots of others
> package binaries in distinct packages (not necessarily
> one-executable-per-package, e.g. mtd-utils collects the ubifs and jffs2
> related ones).

Yes, there are a few recipes that do this (not dozens). There are far
more recipes that do not.

The given reasoning is essentially 'I can't be bothered to configure
busybox correctly and test my script with it in a systematic way',
which does rub me the wrong way. Usually executables are split to
avoid licensing issues in a product, avoid installing both client and
server, or to satisfy space constraints if there's no smaller
alternative - and in this case there is.

A change to the default busybox configuration in oe-core is a better
way out perhaps? Enable the needed options, and send a patch.

Alex

