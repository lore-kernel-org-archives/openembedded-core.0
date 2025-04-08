Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE1EC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 08:06:58 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.70109.1744099613197901557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 01:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWIJMV6f;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so25559326d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744099612; x=1744704412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eQByKxW4Ro/RGS09J1rqhPs7Q3Iaoiw3CmGuUMfupvo=;
        b=SWIJMV6ffrfGI4Z9i5u2OT8xuUC/cCqjLY/BmMup9D29lJC2D6ETOUJqoBiP8WlSkM
         zqwBbflrDRWU+0YzXYw8U8XZmZFJsTRD9x79ThADx5FqsrBWJwQIuRGLU+gSIoqbkcIK
         1JILeyluB2Pz2gqBOkv/7VctqWzBn+0L7qYif0y6ISDbdnJblT6Vq/aKZJ/+FyLrnW/p
         7AMmANXGnvtYK/cpskIH4Jcq04zboGKPI6zmHnNV7Qd0J4ZWne1rkVdK1rXLoDWvu6M3
         J99N5NDDe9Ckk/mXUQU72HxBuxS5SjyHxiMOoVM511+fgTT4pQW7KdIGyXvQx/6wJLOk
         /IRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099612; x=1744704412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQByKxW4Ro/RGS09J1rqhPs7Q3Iaoiw3CmGuUMfupvo=;
        b=nZtfoYE7eLHR8mjVdlUKdOvZ+hgJHQUSNNz3LVzp0/tAt38EnvDk61ux67UTGsAfGJ
         cU4cPr6jEvMszX4zujcbzTJK2VuORE8+IRiZwQ282RF9cJMOW1Px1CX0/xcT3A6Lt4hR
         WsNjoSpvOJReBDzsAzoMLfVYBWeMYHnXb1V+d/Cn1+syEPWKrZbCLxEmE/c3h0oBlN4c
         78woyo4nDNQppsJCOt4kc9yx/JVxiE0R68629+aj0t+Hsqy2PVtD5jMrz2zD6NZXrNtc
         d/iJzT+FI7MVQzLdz2yZMCd8fEfE+aZ8TeBKyQpyTX6VVwin8k4/rRdGF3i26m6DNq/c
         J7Hg==
X-Gm-Message-State: AOJu0YwWJfwzXLUyG0oE1r8A1teUU5OBYqAjm8pN6yy4QNxaHWQaW4z2
	3+VyZV5TlodOlADunD63l0Zj1+JXaSpDqaX5GWTXa61izo04oyZ1GFILtEbZ5L5lycCD0e/esWj
	w9DKF8xB7FZMzuonS+mCeh2DsInA=
X-Gm-Gg: ASbGnctFM4v/M3ltPUCkeOQV6TPsUX8Vtbj3mM8+PLmcZ/+5C+p60OPY0O7FwGwY38q
	l5fY1xgHCIoa30p+BfZKnAUe6VaYF0OCHIzH8Vyzfh+iTHHYl5u41nsphliv7DW4NijMN3JlmjS
	RwjVlLl6DldA/MJtS3qldVbpDVHS3Vfl0vsQpLy1Hyc5y3ittfy3hvlzIEPzJ/
X-Google-Smtp-Source: AGHT+IHJVkpazKEO19Zk7o+6sjLQUmBsXCeZoU6RocreGIZZRpnRQInDKTS4Pp9ofdwxpBXAlnU1ud0Hp9eEG54uorw=
X-Received: by 2002:a05:6214:da7:b0:6e4:269f:60fd with SMTP id
 6a1803df08f44-6f00df15362mr231184986d6.23.1744099612229; Tue, 08 Apr 2025
 01:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250407231500.421051-1-festevam@gmail.com>
In-Reply-To: <20250407231500.421051-1-festevam@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 10:06:41 +0200
X-Gm-Features: ATxdqUGjID_i9LXNqU2CDwJNVSaiSRvYQyx3CXQFXcLnuK4jnLTO0gI5Df_J7fU
Message-ID: <CANNYZj9WY=Wfe=k0=af7h_5sYnL0DcRiZPqGBaJ=3pDTJEA9=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.01 -> 2025.04
To: festevam@gmail.com
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214512

On Tue, 8 Apr 2025 at 01:15, Fabio Estevam via lists.openembedded.org
<festevam=gmail.com@lists.openembedded.org> wrote:
> -SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
> +SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
>
>  SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"

Can you please add the tag parameter here?

Alex

