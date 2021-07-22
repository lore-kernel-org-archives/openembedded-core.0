Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7159.1626958027285621735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mJw/IYjL;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id f190so3248319wmf.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5w63ANyucUr6SjJbVp6JZ3Dvu7dE5r+0pbeE39o+E1s=;
        b=mJw/IYjLLJ2qUUPeZspzEZOlRsfNCs9difxNGQizNhDDohf5PdBljH03Ca4fTrks6A
         zum110PGuAQDuUH0L5BBJlMswUlxTtZ5ToG+413/5ADPDqDW5H0zpTfG2YdoK+WdG2cG
         fIkTVxPxvexdMEFzrKyQ8QvT+vC24Skw0SOz8F0/fcCIlN8NE47PusL+zgwkhxqaqWts
         H2aZgIusiGsJO4U8t/XA6jIcGYY3M4QAlDKOjAifS9yTttLOgWyGEabXtqbNUMJwPyq3
         GRdR5Etx26MCrbU6JiNw0Y7EgBCz+F7iTUY36UoWB5Ys4dNV/HQDUsI3GaFwLyopJFXw
         Mt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5w63ANyucUr6SjJbVp6JZ3Dvu7dE5r+0pbeE39o+E1s=;
        b=PDqW3bdbQi0U3bVC1gEgYS+RvVO6p47jSqysPWiDnxZrHHVfOugjqFEwZUu5xel9qy
         k6l8BP+B32S68dqPVaSJu1QRtwlruaVNrbQXi9UQLA180isi3TFld7C1oORUY1pkWfwD
         ODkurO5M4SMXBOhuvICRc+au4RNMK9WVfpMeFMhwgd1K6uvKPKwjAlGR5MpJvJW63Wtu
         NV9K35ZpuXJxDPbq5KItOxdV7tU7qX9curqvz8qbtYzcYNcFnCtv/BFPXuZLBAvTTD68
         845FmSr6moewVNsRnfOrfYsNMdFV2jH7b36GSnP6J9yw+UzxqFJN1HlaKUc5+ybxC7RG
         EAzw==
X-Gm-Message-State: AOAM532g6kMAIvq2OH+got7TTd1YLZKztaWxIKQKJR1+IDcL8AoCSyDX
	JZXNgJEvphpNocU9gvrect+j1CikfVERdw==
X-Google-Smtp-Source: ABdhPJwyHoEawtp64mcHOnLdtyQnvyKUsWUCzfLCm58KGVaGA+HPkWqr2F/xF7myKqLWqPcIQinHKw==
X-Received: by 2002:a1c:7fc5:: with SMTP id a188mr43245548wmd.133.1626958025394;
        Thu, 22 Jul 2021 05:47:05 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id p18sm2468610wmg.46.2021.07.22.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:04 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/4] checklayer: rename _find_layer_depends
Date: Thu, 22 Jul 2021 14:46:43 +0200
Message-Id: <20210722124644.19962-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

What this function does is really to find a layer, not a 'depends'. We
are using this function to find a dependent layer, but the name is
confusing.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/lib/checklayer/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 72d9df0a62..e69a10f452 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -146,7 +146,7 @@ def detect_layers(layer_directories, no_auto):
 
     return layers
 
-def _find_layer_depends(depend, layers):
+def _find_layer(depend, layers):
     for layer in layers:
         if 'collections' not in layer:
             continue
@@ -166,7 +166,7 @@ def get_layer_dependencies(layer, layers, logger):
             if depend == 'core':
                 continue
 
-            layer_depend = _find_layer_depends(depend, layers)
+            layer_depend = _find_layer(depend, layers)
             if not layer_depend:
                 logger.error('Layer %s depends on %s and isn\'t found.' % \
                         (layer['name'], depend))
-- 
2.29.2

