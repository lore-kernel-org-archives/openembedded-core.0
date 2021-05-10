Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.32555.1620657092857676647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mohvwYS+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso14570770otg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mYmwY3oMCTcFQ0/Mj0ydlbZNV4O4VSUPHZUhiY21c78=;
        b=mohvwYS+blAecxLPbiPrOFmaKf96orQZppa5w8atTVbS0JeiDpthdnme04kvbjB0+W
         86NvZraeGxaBsIvrIJEA60s/mY9JL2Rw+VXrAQwBG/AyEOFH2vYKZs/FBNfpFmxSaIIm
         qJhIUmpKsxwqa1x0IjG9Lp0XyNb9zj4xBkGRIw942m4SHPqg3X0wRuRizx95L8X2wDws
         QAkly/4H7TRtEUknOPaILJ7T1wZ+8Jlzo4NGvzgjL1oDOJkLYK7fVp6RBRJcbN07d/GR
         JLXtUd6LaT6Veff/rpcVdzRMzq7+/q3rRoJIWsl5AKBbocOWfRLkyUK1ZoSxdl5/wIO5
         aZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mYmwY3oMCTcFQ0/Mj0ydlbZNV4O4VSUPHZUhiY21c78=;
        b=Oq9fa4Y0liAxZ6pu34iBhtF6yTqtY4zDkdqRp20ccisKFgQ7dg2pFytiasStwcBKX9
         KSCM1fQ1N29AEAvDVtsvwPFAoQ0R8Q29w0q0/fdF/bOSzhRo0psymmYZXxYlGAfx8tSd
         ie8amAW7w0kgv68xQWaTukdjBAdQhYZBbx7tNOcE6oRnhtYolJ6oeib2zKdZzjjuL7eo
         p3/3UQZlpQ2I/khiKfVR1fUM/ZszyPnAG3XHrVr2SgTl9WYn3vnp/fDi4yfP+Cke/QpQ
         uVHPUDlUMuy0qYMCFVWz+xJ3645C8GyzrW1vQGbCO6uPnraJ+Vq7czqAv0nREqj/Z/Ef
         5BKQ==
X-Gm-Message-State: AOAM533whl1cDXLWILxw9/dhUWGS6r+ZRDqL23VwCZTMzl5mHu4GYNi8
	e6D6ChRrY2DGT5wDOv12j4rQagrxDaEnArFrIYc=
X-Google-Smtp-Source: ABdhPJyDxHtSJC1Cf9FNa+ZNjDswfdy0v8LY1j96Jj0WrAgCMAk8H8I2ULh2Gks41DOc9IkEvAIoSg==
X-Received: by 2002:a9d:70c1:: with SMTP id w1mr2428769otj.276.1620657091790;
        Mon, 10 May 2021 07:31:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/25] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Date: Mon, 10 May 2021 04:29:03 -1000
Message-Id: <6d5d19d0dd0b274b25e708a1ae1cb41a4a3e3403.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the scripts/postinst-intercepts is owned by root/root then the copyfile() calls
will fail due to chown issues. We don't care about ownership of these files so
use shutil.copy() instead which won't perform any chown.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b0660411ea..db988d9247 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -403,7 +403,7 @@ class PackageManager(object, metaclass=ABCMeta):
         bb.utils.remove(self.intercepts_dir, True)
         bb.utils.mkdirhier(self.intercepts_dir)
         for intercept in postinst_intercepts:
-            bb.utils.copyfile(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
+            shutil.copy(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
 
     @abstractmethod
     def _handle_intercept_failure(self, failed_script):
-- 
2.25.1

