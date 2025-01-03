Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2328E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:08:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.31000.1735913294902111249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zjdm98ny;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dd43aa1558so82013016d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913294; x=1736518094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNn6SY7PtxPVyahjftTq0vVZqxCV8b1tR47mojHxz9s=;
        b=Zjdm98nyqvtrgrmwp39t0ug80MvWsN+U4MKQLYa8ZW9R0GDpbX1YC4YcHKbz4GpPvR
         M0/MpTkIfuf8mo+Z0SeeqW9NAcHhgUlCG+5G5q+D81d3MmFWO0tA4fIpxDXudJycC+Fq
         nFBJRgD0SZDlJe9KJ6OgIQLRK1n3UYP13CYWVyXoRvSSHehPwYdloaIarFhkpdwUHh5h
         bsT/zCm0juOV6VfzplXaQ2d7zrPVGNRFkpLgv69IFf5EWQrrYwfhGjiCWfcx27r77t4m
         ygZ5+h0zF+/4PZwxQBnrNv5TRbLDq7nhcrRJYZhHtNc3reaFcoUUDurJLqeLWs8V0JLm
         i8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913294; x=1736518094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNn6SY7PtxPVyahjftTq0vVZqxCV8b1tR47mojHxz9s=;
        b=Y0XzTIMxr36lEwIc86SIKyiLbkvEsWuL1qcodMc0Oi9V9ZOMPM6fWFaHDJ/ihx7E6i
         yNrjBKQ1wgaZgwGa5xx8W2gYZbtpl3dfnQ78g0ErkJnKZqIP+c0gw6NzTEt9Hey0zczd
         f1bVxCuOjtS/QnJuixJ43RIR6eIS7DWFIH1SXqNjeSaAgfEwoFMYQ2AUciBCp9ifpxLQ
         l7TOBqcov4fy0EXVK8NGFCr3qEawWbQZovHPoWPSWj+QtODtmKul8gno7ZeehNNcWjRj
         oyHeZGfQul+X0gYwWdXRRbOZZSYfeD+hXLctjF6tlMB5BtVkqb0ENmG2G1APsmJ8RuuS
         1D6A==
X-Gm-Message-State: AOJu0YywsNTS0N+E1INiOTx6Umse7ONepDlPINIWAGzx7FB0PL2xZ2Dk
	ZsUaVkPK1wpk+hkVGL6yhI7eVQEcYvp5ROGDK6T0Nefhh08lI0AL
X-Gm-Gg: ASbGnctIaVTTOloxXEwyo/A8HmtYwrVz7dI79oQDXB67DSmEfvydbHV7b5WFzNCAc10
	k9IuT/17J1s0FemaN9O7fCjJkXEPHhGipnGVZmLYnwDUo0pizMd1PTSBKxqmlpVQiJCdHS82v4W
	+JnL9ecjqbuOC4pTTZ3UA5gnskHxpEE9nv/7HnBL5hq7ZFOsF8S38nTlI8Nd20YrGGNpqE186eY
	aLIQuk+jOl7GX0XvQ5LE9MgwV+qnckpkUi6SnUu+JpAIW2NP6z5yvID83UnQMnO/bBV5ES79/og
	fUCNd52T3u8BVRgGNBGyuxL06yCbFQ4Rd+8W5A3dYt6nu4bms5n38zjf6A==
X-Google-Smtp-Source: AGHT+IEThPH/obTVJCdNXhd03uS3QagdXFWrA0O2FPqR91YQc7FjmsAGGj0wvTB2WhwfV39PrdB2jA==
X-Received: by 2002:a05:6214:e67:b0:6d8:a5a6:f489 with SMTP id 6a1803df08f44-6dd2334dab7mr675536816d6.26.1735913293843;
        Fri, 03 Jan 2025 06:08:13 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddbe688b33sm18748286d6.84.2025.01.03.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:08:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: -stable updates
Date: Fri,  3 Jan 2025 09:08:06 -0500
Message-Id: <cover.1735913191.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209348

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable update for the active reference
kernels.

I'll send pull requests for the LTS branches shortly as well, and
will also bump the -dev kernel shortly.

Cheers,

Bruce

The following changes since commit c09ea097f1f34e2a19dbada6285b30a6b43b11bb:

  bitbake: doc: update releases.rst (2024-12-28 11:04:32 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.12: update to v6.12.5
  linux-yocto/6.6: update to v6.6.66
  kern-tools: fix python 3.12 warning
  linux-yocto/6.6: update to v6.6.69
  linux-yocto/6.12: update to v6.12.8

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 7 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.39.2


