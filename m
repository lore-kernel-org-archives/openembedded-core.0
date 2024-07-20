Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9296DC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 13:07:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5714.1721480873129549537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 06:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZqQ0X0z;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266fd39527so19918275e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721480871; x=1722085671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MiCINsy+n6kCHxvkcZGrh+vVfWIGwUR+R0u6lLf11I4=;
        b=QZqQ0X0zgp/PpzKTznCWsUMMvggH/dIzx7SPT5qgX5ATTsthB4OydWpm33VruGC6kf
         6Ru2VY/L/NkdJtdFMSD2DTmbEsBsGU34/w68AQ2aSQ5bUR2edaB5Qy9NQ9p37ew4rpM4
         xUIdlVW0wHd6bknlI48rxb0cUpHZiQzStiS6DNKftQ6z27WxoZ19vesB0hy1DUX45ahb
         cIBpyU2p0rEhftd/Hi2MmioUg2xpg+yOuQ0EXnu4TPT1iFokg5QIT/W8V14bDl4Kr28y
         3G0woWe7SJ9cgOZC97xzQAOsNd8ATZG2dUnrhcU3VIQGSvticQCP4V5hVOeEECjM7IZK
         izJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721480871; x=1722085671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiCINsy+n6kCHxvkcZGrh+vVfWIGwUR+R0u6lLf11I4=;
        b=pw6nedP8qEVTTtI3I8pzsjUdwbW2VXluHG4xHc67/20Troqsmjvw4dzJdyv41omyVL
         C/fBmkwi06H2sAQ4+0iRkNClhp8BIuaT1uUANFE7CYraFERnIQgfFPRfcboNyHchmqkg
         1P/p1teJyxi6MckV5h9h9VePc/tUPN8v3YsfOytwUQWAH6DdMVJlKAOgJDy6TtGDdPU3
         1idDxRtjtQB2+nESlMAyASwaE79AvNJ9Jy18dQQjfokxUq9G8TOx+OOXoKswNLKuQj9R
         Ma4IuGnIAiCU/eBkaK9wLPu8dbsbSxJj1r0R62PO28U2HGXlqMkrr2QId0jVu+EBqzlS
         clVw==
X-Gm-Message-State: AOJu0Yye8e3Ryuq1G3x3ea6mXp39jry39dzqH903yFI7tTCYp/Pde7Cz
	XDugs5hIpAg1rKdqhW6Wxzi9zvRFw3oviwTcrE8GQPbFWp0o5nbZMEmLyg==
X-Google-Smtp-Source: AGHT+IFQPggy7cnwoJ/fYlmOOC5mXJvzntv+f4jjCKCe8x9JFRocjcDyzfR1XuElZ1bFVQ4u98FOsw==
X-Received: by 2002:a05:600c:4706:b0:426:593c:935f with SMTP id 5b1f17b1804b1-427dee74530mr2182195e9.1.1721480870700;
        Sat, 20 Jul 2024 06:07:50 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa09bsm57684325e9.7.2024.07.20.06.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 06:07:49 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-attrs: drop python3-ctypes from RDEPENDS
Date: Sat, 20 Jul 2024 13:07:24 +0000
Message-Id: <20240720130724.3255946-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 13:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202286

python3-ctypes was dropped as a dependency in v19.2.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3-attrs_23.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index a638097988..e39b64306c 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -20,7 +20,6 @@ DEPENDS += " \
 
 RDEPENDS:${PN}+= " \
     python3-compression \
-    python3-ctypes \
     python3-crypt \
 "
 
-- 
2.34.1


