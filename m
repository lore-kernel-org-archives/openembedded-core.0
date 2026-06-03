Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45649CD6E64
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 08:51:13 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15640.1780476667939646981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 01:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nCWviOiV;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51780bbc560so1462031cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 01:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780476667; cv=none;
        d=google.com; s=arc-20240605;
        b=VEOIV7t5PYhuFs9ImRovCpCCCFYY5nPgazZJc18SAU6XZjbEJi5vbTZK4EKYPHrXs6
         YxSe9LfPFaVBeawdS9yYN1H2WFHAIII1ej9M8PnXE/7ZGu7J9FxGfrtqFJzTdLm3NPwk
         gHKp7+X0eIHVm1kuzaiCuzE+2U4D8OuEZM2Fg+AZRdROo+F/kbzr6jHg7wC8NFafza48
         OMWLkHtPROCm1rrlA53vDMmjdij4t9wpaow1jfUx8s/n1KVW2jVgtak6oIyQbVnU2Tda
         WfgA6dkGsKwES1tTkIGD0yuRHged/VK1lg52svbrJ8oh5ST2hev/p4P7NmGNbSe/FmiI
         pJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z1OU7v5Aa6Ltvlp0uVib2zMTXOTgClLhufQt465X8ho=;
        fh=AYh8hYhdWi66lwcOfouRu84XFKiGUWtsmJfo9bPsNCg=;
        b=HEeQhxLhs2pAIci9sjTnPbEHKZy/9JG8re+Xd8amA3kAe6dIeTcBgGq0G7rTsHGYmQ
         1Wtdw1tOGQH+rj1HFqjyfEuitnzESeOJwFBYeUl2JmGWbuVhoDAsequla+SJwNaynM6m
         yGoBoKKwfYvuhpauuwNHtgRI6Hdda81xQAhVCYcYXgnJy2LlhVGq5PeL9uRvrnB5CC0z
         hglWiFMysdpR4+eIasPFxc6Y454qcCUsb8T0zEOMz2ROCcx5Fg10oeftpzNpDYGIv/lM
         zF/Llv4A872EiqmmILjXBjPCpVqnAm5hGN0pIXWdoEPBPa6roikz59J5gSLTiV8troUX
         pfbg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780476667; x=1781081467; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1OU7v5Aa6Ltvlp0uVib2zMTXOTgClLhufQt465X8ho=;
        b=nCWviOiVF3G7u9OegyilKg0RA2zjyb+JMFtQMx4P3PlXjtHJP1E/Booaaol2wosNyQ
         CL7bUPxMotXwePhAxtfiuhnaAAEhqcFRUnx5SkVrvFXbyKGh1x3OiazlJs9oUtUcVuxd
         DwO+KJMeGVMyB3K7CPS+0RsqD18dUgeCivtMd+Cmasqv+TfRQn2iDZ5MPHpBHjk2RTd+
         GuHlZPrYSIpBfdCHWPW8n3hkHB/uo9TODBdCZpOgH8apYFUm4WqzhkZW3pjx0onVGOG2
         UjAeoYuTUKGN5RdcE0AhdfXsJo1gYSeWg2YM/3394XmM2wzQNGWVcz7Sz6CxKsAi2d6h
         K19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476667; x=1781081467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z1OU7v5Aa6Ltvlp0uVib2zMTXOTgClLhufQt465X8ho=;
        b=LwBJdG04zxZvjxcJzF+yAY/dn4N3byZ1TUov+DQM0OM9w0iqxTI8Aoz0u7F8i3UXuC
         8XqRbimuSJuMHgYktXS3Cbye1QeAajUlCOtNnMRZYgPHNEyqFGhlRSQzwX4hCWyrFU4w
         OFXZFC+3DdBvLN3hL+m553XydRDPj6FXeXiJpIbUlJAxFhIWJf1+h7tdAJFoPWxTNH8I
         Qxp2kgCuHAyYf4cvidpEqwMJJI/4NHYO7QOnsDnTxR7ReepBGfXqAZucgdT9LqWuvyl9
         GeHg86JkWzW4Ep+M3xtJKASb9YouEV6u6aGYCC7tu1EnFgnixb7i9DO3XJClVeLTOBfv
         kHkw==
