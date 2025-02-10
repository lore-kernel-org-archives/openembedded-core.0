Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59A5C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:03:48 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.46659.1739178219545242695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fDTC2bQD;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be3f230436so405812685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 01:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739178218; x=1739783018; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dCNKo/jlU2Fl6F7jwsi+ole4cvvlEuUo29TFyO3+4c=;
        b=fDTC2bQD0h8JreGsqe/3bPkSuOlae+1XIOuHPPaFEdamJzL1Ew51kQtraJeFKnkFB8
         B3Bp+IVGI1vSjZAjCAlPfor/NuXdvm2XTzDSMguE9SVo1Ujxy+S4HKgaXxgSaTIFe1lM
         xrr8KVtDgCK8Ai9kNWzEbCpykrM2VFR3WYvLeq/23YaYGju/12QaBDQ57UY+3fCybdGv
         uj+sVi/xY5lsqyzee5X4+qKAffAXrpVu+/7AORRMxy40IhPZMQb8boacskjZLluuigZH
         xrEzYpOxLB9gdowlg+XFwkMLg/4vngFVnbyKV5zsNmzuGZNTs04tbMpS70HNQjXcZD0D
         EzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178218; x=1739783018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dCNKo/jlU2Fl6F7jwsi+ole4cvvlEuUo29TFyO3+4c=;
        b=Jt6ISCOuKzp6Sc+cpr6D9x7D4zQwIYhyGDJQqXNx/TXWZWqLPyhASstnTv8cVyPg50
         hvBOEe7/irex09fcawztjvGSCGfc2Zh7vxvCW0ftXmWAFj8NgWKM9rYNA+ZpVH082E7C
         2rGxxGjLO9ZK96shVY1AX+JaAjQf8CnCIp1HEx64N8fXJKXih64obxrGYrAF1KbBsSTJ
         ER3ONm3bIJWkPbGcaXsvzO9Hc3jhd54yrweyV4qzRexParD3iPRnuSqyZzagSITyQukE
         1l5NrVMl7/grUy/syxCyVlArvdp8eX4PZRfv+Ow5gX82//IKy6cMv5g1v1dcD/Q+UKxX
         TorA==
X-Gm-Message-State: AOJu0YyF73b9tqUS8Vmx5lGPIPK1usixVbbpQMoA3h+//wWswHwJuAwe
	7jyY1ydBFzJNvKc+FDVGTOf7BLRvAJEm++HMfLXjDwNnjl4SwN2U1LaXw5L3Z+FKVWRz/4H7/Wi
	UCueG3tpjjk3By4DOhHmmCx3fkA0=
X-Gm-Gg: ASbGncvwKRBPZi/YzD++iqktKk5d4AIWstq4oY4M/OUuR5rFpc0hsO4XHQYJoiqDgJd
	LEKfR4MHBB5yXWMYKtbnD6RBHQvv8OZCsX+zo/h8iXF4KQxE/BIqIoXaSxLFAd1KJXppk5Y5OPy
	Lka+DMR2637bZu/c6fZBR0+L8U61pKNC8=
X-Google-Smtp-Source: AGHT+IFUGGcfDIcDrr92iIKAih/wghUDxreqnEU2PjEhhYc9Am7GYlMb1fqvICPEgHRcIV/VuKcqFt1GSypbU49sJKo=
X-Received: by 2002:a05:620a:f12:b0:7b1:11ac:627a with SMTP id
 af79cd13be357-7c047c5e491mr2033341585a.25.1739178218657; Mon, 10 Feb 2025
 01:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20250208072445.986573-1-zboszor@gmail.com>
In-Reply-To: <20250208072445.986573-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2025 10:03:27 +0100
X-Gm-Features: AWEUYZmLXDo2W-mwTu6ZSBYN-h73A4bd3w1NWN9xlf0vPr8eZnFc_ruD5NGBPVo
Message-ID: <CANNYZj_fcDG+PAoLNcEnKOD3+ooiiSS0acLOrT+j5yqZHjr8ww@mail.gmail.com>
Subject: Re: [OE-core][PATCH v10 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 09:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211083

On Sat, 8 Feb 2025 at 08:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> +Assume that the policies are good as they are committed.
> +The CI for fedora-crypto-policies ensures this.
> +
> +Upstream-Status: Inappropriate [Yocto specific]

The patch as it is is indeed not suitable, but perhaps you can open a
ticket, describe the issue, and see if upstream would be willing to
take a configuration option instead?

We generally ask that Inappropriate patches still come with ticket
links, so upstreams are aware of the problems we face. Sometimes
solutions come out of that, and if not
this documents their response.

Alex

