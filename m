Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0452F4644A
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:00:00 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47737.1773658798541703098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 03:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HO3ihYHb;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899ee87355dso61519706d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 03:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658797; cv=none;
        d=google.com; s=arc-20240605;
        b=H2Bc8KA9NBYDoRU406LEJKcluk2dfybUI01a6/Uq06ZfvVP3zN2oHGuTZoBeT447/N
         zgVzTapQ+PlQK7SOZy9jJJx3TGv7c0vTIFenQ6oskPC8Cg7O9xS6VGsTv87QEGSnSlU1
         8E1nYTVIIOKsgNSH/HgKkv5o2hxOVGflPsblVG3aZpcCOqBR9uPxE1VGha1A5StWAbbh
         1SX1deJzen1LZziYvzSi904TExnvN8W8LmbnCnfD0xXZHbIqRFGxdux8lcdiX4wE468x
         3XhdWJeEiKmyNflV4Sc+8AYNTp7ZnCEqsfLT5XEi5B1H3THZo/nOg9/QwV8xkFyjK4d3
         VrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uX7CH40EgQS72LplMBGYYScDQyhlYWnerKHJ2w3yF7Q=;
        fh=KYcK21Z2eUk14PoG6/CZ1uYdrVWsbJl06ahfZgj4c8E=;
        b=OdJPNjtzO+m6HSKhvlwg6YFkRwZOPNnZZJeRaKLxiEmCM8n/tAlYFdotnebxgZeToP
         MGzWjrBDdB6GMaBjgXewEqNlHA6P6kciJhr9QDnJztQU+AV92TCURgyEXrGr1V4Z0vJ9
         CGqXGdKRllp9/Cbf9ZHnJx/WNJkqI4Tw/UQhOQ4gQcKHeyWu7BgP7ku/iKw+jzlSdVUq
         rdAkCUhLJal9Mxg5r1ntcb3jJcShmJhcyAlBCiNAsBRR4FrbPrK+jiJdhseCJhMbF5/e
         mfv/obu9Q+ikcaVxaA05tkzs8zxcTK1fidRawe0Edt4g+nm5y3DuXS93/vzDV5Gu6yAR
         FuGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773658797; x=1774263597; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uX7CH40EgQS72LplMBGYYScDQyhlYWnerKHJ2w3yF7Q=;
        b=HO3ihYHbVcKDQM0A6MSWYzlM7vqIZ5ub8wxkb1L4DxuIDX+8LbYFPQ8R9dEr1v1Hxl
         8MaH1WO+s7e0B9v1p1qvSUeqQwbwRi2d/2oKzr01dM/UctoVHN5NvPEuqFBvdAjrfQ4s
         ky676YWlMKiV7Uc2X8ctsrW61D+QXkX0cHJW1ZLrCTKMEb3f+l/SCG8Mx+XpSk5XveVM
         fKG1TJBnQHpUbxo9ZUirVqCtcrA91ClrGJiDjT/sPYS069CIM0z3YkpYNCKUe7elFYSV
         +8+0hl4PFFhAVKmAWUQAiwmPygIYtqcf3ng0vtMcxFEK1JENoA3i4jgfxT4jxaJNWovQ
         6PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658797; x=1774263597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX7CH40EgQS72LplMBGYYScDQyhlYWnerKHJ2w3yF7Q=;
        b=oKautN31NPusSRnKI3Y8rLmf6ZShqNFJ9CC9tcE9CdtmGFxgSs/YLfd0n0s0YKv6bP
         ouCoM2RTB5blOykB4YTonk1ZdgT57nMw5FFdxcNB64MQuJG1H6MZVh9+/HmNEt81pent
         rEjmN/uYykTStVb7ye1QECNJq+gXqBAF7mD+Y8bjHqgmoT/4WuxiEc1Gi74/Mxn290cZ
         fPGk25bYrfPJet9RN7x0UVOz18gjiEf2lXEtXeoEcldiVwuJ/xuajVehq7uO7vb1hjOV
         p+X9AMtV2m4OYnLSHqlz3xxNvCjE3zYAFgb5YkfQp/1mack6C3pBo39+UMmwiCToLPBd
         BJgQ==
X-Gm-Message-State: AOJu0Yx5NvJqrfVc84edNeHR9xXO+xgROG+/L9M69LEDFSu1RDfTSITt
	XVKF+UUYwiEvRPehOtplouos/WjzKsRsnRxzAnYTq5FhDaNW6rL/FdlfJi6QQuuH7x4YD3Mgtwq
	urIxmRJKk2V557knY1U0XGJTp0lBXY872mA==
X-Gm-Gg: ATEYQzw7i2307ln8JO6X5FIQeiTUJ0hFclONl5NdiRTRCYRQ63/m1ggH6MjXjpNZt+h
	HlQi7035BL18O7/MUNM/ZQYKLeHHpf59YMVCsL3OerXonMr4Zdvr8dU2ndxWfgo7LUlNZLYPW8I
	SoShJiMyioPVa3Iv6sl6pmU0forNx/2Vmko8UZHC01Pw+TV68iKJ3EqfHdJKlsPco+PbQ3qgurU
	l8sy12XCK32GWHzdjK0P1ZisMjcO/bc0M0B+1GifZBstq1rJRd8nGUJeq2cVm8z0c0Eww6faodw
	QN1ZGxBWbBoXvCvQcRbjMHcL3Sf4x3Jjs9pFSQ4dxw==
X-Received: by 2002:a05:6214:1249:b0:896:ff71:fc70 with SMTP id
 6a1803df08f44-89a81ec2303mr187183956d6.32.1773658797562; Mon, 16 Mar 2026
 03:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260316040958.122568-1-sunilkumar.dora@windriver.com> <20260316040958.122568-2-sunilkumar.dora@windriver.com>
In-Reply-To: <20260316040958.122568-2-sunilkumar.dora@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Mar 2026 11:59:46 +0100
X-Gm-Features: AaiRm51C1cxYqphPMKVsD1fgRR_eD538YukoWV0KyacXtCJrgCfiEDGAOANVHsg
Message-ID: <CANNYZj_yj4wubgwkd+2uvkQ_p=ZXGc-MVhRcrHEdd6AM7JaDwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 1/1] gdb: Upgrade 16.3 -> 17.1
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233244

On Mon, 16 Mar 2026 at 05:10, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:
> +Backport of upstream fix by Thiago Jung Bauermann:
> +  [PATCH v4 6/6] GDB: aarch64-linux: Fix build failure on musl systems
> +  https://sourceware.org/pipermail/gdb-patches/2026-February/225010.html
> +
> +adapted to the GDB 17.1 layout where struct user_gcs still resides in
> +gdb/arch/aarch64-gcs-linux.h.
> +
> +Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
> +
> +Upstream-Status: Pending

If this is a backport of something that landed in upstream master,
then it should say 'Backport [link to upstream commit]'. If it hasn't
been merged yet and only been submitted upstream, then it should say
Submitted [where]. But Pending is not an appropriate status here, as
it means something is preventing the patch from being submitted, or it
isn't clear whether it should be submitted (and either reason should
be included and explained).

Alex

