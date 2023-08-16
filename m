Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12729C04E69
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:08:40 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.164633.1692202110118294439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=On6HNXXy;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so9056330a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692202108; x=1692806908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvbcIP2QGj++If2qsAtGZLbnVHsZa4sVDnLbTzt7gMo=;
        b=On6HNXXyKP8RaY3ysONCxTOB2fuNfT1L9hXZhav8uXAM8GGazaJBZtweqYwDf9e1Ij
         BVjPQI1wzZk7YrJ9EbEqoVzwcDsGS18GKUcXpeFPYhkqygoGjCQ052cDoECtjB81ej+d
         6rAIOpeLIEZa2DAkjS2Myov67R1CYtR9oMcvZQbimpWVvX/DqocEIhMbEnVqZ28XBmEV
         bOZcmxi1ARt1J1IRmBz8ol7XPRpofQmF0NS6yQmn7gpcEpl2ubuE/TlEtTzHpOhPDPTg
         +Uw0/+QcWctYbDHaiWUGmishjXWDHXQgKQx8sEiugIF4V1QnI1A3l2fHTnW8KiqFLCbO
         u2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692202108; x=1692806908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvbcIP2QGj++If2qsAtGZLbnVHsZa4sVDnLbTzt7gMo=;
        b=i7NrJYLsBN8c93rahrzVm2FAhrrdbSSJQJfEvHcmRa5MYpacxnuPZCvB15vHUHFl7E
         eNC2ZVIjL2WOMeS9JJlY3ziCg9XsYPgV7PHtf7cniDXOqkhgchP3PP31LyCaYTY119RJ
         7qRsppj0r1xfZpLZsA/f5TU2zutjK8dqJ553gI2TKtBWPvBzbVrxEbiPPPOwL/Nl/yCX
         S8XBeKvK+lY9AKoFDLO/ECzpIQ88iPH5dCSegXFnWdZKzPus6hvLB7DdfeUPgHuyXGea
         ++sG1xelRowU1YFrd4Sys9FfVhjfrUxKt7Y1UB/XqmhwBkcFJJbQrf9wATluJRlyLwbx
         I1uw==
X-Gm-Message-State: AOJu0YzVtaw2scIDHhHBpoBuP/RdvKAHUIiwhl7t/FunMaN8Z3EhIrlh
	yfEL9gZz5mgB6JtFbr0HBZZEA/yuhJoKpMKwphhb7w==
X-Google-Smtp-Source: AGHT+IEM8TZCHp0LHa7ebmku4UN4Ac5zZSNC3I+Opvmyy++a2vXj0+RNrzkxGpuJQUTLrWG/FaqXOUJcxNOh+i3nfSs=
X-Received: by 2002:a17:906:943:b0:99b:4525:e06c with SMTP id
 j3-20020a170906094300b0099b4525e06cmr1788366ejd.55.1692202108134; Wed, 16 Aug
 2023 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230815130928.983960-1-adrian.freihofer@siemens.com> <19617.1692106716967518808@lists.openembedded.org>
In-Reply-To: <19617.1692106716967518808@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Aug 2023 06:08:16 -1000
Message-ID: <CAOSpxdauAw81AnqUun65_WDFfN55GgeBFT_S9mvqEoYeYJnAnA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libxcrypt: fixup upgrade 4.4.30 -> 4.4.33
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 16:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186135

On Tue, Aug 15, 2023 at 3:38=E2=80=AFAM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Steven
>
> Just realized that this patch is a duplicate of commit 2061f9f15a7f8ad068=
41d8e0bac9a4a298932564 from master branch.
> Maybe the best would be to cherry-pick 2061f9f15a7f8ad06841d8e0bac9a4a298=
932564 to kirkstone and ignore this patch here.

Done, thanks.

Steve

>
> Regards,
> Adrian
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186066): https://lists.openembedded.org/g/openembedde=
d-core/message/186066
> Mute This Topic: https://lists.openembedded.org/mt/100757493/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

