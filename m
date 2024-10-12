Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E7CD1A456
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 08:57:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.7348.1728723465205965682
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 01:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j76FcSdI;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so446333e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728723463; x=1729328263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxO3K+09B97htiCa3zvCe3abheUZbYEF/3ACrZrroqw=;
        b=j76FcSdIkxK5na+WYX43gzTEZp3ogHXvAseGM1U1YheJj33XSS67oiUUMnugWBgd9k
         9+oT6ib6A+kN91ZMa90JL5/LmfdCAW7IPcb+41D1TLB7mztcEPhP+drZftRY6cnxoXqv
         iG3FXS58/gfmr5Qm8UzHNtcA2TjrTHs5ee/t9cs6VPwOee/4bPjyDhaDFpHr25MwfWno
         yRychrzrfhB3ZNJaLSYM5Xdmva4IrXGri/h2RXudO6lcxI8cJ3w8l9B/MgpCMVpHuh2l
         SbI+U0yQZPObYcv4nuDFE9bXli60Y0068MtCJGvBbjrQkwtruL5AixbY2eOT0ugTCVRM
         vRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728723463; x=1729328263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxO3K+09B97htiCa3zvCe3abheUZbYEF/3ACrZrroqw=;
        b=k9LvKBRBO0mA6q6hpAPqtT061u81zMBCXbIuXQ/PA4l6+LT7tekArIIkamKgERJmAD
         Vr/Gdryoy2yUy7K5uiv1t+yxD0uwwlZYDyYvSJEPCVAH8P9EowNQ+b1G4R8W+uKQQm5+
         IZ9jqJabajvKisVIeXxjmAeTuBvAyiTNKc+ZETig9fMdJjYQXdIqxWVg0dHaOhOC39ft
         vbwreQkR1ZiMO84Kr0RVvouRSwitf+dUDuGV7Ro2Np6nvhXEPRY56vL0SrCP3VR/ScMz
         v6Kf+jLZrRMIfNfZx6//jCalG0EoN70G9jEcill518qjZNk53Cs6/6QBRXHk3oHGn1nz
         QWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMhgrz3dftDvBjYE1sSDmzlghrh/FHPSw3btBJ2L92XAN79YlrTUwVhDudrgZlIJWuzPDmdXIj8cXqkKuc8Hw1Hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiPfjv14Bj/64U1c2fh8jPVqZqRN0wWk6Fjal6d6DbTgtk2F/b
	29MquCVomahJyjajKvqqId8tHGOz6uXE298c5fmR4KfomAyrv0eh0uGYJ0KdGsPadsMhR9C1n20
	MxFm3ufYHf56tTTzS4cjo9oF4QxU=
X-Google-Smtp-Source: AGHT+IHY2DPKAGKHyonmvAPo91bb0pbmV6PmxeIruKm5FJoW6jitRYYYpYA/lYtYmbDPJ2/Txpw9aJayh/qAd5n+oUc=
X-Received: by 2002:a05:6512:3d93:b0:539:e88f:2398 with SMTP id
 2adb3069b0e04-539e88f2838mr379907e87.39.1728723462645; Sat, 12 Oct 2024
 01:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com> <CAJo0Az5_R1agVfYbNhZMCKaKrjg1d8fXfe45Z8N8-9zUFzjupQ@mail.gmail.com>
In-Reply-To: <CAJo0Az5_R1agVfYbNhZMCKaKrjg1d8fXfe45Z8N8-9zUFzjupQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 12 Oct 2024 10:57:31 +0200
Message-ID: <CANNYZj-pX9kQ6RENEtSrDRZOQnRX2E21PvdsXYHxKbaw+zQ4YQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 08:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205704

On Sat, 12 Oct 2024 at 00:05, Tom Geelen <t.f.g.geelen@gmail.com> wrote:

> So if I understand correctly you say that the reproducible error is
> not appearing anymore? That is good news.

It's definitely still there.

Alex

