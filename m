Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22E1C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 10:03:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.36760.1701597788468545401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 02:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdX23pdW;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a185fb3aa18so662356266b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701597787; x=1702202587; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y78lhZFQOoaMEasr4FDH3lsSkP5ggXck6hw66hjmTYU=;
        b=LdX23pdWRDRflADrdbW4d9lKi9K409G4tJTiRj7Zc6JeijdLHFLNxRYuu53fHNCI7x
         flHFpK2Z45yCis8zx8DiCVZkhJtnOYuEoEOdAOjLZg6I+6DWGW5RRb8J3BtCbIiB7eyK
         iL6kekdaH/4nDEk2GtcjPHaZMEqZqD4h8PF/+yUCAgV8B582E1L0Ig4xW5fzcjjph/+1
         bUZBCR2PVPn/ugyTcx28bGTINO9nxZlrgqCyo66UkvUyJEKq2zroPyMi6PWnzE8y8BXD
         3V38TA0fyY5uNHvi6LvadHJuypi/N7v2tWBps24T2OHSDF3P8gtCNAfitTxcVTU7bGoq
         WK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701597787; x=1702202587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y78lhZFQOoaMEasr4FDH3lsSkP5ggXck6hw66hjmTYU=;
        b=DcuVxawHKBgrcTlyLgJ0d/P6rzrAG8p+us+GDHIzO7w6DW6/YcoNL5EvlQcYm5AJKo
         36Puh01U3nMZP5LNvgdkR676XAg/V+6XsxTRTG+Q761UD5W9kFxGe9zfUPYZ8xihOt8n
         OVEfRsQISHrCfjs9W9C31ZBaCFxrfeVWWBP6Hmg0TyZ/jw4nZ1R527BIrdx4TUHDmbqg
         gSeV4DT+fQ5z817Xjj5q4e04E4XZiDBbJlfgldHFDeHLXX1Lmi9YsMcWMAN+q00rtYHK
         /O73wOvvATkW594NwdZgbEsWkmbwY/Kh5je/WzfsFs6B5teIsQN/0hVyk1HyE0pxlJL/
         KEgg==
X-Gm-Message-State: AOJu0YxQ3zEeSflGdQdRkFjnx85RnYXa3qjIFB47pmoADEz9YuFRXpKd
	t6bg+VgEyMXpUG7d39vFlYo2fqsKnGk4Xa/6JK0=
X-Google-Smtp-Source: AGHT+IGVUss6FLkfeItRJKaekvHmKY9ZjrJw//CLV2MEN/8uB6MdNOLHQwOYiuqTlsO84NvguApy9E1kXr4MgvAyQ2s=
X-Received: by 2002:a17:906:2086:b0:a19:a409:37d8 with SMTP id
 6-20020a170906208600b00a19a40937d8mr4270428ejq.49.1701597786422; Sun, 03 Dec
 2023 02:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20231129065251.1418864-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20231129065251.1418864-1-quic_vkraleti@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sun, 3 Dec 2023 12:02:55 +0200
Message-ID: <CALT56yOa86qLmf0vB4rnsTyXaWuq=RqQ9OZn+3DXTeMqkY=Cjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] systemd-boot: Fix build issues on armv7a-linux
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 10:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191707

On Wed, 29 Nov 2023 at 08:53, Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> Backport a fix to address the build failure on armv7a introduced
> in systemd v254-rc1.
>
> see
> https://github.com/systemd/systemd/issues/29381
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>

If that matters:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

