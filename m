Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2068C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:31:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.13862.1738056669414864750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 01:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3mndNoM;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e1a36b3684so69511736d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 01:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738056668; x=1738661468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Uqx1szQN8KODP3SxIsdRjlf4OatljiCkGdltASpg98=;
        b=j3mndNoMWu5b/YTMQ+grzdyCBjB65c8E8V11W4mmw4buhfi5ma/pjbJAISqzb9w12e
         i0dnQyyZ3c9w4IjE+nKvp4yI2rX9iTy3a2mxbTCc+RualOSdmgwvHsETs+YKbXRJriRH
         Ve2/bnzig0dTWJCT7ugseyCbOFpP2Ki+9RIgIwkfwwATk1kAFWx8l/s17E8sKSuJVF67
         6hH7yKkhw5TzMpdRsuDXwbwm6+95qyxHxkU06wRwjeUUv35Ox6YNiF9X3V03jpVx4yE6
         7qCXRINPB01jEBDud3f7xNQ8nOE4KygDTiDN/nb1qAC+yyn/JUF2oC4lj+gHEXAf+Aez
         OvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738056668; x=1738661468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Uqx1szQN8KODP3SxIsdRjlf4OatljiCkGdltASpg98=;
        b=iczaAhCjS7/AKQn32xRY2F0R+4eKr8Oszn56GynHWIW93okBC00MQ09FvL016+2Ej7
         KOWKRdhbubzYNr19W027pBDTiJedtKkKf5MXQ/krvUMDF4QGKH7wpd6m6k4HitFM1g+9
         f94nIuaJSHCf3IGWNQWwP4S+8sH97Up3B7ZNHulsZXkvA6MKmijzAS8VwnfLJeiYd2a5
         CqwcCdf8Bra8R19XC5Te7aMusaZuLGPCq9+rDAl1/mX4AqcVAdQEPNOzDkslKnUbVMfE
         GTYt83I85gb2oueF1lenzdXgcVsK/4VztnPEiJSDiKSsYGNS0ISGljLUANQT2PM/AlVr
         X8NQ==
X-Gm-Message-State: AOJu0YyeBiusq9ymLp2Ag/BmGF8xP0vPS72GivM5Kao9R/MkxYoBREOI
	ZHGdfPCd1lvTKL6lL3GVibtTS2arq4XxrYLK9bMdN3gx870myw0QRkKmCPi+dNyc/fBr393Jx+I
	FYXPJ4xSQTXEzRw7Pee4tQncBiM4=
X-Gm-Gg: ASbGncuF4sETl8nUz+PvQhOPxmB2ASlDW/8ORccYouMh7z/4ihy8Jc9dPsja30ZwxI0
	6rTWa2JGRpo/dC90JfLE4dsQV8vt8B1q3hs/ZSfIL6L4lZ6U+44v70XdAjvFqn+EVa0Z1NXWmAX
	n9814zP1mZ/RYduXBKDYCP2SYc0MG+CB0VBarO/jqdVQ==
X-Google-Smtp-Source: AGHT+IGVzEy/DpuvVUwlTQOqeX483QFbSQ0Bru+WI01e4F0X2zOBckWTDsKB9yfXHKKt3MUyp4TYB3Zfq1yNiGLR6Sg=
X-Received: by 2002:a05:6214:4018:b0:6d8:a730:110c with SMTP id
 6a1803df08f44-6e1b224c0demr556270986d6.38.1738056668433; Tue, 28 Jan 2025
 01:31:08 -0800 (PST)
MIME-Version: 1.0
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
In-Reply-To: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jan 2025 10:30:57 +0100
X-Gm-Features: AWEUYZnfXs8lbOWgVevLFIkHXg1pB99GRyYi7bMwYhG1xTxR5AAQuyX9eqBEphw
Message-ID: <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 09:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210313

On Tue, 28 Jan 2025 at 10:03, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:

> It would be nice if Yocto 5.2 final can use RPM signing.

It can't. Latest rpm release needs sequoia for rpm signing. Which is

- written in rust
- needs libclang.

https://sequoia-pgp.org/

So we ended up disabling the feature:
https://git.yoctoproject.org/poky/commit/?id=ea9c2cfb6901251b95e07e052616a512b91ea0c7

And that's the reason you are seeing "Unsupported OpenPGP signature" from rpm.

Alex

