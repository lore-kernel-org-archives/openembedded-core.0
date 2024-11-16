Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EC4D68BEA
	for <webhook@archiver.kernel.org>; Sat, 16 Nov 2024 11:12:05 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.10724.1731755520999303894
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Nov 2024 03:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/ZqfNdb;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d40ae72d35so6565126d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731755520; x=1732360320; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3WDTGcWOCvNVYNiSuy1keSImoIRD3Qmfj2ICw6OR6k=;
        b=I/ZqfNdb9HXmz8bXfpvmLbqgdF/QmROoHo7HSfHaHa+7HjOMqyX2kfaihbc3A2Sa2S
         8mx3+2lxUhQNgj4L3rRaHxytU+/YVtpbi80qBeKPGlpsLf4//hU2iCsMWm8LoKbfNrvW
         NjP0b83Q612+Paxj19QLTufI4K6VtmY8wVIpRcXVNdAOQq2ALRulcmY6r9gkSXXl1dUz
         Egpfwm/h9nztQeyChLzHN7xGJF6mB7mwCMmqOLT0AeMZEkWWxJpVkHO46gRqdNAtcyHY
         SpwRDcVsGS1CQxzcdfLq6DDhCXgG5IibuEHonpEUsgJuZ8BR/yLvnzJIwAbKAm5pD2zf
         iUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731755520; x=1732360320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3WDTGcWOCvNVYNiSuy1keSImoIRD3Qmfj2ICw6OR6k=;
        b=NOYjdkRh6VwS+jTPPkikCqro9uVX9QSQtAwYI8YAin6MjehUffP7XnlW6AMUaseRqK
         mLDnTD4eJeBmCdz702c1abWvNwB0iy5QuwtbJOnf0n+7uPbJuu1pnASU/W/dtEoJphwY
         c3Bt8tiaefwm8DRW+8L1TUJw6HpqgC1LIvgQEaINAl7hOBr8o6uGUq/QNf5frR9pt1yS
         d6k34VTfxGebidb8YZYhI8jjzvPbS3hBenFx+tKPg326kqaUh92eIXHAoZQrU97irKBb
         UemzaZrnqFJwiT7dnlDXwQcA04vE19Le+qEU8Qx/Slv2WLyG++8/0cus8M4oJfu0CQzw
         VA1Q==
X-Gm-Message-State: AOJu0Yy76cHaFxsEi180wsh/Sm0jXNL8Mg6+2ZE8symF3YU88mEAOw8z
	MlJAOpHaefATT7JjAULqrrXdXLs2VoRIfcXeCNYBTUY1OJsuhLDO+MPSkos7ziko2Nyn8IyJjQB
	gpY/gKCWXrAFbdwB7pFBzS7owVD0=
X-Google-Smtp-Source: AGHT+IE+qQtwRVbcja61TUbDw/uUR8woaiJ25y1Km30UpJ5v5340Y3pjDACFi5M6NWKIF0qXPBtnaL3l5cwCo7LqqHY=
X-Received: by 2002:ad4:5bac:0:b0:6d4:1425:6d2d with SMTP id
 6a1803df08f44-6d414257073mr12361856d6.43.1731755519895; Sat, 16 Nov 2024
 03:11:59 -0800 (PST)
MIME-Version: 1.0
References: <18918.1731589075220106911@lists.openembedded.org> <921.1731754558740077385@lists.openembedded.org>
In-Reply-To: <921.1731754558740077385@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Nov 2024 12:11:49 +0100
Message-ID: <CANNYZj9ZoOQPzZMgDPJccd75xpe7psWTvyaTixsFh744P8a8Mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 11:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207189

On Sat, 16 Nov 2024 at 11:56, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi all,
>
> I've thought some more about this issue. I think it is best to remove the=
se two patches I submitted from master-next if you haven't done so already.=
 Using bluez5-native is wrong, I was misunderstanding the 'native' part a l=
ittle bit.
>
> Moving forward I think there are really only two possible ways to resolve=
 this (both seem quite cumbersome):
>
> 1. Build BlueZ, and it dependencies by using a 'target' Python 3. Then af=
ter BlueZ is done building,  Python should somehow be re-configured and re-=
built in order to compile with bluetooth support.
> 2. Create a new recipe called libbluetooth which modifies BlueZ such that=
 only the lib folder is built. This recipe only packages the library. In th=
is case, we need to create a custom Makefile and a target which only builds=
 the bluetooth library. It should have minimal dependencies. The goal with =
this approach is to avoid depending on Python at all such that we can avoid=
 building it until we have libbluetooth available for the target build.
>
> In my opinion I prefer option 2. I am thinking if it is worth it to push =
a patch to upstream BlueZ to better support only building the library. I'll=
 work on this weekend to build the library locally and see what dependencie=
s it needs. If it doesn't depend on glib and dbus, then that's perfect.
>
> For option 1, I am not sure how this can be done. I'm open to any ideas.

I'm not sure I understand why all this complication is needed. Is
there a circular build dependency between target bluez5 and target
python3? Can you show how and where target python is needed by bluez5
at build time?

Alex

