Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A99DC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 16:05:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.47421.1702915502408377421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 08:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwqTJdOQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce6f4d3dafso647536b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702915502; x=1703520302; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfiwGmJU7oo7yh3HpTUMNtbtXtViFioq3quTaGOo068=;
        b=mwqTJdOQPArEjgkC5uAA2TbKSlXazMhkEgK7m+zOZov3jYDOnH/5G5uus8tQS2HbhZ
         zJSraGDj3DeNP0+Bhx+Jj84qTnSEmHsB4rBFFNTcIY6MgjDbi3wBf4Msur5sJ2vOMmrq
         K5mUjRKsW9+lCf9ASbwF5E1TMXrt4yaGZeb5eNP+qVoEiylJXRb5zCOI49u8NstBZO4G
         xrv2Atfwg9Zq3pJ1bVmi+Y3Ri0t6ZAOjkT1ak/mDwRlpcj2aM5ZQHKTFCqBoSkj9JHlO
         uNtMtU71uD2AUBhU2JNB+HF+O0MXDpmbYchdaa3bzXUvtnv5zWQ9dYUN143SgyTl/utm
         bq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915502; x=1703520302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfiwGmJU7oo7yh3HpTUMNtbtXtViFioq3quTaGOo068=;
        b=RA3IGLQE/gmTwb74SFve8l+byAjKbhvG6eJ4tIq3LMOJJ/xcqBZwmTuC6ZGw2RYJGt
         UdXYNBUnMGvXDZzJYrTd4PVn4hUODnSJkUQGdzMbNVjXOVq8FOEFxb5njyOllrU+TN/E
         2nRIjvlZDtgfDJPb08Obe7Jcd/Ztp9CZG0QBY6x0aeCFBcJQb0kZvUarcPls3bfexiyL
         K3cCX+0QEqF0yN51HB8jsEf4WTCfpt4Vejuz3ADTYVyEdEbU7EGeZsPBPEDMhGc2GuBh
         jYMcvpKkmfdYGZ0UslQxpc3b/FjymVN/pJj/J6eMRbWkH60RR2dAwmH5TT161GQ0KgXU
         A6pQ==
X-Gm-Message-State: AOJu0Ywhn49fd1bG+y2EozuoPe3INMC1jKRBn/1sfBPyPtttVSi69MSP
	XRExUhTuj36pSgCysBGwSwvESZfuQBn6FW0evvU=
X-Google-Smtp-Source: AGHT+IHcV6G3ytS3t20EW+29+vifO1EoctKyEShCj7wuR4PJy+c7DhhZpIFi0h/MqWQEPqZIpKPEScROrrh1lKqYaSk=
X-Received: by 2002:a05:6a00:4b4a:b0:6cb:8347:c8b1 with SMTP id
 kr10-20020a056a004b4a00b006cb8347c8b1mr35463109pfb.1.1702915501843; Mon, 18
 Dec 2023 08:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 18 Dec 2023 13:04:49 -0300
Message-ID: <CAOMZO5CNMvOBtL8Rg0+PKGBsFWoRoiCna7T+NMqe+LE+==8brg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 16:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192660

On Mon, Dec 18, 2023 at 12:30=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We need to ensure we read from and log the output from qemu stdout
> as otherwise the buffers can fill and block, leading qemu to hand.
> Use our existing logging thread to do this.

s/Impove/Improve on the Subject line of both patches.

