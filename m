Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA45CD49232
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 14:59:05 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14571.1765551538502525984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 06:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMbmCXhi;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8823d5127daso13771396d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 06:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765551537; x=1766156337; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjcF04WFGDL3dK9pdZ/upYTlMg25BMtE5VlqdL+9yec=;
        b=UMbmCXhiWVBCyRpzH6mT4ynyBLisyYSgU/CaG8zMIjuYu8iK4W3rfndzdZ7zrZpKJy
         NNASwPLJkh4MkjdFS/jNJs4ZXn68hL/u171PVPqOwQXTdjfqQKK8y08hnMtAwTvezFOI
         7L5twFZ3oCPpduM9l3bNHZgEVf2Hgx/CnTEVxBNrqTaOnHsQ0XHQKZbRWAkTv3XoNJGY
         7N4RSWWr27ET67IaDST8ZxP4awFERNRiz9mHCYg9mUffx+N0DXYrtjNELFvvpEUrYQ3y
         siE2/XlYccScKGvB14dyu2PABHs+LtBLc/Y7I9NyRpqXnFrxMB1iMBZyHz5+LES6q0F9
         GjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551537; x=1766156337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjcF04WFGDL3dK9pdZ/upYTlMg25BMtE5VlqdL+9yec=;
        b=rjAyrBSaOML8dfciXboHPB3Y2Rix8PjQxHOROig8yObwp2aoPNcZanHuZSWFkxt+Z/
         oAEz5vou+iAS2gMCyYim/7CUiLvs32tMma7Z06aqpIoS64az8Hm2f2L0njY0MHFCUmZx
         +W2doKY8Kkl3T7bitYINutmBU5qYTxiWO1NLvZxzlAPm6ODk9bdRj7cD6GIbWpF9viV4
         dcAcAWaWOv7Rew1doWzs/S/TTLE/VTrSjPlPssOI8M+TW5fw99REdM6W2TFZ9RgoGYFU
         hM2/p2yi4Cw57SqvuSVgguWG0qREan9S5xh3qHvxpo9uqiGg4D+LP7BXyf+BpmhOMwqS
         ls6Q==
X-Gm-Message-State: AOJu0Yy6aBhlD0EbUYdjVNEH2utKKQr3WXwEXzAiu87XnWESSSm2K0ew
	59DZIo+FpOvAwaHULKE3cg+ysnsH18cD0EC0F8OrQfNltapZK978id4Y/iHXO71uP9yXipOdsWY
	Es/Hd9V47znCfZhdh44+cSvFo3LYBqfr+Yg==
X-Gm-Gg: AY/fxX5sCNsgHgfhUMPUcV2311m79bfaj4DmofO4h5pOc1rp2tWGxwSfo8PCXuTRg0m
	e62SR03bCOmQMNhqa1VzTIhjHJzPKCVJ+pCwkOAt0So1yN4wb9v9n+AEGgIPyzvlMdSjgYHFHpf
	RfKbKfbVuq6gF59SpD8gUJtCNGlNp3lEpoa3qskInsPI5XTUe78DXspkJ9jFGGhY7YJpVfj7tpM
	Uh7dR5LMQYkyOVWymM4gLQ++z0lFxSp/Kx5xoS5hBqOFMEUnPdiZSNp2UUhKwt8E5qmwA==
X-Google-Smtp-Source: AGHT+IFouYYFgrUMn+MgUaadw5dqpPm5422f9B8BPHu9bq95iYNgUBiTjb5OGitCUWqxIBSkZpSGidR7WBK6z0OVTjo=
X-Received: by 2002:a05:6214:23ce:b0:882:8b19:da02 with SMTP id
 6a1803df08f44-8887e15ab2amr31552486d6.50.1765551537428; Fri, 12 Dec 2025
 06:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20251212091927.3741063-1-m.schwan@phytec.de>
In-Reply-To: <20251212091927.3741063-1-m.schwan@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Dec 2025 15:58:43 +0100
X-Gm-Features: AQt7F2p9yjD6d_pA4qN_gQ9PnmkEcFVnrib1-pi-nTePxbe74elv4tOEIPpytdU
Message-ID: <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
To: m.schwan@phytec.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 14:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227595

On Fri, 12 Dec 2025 at 10:19, Martin Schwan via lists.openembedded.org
<m.schwan=phytec.de@lists.openembedded.org> wrote:
> +python do_update_crates() {
> +    import tomllib

Sadly this is a problem right here.

tomllib is available since python 3.11, and the minimum python
requirement for oe-core is 3.9, as seen in sanity.bbclass. Yocto CI
builds are executed on older distibutions to check that dependencies
on newer python features do not creep in. I suspect this is why this
was and still should be piped into python3-native, since that is
provided from a recipe in oe-core.

Alex

