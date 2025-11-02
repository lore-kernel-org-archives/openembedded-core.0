Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A209CCFA05
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:49:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6987.1762073361774419020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnX0bjS0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34101107cc8so282098a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762073361; x=1762678161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As7EWmhSz6OF9Eys6vuJe6mZP1B1Ea29KeikNXkYkZM=;
        b=jnX0bjS0FiEmxUqsfKtJQ7TrzlWn4yZx9Qw7+7RZnijCD8PS+SBbv6qA0u8njF2nzZ
         1HMCm6RpUyBLma8N4ssQaXMQmAlm4K8BnlbJlx8622lNfZ8LjkNRFVcNm4M9AbwNqkdn
         IWroQewsPCy26jR13TWjwok2NgemQDgMezTvj47Fyp3iJ5hVYTrb3MGdN6gdMO6JKy/h
         7exgl2YDLW1JAtY1R8mkXYjPlNwYq3UfvpBKNo27Jd/k6b94WdlNUv+BLhiUkQY4V46r
         C2DR9cXXyGjE8g58AuzFymWJljhATRZSrfiY+/HD0WiGD358YvbgDReI53VResGxqYGQ
         SBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073361; x=1762678161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As7EWmhSz6OF9Eys6vuJe6mZP1B1Ea29KeikNXkYkZM=;
        b=kQEzO/CePcoLmGYua+2RIGZM7WXqqC7QVmp+VM9hweEC3mID56+CtZe8R+gpT/88dw
         QzTWA1gKDzOE1zsPBrbBcgwZNEwi6u/8rqM/oUPYrsm52dZ38tYVvlivstfVVPZYmlVt
         68Vx+QmpoTLPmwJXufZ9EVZH2R+5x3cO3VYIkIbJmf8e8HnioOqG5+E5LpEk2oFbuSD5
         imBlbEEuVwmIpY900fAZ2r/LfV6g096bVqmAhPxl7jxOZsCYKU3xk7agHioq4WJd/EJQ
         go5VJwlgy388jU4Ku9jSxlxqRML9kilsJOpHbn5Heg7e0sz9GK/VVTD8xZfiHQyI6nNU
         uzZw==
X-Gm-Message-State: AOJu0YzZ40HW6VbLc4NLJPH7Z0wmfmqIKzTUcTNPfq9r9jRvagzvKcfJ
	UXrJUnYANWM1qbDAlr55WDh6II3A0bmjMlgcJbCmNeMw7ZI9ddO/hdu8C7ivJw==
X-Gm-Gg: ASbGnctUAFKI6Au6DRcKfMVhxcK7mzYuspHXICSHm396UxzPyK9dQHyMdsCILT1u/tD
	FGPmfXauk/UhZtMaKBUdiPQ4A8wBd87TdGDo2mpTYds9j5+pWbX1Q5eYw4DZJDJdydlRjE8wU28
	jpEfJaYH9hmzyAyC1veG08U1A8RicbHckK4Sz8PPr1XwRAXt4CD0GCZpTVnIQ8R6zXd44btL8Ku
	0t3c1O4jAKJzSjubpWTPtk/mc2SSxSWgmgw/M2qNIj4Bu8cGZCqgngg1IHYgZwa1Z73ctFwwKQ5
	1zldMr/pjYZ2EvOxET94A/kWKqZUpG2Me2xr4PaRLVeozXIYEGpAK+ns0gUIclEEnmVmljXWfd/
	2AgoFrgHYZ9Qr5F+q5PGp2/b2ptV+VpbbyMk5KOZ7MyVL8S/k5fDRfDI3O5qd7sbaXfLgzX8Jm3
	2Bii+utn1feNLWBQ==
X-Google-Smtp-Source: AGHT+IHQWP8ChCPvw/bVeVDSM/w0deSyLgmLSivODP7dnnhUCayntfcdnDXrjU66HjedPHEvIF4FbQ==
X-Received: by 2002:a17:90b:1c0a:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-34083088431mr10465982a91.27.1762073360951;
        Sun, 02 Nov 2025 01:49:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aaf449e8f1sm113891b3a.11.2025.11.02.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:49:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/5] iproute2: upgrade 6.16.0 -> 6.17.0
Date: Sun,  2 Nov 2025 21:48:53 +1300
Message-ID: <20251102084855.1555197-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 08:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225570

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../iproute2/{iproute2_6.16.0.bb => iproute2_6.17.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.16.0.bb => iproute2_6.17.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
index dc7106902c..ade664300e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0"
+SRC_URI[sha256sum] = "9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec"
 
 inherit update-alternatives bash-completion pkgconfig
 

