Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A0FCAC5B4
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.281.1758229694417277864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=TQLbZIdD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250918210812fe75ccf81a00020725-qz2qw1@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250918210812fe75ccf81a00020725
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rRAmRzifvRZ1dxwPlW3uHb7eXC4gexpUrrVNFBOdtGk=;
 b=TQLbZIdD2U8tre1rqeTV4yu+fnvi3zHYZ3ojGyhfkOiTEADhbobBefVooqIefqOBhmOM17
 FxjMAMPvRTIl47xzung0TDwcxekP+VTytI8uQ9Imdq8aLq6CefS8Xo5BjYQo52PfSECEzXkF
 MHTVuteeQO7vZXGTrgk9D6XcKewAsQw9EPjSsbf+jsJrBweggtlcbDr1IujXcY7LRNySJokP
 V5hbci/vCczav4d7j1tZjAAoyrCU7Hfa8bMzKIjLGB+fCMtMZIKFXbIpWjan7tvBNLAm5lJ5
 3e+ie1W2qYHtkplwCy+b/qhjZMsnrvH9wA4n2oUpc2gPum1ZAYrw1dyg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 15/19] cpp-example: Add std::vector example
Date: Thu, 18 Sep 2025 23:07:17 +0200
Message-ID: <20250918210754.477049-16-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223674

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
index dbf82f15d97..23d7169092b 100644
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
2.51.0


