Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.546.1631201777469855193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acd58F91;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so1367622wmh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2FX1Hf+FAXlwAnbpFf/qzK8U8+S9WsUu/b6nHQSyfMI=;
        b=acd58F91ECgb+IMCMG7hhDDf+7QYWqBnYRHyrcA409z3x0ad9nlz3wCnRHcWeQBEHP
         OSM8DYWjXkgjvT7hIEcKBr1x7S3WWoFtWmRSOXJs9oZVOz+rF5qv8+hFyyJznECWmFwH
         uKfmiezh1Bl7sVzV99LNNLXJyxIzbffAAf5dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2FX1Hf+FAXlwAnbpFf/qzK8U8+S9WsUu/b6nHQSyfMI=;
        b=rrrAwv9TKec++kuedK8ensTPUb12+Bq7n0ccgzERR4yqik/MTvlreF4FYsaaPNYnrK
         46uj6r4KP5/VmDL4LPQL4YYvLMLSKUzd1K58tFDpNcNIBn+sDEa9AHf+YfrT73Iu8CZA
         IBc3nurW9aaDOpTyZJV3lCHf+Pve+dBjgBFtcJ7kqzahEM5RQf0oKs3xL9fwumBEYlCr
         WqlrQKMe6wKWNgpOJweEtB7DhWDhjt4ZgaJqTtLaP+K0X0EAcfsWiL8Ll8N+AQrSPnFs
         zk5yeIgORqAWh00qvQBwL1yai5G62QdZ1cyUwyKEroQus79PZH6Hd1GHeBLZDluODGgQ
         r5VQ==
X-Gm-Message-State: AOAM530CMu4rey/zZ9lmLm/m7GFUfdIvowKH8ig9BHNTwxXIPxfeHYHK
	SxkLsUk/M57N/XtmBTBjMO/OQHiAB6jnJXkz
X-Google-Smtp-Source: ABdhPJwRolA2M6dTUvJ3VqVE7ls9LD1Q2g51VpX39xfMyDygRqnpug/+XaOwKiunp1/CvBGp6vAZXQ==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr3720520wmc.105.1631201775704;
        Thu, 09 Sep 2021 08:36:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net,
	Philip Lorenz <philip@bithub.de>
Subject: [PATCH 1/6] test: Add missing test-statx test case
Date: Thu,  9 Sep 2021 16:36:09 +0100
Message-Id: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Philip Lorenz <philip@bithub.de>

Adding this test case was erroneously omitted in
7c722296879906fe093e1e7c4b7537e150d492cd.

Signed-off-by: Philip Lorenz <philip@bithub.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 test/test-statx.c  | 20 ++++++++++++++++++++
 test/test-statx.sh |  6 ++++++
 2 files changed, 26 insertions(+)
 create mode 100644 test/test-statx.c
 create mode 100755 test/test-statx.sh

diff --git a/test/test-statx.c b/test/test-statx.c
new file mode 100644
index 0000000..06d86af
--- /dev/null
+++ b/test/test-statx.c
@@ -0,0 +1,20 @@
+/*
+ * Test that passing NULL to a parameter marked as nonnull works correctly
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ */
+#define _GNU_SOURCE
+
+#include <sys/stat.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+// Passing a null pointer is the test scenario
+#pragma GCC diagnostic ignored "-Wnonnull"
+
+int main(void) {
+    if (statx(0, NULL, 0, 0, NULL) != -1) {
+        return 1;
+    }
+    return 0;
+}
diff --git a/test/test-statx.sh b/test/test-statx.sh
new file mode 100755
index 0000000..77d0302
--- /dev/null
+++ b/test/test-statx.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+exec ./test/test-statx
-- 
2.32.0

