Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A24CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 08:09:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1764662983355544764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 00:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4vVcWh8;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-882399d60baso41906476d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764662982; x=1765267782; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v5rMDh9NTn5uxrd7l67Li5CnbzLifygyhlfpruAVZUs=;
        b=b4vVcWh8WDk+d0kEpsKLIhe6IUDC+JiCk1GKt/6r8flPMI2Z2nMoQ+iE9VInbvI3cN
         0QQ37J/ruSCqe3MKzZtkd7kom5fBNJeWCBM23+DLuV1q2oxG0Cow94oaElgfhdHIAl2U
         FhQWlexIkpAJKnVnD44F+C6V86tTBEuAli1A2SHMYrkq9GYzwwUEFgfW5DH3zsJhCVSN
         50O0cKUnwCEq6GdwdwmMiMzxvljlDr1revMu8n3ba5Cu7Qt4Qvea1+xH02vUxqbwOMxv
         f3BQYBdE3+qkGvswY7Mt7sBzxB8uPkUzRfG1ivG3VMLd7CLr3VtWmiFD75FJRlk0X8Ou
         vW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764662982; x=1765267782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5rMDh9NTn5uxrd7l67Li5CnbzLifygyhlfpruAVZUs=;
        b=nF8QeTsP9CTm7joZIGYvGjlYRAjn5TM3BPBTWjhhCSs8Yxe14gVoDZCeeM1kln1x/1
         p7Fwpm6q+/1VY+P0PlpwZ7b5zTzJyajXP279n1rY9vStY5S/Y9M7jLbnJ2/Ryun7/DcA
         NJ3IC3My5o0wP1DNVkYaWhT1OagiQISUNxCWWPKQPHpRNPfYz09iiYvdtnfuE7tRJBIx
         dRPY2tDuQustH9vdFWjIuTYUSMfpUG0qZcn/zlinUOdgVKF7PgmQKL4XXO341sLd4aGu
         O+90YrWQc1ReV3yd0dPox7exnMW1R3SCtHoqipSGJzHOkd/Cel/spbW3uTU6oyP3EY9i
         M4jw==
X-Gm-Message-State: AOJu0YxPBKKC6E1uIJHw70e/aT7q0odpGGH0c1vbjHC7HNlL9rO3tvgG
	sqVSVN/RPlKM8uoPKrcjfNLykDj0vv2VLx9/tOhYmyoIWF5tjz4imh9n2irY4C+9ma/qO+CLHJ7
	AJJxXCwbSwGDswKoR4SlUs0/Q6T+xgEs=
X-Gm-Gg: ASbGncuqry0pi9V/ADlt1/AOaeJ8/3r8dNJHKnhB6GG3YRS84aRCnCZz1UXeaMrsmSJ
	2QP7C38NAVH71yxQwemCVUeTscfDT3I/SwyubjxjwWtkzxf0/e4g4zbFkGQmecbH4TeVBjZlIzf
	injamAi4mGcUDUrl8lZ5Nx9/CvxZhA/9XYS7quIErthvTGnyeR4Cj5MVytf9V8iz+SKfstJc5Sd
	oa9gpnqOt7QS9q+7qvWC23jHZOk2M3JNo+nXDoZ3nytqtyT+H05Z7MTtD2GnpRSr/yLhyhlwLJB
	HDZbb6jsKWkkBIemu++KiOjvaoEBjw==
X-Google-Smtp-Source: AGHT+IG0TeQd+6F++ZHvoFhf6/m0ZxJazZ3EzHJYWEfxWfalFIt0/m9yMJ/QEgA/db+IeukYUm7ge1euJnQuG4U2g0Y=
X-Received: by 2002:a05:6214:2f12:b0:880:5e62:ae90 with SMTP id
 6a1803df08f44-8863ae61980mr434636086d6.9.1764662982216; Tue, 02 Dec 2025
 00:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com> <20251202004951.2358784-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251202004951.2358784-2-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Dec 2025 09:09:31 +0100
X-Gm-Features: AWmQ_bkqvCNGZ4WxZQEWlO_vnvvptIqnrxxvrcVikcckkEuF4rOBt7vWTly5Gqc
Message-ID: <CANNYZj9smL_ouopyuuWUiKsdbUkzpHchFjib3ABo43+n5mLD3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] mesa: enable virtio and gfxstream Vulkan drivers
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 08:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227151

On Tue, 2 Dec 2025 at 01:49, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] gfxstream: don't dump genvk.py args to generated files
> +
> +Full command lines include full path to the output file, which triggers
> +the 'buildpath' QA warning. Drop the args and print only a basename of
> +the script used to generate the file.
> +
> +Upstream-Status: Inappropriate [OE-Specific QA fix]

This is a fix for a reproducibility issue, and even if you believe it
is not appropriate for upstream submission, it still must include an
upstream ticket reporting the issue. You can also attach the patch to
the ticket to show how it's been worked around.

Alex

