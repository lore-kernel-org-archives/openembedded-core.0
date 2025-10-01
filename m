Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482FBCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 17:50:37 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.3721.1759341030992000826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 10:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=K7HNdJZE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.170, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-43f935f8dd3so67125b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759341030; x=1759945830; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCuRyKwg0+LkZ9LjfwoArLDtZfa3q1/NZJACfNMkcFk=;
        b=K7HNdJZEBPh8+uQJteWbYc4Bdql2h9GewVqmg8LOPqX0BjWdP4SY30O7rhMy1MEdRd
         DYYWDxygnNGba1p0nztcD4AAzkiHNP1qRbjWS+PqSEs6NPDrHyfqDa7RLolLgkEJoElF
         YuZB7X2t63FH4BqCy/QPbLzKl5M44v5Xi47iYGMD8lHa5gBL6VRRrjwTfeMeBCb66uAN
         Q8TGXMAQlIOBUeSX+k56LAmMqafWbW6YWnGEv1Ld0xFq44JXx2ZuYJAhtBfJ6fv7lCps
         SnArYyESFEzW5Mvxd3oBx1vAe+CEHSGfLnIht0JTcLHY/GsBDEsJJzHI5g2Yt4CMwelX
         eZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759341030; x=1759945830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCuRyKwg0+LkZ9LjfwoArLDtZfa3q1/NZJACfNMkcFk=;
        b=mx/+mnxj8XQnupl0uZyW9AXJWDkThMS584RrNzG1qdozo9LGZuOr2QKgB8dPCSjgC1
         nf3unt8OIBXVhaOJq3iwU6/ravXClWZNxxKcpP9BttYQJypcwJc5ZlludBMo6UVGaLiv
         RJG9cuvwyJgNZUb24yKnCxc+moZM6byq3aFvw9sJ0kMInjQvSh0WG8puXos0axtuo6w5
         iuo1kh5HN5CHXkjZKfhwJhRd5nlAU28Wwt8WYsFh/kfx50KAY15CyoDGfIs4L7+NNI2R
         +eeEX0LVXfsxnTdv4yyQ7gPAT8zKuaCnHcNjyKOMvyL48nnlvMtoWKkUj8sQotiPubKJ
         Yctg==
X-Forwarded-Encrypted: i=1; AJvYcCUBYPZ51O/8NvBjoAyG8GBYsfd3E0mBuYRPzDtVGq+bZ0o2wIn9erbPQ6y8sHQltYeEfvTvGOZgXvYQRx8qx9KLiA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyu9VBPRjpMpaSz/pVHB1hPifNTcOSQoJ++tm2gTjLsy9SwDuiB
	+Q5SSh9/+mIi6A3ftHDlUbGevLJo/CnVZUpWJ7eIEhGvPR6xnTP7bTslKThz760NVaUqhBJi8HT
	s7JOLLbKdOevXxwI2rj1OmJfXOX5oQ/FKvNaC0MavmzoJ14/mmSY=
X-Gm-Gg: ASbGncvtzJt21s+eGzPi5esusi/cqdrjvT6qrC3b+mMLEL3M2SYZUNCP9psjJa05Pxl
	C3PC3QKQsOpLWWQkcPHa2xYjZatyfipxxarHv1Xsb5zhtHOqF5vJytKpewplRy2sjt9TsYH9OVP
	ewt8P6XINsmzYeDSEGxB7HBLv8+W2xSUJrCh5ZjzDPX6a3miw58oj6pQHuCYJDmH127s3ORTw4h
	CWKZCPNvxVIecbQ/Nov1QGQvlHeaPSz
X-Google-Smtp-Source: AGHT+IGxgRXP3hTeK0ReK+jQz/dpgfAvRbeHt2eclWuoSJFVYSD6rIL7xPekl5E0tdApPno7tk4XZWoyyclU9Mti6FI=
X-Received: by 2002:a05:6808:140a:b0:43f:713c:a38e with SMTP id
 5614622812f47-43fa41f7357mr2448398b6e.30.1759341030090; Wed, 01 Oct 2025
 10:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250828091630.82819-1-jon.mason@arm.com> <8F25672B-4A67-4E8B-AA89-842439E5D228@arm.com>
In-Reply-To: <8F25672B-4A67-4E8B-AA89-842439E5D228@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 1 Oct 2025 13:50:19 -0400
X-Gm-Features: AS18NWDdakDWU0edZAreRGCHDxzKPeutgJkVZNFaPH7rSxlqNwDAz48gvc0QZc8
Message-ID: <CAPoiz9zGVk0z6zgDBdiunz-z07vjps6xtbpyxpTZWOmA3g2ryg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: remove setting of mem on kernel
 command line for certain systems
To: ross.burton@arm.com
Cc: Jon Mason <Jon.Mason@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 17:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224314

On Mon, Sep 1, 2025 at 2:45=E2=80=AFPM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 28 Aug 2025, at 10:16, Jon Mason via lists.openembedded.org <jon.mason=
=3Darm.com@lists.openembedded.org> wrote:
> >
> > Some emulated hardware will not boot if mem is set on the kernel comman=
d
> > line.  Also, it is not necessary if the device tree file, as that
> > _should_ have the memory size specified in it.  Add a check for QB_DTB
> > and don't set it if specified.
>
> Can you elaborate on =E2=80=9Csome=E2=80=9D so this can be verified or te=
sted in the future?

The machines in question are the QEMU emulated Raspberry Pis, all of
them.  Given the amount of time since I originally sent this, I'll
resend the series with a modified comment saying this.  Also, I
managed to mess up the intended mailing list (but it magically landed
there somehow).  So, another reason to resend.

Thanks,
Jon


>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222676): https://lists.openembedded.org/g/openembedde=
d-core/message/222676
> Mute This Topic: https://lists.openembedded.org/mt/114931906/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

