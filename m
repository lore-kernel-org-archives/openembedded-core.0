Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC859C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:02:31 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.45875.1747040550806247031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUl4uGas;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5b8d13f73so545876985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747040550; x=1747645350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Akk5bhOPKW19u1k7L1xi5wpxIMJ94yi5Y4Bo5ex1HAw=;
        b=DUl4uGaskuehvmRA/IAcKyGca0oH+yxl+3SjiFmX75SkMKk5mfEyjWy8nRgT4DZBXk
         exlCsW5Hdmd3+oe9IlYXyP74l0Lt3Vt7mfvhWu6RCaPuVjGD3BOy847sjkNeYa7X/4Bt
         AZriVNWcouTuCm5uSWVZYffziFoBiOTUES8YXZmqj3HBfqNXmezW7bLjH6uWHwVo8I90
         ZPwd0GHxrzSjH2mxEKTDpKg0K1Yf8i/4tiMv0HABBqt+LbdBN1Kx0wONmqh9cW9vdWP4
         pP/R7EYFx0Fjop1csUcryhIekWeArtrYUcSgqZV8hchtrw6ondbSHLpucCbZ/W0hbKZx
         2Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040550; x=1747645350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Akk5bhOPKW19u1k7L1xi5wpxIMJ94yi5Y4Bo5ex1HAw=;
        b=i5Z5yjAWvszINDj8jPxS3e624j/tf9BLGSNmsTA8eQp45RV8fNTCAWHv8/FhYFIIXJ
         YnH5icLfo1AmEMrTQdrRDcKkSS7RwzPJvSsVpvwhbi5QkSXe1P/YHTtao2c6LUiU9cLZ
         4VN5eowNYhpqbQX5sDXG81aqXtgfdUJGzTO1n8wXknzbqv6bWR7/d8PNLyon8n5S++o1
         MnF0DkWLCsE1WUNHh6tIDmbdxxip0816htehzBBz4ub1N/5YD2Dw/FWIQjYRVqLDDRKq
         UgJ11s4OT3PBflX5qtISmLWidpVX+9BUrXU3VBDOGWoKvqV+xlC4FMGit+pVsxjDmkpH
         2X5w==
X-Gm-Message-State: AOJu0YygYz6mjwJPZLYVNl2sxbSIhaB6HP6zz7WKK8uGMPcqddjev9bR
	vjlFJNPvTBA+rx1IPIjAQM+UhlLD+Icy3MbfCxIQV4tNdYElkK200wwOceYTSxzDNdR67vqkDHH
	CfJyE2JXiwwDFxllbmZLXWjYNpA4=
X-Gm-Gg: ASbGncvt7gAGFec/VbEr4hpJQ2JkTHpWVwgl/KmZqLdG6+KtBOio84MBSf0yymnpf14
	azlVeU3xDCD9sJHLxEfvOFCuDNPh81RE6oD9rc9lhcb6estg76R4uq5ia6LmXlbSKkbcoMwJRAm
	XNBnV17h1OkEnN1NRCIJ/SJGbiuIyr/Qff6w==
X-Google-Smtp-Source: AGHT+IGHXY+9X+4bVaYqC3CGSQeHkIDFxojDKZPzWk39qe9Mb6ex+ZJLUY6JoeZwfNGCxnuSuGYJPEy22cbHsQiYw4A=
X-Received: by 2002:a05:6214:20e3:b0:6f6:e400:45d5 with SMTP id
 6a1803df08f44-6f6e47bdab1mr187793306d6.17.1747040549728; Mon, 12 May 2025
 02:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250509211912.3286338-1-ohnatiuk@cisco.com>
In-Reply-To: <20250509211912.3286338-1-ohnatiuk@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 May 2025 11:02:19 +0200
X-Gm-Features: AX0GCFtiRONMWowb9lQKQOfpbYX50jRx0_BT_fSbPO56Y9EX0KzYqsuq48cTvnk
Message-ID: <CANNYZj_qhgsSZ540jiih6LoaSaJ7c+xmmk0ccA9sGJauBBUjQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216298

On Fri, 9 May 2025 at 23:19, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> allarch code is only triggered if PACKAGE_ARCH remains set to "all".
> This is not the case under some circumstances, like in the case of
> nativesdk class which overrides this variable. This error then breaks
> nativesdk package groups which depend on renamed packages yet aren't
> affected by allarch.

Can you show steps to observe the issue please? Why isn't it seen in
the test matrix?

Alex