X-Forwarded-Encrypted: i=1; AFNElJ+6/dbNWxmNbh+T5ZPtXTPb9BE20rILpiUd6gPYQpIaD3MnyKxPF61a+gYKS9exuGlemTIUITaH2Zpape4imxivHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3uhNMCiHSSOQ2RQQ+XUdAju6y0J7eGtLLEk0pXXE66sZL3k8L
	dyzfeDVu4SOzcLmzyzwAucBIuTo54YfI0PwwfkVc0GKgcX9cL66G0E38HEoEm81Z63mkxfbgn+x
	qzYCsGXpJh9cPNRJQ+QqEOrv1M4QP544=
X-Gm-Gg: Acq92OGsnFR/dKj4acbqXO0nyQqe/69DR3NwDXQtUvwQBKmlELlq18GHajUrR8eSArx
	QPYMohoRuc+HGZ+COGAOT4mmMqk4xjpLnTc4cYEO/L7XXcLMxGNnx3htg2SoMJj2JK7akEeRQ91
	n+s9yo9IePIrVt9cfk+xkKDtRwWLTMtlUbxvIJlPKocQg/NN5bdIa0ikxl2lCdyWDKC8UUyVNXq
	aN8rr6Q+m0OxMLkPDl+a3HCcus/aqH/wRnpwdyIDQr37SgTbaUljRSfQkn4GSscIWDYwIRwx69P
	k/s+XAYaiDnRQ6AF48uvHRfKBYqCiTB6eroZjicuVSIUJB3OXtN4
X-Received: by 2002:a05:622a:2616:b0:50f:f030:920d with SMTP id
 d75a77b69052e-51779825ed1mr24481161cf.30.1780476666943; Wed, 03 Jun 2026
 01:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
 <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
 <CANNYZj8Q7kD4Q1PGvfOzC8LzVDDDuaSHnTXMWep_quZpOqeoEw@mail.gmail.com>
 <75b044b4-eb36-4aef-9630-f5ad09712950@oss.qualcomm.com> <5f067594-0a77-4bb5-b44a-62c8b1c8bb76@oss.qualcomm.com>
In-Reply-To: <5f067594-0a77-4bb5-b44a-62c8b1c8bb76@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jun 2026 10:50:53 +0200
X-Gm-Features: AVHnY4ILLAN_l71KeITG6hsYuAYSKu_DSv-wfwSi2_dRxcSvd7yw7S5MmGC0MWo
Message-ID: <CANNYZj8OBNy4UPtcrEUGe76P_6eHdK==WoAbdhz5T6dWWsyXWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wpa_supplicant: Handle invalid op_class 255 in
 BSS Transition candidates
To: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, jouni.malinen@oss.qualcomm.com, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, hangtian.zhu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 08:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238084

On Wed, 3 Jun 2026 at 06:29, Wei Zhang (Stone)
<wei.zhang@oss.qualcomm.com> wrote:
> I followed up with Jouni on the hostap/wpa_supplicant release plan.
>
> He confirmed that there is no clear timeline for a formal release. His
> recommendation is not to
> depend on upstream releases, but instead to pull a =E2=80=9Csnapshot of t=
he day=E2=80=9D
> from the hostap.git main
> branch when an update is needed.
>
> Given this upstream guidance, would OE-Core be open to consuming the
> required post-2.11 fixes
> through such a hostap.git snapshot-based update, rather than waiting for
> a new formal release?

Yes, but very reluctantly. It's not a great idea to ship a random
snapshot in the middle of development cycle: such code is less tested,
less stable, may contain recent, unfixed bugs, incomplete features or
API, and so on.

What's the point of even making formal upstream releases if
downstreams are not using them? Who is the target audience for that?

Alex

