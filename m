Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3742CCCD194
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 10:11:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.11823.1726654287552710587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 03:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWMuY8cZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86e9db75b9so1027838466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726654286; x=1727259086; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kttv3VYc3yWNYv5s6VGIn5OWRS0niWe3CEPKpf/TaJs=;
        b=bWMuY8cZ6R/n6Xxj0osBNo8M8ICz0wWdUDnkUReAZUUuME69nhX2YNj5PduES5Vn6S
         /QxrB1Ll3F5VBmqchOxjSrrqCk6Pff+bUEDjxdSH44ynw2e6+9ajsgDU9FvtqkKJdZvi
         FReI3/R96rmpU7t4cWO8LP1ej8HKa/BHdPI10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726654286; x=1727259086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kttv3VYc3yWNYv5s6VGIn5OWRS0niWe3CEPKpf/TaJs=;
        b=mOWilhYEGEjnem+QYXz5O0TGiqWksrz4KhzTJV9pEA5Bo+84janOJ5dgtW8f9HQzqp
         QVSH17toBdkZN0bw1VrzkvTm8Lsb5E49KQYQXXUAiCJlKCl4w1e5SDjJdAKevAmQJM9p
         iyKgLnFlLZRseoLKwq9azVdzjLk/i8+cPcEijIhPULEh5Tm2maTEYQwqCt5Yue/6lWZk
         70gASSRefPQlB2d/SZYsOM0Q1z3GmKa047yC2m7z3ufE6z78MuV4zlWifP3gqsnZHfP6
         9U+txT7yuBa4vwMDQm/AYHDgrapyYvILyi7ycb230g8GG0yWW4IzcGxQP2gSUSBwZh+Y
         z0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKzJYTdFKHPY9Eir1JbULHCV1T5hqHH0k837JXQQIkrse4xfmFIaEIq2gOTSmfEDWWQJjJ9f0V9ogXyZ6QLT7Nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywm+iLNgf/kK+Te322Be2oDGPiemU671C0ZgGyb8GMkwkA9Lb3j
	Psd7tyUTTziuyyCHn2kZrz49C1n0BoTITv/M4GHop9y+je6q8cFmcqfBhQet0TY=
X-Google-Smtp-Source: AGHT+IGLVTCbk19qalMdpt+KLS8QAJHF77CEFc2dBzUOcaROQuSt5TPRzgiYWX9Avk0Pl4pFSU6PaQ==
X-Received: by 2002:a17:906:cadc:b0:a8a:7501:de21 with SMTP id a640c23a62f3a-a90294ab552mr2122129166b.12.1726654285678;
        Wed, 18 Sep 2024 03:11:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:84e0:f160:18f9:5089? ([2001:8b0:aba:5f3c:84e0:f160:18f9:5089])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b78c1sm564249166b.101.2024.09.18.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 03:11:25 -0700 (PDT)
Message-ID: <fe63f607a4f3f521e51c6ff2724bbd537977a5b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/7] Add barebox bootloader support (and
 testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Sep 2024 11:11:24 +0100
In-Reply-To: <20240912091857.2631678-1-ejo@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 10:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204638

On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via lists.openembedded=
.org wrote:
> This adds support for the barebox bootloader (and tools) to oe-core.
>=20
> In order to have proper testing, this extends oe-selftest to allow
> basic testing of bootloaders. While at it, cover both u-boot and barebox.
>=20
> v6:
> * replace barebox.inc by barebox.bbclass (move content of
> =C2=A0 barebox-common.inc into .bbclass and .bb files)
> * support for UNPACKDIR
>=20
> Enrico Jorns (5):
> =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> =C2=A0 oeqa: support passing custom boot patterns to runqemu
> =C2=A0 oeqa/selftest/cases: add basic u-boot test
> =C2=A0 oeqa/selftest/cases: add basic barebox tests
>=20
> Marco Felsch (2):
> =C2=A0 barebox: add initial support
> =C2=A0 barebox-tools: add initial barebox tools support

We had some testing capacity so I ran this through automated testing.
The one issue that showed up so far was:

https://valkyrie.yoctoproject.org/#/builders/29/builds/174/steps/13/logs/wa=
rnings

which is at least easily fixed! The rest of the build is still going.

Cheers,

Richard

