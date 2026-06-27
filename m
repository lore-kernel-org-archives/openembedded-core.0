Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB144C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 17:28:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59667.1782581300842312806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 10:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OYFDhMTX;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so213046d6.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 10:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782581300; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7yUaCxmfW40nQYs7sFb4MELrMIp86HdqSrLoMeCdgjzt2GFb1yrI5iPxW0/cp/AwS
         OORX8Vf281JL32cMVR6iuL+e6Adg5mGqPgp3Bky0zHzkC6TbqCvqHbYwE0FfV5J3omy8
         AH7wk/1gcKEAjorD64g4UMl4rSdtVtJlvYjh/7IBPrnQyb7Y0kQfm08S/8cqZr/OaPXK
         gs1+B4aZiDAjeaVmetArwq+6XJ8yJ7Yert5waqTx00Ipipb4pVEZexh/FB17KxgY1Wmg
         vYAcgBi8jjxO+6My6oeigCirLXqNlipae+17zG2PiRKnexCYDFbWhRWUbZoZFv8knPlI
         Rf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sVtyGG6yE4nU3NBuZXVXd+v9qW8NSuGLK6fPGfpXlI=;
        fh=pnJtbyOk/1h2t9CCHoB3PG/WixZJr5IBQOxcWDRxm/Q=;
        b=rTj2wNWPyfJMbKqjaZ6oO4UcGd1HYd6sZnn1fCvMbLedKEnZrzJt2yzyQDl3rZ4Nkf
         thPGDr/cYl4/XaSBSCQ2w5Rth6L1Kpd1YPvZEfpL/Bt+g4aOihS0rp5ZdiTU08Znvo9E
         wttwV08kFJudVCJPX3NlQrpjGRxKUJ8YZJmm/YgkcARAHm1gDqNgYPRQDHHiii9nS0IU
         5kD3iyZyjjGDs5Y251rFZCxq36zzG3JdmoWNpZ6oXCEIQAsqtl1mgAJBjTUhHuMUsN7s
         uAim8PBDM0faMmA1P3vvKVeuQBubbrBbe8Co48r3ZmAeYb4RNT9klQe2uoVRAXInoKQO
         JzVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782581300; x=1783186100; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sVtyGG6yE4nU3NBuZXVXd+v9qW8NSuGLK6fPGfpXlI=;
        b=OYFDhMTX4yZ/TMH0/n1mv+UdjCyOWRlbhY34v78+AUMT9GKa06gm3MB3X0viT2vl3z
         nr59S2PY2ZSZ1iViUEHcl+vxq2VbPHgBrxNq/4US/YRJaragrolLtTEdpxaKKueJ/yQq
         H4gyAZdBL3QNUP6Vg/TFdmNkI1Z8/8+P0c5anEaRbrupGlBo3VT+3oe0khFX1phmYqVI
         kbnmaKs7ITNdoEnsYZR9KlZoqTrGGQ52fUbvsVdNlHWIxE3jPKUgd5vDrC91Nng/kwfN
         FtPyFr9PlumF2iGqe/xXtKCXCUHiLoEN6OWkPXugJDQbjRSjUAE39YfxYeUkmTx/2duW
         /Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782581300; x=1783186100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+sVtyGG6yE4nU3NBuZXVXd+v9qW8NSuGLK6fPGfpXlI=;
        b=cp7/mqODZRbclrSP7+k2GEuUA+qOPJEwEpoSoWvb9CrfKgVJ2Hwb+jUQ1cDxT9sORt
         B7bB3N8kuutGpKJtgYdMC8oaZBpwEZvma/f4jyrUQdU/SEkiiDsBlVsYxufoxIgfcyLh
         W0sTYo3yZYa2BiAVleo+8N7XJr5+nWSZaiY2JMcxi8n1QR6vH0zJfw+S8CKHdgOFwbib
         p+2FBAAC+7/roQ1dQGVDuvhzJrsB8FHIKqu/3rKu+6RPlaprR9XgyPadpKY9vpiV8VaA
         R5DFw+EOXW4K9vBXUETFB5xFPYFK8Sq+6aie/DMZZbA58ilnZ3XrE9CmfRuTOhJ2HKpH
         w2aA==
X-Gm-Message-State: AOJu0YxuJaJuJ0TdQT7q1bULn9Pkjb0aVn5a5WR3BSs/KC3mHqQdTaHB
	BJLpbKn9SHtjs6be08AHZlvKMla+3vMgd6PNpZhzgXee1//kmqdgucwyZbfeEscfbqEwDEHjEj6
	XOnZh3YRl0PLZ45A31eE+ynxruk2m6s8=
X-Gm-Gg: AfdE7clnSuxp7zGf4PT2xZArOPGT+VMbXtHTz6SiedXS2mS2R+BXFSEidpw+odkNE0G
	q9jmlMG4OSL8RB20JU1HsLrAJrRiO/qtXmGaLZiMMe/GepRtvRbHTOaDJ/r20RODle+eigIhXnD
	fSzYoG5/H2r6MnOAQNX27gZEzZAd37PgXFHBxHClOUOMm5q2ZeCj54Rg+jR6owxfDE525CNsIb7
	SLiPDNms/+W38bgj0InGWNbe/lvp3xdbja8FEEOQsFY1U0rWg079HgU2ynEIXhkMY38tmCTeQ==
X-Received: by 2002:a05:6214:8cc:b0:8e9:f62b:8f8c with SMTP id
 6a1803df08f44-8e9f62b9148mr52902836d6.50.1782581299728; Sat, 27 Jun 2026
 10:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
 <20260627075532.3153679-8-alex.kanavin@gmail.com> <CAMKF1sqs+FxNQdx4KL8YqH5n50TsQnVNJFonBNpy1BdSimRB7g@mail.gmail.com>
In-Reply-To: <CAMKF1sqs+FxNQdx4KL8YqH5n50TsQnVNJFonBNpy1BdSimRB7g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Jun 2026 19:28:07 +0200
X-Gm-Features: AVVi8CfPUxRHKq8rPamc6z1daOx0Z2KgHLCUVNZk6X70uCNRvRJHvJVL_UwrlQg
Message-ID: <CANNYZj8jsGhS1ASJ6jUbR3mCCZ=UZumu8GcsNUXSyaep+1EEpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] oeqa: allow exceptions in buildpath HOME checks
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 17:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239700

On Sat, 27 Jun 2026 at 19:15, Khem Raj <raj.khem@gmail.com> wrote:
> It works for the specific false-positive case, but it disables the HOME b=
uildpath QA for the whole recipe whenever the builder=E2=80=99s HOME exactl=
y
> matches that path, which could hide a real contamination in those recipes=
. Perhaps a narrowed down scope if possible maybe better.

It would hide only on that machine for that username. The moment the
recipe is built on a different machine by a different username, the
real contamination would immediately appear, as it would not be
covered by the exclusion variable.

>> +OEQA_BUILDPATHS_SKIP =3D "/home/alex"
> does this need to be hardcoded for every user ?

Why, no. Some files that perl installs contain hardcoded '/home/alex',
so only that needs to be excluded.

Alex

