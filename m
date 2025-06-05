Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4005C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:27:30 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.10497.1749137246919275972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKpHErxW;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e78e04e48so9734567b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137246; x=1749742046; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCECBXyL2izFjMCT5/sA0bLCfcr5qpg94uQsPywcL8A=;
        b=BKpHErxW1Wd6Da1OXxzF8JOLs3cCkFu9zqRMXpzC7YF7MlPYRfx4UbUGKJ1Lci0gRu
         W9OSLUEqCq1sSCT35GwJblnZCj15a3eeRgF5vt2atrLJGacfZdKtuoJI77Av7fS9PGfL
         KRPipUbXj8Iib6vE7dpWx2PqZMVkJcZL8iflvVeOoa1wcHybCXCPwnJBq9Q6s9EZStaJ
         7Q1lo3UHg4Zu5Ka8zJ0WvHJFDaqPeH3VkiGNgOApMmttZsU8ddjr93uMLPkDcsCzoRm0
         toIQNziULB0g9mBELbERwq83YPUz9R/TwkY2VvsiUu1r2+ECquDXgZNXe5qg+lAlH7hJ
         ZXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137246; x=1749742046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCECBXyL2izFjMCT5/sA0bLCfcr5qpg94uQsPywcL8A=;
        b=Z4h+yVeADszTcpt2yhbz8B21Mli5H3zcndpOBuTzly/06YILk1bNfVrvCxzbzblaNw
         c8mzUUM9YDtWzIqcAnoSZuDVihWcj7Zwyxf26McRvx0p9GwvJfrKF1qM2ZlQ4jicZFyo
         2Ba7nTWfEBm1gLRXeDX6k6odo4ekSOJC2KROvbRCn6bA9c7Wcn19EW9iaTX/7G7twlsg
         K1u4JhZQ0lJ8V8Pi3qmVX93beZOeKB1omvvI7V6EwXLI/AGieXPB2bupc1h9IHF4XZc1
         qaAA5rurfEMD5uORMu1S+80fV46Oz3ylcXkkGfK3uXcLLQiUa6YloozW8IYznx8OSwl/
         HD0A==
X-Gm-Message-State: AOJu0Yzl7twP33gNT3eWlhA28Cft41p85vLuCQP68Bu2rSu/u+LLTIr4
	XEnVJpvisWi3szZO7us+36K2nadXzoLajJa55jsY2OqpFbuN6960TX4k/nSPEjjq95SiD9iZb38
	ANNC4Dm7gMAtibJ5cWf7939NUpU3zZNM=
X-Gm-Gg: ASbGncuxo0RNWWtUfxXtjqMfpIdeUZLkFf5VsBOzC42ipzRBHCUnhm35QYf0FUXXcrW
	qcyx18HkMDM0RfbR0ox/KoGjTF/NJAEZMI7qyMnV9vEJ13xvNs47PT2vvCAly7YIc+vNGQZAocQ
	x4Moz0ooOVfYeKSx2lF6u51+kI+gL3BKSWEilKN4wPoA==
X-Google-Smtp-Source: AGHT+IF11mBAdDnN1IguFXrzPQu7xT1v/wVYoa88Yib4J8edZ6hx9Pu01wJ4VkdsHL7P7oc59HV+cgxJzP/ToQRiGqM=
X-Received: by 2002:a05:690c:7092:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-710d9f3120cmr100886837b3.22.1749137245913; Thu, 05 Jun 2025
 08:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250604030723.1509609-1-raj.khem@gmail.com> <C04F83BE-2553-4782-92B7-2AF326101572@arm.com>
In-Reply-To: <C04F83BE-2553-4782-92B7-2AF326101572@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jun 2025 08:26:58 -0700
X-Gm-Features: AX0GCFuqHWaXFduxGel1d1rNcgqQD-xiGoJ82335dwvPdqvrNeptajFOxfztvSQ
Message-ID: <CAMKF1spPfnWhurZytovaki2eZZOqwDiNYoPtc4qBz18sSkhNyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl-locale: Recommend musl-locale in every
 locale-base package
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218035

On Thu, Jun 5, 2025 at 3:00=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 4 Jun 2025, at 04:07, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> > musl-locale installs a profile fragment in /etc/profile.d/
> > which sets MUSL_LOCPATH in environment. This is required for locale
> > to work correctly. e.g.
>
> Is there a good reason why musl can=E2=80=99t be told at build time what =
the locale path is?
>

It needs to live along with glibc systems is my estimate.

> Ross

