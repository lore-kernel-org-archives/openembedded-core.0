Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974FED3C92D
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 17:09:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.673.1729530582638214002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 10:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QpzbB249;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so5358335e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729530581; x=1730135381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aabv6uE7YRkmZXvTBHSH5wL3KevmfB61sBl6yZa4/5k=;
        b=QpzbB249iwqSw37OcUTD7wTk7jpTM+iuGS726zZtY60cMUGNlUB1OtG+kxHwI2RHl2
         BK6pesECm9V/PO+gWGSPgdSPMzDVfQ/1CETwkolNOQ2f34QuUrB7Ha3+6VzVwD0521Vt
         9PSSJRPoULJWiTm1izW5GbxJcqNLFQ/g6CUs6YNpOIfigal7rrwe3mhDcCC0v4UbPdra
         Z3BvkHePU0ludj6MnPKssxP3l2B+ffPaqpJI7K/a7sdx9Y7QG2aa+ZMkfo+Kazg33Dbm
         1HFP3HCmkDX6EMKktKkJsEP/GEcfaciDBI1bb8CFXoTVDi6lg0FvBp2Wv+8C/ws6PwvA
         nL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530581; x=1730135381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aabv6uE7YRkmZXvTBHSH5wL3KevmfB61sBl6yZa4/5k=;
        b=o4ENhNX76gcHe74OB6quvEUE30BUp06vcG6t0rTNRRPjeYGPXOmLnf0M13IVkvYfI5
         3OzLRZyH3zYi91j9PXDUaETCm3gMNeVvX463pZ3w7q2S8wP3DBAHihaxPXi/9Sx7Xnjg
         jGyScVvM/0M0Yd4FijksQzvjGzVhesbqGfTVegSiEKCLK9pZhbaigOyq9+ujlC0V8czz
         nD7xxoisnzrb442PlP68uio8vJRXS5k4XyywQocK6FCj3eScC+oYN1Yv6sYhSu1FEf85
         zUEpmux/hdbyddfhDfOR0WkFyiGGP8QYnWll+NTWW8Km42mrs+sz2+NvGh+U5NqYA+Jl
         X8aw==
X-Forwarded-Encrypted: i=1; AJvYcCVcc95ItyUw5Zqt1qi+6ko/oQNjWVXusepNEhXqTwd10hDPOt1BQno42HcFE1o9THi+0GaWEOtYNw+roBu3Qsr5EA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzgqo2htV27ZSvnMpGL24n4fWlBeJ9l7a63BI2d4zKqFYluIzaK
	6rVfyhA/Cid1MALawYQd7Nr0z/Vn6fwY2ceR4AloJ02EngOF/D2nxAvVCpk6sljV3ksZL14PqQJ
	kw1QrCVtqFyiMqfGJe8SyjqcWJbA=
X-Google-Smtp-Source: AGHT+IFbdCZMpX9Kz7Wu64xre4x/hdgeXfZB9IOeNgOAEzjSK6JYxBc6ciRMluxLThBE0edL549ugmvg7pMZVDZrg0c=
X-Received: by 2002:a05:6512:3da2:b0:539:f961:f485 with SMTP id
 2adb3069b0e04-53b12c03f81mr454760e87.29.1729530580516; Mon, 21 Oct 2024
 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com> <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
In-Reply-To: <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 19:09:28 +0200
Message-ID: <CANNYZj-TGg4RcBwXyvfN2D0Pq5kKSE5mT5u8wsYHjsK3KPx6YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
To: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
Cc: gael.portay+rtone@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 17:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206128

On Mon, 21 Oct 2024 at 19:02, Ga=C3=ABl PORTAY <gael.portay@gmail.com> wrot=
e:

> Or, linking the file instead:
>
>         rootfs_update_timestamp () {
>                 if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
>                         # Convert UTC into %4Y%2m%2d%2H%2M%2S
>                         sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAM=
P_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
>                 else
>                         sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
>                 fi
>                 echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
>                 bbnote "rootfs_update_timestamp: set /etc/timestamp to $s=
formatted"
>         +
>         +       if [ -x /lib/systemd/systemd ]; then
>         +           ln -sf /etc/timestamp /usr/lib/clock-epoch
>         +       }
>         }
>
> Does it look better for you?

This does look better, yes. Will systemd follow the symlink and read
the mtime of the original file?

Alex

