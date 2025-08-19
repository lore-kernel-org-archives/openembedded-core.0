Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A395CCA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:30:12 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.9994.1755595807937817560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZylG+YG;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e87055e1b6so726380585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755595807; x=1756200607; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vdRGo5PSbpzQGqI4wLSZ7SRawMWE6rpA+iPwQos2Hao=;
        b=kZylG+YGALXuizmKpm9vDnuHRC97Nc/IxlApHupRw7QEPyZsbJhBFBIYTsxZIKezBd
         cBX0M9p0TDxk8wTlLRKfxOQRSDt9buHBgjN2tsEUl374s1BSHjKZfNjrqBHHl2X1hDjx
         5A4UAZHuEeOytrYEz1xRJW+gW59jfWgKlqX0BrER+Byvm4qaVmUh7Nb0+69R4hM6z8FF
         2NwxWsdVVQ308upmculAzhFIhziuCjEcjZ5/YwIGBzkJse0bAUDKAJzhAL8SGKlOszhV
         FUy06UcMEUTLH4I+1dxkDNSAo0eQ4g7WQienjoswfhbGkcYeLJxMNDvcYVqBqiDtMETK
         Fouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595807; x=1756200607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdRGo5PSbpzQGqI4wLSZ7SRawMWE6rpA+iPwQos2Hao=;
        b=mQNhkdPYGrcPxDU5Vv+c4Yj7hmIdnK30EmB8ALFTUuBd/s8HYLJAbTdLBbPmbG+VcU
         tf1HA38Psle5XEzYtl2nRdxn+n9zYST8FSQy/TYDfB1V6eWu/yi8/WIzy2yaVK+BVbuf
         5Qcpjb6xjOMdDKux4s6H9kRu3DqtLZ0LiUv/A4SeBJuUiF9julKK2820qJXESGL6128a
         PIKPT9YdruhfHa1Cntyqj4wSRdx/LcA0C89vDEfD9Qd3aV/UWqgvtVbJlvpxbVD8mN5+
         UvQQhh+mAhLSqzMk9xBNW3bIcxIitP3snfG63mTJgbHJKqNq7yYX+SUBDhPP1pyKWFoa
         wKBg==
X-Gm-Message-State: AOJu0Yx/3ZfAIJ5DyPj8w7yl04COoah3zAKP/5LcqB60epL+D2jsC/mS
	jPhoPfVavOC17G/NGAXORDXX44TTmh+qrQOc5kR8qsOviRyDOzhMEhNiFEA+nQQTkAG4xYdLAmA
	pyJYj+zGWQ+iz82epPEJRLOmYV/sva6A=
X-Gm-Gg: ASbGncvLFRPtChPw5VJOq5mDl4simcXFtumhU/4SX1vLLFvBOudVsff/QdaLcqw6jy1
	9lEpQq1MysNZeA79xhTB6EJJkU4Q/WiReVgPFI6Y4Op59jgbKtyLxpKeYVao0rICIYAau4ZoRj9
	lci2gY6WChx1trIyUTIe8kJufHSKROBpTkE/nafIf8SFza/0+Psiso/et5K0U3pvIEgupylZch9
	9ei6fJ1mRAcdQr6tISm/vtUNhaNpFKiEO8oSxULJdr/9XGaGsCLznledcrji84=
X-Google-Smtp-Source: AGHT+IGcYYGnpKk8B46n4XKRzMOdij6E/N1bplgGk8EGSWNiR6fpksXZCS/TMT6Q3BH34IDk8rb1ew0wC7kqCoKQnso=
X-Received: by 2002:a05:620a:6914:b0:7e8:640a:ed18 with SMTP id
 af79cd13be357-7e9f33e9351mr206756385a.31.1755595806693; Tue, 19 Aug 2025
 02:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250819054447.4003831-1-raj.khem@gmail.com>
In-Reply-To: <20250819054447.4003831-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Aug 2025 11:29:55 +0200
X-Gm-Features: Ac12FXx9MCfOVfPWEPx_LoxD-zNd5urQemwjBkBbbzfMagvKRMr0BcfSswmxkXU
Message-ID: <CANNYZj_wpcNbg5HT0RG4DQDiEF-gDK-H2R-57qrjfcZ7Si9Ypw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: Fix uio test and ignore
 pwritev|pwrite64 tests on musl
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222093

On Tue, 19 Aug 2025 at 07:44, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +musl uses wrappers for pwritev and pwrite64 using
> +pwritev2 syscall [1], however the test exepcts that the
> +program will call pwritev and pwrite64 ( glibc behavior )
> +
> +This can be fixed if the function calls are changed to
> +use syscall() API directly, but that needs change upstream [2]
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
> +[2] https://github.com/strace/strace/pull/347

This needs a separate ticket, rather than a passing comment in a
closed pull request.
Better yet, rework the patch to a form suitable for upstream submission.

Alex

