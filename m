Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8943EC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 20:18:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.24211.1715890699843283901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 13:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwPTRmjt;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5231efd80f2so1354830e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715890698; x=1716495498; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27BlKhtpv7lHlDjomYHWMz8pEwZj+55OHIzJpnE7BwU=;
        b=hwPTRmjtdAePiSI07jWUTOcuA+/xwOiSvBHHPbofAbeeW1iSRCmY7wqa8CSQJlfgkL
         fDZMwWHlz1B068QA7pDyXWxqLhnC0ExJEaTL/kLiZsQ3xHjOrwuFVYK8qUuf6Pgum5iX
         6YmX/ceyHdqQ7tah+x7psr533n61Xkgjg/Uum+EGGPMVEt3TsF7NXQm2p+EBuAI5fCVh
         9Q1UngzlpIBrCqLr7Pa3+bGGG45c19BfqxDTOWsDw1DzCij6hn0lGD7ms85FGN5ovLAo
         ghxH4wL3HP7ClpBx9tbf9RrRmWwHmJKAQdiDzBJnsusN+VNZhAW/ddI+iEHCZKyP1sLu
         MfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715890698; x=1716495498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27BlKhtpv7lHlDjomYHWMz8pEwZj+55OHIzJpnE7BwU=;
        b=bFz+BAUSbOzihwmWxOLN/yEX8m30M8FyW3FH2UnDK5Zf/ByIc1+NnQc+K1NVVrhwZ4
         JYezVwdvVa/UjkdHZ8lS5O+GMad6YCeG3KiKCxryA4EYPEHZZEMUUxuiGWQmuizE1UDT
         1P+7wadEnDQX655Ocac3qc3XEcDK0Ip0/0VoIco/W+qLcBUqa4lJq/S+MNwAOcu4zQL6
         4WT/NCITLW+4aaGS1BgOK4ngJTOFXF0U96Yh92mB5p8fhUxIvXlNf4GfCB6Cok74SXWa
         6UonE+XEGF6ZNUmFL436Zw+vQWO7THWgOFk75qrD3+P4MaJ5xm4dbqsQ/JWG6JnI3gu2
         fhOA==
X-Forwarded-Encrypted: i=1; AJvYcCXrj+m9on7gKHhL147EQ0j/W0XpNAuWv+bYo1fBhjLEZxmROM2ObKFSAlJ8H4sErz/APONwoW6HlhXddYvw7ZX0TTCCiPPdCuO3V43s6BHUiB3IM0hPfWco
X-Gm-Message-State: AOJu0YxV7QkLWuiw6lsBs8win8cUEaOr2TkMWmPU+jNnDtVbvW2I2nd3
	7ojtEKPo+u4LBggJ7YMX+HYwYY8n8vqvoCykYKae6hEpUa8eFBg/lx5eySoOidZhzMEHsUl/cVd
	HA2d+cj1sw547ZNiqoc7jiEOw718=
X-Google-Smtp-Source: AGHT+IHIz2a6c4L3NcmRtW7L8QEpq1wbRDsc2Pa6Q75Q/1tOp9XkKsbm32vOMhrKg+eAp8DOi4GL2FG0kSzoE2Ogzso=
X-Received: by 2002:ac2:54b9:0:b0:51f:d72:cd2d with SMTP id
 2adb3069b0e04-5220fc7aeb4mr12042732e87.22.1715890697769; Thu, 16 May 2024
 13:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240506074548.16296-1-peter.marko@siemens.com>
 <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com> <CAMKF1so3hkAxZM6TcG4eq+JZUxOJWuQJr53NxZG=4nO+-aioGw@mail.gmail.com>
In-Reply-To: <CAMKF1so3hkAxZM6TcG4eq+JZUxOJWuQJr53NxZG=4nO+-aioGw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 May 2024 22:18:02 +0200
Message-ID: <CA+chaQd8Gmf4=K0T3+G-QvvY+uD59iOvtcZrgpwdcM7Ny92M0w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] glibc: correct license
To: Khem Raj <raj.khem@gmail.com>
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 20:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199498

On Thu, May 16, 2024 at 10:05=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Wed, May 15, 2024 at 10:29=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hi Peter,
> >
> > what about BSD-4-Clause-UC, BSD-3-Clause, ISC licenses included in glib=
c.
> >
> > I've suggested to add them long time ago in:
> > https://lists.openembedded.org/g/openembedded-core/topic/91285771#msg16=
6005
> > which resulted in:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D28007
> > https://sourceware.org/pipermail/libc-alpha/2022-May/139167.html
> > but the discussion upstream stopped shortly after and the oe-core
> > change was never merged because of that. Maybe it's time to re-check
> > and ping upstream again after 2 years.
>
> Perhaps yes.
>
> On a tangent here, but I also think we should use
> https://github.com/nexB/scancode-toolkit
> to extract the license information from source code itself to update
> the LICENSE field
> in the recipes.

Yeah, we've added it 10+ years ago, because Blackduck or something was
complaining about missing license identifiers in:
https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f91974=
799046975fca
then I've dropped this 2 years ago in:
https://github.com/webosose/meta-webosose/commit/95d7c2798d6f0a7a227db96317=
75eff7a2928596
after failed attempt to upstream this to oe-core and upstream glibc reactio=
n.

The LICENSE information in the recipe isn't complete and as Peter
wanted to fix "or later" part I though he might be interested in other
licenses as well.

There weren't many changes in:
https://sourceware.org/git/?p=3Dglibc.git;a=3Dhistory;f=3DLICENSES;h=3D5308=
93b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD
but the last commit looks interesting.

Cheers,

