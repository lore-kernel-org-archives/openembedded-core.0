Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807C2C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 15:15:45 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.13784.1707837339740271447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 07:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfbVp1ge;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5118d65cf9cso2780040e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 07:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707837338; x=1708442138; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNpGcKPvYTwcDXlvJ3SLyzoFdnKmgFMsXpI+XMUE1nU=;
        b=DfbVp1gecgstGIYCuHV/dt0WLVZE3lME4wBBoj3HY+ShFkvEBHu6ARR0B8ut7Uk6Rd
         So8+xR3n6XkSJtUlR6NsCirExE6H4muKgopm5vyPyU23/sShP31Sn4b4tkoYA1qiVsG7
         AyPk/tt2cWwmK7cxJp1WgNbqoAoNqL71YeduPFwxbX30eTJVFYTv6qpEBmIueVQKJvcE
         nDKluCjZHwPejDOjWRseayAZOgcszaKdb/pHZ0/aTlELvmpn0lDpSl1/xNo+i9mhieO4
         BkblSNpLFmpjiZmiCEKK9QEn/yfEAfpiyEZmKO9fmGmmFmzTee9EB0SmOmzC2SWeQiw9
         t7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707837338; x=1708442138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNpGcKPvYTwcDXlvJ3SLyzoFdnKmgFMsXpI+XMUE1nU=;
        b=Kzb1tYE5xE/OMSovDb/wP0QPbgBGozXYNvKZYKIO8IyUEYQkTcpwMeqA0DL3EqG/KB
         uwohHy1anyvaMEEoXHDDR4UrHbEKQPDvhL/+iUzORwIF2qP4tptSJLuOkX/8mNCWE4/E
         lgnaS5Xg84X6A/GEIqiCkbaKVTo1k7UuUDtg9n7BPk3BSf3qiyPzEl29TnHWSknWQhgE
         zHqHuc+F1X3x8OQewNMbxFzPgRQAAYc3YqI/e+OuJhgEqYOU6vubC8IbuVu/YC/vhmMP
         CgpXdoChzOESFKxpYEKRBMAKZ+piQBN/gGWRtxdz/8rgtylxHj93OIDjC2eAnVUzJTea
         yHWw==
X-Gm-Message-State: AOJu0Ywp5nTVaOscZSVafY5gGUy9N8tOg4hVjlZUv7JUtea2ihdUNhiD
	M42o9AOjTH3Og2bVyFyeK0KbTJrhQhnEmgmcZ188uyZtA8QTkL48DYvyhEkkxLrsH7B9VjY9Cj7
	0C4VuSbDJzcNKSBLqC78IF9Nthm4=
X-Google-Smtp-Source: AGHT+IEnTpLqXFyH8KquSVvvFvq4T6dJjuisx66k+qZE1AfpzdEaBFqowvvwnw+QhBDhjZc6s4ZtULuAdOk3KC2zGns=
X-Received: by 2002:a05:6512:3b96:b0:511:674d:88c5 with SMTP id
 g22-20020a0565123b9600b00511674d88c5mr8872393lfv.13.1707837337479; Tue, 13
 Feb 2024 07:15:37 -0800 (PST)
MIME-Version: 1.0
References: <6ef9e3cf-6246-3e7b-b4eb-4912b91ac63@crashcourse.ca>
In-Reply-To: <6ef9e3cf-6246-3e7b-b4eb-4912b91ac63@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Feb 2024 15:15:22 +0000
Message-ID: <CAO5Uq5QeeqgJ0gQ4_qJUY7wrLnBXf2bDJgBM_k4jV9Nx9WMA8g@mail.gmail.com>
Subject: Re: [OE-core] another possible ptest oddity
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195410

On Tue, Feb 13, 2024 at 11:55=E2=80=AFAM Robert P. J. Day <rpjday@crashcour=
se.ca> wrote:
>
>
> here:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/python/python3-cryptography_41.0.7.bb#n51
>
> given that check-memfree.py is being copied to the standard
> PTEST_PATH, what is the point in line 63 of explicitly adding that
> file to FILES:${PN}-ptest? would it not already be picked up
> automatically based on its presence in that directory?
>

Looks like it to me.

--=20
Alex Kiernan

