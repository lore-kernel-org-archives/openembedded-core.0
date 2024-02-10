Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0578C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 10:31:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.11346.1707561063846807762
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 02:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSy0srq6;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-511821e60c2so331454e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707561062; x=1708165862; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuasaGjCdldsdctsoOJhWkyMBCGymfyMamnlg6/POLs=;
        b=WSy0srq6qivDBGW9OHYFecZEB1ecHuqvYC9L67htpBqLF8vD+OUhCLYEOwjlesLR9L
         eKYh8DVvxkbTMk+3U8AM1KBU6CUw7lXCFs62xo2a8WOf6eJseWfINldWUDtLYa9KD3kY
         q2w6+RTknnj6FN1BG8y0eJR0aQTCwESAY0whgdYDVhaQq3hvMU69ZXCEV12Yt0Kk8e2Z
         wbdEsjw7IMwUYo0ULKI2oKOLN4ItXCnOCZwaSpieT12bR7QfYDaLzlKn/0fx9oj0PaYV
         1yhHpIfrwM1Cuy59UYc+/LOjU9YpS4vKTmocYXaDGb+p5f2EwkbSkvY6O835SLr1vBAU
         Jgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707561062; x=1708165862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuasaGjCdldsdctsoOJhWkyMBCGymfyMamnlg6/POLs=;
        b=VTAIbyxLrA4fKBhZ5h7JVYmHZBVxaTjHKweBd1z2EtvVxfeBUeXc6BxwdonBnk0hlK
         zHYYhPDp8EASqVPUlIPydZp4A90wVa0k2UQfkqv4Pa84Y5gb2OM/ym0zWc3e1bF2Mb7V
         rQQgf4oT9aGdU29MpfbCrvPMTvclI+PSgkdpkDoTNAQvtW+Vtix8GL6E6eQzOxohNHWM
         EA1Oh211pC0vQEANkIQV+Cov2YzedaDUb773Tu5wXS3K3Rlh6gEh4GS+UZys9IjuV11P
         HoH8rJBl3reRpvYvB5qakb57iGq+u/AD0Sp92MclfmJ1ODRrk81pSQZFZ8hEUEu/tlIe
         zXWA==
X-Gm-Message-State: AOJu0YzkuFHyOpVKH82NnlNAIGSuZ0e9cJeP1BKwae2mKc467at7lNbi
	AQIw5dGkWq1rx38zqxE+8sh2ywhI35/n1bK01oQB8vERKn9vZanlGHUGZA2BITLJxddCT+ZMmO/
	jM+avAXviE3P9nkUAafQtS7h2FHU=
X-Google-Smtp-Source: AGHT+IE15YRmQQmL8sTHWdvK53xhHC5jgWXLFq5MJAQ5h6thL2V2E8gw6AUUZgK6Da/9TGChAEP1AtcIU8Zen4VxQvE=
X-Received: by 2002:a05:6512:4c9:b0:511:4146:7032 with SMTP id
 w9-20020a05651204c900b0051141467032mr834187lfq.68.1707561061691; Sat, 10 Feb
 2024 02:31:01 -0800 (PST)
MIME-Version: 1.0
References: <95196f90dcbc7e45dbfe46a1fe9f2d67a87b5118.camel@linuxfoundation.org>
 <29551.1707559356932948052@lists.openembedded.org>
In-Reply-To: <29551.1707559356932948052@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 10 Feb 2024 11:30:50 +0100
Message-ID: <CANNYZj_HFeWwpmD7Co72WpQz6kbn6O0Ys2KFqV4gnRv_2Lay_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add user space utility:dropwatch
To: chenheyun <chen_heyun@163.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 10:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195258

poky is a reference collection of several other repositories used for
testing, it includes bitbake, openembedded-core (both on
git.openembedded.org) and meta-yocto (on git.yoctoproject.org).

Alex

On Sat, 10 Feb 2024 at 11:02, chenheyun <chen_heyun@163.com> wrote:
>
> Hi,
>   thank you very much.
>   we usually build our project=EF=BC=8Cpoky =EF=BC=8Cmeta-openembedded=EF=
=BC=8C meta-selinux and so on.
>   https://git.openembedded.org/openembedded-core/  for what?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195257): https://lists.openembedded.org/g/openembedde=
d-core/message/195257
> Mute This Topic: https://lists.openembedded.org/mt/104256897/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

