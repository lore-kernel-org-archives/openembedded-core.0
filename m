Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A325EE644C
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83908.1767181666334371514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=reRe9fVS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202512311147449c6b4bc518000207f3-amr575@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202512311147449c6b4bc518000207f3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NVAqGQRqbcEtQszMyuoNFUTh3Y+66wYlXcG2CjppYIc=;
 b=reRe9fVSxvlijP+spmqPFeHGRJMcVx9DMywANVPqhOSX+KXs+7Rc3RghblNMo8IwO8InMp
 atLgNxN50zmLPsP5hs1p27BOw7WJw00jTfQUl4QmdL3GKTJrNSmcLP8TtXWAJwNXcvktv0YF
 dTvjCkvs4Dq32dvTxXRNj9Xt7uSYbeHM9fkT+Ud6JXX4vZ0UKZS/cN/1YTUHGjI8Oy91l1K3
 znG4809Orj/VEUqaizzuRd3i/4Ci5GofXRP8/nSg900ksTAfKsISfqLvWRlN2rd8fr2UoXrQ
 pmLTDnngckb5JuuJDuTTGWDpNo1JGCP5guYm/Pq1kf74UqTEhZN4D0Ew==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 11/14] cpp-example: Add std::vector example
Date: Wed, 31 Dec 2025 12:46:41 +0100
Message-ID: <20251231114718.4031606-12-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228733

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


