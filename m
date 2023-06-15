Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE80EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:56:10 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.16107.1686830167062464000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QHh06/UT;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77b94cc4101so101901239f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686830166; x=1689422166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5LzM8yXwcro6BoOhX8IhkRaJbxGC/sWKH+Z8zUFJb0=;
        b=QHh06/UT0Db8vryiLZY+MFdJLxCrOVzXz8thg/ZPcWN+IDf3hL8Zd4eyAcl/YCcaTY
         2TDMhcVxTdu7o9EPi9fClKOahLSNG3tmiRYcCajuMQ+9D9UyN4O9fPv6XekOOqi/LUkS
         Du5cziGCSoW3L6F3ZEwTTYYBa13Plczi+M0kQ+zWh397YCoHFlijLLAEZ9OQX/eG1C9y
         dUg6Eilcgqygmpo+eba8t7vxYan/Vyufl0eptF1By/1xA9vcp1yMZbGQnsTFg3nhuQkp
         A/xNLvYGipLFSp+wcHnL8aNqkjL+kOW8L7noRnfuNlNYtwgAzFaBFnPZTKEyIURpXsXs
         nscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830166; x=1689422166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5LzM8yXwcro6BoOhX8IhkRaJbxGC/sWKH+Z8zUFJb0=;
        b=jIcLevFCRKzIbid6rAgQB4b8xZBHOnDhWlgVfm28QIR/1Okk6uPWN2QgruhOm+HkjO
         OdhKhdcD4DDOJi/2+jalXw03FZlMisBB8EcbCnYb6LeUakdVc+sr8QM4NswqSlK/EsJp
         Ox3l7PQTxOZqTRYeDr/7DPWByWDGxCl5UQr+sJakIF9Ihji2HbGh2CMbhkdm50Jq6Qaq
         8HmDtAjYegNqGOtGWnrrTKf0VV/xn3R3iq5SWsXJcWJpKADRFoptfs6Zx5DUbkLbCw5f
         l4naEJZ2jOLfB9tLPl7BKIvSmhnQp3lKSnFApbTcKDHKIbGUnly/iZsywM5QMyL6e+qq
         A75g==
X-Gm-Message-State: AC+VfDzSa0ON3n8pITgumR0KLAmGdq8xLJLXKDNP3qhcZl0U+JlJeLND
	WEre44dA/PmV5Lj6YK4yXPUJjsKiv8LKMCA6tQU=
X-Google-Smtp-Source: ACHHUZ4JqYwfiz/tihXgsrkNKarbBsHMlPNMigNOMDaYMX9+zdlqI5zjYHdkj9GxbP6+2th3fBgbKDY+76CCz2637Wg=
X-Received: by 2002:a6b:7b45:0:b0:77b:1c57:7e78 with SMTP id
 m5-20020a6b7b45000000b0077b1c577e78mr9184922iop.16.1686830166204; Thu, 15 Jun
 2023 04:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230615031608.29371-1-bruce.ashfield@gmail.com> <f0d0d2c8dff6107b433e868a797685fdc54cfcbd.camel@linuxfoundation.org>
In-Reply-To: <f0d0d2c8dff6107b433e868a797685fdc54cfcbd.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 15 Jun 2023 07:56:02 -0400
Message-ID: <CADkTA4NjMjufzgPUa1jLzR--t9r9WadOM8RP+WgkWVtJUZ82CQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182850

On Thu, Jun 15, 2023 at 2:59=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-06-14 at 23:16 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The commit in question appeared as -stable backport in 6.1.28, which is
> > where we started to see intermittent boot hangs on x86.
> >
> > Richard noted that others are seeing this is well, as can be seen in
> > this thread:
> >
> >     https://lkml.org/lkml/2023/6/13/1460
> >
> > We bump our SRCREVs to pick up the revert:
> >
> >     947f660bde07 Revert "tick/common: Align tick period with the HZ tic=
k."
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > Richard,
> >
> > As requested here is the revert of the x86 clock fix that is suspect.
> >
> > You'll need to restore the other dropped linux-yocto version bumps
> > to apply this patch.
>
> Thanks!
>
> I don't think 6.1.33 was sent out publicly and isn't in OE-Core yet.  I
> couldn't see it in your public branches either, only 6.1.30 is there.
>

I realized that as soon as I woke up this morning. I'm about to send
the .33 patch
(I obviously had it here). I was sitting on it, once it was clear a new -st=
able
wasn't going to magically fix it for us.

Bruce

> I hacked this patch to apply against 6.1.32 for testing purposes (and
> included a version bump to hopefully let it build). We can work out
> what I suspect is a missing patch later today, this hack is only for
> testing.
>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

