Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E4CC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:38 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.26233.1685610210266573861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SBQIaRex;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b1a4250b07so3851341fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685610208; x=1688202208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26TooTZjIGVcqwAbVhXRANiBkiBbnptKKv9FT4Mp7sU=;
        b=SBQIaRexYB4aIbR57K0yJxupFsOYwdhooiiUMAZHuuxny9viUDq9cquxv3sbDMHRVu
         DE1r6AL8bizExvPyZuXWSBKRl9W0LPOU1lLKt4Fcx7FKYzhEIgVJLrb3Q9xcTgQm28cw
         krOZoC6mMr4V+EWDo98nGoHkb08zH/gVxnr+Gvy61KBUJgUaE3LOFnLivt8rG6F18p79
         UOYHB9OVOOkRmJn0ljwMruaqZ5Pqg8yMMKx8BFUJ/zF9/laljHT+TkNL5iLFyPm5N+cg
         Xa1SSHDaV4IlF5hnhF4DPOCdMPPP9fkNuaqJeewyRboXW1Ruk4hSuvZg1uzO/Qrj0D28
         ZrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685610208; x=1688202208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26TooTZjIGVcqwAbVhXRANiBkiBbnptKKv9FT4Mp7sU=;
        b=CrUzZO28TMIFutO3DDaOFF6MmVz1uBOS/I9nkrWO46Sa9uig4KMWOqJm+XJgzr8QRQ
         qsTSrd26ZUyDPlFX0yFAAP2ZW+DIh/YI9ABG8pTkTYsjsSgCuVjhlBO8VbUM04jVe60Q
         zpDDljKx73sNGhU9H+1B/4f3dQ0qca6xgnbKDZBKWHs3+Ioyr+ONwP45c3Bkm6RsDtOf
         +NavlXzpVLg1R+YxQyHtqTvgulAc6DokkVY+vyTF4ihnd4K9Aoao0YbKqEoa99WTVPyO
         WWxpC8C+jMxTs5BC3JHjzDRQpMGikNu0sMwz3ZEaqqLAPJI0kMwb8SpUQT/TMYDvyDi9
         KuxA==
X-Gm-Message-State: AC+VfDzj2iNSaBa5fB2JKRnjvspTI6rynMoAyIr3q8woH1oCIKOx+HRp
	l3yWN0vlUkAE/HIP2qHrelxP7q8MCBLjx5n1VQI=
X-Google-Smtp-Source: ACHHUZ7oD90j7iVFSYtBL2zK4GzcTSzKFT2k1U/uWlynS5mYrH0VMr1Y9nPwBzbOAfFnnzx1Q6N8sjgj5HzAeNDW09I=
X-Received: by 2002:a2e:a0d1:0:b0:2a8:b286:8272 with SMTP id
 f17-20020a2ea0d1000000b002a8b2868272mr4219883ljm.15.1685610208164; Thu, 01
 Jun 2023 02:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <1685609536-23934-1-git-send-email-duep.fnst@fujitsu.com>
In-Reply-To: <1685609536-23934-1-git-send-email-duep.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Jun 2023 11:03:16 +0200
Message-ID: <CANNYZj9p4=fj7du1KFx9aP3Y_cuOOuAkPJzEe2wqmnK7xqGVnQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] xz: add ptest support
To: "duep.fnst@fujitsu.com" <duep.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, fnstml-fujitsuten@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182056

On Thu, 1 Jun 2023 at 10:52, duep.fnst@fujitsu.com
<duep.fnst@fujitsu.com> wrote:
> +From: Du Erpei <duep.fnst@fujitsu.com>
> +Subject: [PATCH] tests/Makefile.am: add target of 'build-PROGRAMS'
> +
> +Add target 'build-PROGRAMS' to only compile the test set under
> +'/tests' and not run locally.
> +
> +Upstream-Status: Pending

Please submit this patch to xz upstream first and include the link to
that submission.
https://github.com/tukaani-project/xz

Alex

