Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C58C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:06:15 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.10170.1738148771898701905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLBW4aG9;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be3d681e74so599591385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148771; x=1738753571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agwdSgD8ZfxAk6H9fqznkGJC/txdyZN+N8aOMnqyRr0=;
        b=LLBW4aG9Tzdpx74mrmtT9B1bZw7fxFN1ihZGckTbuY3TSGwSxxIYRh7VUKPQA6sXqb
         LwLYgi7xyTnNQMjj0X5Hfd7N6qYq9Faasy+wCCR/fG5Nv3aaj6V7YG3aXvTqwaw9B6ff
         1PLniwwRLm3q+FBdITdBo+z2Atv4bdtZYQjpk7X1c8d7PWyYOfHqUMKLn2reHiDDad/L
         UuUemzxC6WH+ZRVkMepnaGlIkfxdFy/lYKOLVpSnN9bQYbbbYo47Qcmtl4Esv79jRD25
         NPUh/4e0In1tiWaLOKx2bcVHPsRcPoUIQ7k6uE+HYiQcYUYV0D11RHTqYVnpa1ueRxkw
         B3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148771; x=1738753571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agwdSgD8ZfxAk6H9fqznkGJC/txdyZN+N8aOMnqyRr0=;
        b=N0aFkXgOfqcAZ1Rm8SvZNqPN00/O+gkPTXLWhOTwJlsXrocn6hOB2jxd1N/S6CE9QL
         mb+0fDRlBrlHDebaV/sY3oc8DZ/uMrf5v6QzwpUQOAJdB9a9kvrbB0ohvNyX/KZcet2A
         ujEmI77jwFh940fqxSGNQw3KmGw0K6Fa6ys+TkDniebgujZhF47FUZ648K6gdsiKZOOE
         mfXYWBAG5+PAOvL3u+d4u88V0cjQdXYXsHpxL2q6ea1gXC7fK8/V5yIOQ2UZeMKBBIBu
         wnuEhgAEGL5rjEA6Ec3NeGcYtFosSxtyLwSb316hm9NcQvTMpVQU4+T0aMXqU3sM8JvZ
         F0eg==
X-Gm-Message-State: AOJu0YxfAU4HrNbqwzgfRxZuRTnGotYZxq6j0hQnISSzLKPeefg/d/C7
	JGTrQzRwVDqqByaIliaO8sUePTWhJQkL0P7QpDEyHk+lJ+AymdwKsSsb9pP3FEc9JVBNj7i7+Vx
	tBcPL7c85qMbUlgoaTmMJjJfwJiI=
X-Gm-Gg: ASbGncuHUuvdTgw1PCZO0nh1YB6lNnUIwF0zv+wGYl5w7ATZinW66z7WxPFpPHlRY9v
	Xqd6+JXHhLe4GOhqTerEcQGFwBDAIMX1lOPC/tqw6UPdtB2mkYBG/yZPx8WGgM9dckYOE1Nj18T
	t8nwXHvBRwwUaMafX3pI2M8QooBjujyxQ=
X-Google-Smtp-Source: AGHT+IG9D0JCWPGjK2wlfsfpuy1S3TS2YCaCMZb1F6DNe4nwDw6vV/WlsCNdv7w40P7elsi9u9oaTdYbJwoMqAo8t/A=
X-Received: by 2002:a0c:d7c5:0:b0:6e2:43d1:5fed with SMTP id
 6a1803df08f44-6e243d16322mr29534036d6.39.1738148770897; Wed, 29 Jan 2025
 03:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20250129104150.2391653-1-zboszor@gmail.com> <20250129104150.2391653-2-zboszor@gmail.com>
In-Reply-To: <20250129104150.2391653-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 12:06:00 +0100
X-Gm-Features: AWEUYZlz5_IVbH_X0hx0aSEiwErekFY18gUh4mvuHiSOw-5L5brVdH4M9vXGLjw
Message-ID: <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] rpm: Re-enable signing
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210372

On Wed, 29 Jan 2025 at 11:41, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:

> -PACKAGECONFIG ??=3D "archive"
> +PACKAGECONFIG ??=3D "archive sequoia"

We can't do this. This will add 14 minutes of rust-native to
everyone's builds. Rather you should adjust PACKAGECONFIG for rpm in
the selftest (and your local configuration).

Alex

