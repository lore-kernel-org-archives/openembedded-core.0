Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52370C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:45:27 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.43465.1745336726319641212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/DVRjao;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476f4e9cf92so39367211cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336725; x=1745941525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2l1AosZECPJftE7HNLE6KYIsa1vQTxpJpMyyEweslQ=;
        b=O/DVRjao742Pj5WpsFPk2wSLz3R9gnzPuzBrfb2fcoIY4MZ+Huo89cavvZDyp4HwAU
         sAhGEGTtZDG6+sWjsKwUf8QHRhdMtl1UnKBStw1mxLDeZylNG1VLt8Wn/BlURDWbzuOE
         f8wOecJvPm8m6su61ZShx1XwPEO5Pk5En+tCAqi7G56Ww0VXUmYrlthJxeOu88GLVTTw
         wdFqZRk5FjgKAfrlQVlvxUALljWtubr3zhzRI4nfp4++PQkkVGe92GCGzFyXkrFFrXE+
         uKOepfWzTfl4UpDp7uLeQk31C0ElqKySxDU3nTcXh6ZssrVJk9plkHxp+XnFQPhHH7y6
         +0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336725; x=1745941525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2l1AosZECPJftE7HNLE6KYIsa1vQTxpJpMyyEweslQ=;
        b=izw94QvbKjyowo3Svj2kAurbMsbeJiGhd+79hpO5PeuhPyyDrkkULotLTsh1vGTIFh
         YvaHj4JIUEt1vJqsaybg9JOUxpD/Lnvi/5rnzq3DEvSIm2v8SrFmKE8x0bj8W2XDb+hy
         HZhALRLlW9QPR9gdu/p0yE8kreJWXGtELhBdxmbqh9FUw+is+sf0ZiMRKDfGxJ9ncBDB
         trwvEMfb2Zq7lsWoSGzclKn9wwtu6e1tptJXbLQSDCpW8SSouMsWmdBV8saI+GVcmZfZ
         VSxcL0MkCqCZ+k1Ba8B5rVLosu7JM0QI/An/3/duLxvsK00MAkL9tgjnId4Qx7t+vOvi
         BITQ==
X-Gm-Message-State: AOJu0YzB3x/T+7Z5VpQgVFsszSvoF3WFTK9wJXzZIW//FlD3qvEkYX4B
	X0ZrZIU4XwoNAvMwmQRiKiwA/GhFayhLuc3NK81QaNL1tCNWMk9rkyLvYPTI4yeKsViKnPstmLJ
	aY96k/kJDhXWmsl5bymEVt++MPPgikQ==
X-Gm-Gg: ASbGncsgmk84S8/hyQOM4RdDgdcC5dM/2BlzjA5pgMGZM4C5Y1bIos+/S7QEb/wdvGD
	/6tou0Zq6SsX/cNmkxqbVZaxXLSe/73WMGoBEQC+7S4U+2bc15UD7jjK4gpQKmRNaXY9E70/sEh
	eEu1abPZHhJKpfg6NUGjGUkNV3+V0XsFYqcA2UT4bfLqDbF/lkDfTG2MG3
X-Google-Smtp-Source: AGHT+IGzYy3kLBFfp7dUy/xM0Pq1ge35RP3ZH0DBFuqmXjGVsOl1pfYC/zrgecDUpC3J8saWTtSWF49NDlj8DZTP2yo=
X-Received: by 2002:a05:6214:202a:b0:6e8:fee2:aade with SMTP id
 6a1803df08f44-6f2c457e424mr309066046d6.25.1745336724776; Tue, 22 Apr 2025
 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250421090611.3862686-1-yi.zhao@windriver.com>
In-Reply-To: <20250421090611.3862686-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 17:45:12 +0200
X-Gm-Features: ATxdqUHKXnEZlmfq7cVihaVKcGiHUie8sgMZLr9Gbwo2JAhnFK0EM8cJ5oS_4FE
Message-ID: <CANNYZj_MkxaEpUHzQbZHsBix5UDa=6qSLPf6viyjYV-Gd2LFcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libsass: fix runtime version
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215235

On Mon, 21 Apr 2025 at 11:06, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
> +do_configure:append() {
> +    sed -i -e 's/\[NA\]/${PV}/g' ${S}/include/sass/version.h
> +}

Same question as the other patch in the serie.

Alex

