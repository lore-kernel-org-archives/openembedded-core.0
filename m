Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.25963.1609019405919381656
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 13:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nHxYr+Us;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j18so3461535qvu.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vVjdNKJMyDBno/MzkbQOaWAAAaiOs3iZK0x3avB9wRE=;
        b=nHxYr+Us9nBLABs3nPFMDwHCNQY8ncYL9mDYAHIMj4xxzHLJ6LZGG0MVyM/HoMrgpX
         ogCEOQF9FLZvzkVS0DMOkmGSM9MyS/wRrRGJcaJnKy3o7i+/JTBVAi4/2rLYm9idCe7/
         QmWHsiLdkbtmrfoPOvpIhfVh2lsYclUbr5my52WhwPgLD/plIN1iA3CM4G2vqyz/SdsY
         CYjMQ/l4759S473jg5+V1ENKpeXkvLO7yx+CaF9gcF4j1mdxmbo+hdEC+0BpJPSUnj+k
         PujEp7/56qYiMoQ4HW/KZBAbicWLGYZlXlw+HkFRY9jsxnJE54z+WilBMt2nvwWWic3b
         q35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vVjdNKJMyDBno/MzkbQOaWAAAaiOs3iZK0x3avB9wRE=;
        b=lQzDQk/ft5CYw8eELwC2dITHBi5tCKrC7E/SxRF6J6Jxl5Ed9rQdkUVW7RUwXph7Jh
         rHgTpRTHvgRj/A9ZC0kK4M00R9FO+mRr75uxCOxV3zqYEIBLzphK9wnKHsTok9gd/WDn
         wG5nD8mv7DonGFV6nYtI4a3wL161FVxxjVVvtOCvO1EZb3Bv7j3bZmNzbyjDcGju1QQQ
         Fj06T8UNwuVdncsVoHhu1m04Zd2XgF/E0j3se5MnZvINDB1frE5dBEPvIT3cY66GKDT6
         tY57FTB8uIYw3zal3kAlbnnyJFECDEemJ0dMZQDljgid4zxORzihftm1XBQd3yYkPSa3
         FEbA==
X-Gm-Message-State: AOAM533mVALtw7uaviZUdD6OqvLPOJe0VFT6yZblBvgWNysx/JI7T0z9
	D4neF6WXwDZ+8Tn/3y+EIZA=
X-Google-Smtp-Source: ABdhPJyao7V25fKZhXugZYEGyXU/xEBLC+wv0bM19ntgyzR9kP5dj6c0bqzTZkBEuD1/ad77LhniYw==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr7475592qva.18.1609019405043;
        Sat, 26 Dec 2020 13:50:05 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id q3sm21070761qkb.73.2020.12.26.13.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 13:50:04 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: fix 32bit ARM devsrc builds
Date: Sat, 26 Dec 2020 16:50:02 -0500
Message-Id: <20201226215002.59944-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As a follow up to commit: 0fc66a0b64953 [kernel: provide module.lds
for out of tree builds in v5.10+], we must not only copy module.lds
from its new location, we have to not error when it isn't found in
the old location.

With this tweak, we have coverage on all supported arches for the
new location of module.lds, and backwards compatibility through
kernel versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 35bd0ed5c3..23f090bf71 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -200,7 +200,7 @@ do_install() {
 	        cp -a --parents $SYSCALL_TOOLS $kerneldir/build/
             fi
 
-            cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/
+            cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ -d arch/${ARCH}/include ]; then
-- 
2.19.1

