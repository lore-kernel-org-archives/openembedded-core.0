Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42BCCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:11:50 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.118268.1698059502520977270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 04:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVDoGJ8E;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c16757987fso45832851fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059501; x=1698664301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijGLiEnzD3+NuUaBjrGAkT5kCXRo5UKA/9tMLi1eDoE=;
        b=iVDoGJ8EB9Z+hR2i/U8lxLTiL+mjp749nRucC1TTV1YGCeJmwU7yvbB27l29txMLQc
         jjAQJBw+KzEQJStc78w9JLFdIJuG2m+sgkydMks76RdZo0l/hXSEEAFd2WPvuQp7dt8j
         GVtLaYS67Ov/YxVi8vEiccAGXsV4TQcaP5EH8jrV2e7FrKrAaRUknbXJNXWH7dMMk0I2
         tERqHp3axg0myRi85Nyg0fxelK4+EZQCEeNRsIJAjvZKdtmDtAMUB2cmGHCchuedX03i
         W+RwiItMjwaV3+XJyCf5S5g4TGSsWx64gwkXAhDGJ2YUVlbpG+3DxIR2yn1Os/ZIlCS8
         GvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059501; x=1698664301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijGLiEnzD3+NuUaBjrGAkT5kCXRo5UKA/9tMLi1eDoE=;
        b=pl/D6cqCdCMPTo1cSL8iLCMD/weeyvW0WfUAHlO01YFOR4Ag4ER1TMHwebH99JISiY
         6B2/P9hKkfwINuw+l1+zT6GwxQBHDCSLIaGk/cVtBA3FnjZdHrNiKn/6X3/8EAZIgolo
         dEcWSGw9gRujyDfaMwHJ5pl4pXeJ8/oZP/IyijbI3v2cyWjuHOukXZ4+yNDw+4icYCfM
         myagZQHQXY3dTHWoGj12I2B8PgnaJtLhxgGX6RBxEna0FdQPI05IFb+Udo6H+17G00T4
         TjzOJxskbERFP+BFZ4y/LkBxim87UOFGEdAb2TV8OVRZ3g2wYfiU/CwnqQ2PaiZALcWu
         tFxA==
X-Gm-Message-State: AOJu0YzpyRVgeC+x4jvWKMyu6AikPKmCUG0D0n5/QDgyvkmBZwfXwjOg
	wF2JGSZ0YJoMbS0VhdxgqIqy/4sFbiZakfNImt2h3kj6
X-Google-Smtp-Source: AGHT+IEoZg5QOWeVjldH11leQ0RcdAZOaMo7leCV+1rKc8FndqpxCHAllQytNl235AmB0Ij6v4BhW0OO0yAUjQGyJFE=
X-Received: by 2002:a05:651c:4d0:b0:2b6:a3a0:5f7 with SMTP id
 e16-20020a05651c04d000b002b6a3a005f7mr7505117lji.9.1698059500486; Mon, 23 Oct
 2023 04:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <1698029586-3002-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1698029586-3002-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Oct 2023 13:11:28 +0200
Message-ID: <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] kbd:Add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189621

On Mon, 23 Oct 2023 at 04:53, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> +do_compile_ptest() {
> +    # update DATADIR in Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkeymap/Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/helpers/Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkbdfile/Makefile
> +
> +    # recompile tests
> +    oe_runmake -C ${B}/tests/ clean
> +    oe_runmake -C ${B}/tests/
> +}

I'd like to better understand why DATADIR needs to be reset at build
time, with this not-that-elegant bit of code (particularly make clean
should really be avoided). Can you show where and how DATADIR is used?
Can we set it at runtime, for example via environment variable?

Alex

