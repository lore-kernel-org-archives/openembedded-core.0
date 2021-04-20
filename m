Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.97.1618939988188101681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 10:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7cU0Dja;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id h8so5925230edb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZOxH2+/385VKGQ0O1qPMB+2D8CNMCUrBaueO320cJc=;
        b=i7cU0DjaDE8S/9CYsTutq9oFFwWFEOgRyI0Q9798zO38mn5wILzQs4nglkpnbe/OjF
         ZeodcK8BydQNsZVD/cGfsAPefCCTN+abC8GZTCcwAjVNJFl7cOFx1H/gSFlCPsunDsVv
         ogc1EvQ0ctHjUYDcdAu5Z5sVj8lvcxbrT1Kk3HBrMy1iWxmJoX1xqbhnaCmuSVhFYECQ
         bXq8VFEdkbqJQ9d2PeAJdoXbC6x/i3/ZYSCH1hh1r87aZ5rNUYqgLk7yoiJaE1ODR+SL
         mkEbzHHxpXNW7RjlBfuIQHQyoDUSk2xNSxOoSPFoqV4A4JHFZ/Re5iUlINWIsXIdRCex
         r0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZOxH2+/385VKGQ0O1qPMB+2D8CNMCUrBaueO320cJc=;
        b=nYZoKfvIyqDbNM0N/UJ4+xutzhHIjCW16G+qLNRh0UJ3KD1UtQJEY6sfdcZNjl1dUi
         vOqlL4zd5o3IY0IJQlYyemkTiFWSxRdvUvRBDSefDp9sRk0a5TXsnQm/5XVDNrAwsfUQ
         NQJDjEyq8uLFCvxe3CUVyj2D1xWut1zn9WikDdqEXCk86WEUQkCf97Q9ohnB2wtEkkHp
         LUZ2tOWwAQRjl25hgA/uo9xx8PZQ8jqLGJ5O3tkfm5couHj1mxXpSMg+Uq0GnCS/5ds1
         56vjr/JgyaaKV8pDri5xH0HJ/K9M/+hrxSiW4mwCnRn1rO+CG/olkj/E5oEvG/O8ls7H
         ZPMw==
X-Gm-Message-State: AOAM531MrsEPG4PzRmcljN97Vw1Grika5OG3FQCLZDxBotIGs6a3ANXa
	3yNiIovVNYMrtr5TlBOtLlgdBHEIG9j22Q==
X-Google-Smtp-Source: ABdhPJzTTohKXHfE0IaYGt1TCyiRrnrxK+OGy2XdURx+GOqjx5rCBYi7EMF7RwlfER4Gm/1ncMwwtw==
X-Received: by 2002:a05:6402:2686:: with SMTP id w6mr11417530edd.226.1618939986516;
        Tue, 20 Apr 2021 10:33:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n17sm5693963eds.72.2021.04.20.10.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:33:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] oeqa: tear down oeqa decorators if one of them raises an exception in setup
Date: Tue, 20 Apr 2021 19:32:58 +0200
Message-Id: <20210420173259.619447-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the decorators need proper cleanup, such as OETimeout
which sets a signal handler that needs to be cleared via teardown.
If this is not done then the signal gets called later with unpredictable effects.

This can be seen if there's a test that is skipped via a decorator and sets a timeout
at the same time: the timeout isn't cleared, and is invoked later in a
completely unrelated context. The test case for this is added in the
next commit.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/core/case.py                | 9 +++++++--
 meta/lib/oeqa/core/decorator/oetimeout.py | 5 +++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index aae451fef2..bc4446a938 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -43,8 +43,13 @@ class OETestCase(unittest.TestCase):
         clss.tearDownClassMethod()
 
     def _oeSetUp(self):
-        for d in self.decorators:
-            d.setUpDecorator()
+        try:
+            for d in self.decorators:
+                d.setUpDecorator()
+        except:
+            for d in self.decorators:
+                d.tearDownDecorator()
+            raise
         self.setUpMethod()
 
     def _oeTearDown(self):
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index df90d1c798..5e6873ad48 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -24,5 +24,6 @@ class OETimeout(OETestDecorator):
 
     def tearDownDecorator(self):
         signal.alarm(0)
-        signal.signal(signal.SIGALRM, self.alarmSignal)
-        self.logger.debug("Removed SIGALRM handler")
+        if hasattr(self, 'alarmSignal'):
+            signal.signal(signal.SIGALRM, self.alarmSignal)
+            self.logger.debug("Removed SIGALRM handler")
-- 
2.30.2

