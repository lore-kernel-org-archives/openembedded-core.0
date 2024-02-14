Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0524C48260
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 01:33:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.32145.1707874401405109175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 17:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mJX2aJpj;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-410ed9f8621so19363005e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 17:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707874399; x=1708479199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoKg0aEc6ZCG4yl/NsK1ARco7ARp6TmF9yvlHBB5bHw=;
        b=mJX2aJpjpsZQiHhAJGd9oMG9O7a3YCBcjFge805ttVRuJRiO0KdH6PHEmwtIzjWx1+
         ROzdGkpSGRdqF80MTG/FAnrSMX5J5x3bmqoyqIGReLio1kXAn//SK1nuCtoMrThqQ2df
         FdasxfohNLz0epdr7LafGJpv8ddpmcDqnlCGEwOOTzWlo8VMSI94/Ni6qVvjBzUpYL8x
         oP7Lz/u4g0LCSDmChf2lBMv/V+AzEFhhHMz6utVfivemUbGr4aDj3SaU/cGhSKUE1pyB
         niA6Q7iYBSANblfTIgfAaVGoSQ32zEJgRGoMvXotfMfXS7nlAXB36VSv7azDTPGAyJPd
         gOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707874399; x=1708479199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoKg0aEc6ZCG4yl/NsK1ARco7ARp6TmF9yvlHBB5bHw=;
        b=NvLuhEbT3NdZndcIcR2rh5GlPcYgtlJkHvQmCPJV/H3ZVh0256IGIMADZyJfNcBmbE
         SppzNVySwaIBeKWaR11j6kKhrJSyWh1VGKjcbPZTPQlZuTs2szlAksytP69UUcW5Sb+g
         SPPNP/s4wi6O1p+Thx9arSwXhGUOqZGeZHDRfHJovdhSsXX8Y+A8a1WzMAxt9NuJxmTM
         xQ5d6lmuDOPy34Tko0+JBcSwS0dmmU1UygYqM8cuuSE43dryyutDg/HTJlmsS/sHi0+8
         XT9Pi1qlNvzldGAbJet4bC5deTUZyi4B2ka8nDEaQVtfK8zSX8SQgZ3NBti0PNlzkOvl
         C35g==
X-Gm-Message-State: AOJu0Yw8HYN+kYyvm+3zZFpPdKsPfySAa1nlLVfc3+2CwKQlVDl2WbIk
	yMZ9nPlmlBnXzSmV++7ep9Xthi+ReaitLRO2lwu1LLvqOVJ8hpW6JTtZzKzkDhg=
X-Google-Smtp-Source: AGHT+IEOQ/VgtQ2kwa0rubp5aISF9ewCJXg8CW+GsnJ2QXO+vpw09lBDrDlZC/uZrwbiZsASja8+uQ==
X-Received: by 2002:a05:600c:35d6:b0:40e:f1f4:89cc with SMTP id r22-20020a05600c35d600b0040ef1f489ccmr898329wmq.25.1707874398779;
        Tue, 13 Feb 2024 17:33:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNnwOwKv3u5gKn0xPWKdeltlfLwP2LjB/4sRhX4c+xh+jZxcUwKfephIb2IeuKSW9+lhhnb37v5gGhbQbT6oiurLizt0Q5njQFgaavzX5Q5O3Ckox8
Received: from localhost.localdomain ([2a02:842a:10:ba01:5116:683:982f:b238])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b00410d7e55e5asm362762wmn.3.2024.02.13.17.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 17:33:18 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] create-spdx-2.2: Correct the default value of SPDX_NAMESPACE_PREFIX
Date: Wed, 14 Feb 2024 02:33:16 +0100
Message-Id: <20240214013316.127190-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195450

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

This patch corrects the default value of SPDX_NAMESPACE_PREFIX as the previous
value is not expected to exist.
It adds also the documentation of the variable SPDX_NAMESPACE_PREFIX.
This patch can also be linked to the bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15398

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 meta/classes/create-spdx-2.2.bbclass   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6f7d6ff01e..907575ba82 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7913,6 +7913,11 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+   :term:`SPDX_NAMESPACE_PREFIX`
+      This option could be used in order to change the prefix of ``spdxDocument``
+      and the prefix of ``documentNamespace``. It is set by default to: 
+      ``https://spdx.org/spdxdocs`` .
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 486efadba9..dedaffc043 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
-SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_NAMESPACE_PREFIX ??= "https://spdx.org/spdxdocs"
 SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-- 
2.25.1


