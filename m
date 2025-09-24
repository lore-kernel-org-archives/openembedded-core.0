Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C3ACAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:41:46 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.9622.1758710500296853630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yxy9UW+F;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-7639af4c4acso75411586d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758710499; x=1759315299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pslinVdFcMDZE/Z5mR2SqG/biUuuf0boMxx/pQ4pzyo=;
        b=Yxy9UW+F3JU0jOYgqh9Ft9S7ZEHgN2a5/oKLRcqP7CHWohZ066IQqEPDr/ppW1ptxX
         mvpxi8BTsBH2q/1AenDqpucn1u77wQQVzBjyESnbxhSfIRsTPHQGPXeqkSLpQECv4nWA
         U/c3Ah1HrqDesbrvFTcYY1uCPqDcnx+kgMhQXkBgoxo34fORS5QmoNeURO5T39neeTJ8
         PxigLYdBQJI610qYG/peN2Fp8WYYLLhR3L2fR/EAqFd5k3W9WARmKLbzYi40VRsinyEC
         oYXcZHGYsOhpnxxQlA9PN0/yfJaVWiPiCNjlRKrZZODrcVQymbTKS+E1iBCh3mHMVgaR
         TQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710499; x=1759315299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pslinVdFcMDZE/Z5mR2SqG/biUuuf0boMxx/pQ4pzyo=;
        b=sSJ7Pw4PGs0XTpaJuVHfuyvafUDL4HrchIBI3T0Vy/MbgW9Z9eDFuzFC/SLC7WBtKw
         6qd0S6VuNcr8VSlsfMG28F2QK/V/rMcJtolr3I31EEN7PhraYRgzvGl59xtExfRxaPu5
         lr3J6GQ8ZVS22k1W8MqBY/8vE8mrlaOhEp4Qs9CauFC0hIbULSJHojJDv5z030Xw4mfc
         FzxDFf05uwL7dPhgEUmWp1rDml4ljbDBNMgIYwG6xYvAu2cYzBgtWE3xmEMDyjVG+RB1
         NiQwmhvSiwkFVdnyJCt0/Jp6vdOgR3UfVYTWNA21Ihp/pIWg70YAAwSbF8Hd0tTGtkR2
         pCjw==
X-Gm-Message-State: AOJu0YwLBzay6kuJ/fxPqR0wgFeW5nxRjWyStZ63fHTJpfi/nGYyTCT7
	XKwzcfCkY7g+bTG1ZLBBQTRKoJs1JHVZ4InXsoSbSEIBq/SPTLZODeL7QRKMFQHCo0yqm3iDoYR
	yOW3UwdrKE3yv/19Vc2y4UeX2tSx4bU2kFQ==
X-Gm-Gg: ASbGncu9POYD6p+w90DYh+fV93BlX5liEy6MFZ5lnTQCoeeR8px1uR5x7nQcDYoyCCz
	WIZSpCjrBpFRIJoA8kZL3Z6/UVaPKXfuhtjFjJYgbpXaa36fzghbIvbM2MhjLzux2g7lN5UOLxn
	wRkxcuMnvUl1uOxHsnORKR+kwtYl5U8TSIsPGdWriOh0Hek4I7+Br/nymusFkgirFtzMic9kB0j
	C/81Dy3DN5VP4uZeB9tfJq4cizcwUN+E4hlA4mKGR/VM2UmZ8tASyxWUYTRjQdgu9mzogKv94bQ
	2Ojk262nu5zCEusoCCR1gomzM4J1f6UdFo5ITexGiW8FUae5Oyk=
X-Google-Smtp-Source: AGHT+IEmpb0KRYLT0FfPrZNUo4sFzRtJcegXTkVBgDsYwLwmIbjS7rAe+fcNr3AxIcAzk7ZMuWEOHvhuXplYWhr/3ec=
X-Received: by 2002:a05:6214:529b:b0:798:95da:611f with SMTP id
 6a1803df08f44-7e6e4011a15mr64268016d6.0.1758710499380; Wed, 24 Sep 2025
 03:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250924103729.111501-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250924103729.111501-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Sep 2025 12:41:28 +0200
X-Gm-Features: AS18NWBQGXaE5SEbiayZb8XkVeiRgZYOGpb539394exRbbuEpCEpsBEOLAKjBfo
Message-ID: <CANNYZj_vhzWn0i33xKAWbfU=YCzrj+GyPPFVe-Ygc4wAHb+S2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fontconfig: disable tests on native builds
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223960

On Wed, 24 Sept 2025 at 12:38, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> +EXTRA_OEMESON:append:class-native = " -Dtests=disabled"

This should be unconditional to avoid non-deterministic configuration
in target builds.

Alex

