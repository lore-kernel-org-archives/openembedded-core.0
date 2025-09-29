Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6EECAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 14:47:26 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.55809.1759157237642858746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 07:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUxvMa9z;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so32321846d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759157237; x=1759762037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hXwKSMhpGC1GSwXVnHYWMk6rZU70t9P98HvFTRSLJuA=;
        b=NUxvMa9zjRJUCm8wE36Y4HXTYpEWFpMY0X4cnFbWSAIMe35md+9bNNWpR/HGSx3S6V
         d0BGwiMukQueq6bxKQzJobDEnV3eTLyG9shnBFuwzd+ba5aw8kZ2atozDtbZleev9hwu
         O0Kfqle5IucpenzIXRm3IWQKg1oEdNUhAAWISrV2k8RQVRs4/hdn7pCQnKUBtA10sBa1
         LU8rBHm98gICEvqEy7P8aLhdf3r08T1iVdyysenLfq2CisfRlzdZ1+23hhFIZQIqjY42
         DDThdDFEl0mpmp7HMvOkTxnqq9UBq1x6OpRpKOVOdNlVImJlncIF3KACdhCSBl3gw78J
         wQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759157237; x=1759762037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXwKSMhpGC1GSwXVnHYWMk6rZU70t9P98HvFTRSLJuA=;
        b=ruLMLiCASLOCeQQ6G8MVlzt6Ec1+5TbH/VMUFbf9GJH2xaRXTvEVlNK8TWPj1JH2i1
         twIJ7iiLEC3cmUQzp7gXb27+3rGirlTCtT52c8DFIgDMa8TgNcP3cElcaw/bMr75fohx
         BOFQNTQMEti1G0YiYqJZAyQkDDdeFunBdO7ip+MG8ggCPHUutqQRTOj5zUJ//UQK3NAL
         kb+rQ3M2clKDaJUbnM8YSm1/Ts+ZDStdp0t/zLhuezCJbzquT6Mwd6faNmCj5vPwU1Ff
         LLHu3pGY+KqlV73gnZj080ZTQ6CZc/Z+ozOYn3wW9tkCTGxQxwgoyPIrMJJkTKFkPXVu
         Wapw==
X-Gm-Message-State: AOJu0YxEIuBuMiJ4vX/Ql/bn5URKlKRuoBifINHOqwzrj8+k3uxm/SQz
	FUrv9Rje7McKqNULUlzIn/LK1h8u2lpj0PLmRf3WmE1xweETOcEpljCVqdWExQVntC3DBH24Slt
	Djox4SBJqvz9MSfE1ocp9wtYzU2eHoLs=
X-Gm-Gg: ASbGnctT/y21I+2Kcgu+vxTGu7fT9+hejBAVaIZypWDYGASG2ko2bp7FFoPHx3EWXd6
	fUDMhqsOATWipgr0ORACjnr+aJIg2OCx2jYwedePwlnfRSTruyPe+sex8YQwrOLFNCO7j/nOWGb
	aYoX8Ogyx+WSt1ZZpL7P/XXiJ1IhXHERZKhm6CcSKtmxP7pljO8c8lxWdEDE7Qozd+IFMHnWVqi
	Qal6yjFyAjy7b9H+mtI2yv1b3IzNyrUx1ZYyRyhAiwc06wgB4WVqQlf4gXdtbcmo7XvCCXMaICB
	cpPNkO69tYSyUAXaRqqA78Zxgm4BlD4sCtSEt7k+
X-Google-Smtp-Source: AGHT+IGQ6ftH8t0ZaSTjlPhWuvgrwP5g69rmmYoI7dOPpwUKf9EK7grn2/m9FnpaNVKbjFNzPN3j5CqTgreK2VlGm/A=
X-Received: by 2002:a05:6214:21c8:b0:798:513e:3bd with SMTP id
 6a1803df08f44-7fc25df1a0cmr219944606d6.3.1759157236504; Mon, 29 Sep 2025
 07:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
 <CANNYZj9PM=Sn5zy+6-N6ZFvzEt4eJpM5dGNAMong8WMtOHtNeA@mail.gmail.com> <9d9b71c6-76f2-4964-8341-4918eb9d66b4@gmail.com>
In-Reply-To: <9d9b71c6-76f2-4964-8341-4918eb9d66b4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Sep 2025 16:47:05 +0200
X-Gm-Features: AS18NWCiw3aZYDpspaR2LXPNSWnbobCzihhaP4ophbcPs5yAlgnAsdqm_4w5Os8
Message-ID: <CANNYZj8e8dpdpZe41O_N1P44Ki61tcFNX4jVQ8rn0EG__j+RKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia-crypto-policy: add nativesdk to BBCLASSEXTEND
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: openembedded-core@lists.openembedded.org, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224144

On Mon, 29 Sept 2025 at 15:47, Clayton Casciato
<majortomtosourcecontrol@gmail.com> wrote:
> I understand the pushback against unnecessary functionality.
>
> I would still like to resolve the case where "sequoia" is in the ??.
>
> What are your thoughts on this alternative?
>
> PACKAGECONFIG:remove:class-nativesdk = "sequoia"

I would rather add it separately like the signing selftest does:

meta/lib/oeqa/selftest/cases/signing.py:        feature +=
'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
meta/lib/oeqa/selftest/cases/signing.py:        feature +=
'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'

_remove works 'after the fact' and complicates understanding how the
configuration ends up with the final values. It also cannot be undone
with any other statement.

Alex

