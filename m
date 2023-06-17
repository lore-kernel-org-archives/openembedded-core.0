Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264E3EB64D9
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 10:31:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2843.1686997910259794332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jun 2023 03:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=B0pnZiOK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3112f2b9625so108298f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jun 2023 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686997908; x=1689589908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tKkz+QSu6cZov7EctDTb96vDufhUoYpJxjIariAFZw=;
        b=B0pnZiOKMPL461oRrDb5aqkmZCiXcvVKFjcWLR5/bsxqYFLk1zU2UGfEjP+YfKAgZm
         MmZje/wlhBu2fL+G6Y4qdHTgWuoxEBccroi/XU9We5d7kVwtBoctIwek5NGA8PmfCS/z
         23kEb6W2rm1P8+/ETRbQFdC0aTI2T1BXpBJ8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686997908; x=1689589908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tKkz+QSu6cZov7EctDTb96vDufhUoYpJxjIariAFZw=;
        b=MI9YWxEsI+FS83RaRr93M+mNgb+bnV7ze4bHKzz58TRGikSr+SYxcXmYph17I8q+uY
         Lm5v6J29sq0oJL5yfPBtaqqx+9YjwRHgiZg9IaG6YW+oDXrZflYGKX9HOPQwu3HTWm6f
         LTp2jehbB+MOAdoKH9emnTFtgCnw2y2okzIzwggeYVyNg6VHR9HzqyXRljN6eXHf4dNM
         oupQZqzL7UeloAlooHcy4bPRxUPTKxUC9z0T9xzLMioWuvrKG3L6i24U86kwKQohZMnK
         Y5gNP3EEZ/soB101g4uYFbT7bTs5JS5aVuBRLqHl0+VppDs7NRodGsJv6Z42naxGJqu7
         ZkmQ==
X-Gm-Message-State: AC+VfDw5PKluYtj2glGs5u9JwjPYIhPKcUSJo2dBicFTk9r9425BoaCv
	3jMmKpN8R0Ih8iEQbKSp7lJsX2nInpNZ4OafqyA=
X-Google-Smtp-Source: ACHHUZ7Z5gtgH5nFtE0EgEt70sZ7Df46aq3ChfX4mamRFR7XsIcKlkduaqId/ilMHlDKvLiP33mU4g==
X-Received: by 2002:a5d:4387:0:b0:311:f51:66b1 with SMTP id i7-20020a5d4387000000b003110f5166b1mr2786153wrq.19.1686997908227;
        Sat, 17 Jun 2023 03:31:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aef2:b866:ac5f:df45])
        by smtp.gmail.com with ESMTPSA id u5-20020a7bc045000000b003f7f2a1484csm4736350wmc.5.2023.06.17.03.31.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 03:31:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/oescripts: Fix qemu-helper selftest
Date: Sat, 17 Jun 2023 11:31:46 +0100
Message-Id: <20230617103146.1938095-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jun 2023 10:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183053

The updated selftest was assuming qemu-bridge-helper was available on the host
system which isn't always the case. Tweak the test case to avoid this issue by
adding dedicated help output and checking for this specifically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oescripts.py                   | 4 ++--
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c                | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 36acc006cae..7d3a00e2ab9 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -123,8 +123,8 @@ class OEGitproxyTests(OEScriptTests):
 class OeRunNativeTest(OESelftestTestCase):
     def test_oe_run_native(self):
         bitbake("qemu-helper-native -c addto_recipe_sysroot")
-        result = runCmd("oe-run-native qemu-helper-native qemu-oe-bridge-helper", ignore_status=True)
-        self.assertIn("No bridge helper found", result.output)
+        result = runCmd("oe-run-native qemu-helper-native qemu-oe-bridge-helper --help")
+        self.assertIn("Helper function to find and exec qemu-bridge-helper", result.output)
 
 class OEListPackageconfigTests(OEScriptTests):
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
index 9434e1d2699..c34aa00567e 100644
--- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
+++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
@@ -7,6 +7,7 @@
  */
 
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <stdlib.h>
 
@@ -25,6 +26,11 @@ int main(int argc, char** argv) {
         return 1;
     }
 
+    if (argc == 2 && strcmp(argv[1], "--help") == 0) {
+        fprintf(stderr, "Helper function to find and exec qemu-bridge-helper. Set QEMU_BRIDGE_HELPER to override default search path\n");
+        return 0;
+    }
+
     try_program("/usr/libexec/qemu-bridge-helper", argv);
     try_program("/usr/lib/qemu/qemu-bridge-helper", argv);
 
-- 
2.39.2


