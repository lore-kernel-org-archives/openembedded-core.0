Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C7CD2F335
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:26:03 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61685.1768317960953657277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 07:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Su1XvLES;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8887f43b224so121215216d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768317960; x=1768922760; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9v3PbbiBpEq2EgGoowhXfGTlnyiMYUdJljgCsW/UUks=;
        b=Su1XvLES6QF76LZNXaNu2i1YHKyNXytuQGWyXOK+8mrlfgCKRnAaD+he2Q3gNEBDNx
         62tEnE4KbxFc2AXbz1+ZPpsAcG94xhw4Qe0Mb/bhh50DWbw0ytbeBNAVFV4YfJf9npRa
         bT5Ii1bGcK9YX/8VXriYK+gb3yP0WsbZNrmSrHgxIeHdow0XUmTLC2OCNSpGuVHNjr9y
         Gui1I3ke7eTCYenPg/T9HJEkrpOwJcyFQdljuCXN+HNStaopxSPeccdEe1NhitHzDt7R
         EfGOBhymWmBGHuQ5UwZj5svsldQAL2MqFx39HuyQXX5QnZZ5EMABa6WNxanK7fTusiJJ
         orYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317960; x=1768922760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v3PbbiBpEq2EgGoowhXfGTlnyiMYUdJljgCsW/UUks=;
        b=alu43Mre7uC1ZmfBIgdjsz/tn55qmDuxqxKbgjI/jOWvVOArVkwdrxPuDqcTSwHtsE
         hteq5wLzXpe0MYBPJ46Q0fYlIKFU4iNPvdl7WudVlKaL3w5MPpg9GJKWq92NQwhzWYla
         +GSeknm9QIND5FimkC4VoLqcGtFQyuboi2hom+yS36uPkpgYCmk5czncRpOq2aa044WA
         ifTdsG3rCEeTBqmFpGgVT6aE7rVFYJlZaFwygM6qvNwLSl2UTqeB/mkEEPRevaBcea7y
         UQ2jxix5LRML9MpWwEthJONqMC8KpPEYsm6c8kqCHWwAXRHlVJYoVwPLaptSGNEacgxF
         lAyg==
X-Gm-Message-State: AOJu0Ywl3VfcJGQQkbRtwo0cZahBJAcf18GjPlvbAobGi7LQnsulqr+t
	OqWxw3DQR1mbD48fkvOWKUNKhhx3qZ42rvHJlCrk/xL8tqNZ4aUEUykkYcWnT/7nKnwP1wI/V9F
	czQ2JECvP6H6VkRe8mRrxKVHiH12dSIw=
X-Gm-Gg: AY/fxX6MM1ezUfx6nvvxXMf2wrGQnfz6C920sveMjgb2avAwZRKmI9JNwe0N2bEQlQP
	abV0oojvrI7gA22EBtwu8WlHs+8Rc3brSE+DNnKcEOCKAO7gU2tC+RnhCgK8YonhnV2o2D9Oaki
	mcDTx0iAjZsU8GS6Y1pDdUOfagGnCcQqeA/gHTY8muTmXkkZIuC/DqdQ9cx3PtEj+3uMZKSL5pJ
	zykwKuoZlE1/T/7bSNgIarWf27TS+oSPQXhD3vrQmVp2WReuFu+hn9QMl8U9qyy9sfYF04e
X-Google-Smtp-Source: AGHT+IGYTpnwE41ewcJVaDTNy2C1IDNqZOCrwmHaIlx/MbA7zJPGawUJfpH0adaitDrUIZUEs1NzinKKRJZClSE8YOE=
X-Received: by 2002:ad4:5c6d:0:b0:884:5e18:e91a with SMTP id
 6a1803df08f44-890841e45femr338443836d6.2.1768317959708; Tue, 13 Jan 2026
 07:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20260113124504.961856-1-hongxu.jia@windriver.com> <20260113124504.961856-2-hongxu.jia@windriver.com>
In-Reply-To: <20260113124504.961856-2-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jan 2026 16:25:48 +0100
X-Gm-Features: AZwV_QjY2TZCm1q5kwYSXTcszmcWdS0VySErMa8mF1I5aYmeLWDxx8bZk_rwvdE
Message-ID: <CANNYZj9VBv_G3phFkW_mosnZ5hvzXxP4OJ=nJ3G_oExV+FtNrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] webkitgtk: upgrade 2.50.0 -> 2.50.4
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229275

On Tue, 13 Jan 2026 at 13:45, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
> Drop backport fix-musl-compilation.patch which already exists
> in 2.50.4
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> - Fix compile failure on qemux86 [1] to
> drop fix_op_instanceof_handler_for_32-bit_C-loop_build.patch,
> which conflicts with upstream solution [2]
>
> - Fix compile failure on qemuriscv64
> ...
> Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71: error: cannot tail-call: tail call production failed
>   810 |         DECLARE_STAGE(name, arg, [[clang::musttail]] return (*list.fn)(list, ctx, src, dst, \
>       |                                                             ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>   811 |                                                                        r, g, b, a, i))
>       |                                                                        ~~~~~~~~~~~~~~
> ...
>
> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2907
> [2] https://github.com/WebKit/WebKit/commit/fcaa289f6015595a638eb96b9f728eaaa7b13ab8
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

> +# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
> +# error: cannot tail-call: tail call production failed
> +CXXFLAGS:append:riscv64 = " -DSKCMS_HAS_MUSTTAIL=0"

Thanks for completing the update. Perhaps this last risc-v tweak
should be reported with an upstream ticket?

Alex

