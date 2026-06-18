Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3715DCD98F8
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:42 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28951.1781815000235554379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=MmzUftzj;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf01ba514so11932326d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781814999; x=1782419799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD58iwcPZyb4LNxn/tcCInRALnWhpDqn940da7MF7iY=;
        b=MmzUftzjfQtNUo7Z55Zbl6eCR3HMGnyoSK4ehv+NmsjVb7zca1gbxVeqQVnrnO+Msu
         bdbZWxZBsRHLqLgAAqgvREMvf0qxgVIIsVVgWp2HrtbhstnaLVQ55pKJQEAlyhNzzBPX
         dCG5QoPczzL+d9IOzC6/LzirMj0iHAw2v+chjetuG6ZZE2IfYcHneZCbeYM3GZWRmMbe
         E0gK2WMojCUjg1FKUsF4Rc/kCzzMgma2DyS8kEyeXP3/XTF9b55CuyHeAue9OqAfa4WD
         oCGlQhsPjMOpuaFupgwHpiFz/WaEafDRGhd2Io5A/RXOmJQdy+7g5EfOk2vN+Ftacxjv
         SADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814999; x=1782419799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD58iwcPZyb4LNxn/tcCInRALnWhpDqn940da7MF7iY=;
        b=UDb1zgN5JBtnCmPOLy6QfIRSQh4YgVW4b2LaYottH9L+NPSA5FxHgZt9p9uW9D4HDZ
         LOVqIkS1tkN8FtQ61eqChDGmhr/vp3Lh7u9O55BFEDIfJtSa/rEJU6LKMIIJbYlWjypZ
         WZeHBydUj98J3Z2VdiQm31d4U4CTlaFnzzPxyqZBLf5EYNs6IOkuF3uFOBeurt7sNBhS
         Zr+A6L4MjC1KAAI+QCmlbSNVzuYp9tGCHJOwteOe1IqRYNETJEF/TBEbC4U56MRtBEwc
         3HEwehdltvi9Q19+ymUUwkvsFxJ7ZMf3C+p/VpD8owXmgmBf61Y1j68wzjw1Ouk1WVuL
         Gstg==
X-Gm-Message-State: AOJu0YwFc6q0fNfky0SYBchzHSsprowyszdWwq2XwhnF9X3O8ZE3QiNg
	n3VJHAxSyb3OZ9aqgwQ25mjR2jhJrl284XtvcRuzAcE3iKaKxNRWKr7PZ49RJT1848aETGVthn3
	xe0Rn1Pp6gA==
X-Gm-Gg: AfdE7clySMgM1lfbrg8LAdq4EuXgdELhwDtSqLawps/t/gZYL9B582vT3rbYA+eMIvr
	L7rUl2JUrswEAzzPgOPdakTAuKc9uZVUtwuF0uCvnG2wbeXM6cFI0JD9Xsr25rEwiPX5UtMvrrB
	vgK+ZlQvqqGGUX5XDUgkcVSyQTcr/Q7e+6PO8pxeO6nFYsEDf832b+jxAjMzKOjB1otrhgDp8fk
	0J5OSvoKeQ7SXtqaipE4xD/H3Q6SeRXrQVztLHDRQpnp7rZr3f8uUqgk3FaiXS2URb/kR1cGFtf
	yPqqptsxzq74h3NdcXTCxninEaI0NBeTYoUIJCfLZTWzpGwPYiaqueEgtxTkIK1h4S1MZa3rlmj
	Uv0oXg4JML5Ikv34EFpr2U+JHwifbDlyqwTU+BRp5y3jRySz+F+GE1Je7VC2I4INVvtEL8id5FK
	ih8rew+wz+1rE961YY4IRjJG7XQKc=
X-Received: by 2002:a0c:f6c4:0:b0:8db:3bf7:7aae with SMTP id 6a1803df08f44-8de3e7ef8fdmr11289626d6.35.1781814999047;
        Thu, 18 Jun 2026 13:36:39 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de62de5904sm1829036d6.43.2026.06.18.13.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 2/7] scripts/patchtest: clean up startTestRun()
Date: Thu, 18 Jun 2026 16:36:27 -0400
Message-ID: <20260618203632.131125-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239103

- Initialize self.repo directly instead of in two steps
- Remove extra whitespace when setting error and failure members

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 07c3ada6f7..ff8e8b11bd 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -61,20 +61,17 @@ def getResult(patch, mergepatch, logfile=None):
         skip        = 'SKIP'
 
         def startTestRun(self):
-            # let's create the repo already, it can be used later on
-            repoargs = {
-                "repodir": PatchtestParser.repodir,
-                "commit": PatchtestParser.basecommit,
-                "branch": PatchtestParser.basebranch,
-                "patch": patch,
-            }
-
-            self.repo_error    = False
-            self.test_error    = False
-            self.test_failure  = False
+            self.repo_error   = False
+            self.test_error   = False
+            self.test_failure = False
 
             try:
-                self.repo = PatchtestParser.repo = PatchTestRepo(**repoargs)
+                self.repo = PatchtestParser.repo = PatchTestRepo(
+                    patch=patch,
+                    repodir=PatchtestParser.repodir,
+                    commit=PatchtestParser.basecommit,
+                    branch=PatchtestParser.basebranch,
+                )
             except:
                 logger.error(traceback.print_exc())
                 self.repo_error = True
-- 
2.54.0


