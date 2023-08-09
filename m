Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AA1EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 12:26:06 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.86961.1691583958145188577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 05:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=O2wdbU6Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so11229949e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691583956; x=1692188756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eEwv2JG4tk1aIY4r/otG6Nj/L1vVoLwnD773S1MLVkQ=;
        b=O2wdbU6Q3k0kbkrtCw2W30OI+rhdAA3LAlOxDCHdIXFcC/9szs48N2X951Cq6CmOYI
         iHyXpbHhy2EIXsI3CtRdDAK2ZMFg2sU6Q6upp5IVQ+MmrM95Dowz9O63OGdT/TpAxgyH
         NmXcCLwQRiYwNI5sRZ59kLRkyoO50DPdpOLgJ3TkIYZYa9ktbDK1gPccbI6QBkGaFgb+
         SoF2GSAcT3VIPVmn+4Wg5Umy7xLFc62LozDUwVUaJHHNGAZ5Y+7IIPB0Kk7tzOSmYR3H
         FLrOzAtgBEHhfICZii4QuE/1Q7In4iJj8/IszjvWyWUmUHGgKPpJYKH6nGMzikjbQUmd
         2kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583956; x=1692188756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEwv2JG4tk1aIY4r/otG6Nj/L1vVoLwnD773S1MLVkQ=;
        b=dCOjwxE6UZmm4Tfstdgp9wBGfcCPyxI/TyP3LCgwIY4ZirQ5VQSfJbK2r+p27NLWE5
         Kn+gsKhF2tAV50VZUZMigYeVbBRSDjrKHW8euWROiec3EDhlsWt9UIcK/0sDdAalvMkB
         IwmxD3VBXcT/FwxGg0WO0N52vyYgC/6CYj2bwAZurcwVGCc0VAlIRYW/yEV3mxAEhMFf
         5/hOzudSpy5Ew1hy7rXJ+O+HyhjOtg94LdMIPoV4pHqSR4dVwz4Tdm5dqwlAVj2UqZDj
         MBXoLlXFDCVON0DWYYZUOKwcOGC5MAFX0bA8GcyTYEhcSlwQbIqEqUNss0Ym7imsNeWa
         S6yg==
X-Gm-Message-State: AOJu0YzMMrfD0Wi27vdH06YL1fWqI6Bf++ciepEEKnUnssdywnPTamiM
	ScJiyfYIntY9n9dxJPU/DI5q+iOoEk9juoDII3w=
X-Google-Smtp-Source: AGHT+IF1Ik/9fu3JnG7NelZhHGT5BNXcOvZM2w5NXqAOZnWn/WGu/MH5ISKwCYe5HE+IxB8lskRiPQgDHPdd0ewAXf4=
X-Received: by 2002:a19:690b:0:b0:4fb:76a5:2325 with SMTP id
 e11-20020a19690b000000b004fb76a52325mr1548905lfc.24.1691583956127; Wed, 09
 Aug 2023 05:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
 <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
 <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
 <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com>
 <CADVatmM4PuUygcPU-e1GnYVXuxhfo8Qxey0evE___iHaA-NwTg@mail.gmail.com>
 <CANNYZj99Op26qQPrEVOSZgpE=HJ_6twzqsi+6O0_asPDfBc6gA@mail.gmail.com> <CADVatmPsZofiznWT_DF5WU5+v7dHNWyDn_ZveT66zUy_PBO2qA@mail.gmail.com>
In-Reply-To: <CADVatmPsZofiznWT_DF5WU5+v7dHNWyDn_ZveT66zUy_PBO2qA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Aug 2023 14:25:44 +0200
Message-ID: <CANNYZj_i-d+JtqSaPgFZGwFswP_8dw_107eecwkdZ2oJihYtNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 12:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185699

On Wed, 9 Aug 2023 at 14:20, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:

> > I suppose they will do that once someone reads the issue, until then
> > you can refer to the ticket in oe-core submission (but pls roll back
> > to 2.4.x).
>
> v2.4 will also have the same problem. This change was introduced in
> v2.3, so anything v2.2+ will have the problem.
> Anyways, I will resubmit the upgrade patch here after upstream has
> resolved the problem.

You don't need to wait. You can backport to 2.4 what you submitted in
the ticket.

We generally trust that people who submit patches will carry them to
upstream merge, adjusting and interacting with upstream as needed.

Alex

