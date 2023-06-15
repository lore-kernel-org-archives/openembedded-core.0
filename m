Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61C4EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:41:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.25085.1686850860966013862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 10:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YYTWMEwn;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso11063839e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686850859; x=1689442859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a37iqTrxB22WOA9CMvK27m4ITr5SB5jieGHHv+nJhOk=;
        b=YYTWMEwn+36OVQwlXklbbcXrTK6zPeCPwk9S1v6hkDRcPMjtdxcroZ+x5cUYRBGAxg
         5ieD2W8Pw9NO1PevXP8/BldOKeH7m48+17lGeFUryUxlSOEEVodzt//GzIYrn8ztkANg
         IaYa99Iyq1WBj9CqYMTiSNoWvqGXumnCQPyq4wv6b0Hm+lPtEEcpOjx7APmjjtZES7iA
         Pz8Y0aTrCA+qQUcYSHMITdRlBJ4IgxMNVw1FJ371JNqDaNdsmjMpcOi3hk6AxLy4iObK
         fSrY9WeLjndHr6MWjTLVNhFo2mCMVe3jEIVCHegSbnMBVoiWa5C+Lt2InTAVgtUiyg19
         TjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686850859; x=1689442859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a37iqTrxB22WOA9CMvK27m4ITr5SB5jieGHHv+nJhOk=;
        b=YnkDMPt/NBC0BHKeSEZCTzkptJLggRK79w03E1EWy01takbKr+So1Ep1+HA49soSFK
         cO5q6H5+ee56YMoNH8amQ6jQi5PNuOr4eGvNeE1Q3qyICqeYnWhq+y7n7O+dTW9XEKna
         lv+j2kF85VqjRE8PUX7eQI2kltVFhxgjjoHg+MAr8Acsd32LxsesWh+Pw1edsBjO5UYO
         O2VJCHmwdd4EFksYZfv2R24l/44df3gPo9Sp33aGhrMImg9Am752OHsA/J5quHJohlOx
         7nSZhy2eV0riBVeI8wYsNN1Dxr4JG0ODBOgYsVUk6BpgagUSTjDxkp+wBD2cb5+xl6DX
         ueWg==
X-Gm-Message-State: AC+VfDyTseMajqJX9Dn5qrBWEdX0ZPyE6gnPlqHYXLdvS2Y3fK3hFiBf
	gq3d7FTeHz0Ikeny5GGYdvOy9iXuJD4sdsuhkOI=
X-Google-Smtp-Source: ACHHUZ6VT3Jv0RYA8SwKXTPXJ8lKelytcaLnJxlZCSF1gZlpTbn5Be5T0t+i4Skn/uEZbMumMfex1rDLYn1Zb6xeIu0=
X-Received: by 2002:a19:7106:0:b0:4f8:4aed:b489 with SMTP id
 m6-20020a197106000000b004f84aedb489mr112465lfc.18.1686850858750; Thu, 15 Jun
 2023 10:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-6-alex@linutronix.de>
 <9BD4E811-53FB-4468-99FF-FC6E50FE54C6@arm.com> <E0C698D2-5E0C-4FC7-B44A-98617EEFD06C@arm.com>
In-Reply-To: <E0C698D2-5E0C-4FC7-B44A-98617EEFD06C@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jun 2023 19:40:47 +0200
Message-ID: <CANNYZj8oX82s6zKbE7UbGG=Wk6Pq-LhKQELKtnTeQt=QQF=A7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 17:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182866

On Thu, 15 Jun 2023 at 17:25, Ross Burton <Ross.Burton@arm.com> wrote:
> > This drops the pkgconfig file into /lib/pkgconfig, which doesn=E2=80=99=
t look right.
>
> This is because the recipe sets libdir=3D$base_libdir, for historical rea=
sons that we can ignore[1].  Delete that line.
>
> [1] pcmciautils also puts stuff into /bin or /lib and was linking to sysf=
sutils.  pcmciautils is now outside of core and lets be honest, dead, so th=
is is moot.

Can you send a followup patch like you did for coreutils?

Alex

