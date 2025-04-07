Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92282C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.42765.1744018860833328399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDDIBMLe;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso26959845e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018859; x=1744623659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lZeYAf/nYvN0YAOxpIYW91MVMgCps50AcO8IFxyLwM=;
        b=UDDIBMLeu7rK0Vkpdo5bdX+zhhF0BxFDyaJaSZHonxuR2Ep8LePMC/SXJA8jkhdwzX
         uOfNxoHjCJ+/wV4hszjfTJ5nyh04eWHK0MFmQ1GLD0hfPD6MGqwobMYpbyQE6+K+oOBw
         XHG8sq43Kx1LRXq+OEQn/EcINe/lqm9S3Wqs2yX74UocJMLET9ZfnOCHhNAh3Mu/3ae9
         4dGR5UHoxdtOJuA7uGxXQwKrpHGJK8xRq6NBUYhs3+BLyIJjqg9HKc7jTNGQEMw8HGY6
         zcBajthEbPIiGVflvh+Ow/OqX5p67AXMPNuwOOj0bN2ZL6V9bNHx3tg18A/pC6TcIMpg
         oe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018859; x=1744623659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lZeYAf/nYvN0YAOxpIYW91MVMgCps50AcO8IFxyLwM=;
        b=fNtRegoDytCVQTjmB2R6jdgy/rP6j9+OdRHFG4KhYXrzCQloP9JD2HvA8mL7V7lnVz
         Oyy38TWdoQKuYzA3OPktWtaPV8QlWjcytQNuftnyIrxn5zo0i+6R0ge++vsOuDGsuXU/
         DNYQWAKZnpbZIWIznTGri/Ln+eEo3XsazHQ+QaijaJMHCE0orq5PsUBTdBQJLLHlMyYP
         0qPL3lyGdrR8LgcdgHjrk1gqY/agKEAX/CpJ10QxdOz/5CaK9OIEJ8JwYUhamBdvmopZ
         qVUeupmEDX2juCMMKawv0XHFzECUexXTYi/IFZtxyoM44UVo0ODp2JWqoOGOYAHJy7ZR
         92ZA==
X-Gm-Message-State: AOJu0YwZBQmgf6DhkpYVTtRdMrxtuKV7crEIx3FwnXZGSzn4pJCJH0Ge
	6Qx6qz31BcF4O+QiBCdgGWVqasvOG5ee4TPo6j64uvJoWPY3o1YZ8Zo9Sg==
X-Gm-Gg: ASbGncuNlV3d/xncFLweU4amqWwM3U6QtU1TZ0lS/hwHJ26yb7spl7g+HSX+B86z6km
	7rw27lQTC2i7nkR2p7JEDmIo3ty8DxYVsPTbAY1aD3BCBEzSBeusGZn6834xCGpuEcrLfjoU6pB
	bdsZYg/49W/Z8vZpwQagkMQmvJn07+pDr6IWYiVBXZh7pMTepICteXuyulSMPtF9gFvO3Z3WIG/
	aznhCEgsZXvl7PbYl8vlA0XBl2ZesMGN+fOlo5zEpzI2x7yLqxSvG5pqTqitgU0U60bXLxKf851
	FOeQT8FI2hx2TYKAvFq3y29YoPme1d0oUf1SECqNoWYYM85U5j72Io/OjfC9Xk9/ZIhj8W1bNVi
	uqmmBTA==
X-Google-Smtp-Source: AGHT+IH08DUQtxLAlLV/EHBnJPurtka7B0eTPE4BzhRnSotjCCk4h0UbrHnD535e2Ga/HdwQP7HxMQ==
X-Received: by 2002:a05:6000:220c:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39cb35aa70amr9123768f8f.31.1744018859125;
        Mon, 07 Apr 2025 02:40:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/18] vim: mark no-path-adjust.patch as Inappropriate
Date: Mon,  7 Apr 2025 11:40:42 +0200
Message-Id: <20250407094045.753021-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214424

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vim/files/no-path-adjust.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 908459a95ec..a92b1e7cdcf 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] vim: do not adjust script pathnames
 When cross-compiling, we do not want to reference the host versions of
 things like perl and awk.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [specific to cross compilation and sysroots]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-- 
2.39.5


