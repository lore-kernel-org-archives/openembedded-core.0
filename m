Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0F1C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 14:46:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.51982.1700491594528427362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 06:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SMKRgBMz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so2972309f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700491593; x=1701096393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbozGrbTj2vT6uKHvQAyEZM9nfeeFDQ1oLbuQ/nbcUs=;
        b=SMKRgBMzsZbvxEIvQeoTwV1xGrnF8iLLbT9pozk44phwg5/62FvPCIAsztXCD8UBR2
         rm048VL0gRQP11BjkHxMNBKhcgkwsONz6RbP1+VQ6xsRUkN4tkPJdNe/EX5R5MTUV9zI
         DIcjqOitOkMgXjTC4aN7b82jmFkci65Nltsp/L/oaBoFscoRPDzdBye/JuQZLm7wWfSI
         H+hvBprqtsLL77+ShiiP3P0NyZai22McE2TLoCYn4YxibEDyiLN1ld1mQ2XOlWAG6Kiz
         3V68q+JuMI6qiyMYcwdrpulh8WyX+M8WjRd6Nacmc8dryf9CfM+/YAt31Fg+f/bxfvkn
         H5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700491593; x=1701096393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbozGrbTj2vT6uKHvQAyEZM9nfeeFDQ1oLbuQ/nbcUs=;
        b=of7hZjilUL8QkFVshjTb23y6jAZgZ2PWGhkBa02/YrQLwIUoPsnc8zyOMH6KNGUOl0
         njpYDaN5HT2SyVsZWUnkcJVUHjEPdJxomJTVWo7NeVGFQYL989/HY1cYzK4HD06ZwTwH
         OH+VE9zMB/d/PN4aVFpkUnN8VWsvpYHomgczjhlrgGt20fSAGipf0PCcTa5OLGoF2fj0
         S/eKCOkAnuqsQaE/KjdJvy5UdPm1JDu35QXWnjBsrqBSpZRm1yG+3ZZMM43vNObfVpgJ
         OuJ7yGW84KbJm+XF63hLjXbMhl5fUpBQ9EmGYAq/XpHqsldGnpmPH5p10U3M3NDfpGWn
         KCuA==
X-Gm-Message-State: AOJu0YzH/hHnmhgNksfBxYNIfgNhLySMpuhmX0BqB8KNAuiPWW6vcRT6
	XPQvvh4+QY5xvfqyCImYTC9LzAKeR/8=
X-Google-Smtp-Source: AGHT+IG1WljkDOJRHv41KgQiEsM+I4GwngORPJnMb84u23zGpMSCW8FXHjml6BJ6bejsfYbop2zWNw==
X-Received: by 2002:a5d:5f94:0:b0:32f:8a45:93a8 with SMTP id dr20-20020a5d5f94000000b0032f8a4593a8mr5803338wrb.0.1700491592665;
        Mon, 20 Nov 2023 06:46:32 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a18-20020adfeed2000000b00327de0173f6sm11454848wrp.115.2023.11.20.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:46:32 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] cmake-qemu
Date: Mon, 20 Nov 2023 15:46:26 +0100
Message-ID: <20231120144628.52664-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 14:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190878

Not sure if there is a better way to enable the cmake-qemu.bbclass for
all recipes inheriting also the cmake.bbclass globaly.

Adrian Freihofer (2):
  cmake-qemu.bbclass: support qemu for cmake
  cmake.bbclass: optionally support qemu

 meta/classes-recipe/cmake-qemu.bbclass | 28 ++++++++++++++++++++++++++
 meta/classes-recipe/cmake.bbclass      |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/classes-recipe/cmake-qemu.bbclass

-- 
2.41.0


