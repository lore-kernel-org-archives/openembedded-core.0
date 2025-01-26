Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D6C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:58:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.29488.1737896274345133845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ph0+yA86;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43634b570c1so24799395e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737896272; x=1738501072; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/rHl/1un8e3N2rFode1rz0skMzCdN7uHU6OCpC0/H8=;
        b=Ph0+yA86yUl7TddDjG2c58ChbV0L9aPZbtJBBCUcJ5ZuJB46Q4kBdQmueel2zh53mj
         YcQ1903/7AWr2OAhRZzs3idGaHmJvaO3OCxZr5h/i4egOfBIaUNodWF3yamkQrlo89Nb
         xV6RNsE0b23J+IEHOIzal82E4J7WNZSp4hdDJZjmjTuX20zX2Uba1Y7qtH0q4DQN6wvx
         kO1RY4z4NUzcHRt6NJpEY7aPo6gfOhiQNEcZDV5SJlGE+IWOxjrFcn0tMdm5ROfT9TCT
         uBSbqspBAuINzKicMgHcNe5hvcHau5+wehjxK9U8s+C2xUBelvinLsACogtP7+BHBgAB
         MXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737896272; x=1738501072;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/rHl/1un8e3N2rFode1rz0skMzCdN7uHU6OCpC0/H8=;
        b=jWOL8zuYv1TqSLiR5SnMqWvfiYrFH4ns3mAaRieCn6uKUJrTNv944dsbI0QcclT9aJ
         ROisS5ytLCAsXNioRXbep4d4+9qpldvVl5GYoqg97quHhCycMh7wldhuPPKVdvEi9yKY
         IAZBEoiv3FmMEr4YIjLd0gJM33aycToBYAKftuWl2qU3cgvj4NPG1s/qBIk69QQYRTY8
         +Hja94asBi2WfJkxuilEOXDY2MXHSe4YjGjIawDZxVlD5xTmOZMsiJxfShR7mEOf+zbI
         4U18tDWDifnD1AxASfwDvtbDJ/Z+Jz4Bd4+MVaoc4kfV32hny4Lim8DuVjtsR0Siz7Wv
         dKtA==
X-Gm-Message-State: AOJu0YyBki2tvlScf/OXZvANIJly0I497uzGojwyKw6Yrk2M2paymBiU
	yOTlRQUyJYmlgOTozAJM/JtZLWiC6ETujrtl1A+tvP1jDa5z0HmRN9C9Zg==
X-Gm-Gg: ASbGncsRiHnG0I4UvAcwKYmGGqAGQNkkTZSZzkIxGOdD/+BMh6swB8cDQsZZ+O0SJCq
	c1TWsdLo/XX0tavX9yED4YKZgojq6uLFAb2+j9IZ/Fr9dMjlXlfgzXWv4wNLsQdYnotvVQ1K4+Z
	sUZPCqVV6DNadYS6f7zvA2RHFs8NJ0WZhAiZv+fyL/ua9V4E9VWXF+nm6hctKxyipqItVq69P1s
	cj/9gNc1r1ej4soVU9fMFC5jew6WKi1wEcr0eXzfReSjxS8lREANNQZFfW7YInVzHOdSh/CSypg
	cUp6erjDdgH84KAhEiaZ1SLmQak2Z0LVmctJ88/Nu9vPsmLJgAr6fQ==
X-Google-Smtp-Source: AGHT+IED/wjfG5R1smwLATANhHs1GDJsv4rr0Y7MNlqOAMpzhUCkSS+g+vfpw3/hrjh/ejdXsivqog==
X-Received: by 2002:a05:600c:1f86:b0:436:aaf:7eb9 with SMTP id 5b1f17b1804b1-43891439d5fmr301490855e9.20.1737896272395;
        Sun, 26 Jan 2025 04:57:52 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5082d3sm92284435e9.22.2025.01.26.04.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:57:51 -0800 (PST)
Message-ID: <d7cb1a42d9bced967202e6ef4290e7663fafe4a4.camel@gmail.com>
Subject: Re: [OE-core] [scarthgap,styhead][PATCH 0/5] pick devtool ide-sdk
 fixes
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Sun, 26 Jan 2025 13:57:49 +0100
In-Reply-To: <181E3EECB3DC90F7.4788@lists.openembedded.org>
References: <181E3EECB3DC90F7.4788@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210286

The related patch for updating the documentation is here:
https://lists.yoctoproject.org/g/docs/message/6181

Adrian


On Sun, 2025-01-26 at 13:48 +0100, Adrian Freihofer via
lists.openembedded.org wrote:
> The following commits from openembedded core repository are
> cherry-picked and apply fast forward:
>=20
> git cherry-pick fc17808799d2b667afbe4ea9837b66af70d47007
> git cherry-pick b886c26bf893878ba8eb6bee80dd0507e5cb0d2d
> git cherry-pick 65950eb601c6c8aac0e4bc8683e544305346229d
> git cherry-pick 9ab1e35a0969af144caedcc25cd095a17d758bf9
> git cherry-pick 177aa72b37f2061ff3311ec5dbb33aa56a5ba006
>=20
> Corresponding documentation patches will be picked in the yocto-docs
> repository.
>=20
> Adrian Freihofer (5):
> =C2=A0 devtool: modify support debug-builds
> =C2=A0 devtool: ide-sdk sort cmake preset
> =C2=A0 devtool: ide-sdk recommend DEBUG_BUILD
> =C2=A0 oe-selftest: devtool ide-sdk use modify debug-build
> =C2=A0 devtool: ide-sdk remove the plugin from eSDK installer
>=20
> =C2=A0meta/lib/oeqa/selftest/cases/devtool.py |=C2=A0 2 +-
> =C2=A0scripts/lib/devtool/ide_sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 63 ++++++++---------------
> --
> =C2=A0scripts/lib/devtool/standard.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A03 files changed, 24 insertions(+), 44 deletions(-)
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210279):
> https://lists.openembedded.org/g/openembedded-core/message/210279
> Mute This Topic: https://lists.openembedded.org/mt/110820926/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


