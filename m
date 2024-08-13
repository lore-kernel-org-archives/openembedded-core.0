Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50085C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 07:58:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.67127.1723535873878930208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YwBYpK/B;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530d0882370so4982256e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723535872; x=1724140672; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qgmn0zBhuc9Oz1zlh6qXcWDooa3lqhma9of8YdAYyw=;
        b=YwBYpK/BOBBrSCUxRJ6wvI0PrTy6/ZGcFHqlQJ49q3SbGFq3STo/bC5kUAnfA/o0Hu
         KOnFDQL583B1L9yBuGgVraG7qY6zZIAag6iLpVLtvjY/Sdksc4IdpDfMZX7gvPUbtG/O
         KAOfDCm0OkaStlOfRgEfjKGgciRYG1EmmAM5b8xHfHNUNhub1rP6L9MqVcfsdTgoNfHJ
         mDEbB//IeQHE/PYoRtSj21ULP6iYGhJwyMyo84kVtBR0KtMw98sZFqwfPh4OPmERP5rG
         n0HIj2EPTdsnBPY6b4xZCtQKeWi1IkUiZM+Fp9Ur/Y/y5kmDzKcL1ei+vAKDWKH24Qji
         YGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723535872; x=1724140672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Qgmn0zBhuc9Oz1zlh6qXcWDooa3lqhma9of8YdAYyw=;
        b=WZa558Eh5Frozx8j61SgBRJwLpst9boQJxlQYEn37rfH6oVb+ltzd63xEgJ4cB4vb6
         g/eJCX3ginfpYjbfTPMIhkwEWQsi8hNKDWJfZSE6apUu/F9dfDR72QO+lisL43mi/8MR
         Wuxsn7nTqLU4QjcFW1iG3dLwbfex5R4/mn1hDW69ivxPhCoHSm4bho92JDTpX0GXRfVh
         FaOVfEIpzRCL9EYBrWJ0BnqK545X9gcOpBHwAjQhocrbetnoqscGdUh8ecuYKJGRvyVa
         8pwyUuzYYFRqwoHSTNXVax9Lh/q4kPC9KPjS9s7KjDACOHEqw2sHU5Us9nlls6/xeD1a
         kcug==
X-Gm-Message-State: AOJu0YzHnN0HVYQlUoFk9qmeaf+F1NH8F0uIX0VwUEozDL2t6bDVcqt0
	kin++630vio28deouJlBybmHbsDg0TQPqHbGHd6j83J1uuETK5Uh/0vRAHtJFjVCnOnn+PWEObv
	+TjX4SOFG6oQKUIR6onHRvAqwHrU=
X-Google-Smtp-Source: AGHT+IFDOUsNkAVJtaKyHE1eIqOAS1sfddqaVJ85pKKlpUSIMmtnPZIt8BCSrycYuj7+lQxQwiTj0gpbgIO8slgWoGc=
X-Received: by 2002:a05:6512:1593:b0:52c:842b:c276 with SMTP id
 2adb3069b0e04-53213693f2amr1883000e87.53.1723535871693; Tue, 13 Aug 2024
 00:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240813070642.6275-1-t.fuchs@thofu.net>
In-Reply-To: <20240813070642.6275-1-t.fuchs@thofu.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2024 09:57:40 +0200
Message-ID: <CANNYZj--NasHy0ARcMb67UV_w4insLHUPYaSDxWZfu1=mdrvmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
To: t.fuchs@thofu.net
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 07:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203257

On Tue, 13 Aug 2024 at 09:07, Thorsten Fuchs via
lists.openembedded.org <t.fuchs=thofu.net@lists.openembedded.org>
wrote:
> +Upstream renamed LZ4DIR to LIBDIR inside Makefiles which collides with
> +the OpenEmbedded builds.
> +
> +Signed-off-by: Thorsten Fuchs <t.fuchs@thofu.net>
> +
> +Upstream-Status: Inappropriate [oe specific]

This is not 'inappropriate', and should be submitted upstream.

Alex

