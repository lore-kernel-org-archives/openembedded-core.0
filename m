Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A95DC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:57:43 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34827.1785913054854183125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cnXr/Wyj;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so4097636d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913054; x=1786517854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8CEayyXTZStS7IUrseETRy2fWMTm8cg5hj4ObOnCk8=;
        b=cnXr/WyjF03jr63sOiwa1Kw+Kg0qx+GLavkc5XDsSpaS0rdAuyrdMPKF043YoE8qDB
         DAkXzegVqxlqFIx9tHfeK3YiADaKK8pjkiEKFHzG5Gty5YTB/OQYklDYO6lhMCccfNx5
         z6/OXdj+5k8N0X72dsvbde90wpjJSmZt0i/Mo8/NJfh251sYkT/0lG6wwbgUfpcuFu+L
         My1wDpeIWKoVRiSWDSRMG3jxjFq8qaC8P4BKvrYI6VmyH7eaZbJ9yw6/Rm6BERn+rxxU
         dIYZcA/EEPAYc2k7b+Yop1S0cAQrBM4DW/+5s74qpEpyrpYxpd1GTOEMwdpzkuDkAiLG
         nIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913054; x=1786517854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8CEayyXTZStS7IUrseETRy2fWMTm8cg5hj4ObOnCk8=;
        b=QaESVdC625rjgQ4IJWwLWASDOzPuqFQgr/vxnuWQh4CEAZh/mRV5jDu32eT41MjFrI
         4E9iIsWfLD98zSwu91Aq+rR7AZwYEM7Z3MT9e1ARuDHz1OZYmtlWtK4mkGY9Euyjg+NH
         yT3E4sgJylmPFvXTcJ8GSP72O2N+f6PBhsP4ekohb5wueWYKFlKdKCzWsJ+46rTiQLxB
         cH7XHTeShzxpxXw+HeqIqIMwfcQ4wPOWyikpvq4OSvgppp7CyV4CKw2j+oZmujQ799bK
         7//0h+XsC1K6PGzhpPW5bQVV1ynpQp9s1WYrAd/3f5l2N6+hwrZfO1E4yNzls4AqLxQI
         YXRQ==
X-Gm-Message-State: AOJu0YzGbu4Ospcod7E6vjbW/sPuGEHBDU1ozemNyEFNr3SHXBuAXmXk
	W8Q/ytV0uA4huUW34JEu7eDLvZOtDKdDpVAYgDYU50EagirjpwDftLm/9xshPQ==
X-Gm-Gg: AR+sD12cYdz94EZQ/Ct6uJSXZ6/q6HglpZXo35m4igGH5Ble5hAARIuClUOcGUtCwYx
	itEr2aYPlElcuoEh6UD3hTSyZMTfUbTsmMaD2zkBuRc2V4t/oAmN3n3UlujmwrNykU8ZHpW/gfX
	GA18c9gBCSvL/mRp+9ZoONU9fhOZT72Ynuc5RSZLlIStqU141Kmr84PkYHooQRU1MW3NDdJVq11
	aEbh/eF0tLlDmOY1w0CNaYyUMjVP2i093yUCT7DaeGydi87x4uHpzvgby0igrKt47pWYAoRKXFH
	woHXqrh95VB3/70lEuyC83bS4j1NplV+RUIdxQbkNmKc48sRk6k2ZRN578/45zKgmEvohvXvC7Z
	1y9y7fncd3XOyylRNCCl7dMCA5evYyN7QXZEaXhKX+RnkD8vwQ84ljQ4EhRUM+Je/iP6zfHRINd
	R2tr1Xc83BFQVvMuo74R3sVn4jhmUBF8aW3I1MLPwq4kIkU0C/vBS4jWi9X9Z7bbZ503wU/FQSp
	9g3gPiMZdFbBp8cj5kWCvSLRgKM904=
X-Received: by 2002:a05:6214:19ee:b0:8e8:b302:8afb with SMTP id 6a1803df08f44-90880e8e123mr52990926d6.0.1785913053614;
        Tue, 04 Aug 2026 23:57:33 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbcc9esm19264546d6.12.2026.08.04.23.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:57:32 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	Harish.Sadineni@windriver.com
Subject: [PATCH 0/2] fix the SDK kernel module test
Date: Wed,  5 Aug 2026 02:57:16 -0400
Message-ID: <20260805065718.3497815-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242826

The kernel module test in the SDK test suite does not pass today.

The cryptodev revision it builds no longer builds against kernel 6.18,
and the kernel's host tools are compiled with a pkg-config that the SDK
environment has pointed at the target sysroot, so a host compile is
handed target include paths and fails under -Werror. OE-Core already
solves the second one for its own kernel builds, where kernel.bbclass
passes HOSTPKG_CONFIG=pkg-config-native; the SDK simply had no
equivalent.

These are independent of any SDK feature work and fix a test that is
broken in master today.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (2):
  oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
  toolchain-scripts, oeqa/sdk: build the kernel's host tools with a host
    pkg-config

 meta/classes-recipe/toolchain-scripts.bbclass |  3 +++
 meta/lib/oeqa/sdk/cases/kmod.py               | 11 +++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


