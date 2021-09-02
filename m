Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.3985.1630569926404417986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 01:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M9hCuE5R;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u9so1457657wrg.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Sep 2021 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=balODuY55zt5jm4ZVpVerl52+QXsrnkvxXjlrclXCJc=;
        b=M9hCuE5RmNe9WU7DhZVkoEnxiHONFdbSdUZ681jmCgqz7O15PEkhQlO4IQka/GiSgR
         IWTiLMew6eTq6ygpFV8eTOWe4irhA0mBvnjAB6STRwzzanLqtLw9jJmmvLwzVfBm0XfF
         4LzlGZqucH94SlhJTsHMhSl9/5XiwLfDYmCx9ORcz8O/BXvRDSQRTZbKDaXcnFGNUnYi
         AdG4nSi6Wu+C8tIg66iZ+nRR35nv02s1w3MgVZLyItgcFzqQ9FmMSE47fbJmErvj8woy
         LHD8Cya1QTIZQtAjXf1WU11gvLtt/IIllfNH13nl4AHp3mgURBBhw9KfZelnWidPWFpn
         7gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=balODuY55zt5jm4ZVpVerl52+QXsrnkvxXjlrclXCJc=;
        b=h6cZ5FsTqdMmy0963GJ+Nt/dIrqp7hk3+uTVpINrzukfZMbab5IRVpLST/g7VLyhBa
         RKSvwWcvgzmFENnWjJU3rlES3B4N3O+J2RJVmw67KPK0hDoaRkFNnFEOEy7TXibXHYY1
         J0UOan+GixsHB61VRCAeyo9lQJ3Ze0kIHyt6BrgymWeIRw6Rh8JdAeQkrNB7dqhewlIq
         1D9ujIfSBrU5xHp8Wx2Nxr29VRAaxCCgVyDdNL5ssGwXb9ZY2vIbvSzv9TzDsKH5zrXB
         OU4+UbAgCk/SP8BDTac5YtnU7C+Ud1oDkd1IJ7THPBYobSu7gk67kvqdg9rHT0nVOLJ0
         nfcg==
X-Gm-Message-State: AOAM5307N9j7U1fByeP2p7nwynkjzE4UASKJZns4SOTxZqvL/AiSR8sA
	i+YnqMrL3vlDU+YnB+7k2gOIZAFvwqE=
X-Google-Smtp-Source: ABdhPJyn14S7jg0Fp6JpFwela+9Tfp80TPO58X8ww0Uee82soSikG/x+idP1I2hNzAK5BOvqmiop1w==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr2079749wru.232.1630569924875;
        Thu, 02 Sep 2021 01:05:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id m5sm946355wmi.1.2021.09.02.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 01:05:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] mesa: enable crocus driver for older intel graphics
Date: Thu,  2 Sep 2021 10:05:19 +0200
Message-Id: <20210902080519.1029357-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

See here for the full story:
https://www.phoronix.com/scan.php?page=news_item&px=Intel-Crocus-Default-Gallium3D

Once crocus does become the default over i965, upstream is likely to retire
classic pre-gallium drivers altogether, which (with the exception of
i965, superseded by crocus) are all for retrocomputing hardware.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2fb823dfb8..e8f46384ff 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -131,9 +131,8 @@ PACKAGECONFIG[v3d] = ""
 GALLIUMDRIVERS = "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-# Add crocus when 21.2 is out to the list below to support the full range of Intel GPUs
-GALLIUMDRIVERS:append:x86:class-target = ",i915,iris"
-GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris"
+GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
 
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-- 
2.31.1

