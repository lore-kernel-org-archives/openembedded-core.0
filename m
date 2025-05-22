Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6965C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:34:10 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.26747.1747928045827711285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 08:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3KyO/RO;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2d522f699bcso3066755fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747928045; x=1748532845; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4yJ6hkw1n2xTjRLWat67ucApI5nRkjxfnF/YRL/kVs=;
        b=W3KyO/ROgodSq/rIYgMo6fTjBpBFKXjBn2G828nrp6hvaH3IiuBkxNYJUjVatcVN7c
         qolrTzwuFEBWaLWIhVfHZMY484A1knddK3etLoha3MzoMTgv+YMv+J/v2JaTzg3dJeO0
         XRjpdwfyAWH9lGfwIGT34ZTbtYlPxj74gABvrj7cjdiT4W2o5aBNHRgUwdg7bLELU6fI
         r2GrJYFqlI7XMr4b+ForuHG3Nac0F6LTOxbvjh+400HgHv0xgMEyURMya1JayGWkiGye
         5eHuA6qLuxTXpNEWhchTJ5FwqoX5J957avB5EHJw2K3EdMV4GEmq4Ep6gmu8ifoeUcqd
         kGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928045; x=1748532845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4yJ6hkw1n2xTjRLWat67ucApI5nRkjxfnF/YRL/kVs=;
        b=QZQ+V9Ra5iDYjpz9bfJ2ivUmWl6Y4s59oH+MQzJ69ccBooLxb9KJFTLA6y8k7hgeio
         JbNqWCOhX6PDU4GZdW0v90v7SGQpj3LjVrhhd0f+P/Ianr3g3Ql5tqnn3bl6xrnY5CUi
         b3gIYK+KX93P/0QKvSGBYJ8D2Nw2hU+P70vgs6dnELdigmGaaPALuxZMEpFhr2NdV3lN
         osAQkDd/UJldmvxLAtQx2OOnYc/7T02cush7+NCx6TtawUQReA/Ej/EunJDIgmdXBYo8
         p9IBfh62A0WdKXFLLxffw+v37jwu9WAxOYkxfaX0TtrJjmTRajX7sM46cL54rTEuw9A3
         ovGw==
X-Gm-Message-State: AOJu0YwEu2E/NwyQRyY1huCgcDEXorgfjjXfsiqNAfeQFpoNxMXlUpqt
	uXvsyoiQEdo3ezV8ojNUId9PCXYUkSBPy2jxow2T/gQ2g2lLWPVF9Sf++Bl3QmTWsInXXOD3ufS
	Og6ngVXDb8JZ0p0XJdBKRp6XxNHkC+GipqEhQ
X-Gm-Gg: ASbGncvCDcpGvyJscN11kU9cjVKQ0JtVCJ3wqysEAPynCFttdoDVsjWp0A1Rp8eybjT
	vxTBlEhaCdF0QSj24HlUyhUA9KljOm2vR1OmTCpgzqf7dCCxhUZ3VkvHadhNvVvh7YV1cJjkyR4
	R5IACKaWfekxXb3cfjvY42pzDMCI1qi5vVyLNhVhsktPo=
X-Google-Smtp-Source: AGHT+IFdIcsaL89dt3NK4gHu0QTnKFmRrLrz9qWBz+/MthXf39d4MsXkaYnRLMnlcwcKSWGSzuWnWlI2DmUPLuN/h7c=
X-Received: by 2002:a05:6870:ad83:b0:2c1:b58c:c0c with SMTP id
 586e51a60fabf-2e3c85e2fb2mr16467705fac.34.1747928044684; Thu, 22 May 2025
 08:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com> <100945AE-DECD-425A-9594-EBEF50D9053A@arm.com>
In-Reply-To: <100945AE-DECD-425A-9594-EBEF50D9053A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 08:33:37 -0700
X-Gm-Features: AX0GCFu7mC4zLl0K18bo6eKcpvExQFYVPlpl54uPuuUsnVb9vI4cvMiI421e0Ps
Message-ID: <CAMKF1spZ=cZUZv_c0+P=hxFe0JEWHbTFoBLPjXM5maWvdxJXmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 15:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217127

On Thu, May 22, 2025 at 2:43=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +# qemu usermode crashes when using clang as system compiler but works =
with gcc
> > +# see https://patchwork.yoctoproject.org/project/oe-core/patch/2024092=
3234336.3978188-1-raj.khem@gmail.com/
> > +GI_DATA_ENABLED:pn-vte:toolchain-clang:armv7ve =3D "False"
>
> Was this failure replicated with current master?  I=E2=80=99m concerned a=
s to why vte fails but nothing else using G-I.
>
Yes it still happens.
qemu in usermode crashes during gi data generation with binaries built
with clang, I did not have time to go look
why qemu is crashing if someone can it would help.

> Ross

