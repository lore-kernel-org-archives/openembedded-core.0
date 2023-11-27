Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A72C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:41:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.92241.1701081715927657109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNvQkC5T;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c897ba4057so48577051fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701081714; x=1701686514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZU1pRaZxCCezX/mcaRdPGcEqDYzj1JNcLXkvnwF5LI=;
        b=PNvQkC5TmkNVKgiUgg67K4Nl3AAN3HrFpOsOvQTu/wFXf3HeUtuWBLe27mD0nflyKh
         xYzY0V92FmuOgDiYnS3nxeKUjB/jPeaAch5vKCYb7PCKycuc0xamehDZpwlqRvFvCYig
         bymgENTEMZWXytGT20fGcvdFwiPiHHUNn0b3qtoz7IofVYqOQKqmtUUMOt5o49yuXom6
         3f981Qk/UafL5FPt4gk2+40F3G9IqPQcj3+Ztbv088EiwGe3sg5gu7mlcOFrJ0c4wF3m
         awf26Cw28eIy/58K2Z4WJC632RT61Gs43xPljsT3ssvfaBaYtqmfWe/UICKJn+MjcOVm
         rjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081714; x=1701686514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZU1pRaZxCCezX/mcaRdPGcEqDYzj1JNcLXkvnwF5LI=;
        b=JpGOfkiSu17eRJU5ZcPW+RjraHliNeiQTNWV4PWyArT0rc3+YRqZ1nyaf+E+vNXdKJ
         vEAUwFEvqHoIy63yz2rRdaz1g9L0edmDSRKZID8VYK6l3jcv02Gl2QjKzl3/QVzk/u0L
         lTHF9KdHLjL5Io1Wn+CSKL0gZAFuZsB1F2QMIsIqh0pjtfNxoQUjEkfisz8Tf4WiUFhD
         90HuZ+ZxsdqX45G1RImptpIPhWlOs8YlzwXgmAIDoTET8A2ZUGj5ssH0CD6x/buJF0in
         Z/hK88BkxNg/jsVvos9MPahWGgZ1ZYX6ubaoDhK5mQRSYmoJNqoPUj2aOllQSku1zDQR
         K66Q==
X-Gm-Message-State: AOJu0Yyel0rHYYibDguC2PaMsUhbv4NwtvJUZUu7LWA1Of9DBr8UC8TF
	2JKJ1s2heHbQ3VhJmcAeo22LylQyAXtX4zUI1zo=
X-Google-Smtp-Source: AGHT+IG7nlu+j6RzhSWM4bGFD++Gb7RdbmRWkQmenY6Ven1FUSMPwmdSNlW0IORZx8c+euvYwuQjkCODvSlyUg3GLyY=
X-Received: by 2002:a2e:545d:0:b0:2c9:a495:2a42 with SMTP id
 y29-20020a2e545d000000b002c9a4952a42mr1141447ljd.16.1701081713965; Mon, 27
 Nov 2023 02:41:53 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
In-Reply-To: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Nov 2023 11:41:42 +0100
Message-ID: <CANNYZj9B1P+xPPvoZN7SfgodkWPuis78rBcU9yPrPfUbN820sA@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191290

Fedora 39 isn't yet supported or tested, so it's almost certainly
you've hit a python 3.12 compatibility issue. If you can look into,
that would be very appreciated.

Alex

On Mon, 27 Nov 2023 at 10:52, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> Hi,
>
> I am not sure what's the actual problem here.
>
> FWIW, I have recently upgraded my laptop to Fedora 39
> where I test recipe changes first.
>
> Now, whenever a build ends (no matter if successfully or
> if there was a recipe build failure) two bitbake-server
> processes stay running.
>
> As a result, the next bitbake run spits out messages about
> the previous instance holding bitbake.lock and retries.
>
> Fedora 39 has Python 3.12 but maybe an outdated python
> module is the issue.
>
> I am happy to try any ideas.
>
> Thanks in advance,
> Zolt=C3=A1n
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191263): https://lists.openembedded.org/g/openembedde=
d-core/message/191263
> Mute This Topic: https://lists.openembedded.org/mt/102826186/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

