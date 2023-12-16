Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCA2C41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 20:16:22 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.3001.1702757779804236183
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 12:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jc/QLCPY;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2030eae5051so776139fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 12:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702757779; x=1703362579; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paOFq5sutv5mu2PXmGFZ39aCAYEJ9KYNI5rH2SkHN0I=;
        b=Jc/QLCPYDKG9OPicTQawJX3O8bHcTno/YtzoNUmhhL6+0sDSxkbIVdvTbC2TVwKO/d
         gAS9Gtcs0Mg5sd/+OmzsGjh3txqvAgxPcwA3AcPWKwEI3+8XAfCpPUd8UWCnuKbGLLvo
         rqyiG5qGpYV8U+JvuraMCfZo9i1+CayNQm2KLyig48Xu5lyozqw3AQmYku20rnofUGz1
         +ThIBX1lG5Gru6yRE3lgXjqKb4ffxphKDx7K60g9jvRi4B1Gsc0yLRRc1GGEw72oJc/S
         VdzbBA9amjIm4dAvnJqOtlFAksoc2jPc5BcjAxyVa6kEWnnG879Gxsdk/zj2WcXF+OYo
         KIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702757779; x=1703362579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paOFq5sutv5mu2PXmGFZ39aCAYEJ9KYNI5rH2SkHN0I=;
        b=f6Pc//JU9QeBKtc9hXH6UZfdtONlggIpk2tdaqj+QITWcYsRCoYcJ6WLcW0X7nZLl5
         2R92geU/fhPznHdYjV9cB0d6+XkS3IT7OdjEhP5av9EBLI3tFkua3Bup7Bxk6TySEMv7
         CQVfLUtkp0Tn9s/J9xchtyDH4iNOZ6G3nYeWjuhNqJGxKPiceneridC7dbRNB2zhj3jv
         ZGyZNTyvgqTSiwyuUzYjeCqzEnNbmHjFAtMwwryPfdPIFwyY7FgTVtvDl2+cSlF33J2p
         7d5L1HWqTEBvrnNLzmP47DpC7KQGmjOw2HRrnar5RMRU7DKRY5EsxtK7D+tdj9jEvjrt
         r6tg==
X-Gm-Message-State: AOJu0YzBJMBli8QDrFnZkzVjbJVNZrj8HC3d91NmOJEfr1ASElRU0iqW
	pz2viMcPIKZdqSTOHhLkUit0URBUW36HTRD4C0Q=
X-Google-Smtp-Source: AGHT+IEakoNGpjOTEw9PGISQZdqZXligAK1Xfeq91QiNKrqHewC/x6ZBoBGiMqxVfTYtsdxOpiQxZvdX06wL9VJFJ68=
X-Received: by 2002:a05:6870:c6a2:b0:203:7a7d:c041 with SMTP id
 cv34-20020a056870c6a200b002037a7dc041mr1027321oab.39.1702757778883; Sat, 16
 Dec 2023 12:16:18 -0800 (PST)
MIME-Version: 1.0
References: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
In-Reply-To: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Dec 2023 12:15:52 -0800
Message-ID: <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
Subject: Re: [OE-core] mdns on musl
To: mattwood2000@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 20:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192569

is this issue specific to musl systems?
Maybe try to reproduce it with glibc on qemu or something?

On Sat, Dec 16, 2023 at 9:11=E2=80=AFAM <mattwood2000@gmail.com> wrote:
>
> Hi all,
>
> I'm working on an embedded system and it needs mDNS in order to interact =
with .local hostnames.
>
> The image is based on musl so it cannot use the libnss-mdns library.
>
> From what I've read the mdns recipe is supposed to support mDNS on non-gl=
ibc systems.
>
> The recipe takes care of modifying /etc/nsswitch.conf and appends mdns to=
 the hosts line.
>
> When the system boots it runs mdnsd and I can see it join the multicast g=
roup in wireshark, but I cannot ping any .local addresses.
>
> Is there some other configuration that needs to be done?
>
> Has anyone successfully done this with a musl system?
>
> Thanks, Matt.
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192566): https://lists.openembedded.org/g/openembedde=
d-core/message/192566
> Mute This Topic: https://lists.openembedded.org/mt/103211493/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

