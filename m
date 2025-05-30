Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B98C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:15:36 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.5696.1748610929156855261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 06:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ahIU3v1H;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a3db0666f2so41114901cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748610928; x=1749215728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V5D+UTV7kneMkUwYlybbBYilILEwgBvYRJbUjBf5Prc=;
        b=ahIU3v1HZfuT1Bb6JmcLrDdgKEnINp/bNSOYm+iITSya2s4Jmh+W7iZIPMz8FFiWfz
         Pi6rxj9LF07jcRQnBNzUTbTgWeHp0Ya+OcKYyFJEIX7eRvcg+oiKrg6lJhrNVyNUWaCE
         whKKqIjZdD3gh2mpU+r1C3eYdOIi+yMGpAkjLu0tV7sBt2p1stEiCvDkQt2Y4o3eDaXF
         BGCiGNHw8FDGV+BNRz2PoHLC4DIxcr3IM2K6LOdGi1NekgzrintjqHbQjV0rL0vouvJZ
         AHuCpDEbljUky1PppvhCPX7ZjoeYtZxfiQ8bQf/VVoBz1SHrkYhnKh7twDtDq+alXuPf
         k1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748610928; x=1749215728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5D+UTV7kneMkUwYlybbBYilILEwgBvYRJbUjBf5Prc=;
        b=q6gFvo8XDvraiJBQ7n3zxOdV/OxWBXHjAEtO44MwX+G8SMuSrzWhyyUDk3x5WOhX/V
         DHJZCVI/GPAwOQwfgZs8knMo6ZVy5bJNfwmxQOiMWCRLYB0GeP4EWjsYOxfFLwZioccj
         6S50gQbEJvZ7iYGvFkihxGUXS1Fkoc8UR2UMcH2It3vg2NIfXtHA2hM/e3optF6ljwZm
         X+ti0E5M34qSwb4UIf3h6ycxSUxXeOPYF7X2YF0CpZEMXJ+7CPkUcSHhoOGS7DtTTp0x
         muouJA2OcMc0u5KEXJ38iy9/uNufuy7/WwQN9w8jpE5ct9drIV5SBs4ap850qQnagmav
         YC8A==
X-Forwarded-Encrypted: i=1; AJvYcCXb1aoJtMDv1hiNt1fkzFq0iskdpEgKn831sPAAAmKRJvUTaPSIVXeqUTmYhz0ueOEDoNwcwukBTu3qpA9YAokzqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiRNdIh8SqX021Mp3E3hurq8WAdQ2Kor5oNSzZQzjRmOxe+Qd9
	TjWny05Zd+faj9vIbJgyA/EVLbLcmY9wNAy75Ea/vF1cFnjSw4iZvqLy0Oakvpo25d5OUsxcyM1
	X2mA2Aa1UZYtOaL57CtXu1WJe6R/ubjwo0A==
X-Gm-Gg: ASbGnctf3YkdxFmP4/xroNtpxLFOO7+6iu89H5jza7orIAHIjypsq/NXGqdlUOYE2qG
	CuUmw57tXnGTQHrwwoeY5f5h1eweZjMhAyJkw/8ymHJn2TXDjhGU8XfelOMQVyRpMsLZ5ZGLJV/
	yywBs4fOT/kCUiCanaV+bbqozWbz/YAUocpZjOk0QiZw==
X-Google-Smtp-Source: AGHT+IFlf4tK+fDQA3FrophZKyxqLy7MmivNBe9VC7JJa73n6t4iWoaNDiNjGQam38i1MmVcviFbw2ySpibH3vdjIW0=
X-Received: by 2002:a05:6214:5199:b0:6fa:cdc9:8af7 with SMTP id
 6a1803df08f44-6fad19073c1mr36408126d6.7.1748610918036; Fri, 30 May 2025
 06:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com> <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com> <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
In-Reply-To: <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 May 2025 15:15:07 +0200
X-Gm-Features: AX0GCFtsOkQjl8fQXtS8WXxgnA4eNkMi71Pwhj3WQ9KnHCeYkfYUBVt2n4J5umY
Message-ID: <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217506

On Fri, 30 May 2025 at 14:42, Yash Shinde <Yash.Shinde@windriver.com> wrote:

> As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
> Furthermore, using "use-lld = false" ensures that LLD is not used as the
> default linker,
> causing the build to fall back to the system's default linker. This
> restores the earlier behavior.
> Also, the package QA error for rust-lld is not seen with this.

What about build times though? Are they back to what they were?

Alex

