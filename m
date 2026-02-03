Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFB2E8B36D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:01 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6178.1770157316319166633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ICsn1LMG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260203222154454113eb9e000207d2-t1yhpt@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260203222154454113eb9e000207d2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NVAqGQRqbcEtQszMyuoNFUTh3Y+66wYlXcG2CjppYIc=;
 b=ICsn1LMGXcMtGmECYMgK5Xjdn82vSN/tWN+4UB6eELWkkNax9dUiI3dy3yVrZOzsYd4SG1
 z0qjt93ZJYnwMwWPISNge0Olx7tdm2RWm81xtImSoV2bxJcP1z9RtY8sHd3fD7Y6O6ouFlzy
 ezVhnT/yAQwSrv9oF3Z6INBryKJn2R3hISou80bPyxtsII3IPqkmAVv4LNnLHFNpNpofUbew
 ZjoHARG25ZK3Jcm/WC44w3zFHbauRoD7cVpR1SKnbxQ8MlKZwfYBkTjE7xgBEjOgvVVVmAfM
 ycIpklwvMT+HeVMkRYp99MuYvKXQep9Y/NOBG1J0OOk/XZk64WfBKOhg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 11/12] cpp-example: Add std::vector example
Date: Tue,  3 Feb 2026 23:16:27 +0100
Message-ID: <20260203222139.1599349-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
References: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230475

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


