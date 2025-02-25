Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE763C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 11:22:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.5850.1740482522352508905
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 03:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b1TUNpPr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439a2780b44so34272745e9.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740482521; x=1741087321; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dtgA1Lu9HhD+TqJDSziHCB/YF1E68zzE9pyNZA4X3LQ=;
        b=b1TUNpPrlku9j1QpdMvFxX8ILWdsv7tJW5Wbk0z3yqwbrtFPdMYOZfcDuWltmo+1XZ
         7gKLRV9QHmca42MJI4/v/Bzl/XfdVbhCPaSkN8y9Lrqx5xrvrUdjrDOh1GYDvmyqqxom
         ESD+uXTRt32GaRwncNqbzo7ePELOUk1nHeXA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740482521; x=1741087321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtgA1Lu9HhD+TqJDSziHCB/YF1E68zzE9pyNZA4X3LQ=;
        b=hRqsITHT0Vf7117QLnGs0I4tlW+VovXuvaYxm/VmN8LLYMZ+bZTXpjYer1RH5Pd255
         b3LEDb/JIGCArLhcDSnMIXeUfTRHCqC4g3xaEIOgXSnAa8/6ZLqex+fqaf3KcF4h94hJ
         kihUWmbT+GWlBY0/A9K49yOAaw2n54SATq7bmwX2TAxUQECpLYlCAI8O+cY7AQgXToQG
         LOSSy08z7b2s0lggzQuhJpSnfuVe5ClOwjcZlzpwVaZfVLz0rp+ptvQePqu9LqC0mbfl
         UPL9EzUiUVpbY0qxDQqA1JYunaJQbQZGRG4Bo6GaOW6bAN8XcvqimXkPRUiHubzI2miD
         G/9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnzA3eOUZJ6KwSNEoRiSFR0nH1Eycp+IhO1Q7NS9rPoR8yhZ6ax1LZSKz7KU6qp3qs9v6JeeuNzEt5/6Jwbt+2nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDtP+t9XQVFBuCgjOhWPVq9kFTLCLYfHYhyxhpuHoRQzJp1oac
	4uCB4kxkQe4wi0qI5mEIcdYVe2mECHVy/1zDWLdkdOZZcR6ltZRim07TzEiMPcg=
X-Gm-Gg: ASbGncvLEmn9m1MWp6SA0xpQULrFxiFFV5qOpNkeqHnjv5NrZlygpsHp/FkjcQKNLdX
	xRX0cSwgfFgLC4geRYk8xHjsife2Dt7nhI2rw5fOBDiuc51BVe+wHuI0O/PbOc+q2EFGO0ZfUqI
	//3PVCGKhUrCB7Yn7PArc5mlJOjxTYzgTf5cV6RyXub6dW2YABv/855QdPvHx1LFfT2kWpG3FmI
	HCsen/Xi/tS6QX85UDZ7QDfytAZfahDikgyhY5k//3tI6uurv8ccItXZqGIjUTUl5tHxHBqkRrR
	GzOV84+rzkIVTg9GVpYTdPvgawaOIT46Vc3Svpm8b1euqErU6gwXsOY54Rjaj4Xf7JjiQYbkovA
	JBbnyRuUZsgx6M6I=
X-Google-Smtp-Source: AGHT+IHv/MR8GOG6odWcv0HwG1zYva9/YqkPRpmjuifeyNK4o4/Cg1e/XZaJSPklHS2hRcEL3Xh/4A==
X-Received: by 2002:a05:600c:a384:b0:439:8a8c:d3ca with SMTP id 5b1f17b1804b1-439ae21d2a0mr131098175e9.29.1740482520663;
        Tue, 25 Feb 2025 03:22:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:92c7:7a17:f809:bc92? ([2001:8b0:aba:5f3c:92c7:7a17:f809:bc92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab153dba2sm21912705e9.16.2025.02.25.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:21:59 -0800 (PST)
Message-ID: <73881478fdd87961e0b3252ac973327874aeba80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, uvv.mail@gmail.com, Jon Mason
 <Jon.Mason@arm.com>,  Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
 "Openembedded-core@lists.openembedded.org"
	 <Openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2025 11:21:59 +0000
In-Reply-To: <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
	 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
	 <1825F47182B39BA0.23135@lists.openembedded.org>
	 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
	 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 11:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211871

On Thu, 2025-02-20 at 16:03 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> On Thu, Feb 20, 2025 at 3:52=E2=80=AFPM Vyacheslav Yurkov via
> lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> wrote:
> >=20
> > From meta/classes-recipe/rootfs-postcommands.bbclass:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 # 20:12 < mezcalero> koen: you have three opti=
ons: a) run
> > systemd-machine-id-setup at install time, b) have / read-only and an
> > empty file there (for stateless) and c) boot with / writable
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch ${IMAGE_ROOTFS}$=
{sysconfdir}/machine-id
> > =C2=A0=C2=A0=C2=A0=C2=A0 fi
> >=20
> > We could think of further improvements. One thing that comes to mind is
> > changing systemd-systemctl-native to systemd-tools-native and enable th=
e
> > build of systemd-machine-id-setup.
> >=20
> > Slava
> >=20
>=20
> I do know that it was a horrible thing to get right when I rewrote the
> shell script in python (which I'm very glad to see the back of):
>=20
> =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also create /etc=
/machine-id, which
> =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesystem read-only=
 before generating
> =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
> =C2=A0=C2=A0=C2=A0 #
> =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /etc is gener=
ated at runtime
> =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script shouldn't run =
at all and we
> =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
>=20
> It may be that this behaviour was wrong in some cases, but at the same
> time, I remember spending a lot of time getting this right!

I just wanted to add that we've been seeing an odd failure on meta-arm on t=
he autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1032

and when I did into this, I see this in the logs:

[    3.700441] systemd[1]: Hostname set to <sbsa-ref>.
[    3.704040] systemd[1]: System cannot boot: Missing /etc/machine-id and =
/etc is mounted read-only.
[    3.704488] systemd[1]: Booting up is supported only when:
[    3.705023] systemd[1]: 1) /etc/machine-id exists and is populated.
[    3.705349] systemd[1]: 2) /etc/machine-id exists and is empty.
[    3.705651] systemd[1]: 3) /etc/machine-id is missing and /etc is writab=
le.
[   10.206513] systemd[1]: Populated /etc with preset unit settings.
[   13.034155] systemd[1]: Queued start job for default target Graphical In=
terface.
[   13.149568] systemd[1]: Created slice Slice /system/getty.

We therefore need to fix the issue with machine-id before we can merge
this patch. I will drop it from master-next in the meantime due to this
issue.

Cheers,

Richard


