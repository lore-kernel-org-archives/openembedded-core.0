Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECB8CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:55:30 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10498.1779278127102801034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 04:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P1f861bW;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8cbe69b122bso9053896d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 04:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278126; cv=none;
        d=google.com; s=arc-20240605;
        b=MdJKENrmhUjVv+y95hdp3qo84MYT/QmypHjT5M1TX9M4svEaPqNZ3KdSzNR/40TKxx
         gc6elmEsGSbBxKv/UCvQMWOq6Ii5R5CiqWlfNd78SI3R8JT/tsuKUnDbYMK0VIoBQpFp
         WMruW8WrVLRV8oBvB86H87K48rt8vHRCwUaQBByHlmx9vooadgFLjlOSCkL5UyvVxlVh
         TxOkus11IeAWbV+qT+ROxZklsUTRCgpP63ZzlDfCvoS87kJnFh1AtwwR81+ASbacXtLe
         uAOqVK5jUm5rDG8XkWYT/bKyokHtNYv6J7uoHxIKzJjvEnpc3so3PD+lH7RwpzT4+ZFE
         COrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N+VsOjcmQu+sJNk8PhIZSs0QxUEQssvLndG1R7kb/zY=;
        fh=O1BUYK+c5L3d6rb1WRK6HpLhGoHHmbD7Y8/33WeYC0c=;
        b=etGbvkedViCnOkVjGYmdYvA9amzUnhDxPCoHKkF47IDsTlfRT4Ov6ZAoACMLWC+hFe
         5Js0XqiuBn2jAdqixko0BnkMafPU2/dOrj3qDuMmC4tWF1eJWqe9j+jibMShm4ra0+9C
         pOpVfZPwU+/bG0iO1YJ+2s1lqjwGMWumkto6L44IaIqXX8AiDrwMrxdWCpbNTFm9SVqo
         jbDKVQMTIGlJkVdD8N3c0ebS4y2Bv2UBLp7df/UXGi/ZOjf1JHyW81eXECmxQVdJuh88
         ESRXoMuJH7d58JNczpw4R7k5vd1N6dtFMGVAcYn4LYZpFyHM7HTwaK/G+esJ7jjQ8GLn
         p4Dw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779278126; x=1779882926; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+VsOjcmQu+sJNk8PhIZSs0QxUEQssvLndG1R7kb/zY=;
        b=P1f861bWO1tLXrt4cWazfE523T5cTr70pzKMS61AKC5Jd98Z8TX0uj0/IxE/FNufbb
         3QsdNNN7NY+We0Kw2ZrgJF+xp+6M1oHdUEav04vyeMxCtOH7aXTWiIS7r3A09Mlx0DQv
         c9X5Kh1eftsSYQbTgDzyAZK1cnpo2Mol5ej4mNQsrfTkBlKF4LUGYpq8C8N1EHaEgucy
         N/4Cw70lkPMsBKJcXfESYlkb4cYWupA6cuDYG8qS85QJk5i7gO/W1VTN3bzhyDrM93bU
         5AGg3QP6W/Fl3f8LIhGWUnBp+uOY+jpd92JPcQXlcd2Szlq91lBFZZBa1Ka3oH2I1GIG
         N0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278126; x=1779882926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+VsOjcmQu+sJNk8PhIZSs0QxUEQssvLndG1R7kb/zY=;
        b=QLzHyfEuP4iviZCzbrCqXqSg+UkSkY/E4ruVoTOWmAQI99t8KFGxeFofM/rHBfNZVx
         Px00NwARl1Sh0aJ9HwLUnLG1QoVz4WjBHIc7ciKcBX/URw0BJan1FKmXUElb9507YPhn
         S+KYJCnswlqnFkPf9d8gES7UGxna9nuiiiL/RUMy1MMhQ5hLKmjTk2t02QAzBuC+Tjgk
         0j666jbwOkntQrANCIg5AtipbeMWnecxoQTrfHR+FKHTKjHQ3s6llQPI/po64r+c2IIn
         Bppji0BsD8VdckbuvUyKKtczNSGXqEF3niZ4BPXWj6j1C9/zj9l1UtxpZpewgYnPNee8
         xaEA==
X-Gm-Message-State: AOJu0YxGcCiSK3KV/og0ycogZqO1xtBOwxnyUSAF4nTmRtLeQmlSj0XQ
	X2bIqctUn2y7QYJltzNRllY/dPdAwkRDzay8FX//CY1kphzJr3N51xs/dM4gp5bHlSM19BOJJ2B
	yOlYI/AtNNGQdF+roA+uPICYFvYy2bvQ=
X-Gm-Gg: Acq92OFrsGrn/DsH72lt0g5ASPZc8CxyUAaG6BEyux5lAs1DJZ0p+uNoRCeSsL/1x3P
	8XGO2cGeaqEK4DgY23aVprFunTNsbv5W6abWMzuE2tx1X3/NnCJ9IZZarps/49EVNbLDEx3X88e
	oMQNB1ZbJhi7329SnGbHAu7M+yxN9qyejoYS5NvdJeJQpp0lV0I66NxwD4w4HkHokwXJ1tajbpM
	VBI/WYgOmAQqPf3z4f4o64Wb2kpFoyJBBna3BzH404KKFxubANhdMoS7GtR32CRFDXA4N9xZ4TU
	qCJv6t68VWJwb0HitV/7j/AL99FFHMW2glIyMDxUMA==
X-Received: by 2002:a05:6214:4905:b0:8c7:76cf:5088 with SMTP id
 6a1803df08f44-8ca0f4fa5b6mr385309196d6.0.1779278126027; Wed, 20 May 2026
 04:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <18ADB4FEC98E8237.2455325@lists.openembedded.org> <503fb85f-b436-4985-8d39-549f54bd5025@bootlin.com>
In-Reply-To: <503fb85f-b436-4985-8d39-549f54bd5025@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 May 2026 13:55:15 +0200
X-Gm-Features: AVHnY4KECv7erCwMHjTmXeJti3XKytHVcJu2G_yMd2n4Qr1eM4hyAVgR0mQAXQk
Message-ID: <CANNYZj_aOAHSWHGRHBe94y5KrO7TL_Mn677efAby=3LNEOXQ1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] Split vim and xxd in different recipes
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	paul@pbarker.dev, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 11:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237450

On Wed, 20 May 2026 at 13:49, Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=bootlin.com@lists.openembedded.org> wrote:

> Would there be any more feedbacks on this series? So far, I have been
> considering to prepare a v2 to fix the License issue mentioned by Ross,
> and also wiping out the source code of vim in vim-xxd_9.2.bb (leaving
> only xxd's code, of course). This step would significantly reduce the
> risk of xxd being affected by Vim's CVEs.
>
> However, I prefer not investing my time on it if this split is not
> seriously considered in the first place.

I would appreciate a v2, so we can seriously consider dropping vim
proper from core as the next step. The reasons are in oe-architecture
list, if anyone wants to pick up the discussion.

Alex

