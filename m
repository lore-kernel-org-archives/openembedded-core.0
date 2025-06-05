Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04E8C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:17:30 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.10237.1749136646387194718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5ksTBf3;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e2b601a6bso11329357b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749136645; x=1749741445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVrkN4CLmAOD4T2JCtxz0cth6m2UKu0k+hS8CDIxhAE=;
        b=F5ksTBf3XPdNKlyPoSLN304gvKyztWIpOIPVtLONPI+DprTEinMBIeSvovsW2CJahx
         h7W2aeZRaS3a7yZS1tCaalXdHGNJYhzBtcHGdLoqJOpJeILVXACNSIKBVrW+tZziWLcM
         pIdN+ztc2ZxKHvFCMBB0DKekTXU4GGcbtk8eSwEhPENQJHQktRuyyRVQj6B+neT0sbvw
         GJmflpUrHC0MfOaVYxfnQnCjdEOQK2C4N9zLMZyGQ6B72vW5kb0GhNlSw5pd8P786Fak
         tTmncrxAnqzd8vpC0N2xoFPFK9f/drBBX/2KagP68ltPTR9+mRT7NU119uli+a2r3Tu8
         JsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136645; x=1749741445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVrkN4CLmAOD4T2JCtxz0cth6m2UKu0k+hS8CDIxhAE=;
        b=DMrvaeZR5u3SK++vZ0n8O080cUeEXn5ONKYi/ILjkaiGxrXilQYaHxCHit8JVB5VNT
         J9IKKW24Cr2zL38c66P5pNaWeEwzjbA9usdzfE02uE4BF0EzDMzlYLJacsazYQ5fIOBD
         6Fsr5XK0IUGwXvA8783PWXItVOrKXzKUku2QBJDNaUPieYHSFcJVuFcW2l++ZNnbV91H
         xsp41FoQFuefy2m5r+orso7/432tpcYjZRUyhaby796JfZJEW/fVhRLDza2v39GAaMFC
         SIdvPPVOW9Cqjyi7sq1iYR8dyWN3AiUydvfO2X0js62uLbPFaP9V2VVnMRnVf+9vP+uw
         e4kQ==
X-Gm-Message-State: AOJu0YxkZwMZGEyEKqQl9kqoOQPG983Jbzq6qIJTu9ahJWspuL8YrAC0
	Ig2ig+xxufpdOsfhrg9J1C3t9uM9tEojuHzB56pD0MQTYOKiOjL9jH/XgJjiM1LRcqIro3HGoRA
	+gVqFGfHo5JcccbcFqQesa1BccDCDe3A=
X-Gm-Gg: ASbGncsSncXWRDq34IYfBQ0kxsyBeNklBYYji7rpssZjN8vXk4GRsh0ZVCSixhJV9Hz
	om8yJxREme7zE6kEUG4Us0Wwb7+jr+F8zYSPnxTFHiu5caARwZuPichGM6FuqakVvtwBonL0T+K
	C/X18qwAZIuOQPuHbBDH3Di5z0sjPosGbJnKjH7QMiD2tAx6AY847a
X-Google-Smtp-Source: AGHT+IGp6b3fHaKm+3ZvWAS0T6zewvpkroDv7B1tAB6kTkb0nIycq4p3WoRhnNZlywiXk1Cm4WCyIzF29CIJnqZB73g=
X-Received: by 2002:a05:690c:6e11:b0:70e:128c:301f with SMTP id
 00721157ae682-710d9b474cfmr103092407b3.30.1749136645338; Thu, 05 Jun 2025
 08:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250603161135.1013947-1-raj.khem@gmail.com> <20250603161135.1013947-2-raj.khem@gmail.com>
 <65A0C80D-49F4-4F66-BB45-BD6A798AEA12@arm.com>
In-Reply-To: <65A0C80D-49F4-4F66-BB45-BD6A798AEA12@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jun 2025 08:16:58 -0700
X-Gm-Features: AX0GCFt1U1MjQRx798Py_PoRDAcWxiBjZ1YMVmAOAbvXaTZd46UljFqTfUwiCZI
Message-ID: <CAMKF1srT0fsFfMfbU9B=j3z70UAK=OjMCnnVV=q-mAdg9ZSUCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/2] tcf-agent: Add $@ to RANLIB
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218032

On Thu, Jun 5, 2025 at 6:45=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 3 Jun 2025, at 17:11, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> >
> > Sent a patch upstream to add RANLIB for linux [2]
> >
> > [1] https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/blob/master/agen=
t/Makefile?ref_type=3Dheads#L53
> > [2] https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/7
>
> As you=E2=80=99ve sent a patch, can we apply that (which will disappear w=
hen its merged) instead of an assignment in the recipe that will possibly b=
e forgotten about and left forever?

That patch will not fix our problem because we override RANLIB in OE,
the patch bring default RANLIB to work on linux platforms like others.
e.g. if we did not override
RANLIB then the patches won't be needed but we do.  Maybe one option
is to undefine RANLIB in OE build environment for this recipe and
apply the patch in this case it will work, but we will not be
enforcing our toolchain policy anymore for this recipe.

>
> Ross

