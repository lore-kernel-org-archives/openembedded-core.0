Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBE4C88E75
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15106.1769413110454620707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=CQVMWvr5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260126073828cd245e88b60002077c-_rr7yj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260126073828cd245e88b60002077c
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 08:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NVAqGQRqbcEtQszMyuoNFUTh3Y+66wYlXcG2CjppYIc=;
 b=CQVMWvr5kn6uIzTetYHn4j70s7gDagE/IkDFo7Mwugglj0o+E6+jx8+V5PZm0WnB5+XC6E
 FU2Ag6e8cHyiY7FjeokzqIe1N9A+kchuzcpE+kUMeL13D+qvc/IOqG70OpDfAYpzS6vFuEZj
 3AHXatvbzmxo0Zd3rLqXdza1kekAoW5/IW3fmWYpThq+a+GuQdmO7Bws60aequcuIYtEfb0U
 lN0j8yeS9E/7b762/7Dt5YXsuX77VSUVg8CBc7fNU/M6DvbyJ0APvHcFENfJa/LO8qU7ltjO
 hB/7TYLnxynF6Th1GmWa7Z1Zz0NK69ml/SelQDN2yxYgG4QQnJA6zy2g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 12/13] cpp-example: Add std::vector example
Date: Mon, 26 Jan 2026 08:37:39 +0100
Message-ID: <20260126073809.468495-13-adrian.freihofer@siemens.com>
In-Reply-To: <20260126073809.468495-1-adrian.freihofer@siemens.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229955

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a standard container (std::vector) to the C++ example program to
demonstrate the debugger's capability to inspect and traverse STL
containers during a debugging session. This requires enabling GDB's
pretty-printing feature, which depends on Python scripts shipped with
the compiler.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/files/cpp-example.cpp | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index dbf82f15d9..23d7169092 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -9,6 +9,7 @@
 #include <iostream>
 #include <unistd.h>
 #include <string>
+#include <vector>
 
 int main(int argc, char* argv[])
 {
@@ -50,5 +51,12 @@ int main(int argc, char* argv[])
         }
     } while (endless_mode);
 
+    // Example: Demonstrate std::vector traversal for debugger inspection
+    std::vector<int> numbers = {1, 2, 3};
+    std::cout << "Traversing std::vector<int> numbers:" << std::endl;
+    for (size_t i = 0; i < numbers.size(); ++i) {
+        std::cout << "numbers[" << i << "] = " << numbers[i] << std::endl;
+    }
+
     return 0;
 }
-- 
2.52.0


