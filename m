Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.12504.1601349781926591700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08T3MeiF015499
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 20:22:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 20:22:50 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/3] testsdk.py: remove workspace/sources to avoid failure in case of multilib
Date: Tue, 29 Sep 2020 11:22:15 +0800
Message-ID: <20200929032216.32161-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929032216.32161-1-Qi.Chen@windriver.com>
References: <20200929032216.32161-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

When multilib is enabled, there are multiple environment scripts, and the
test cases for eSDK are executed for each environment script.

And we will have the following problem when executing test cases for the
second environment script.

  ERROR: Source tree path /.../workspace/sources/librdfa already exists and is not empty

So after executing test cases for one environment, we clean up the sources
diretory to avoid such failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdkext/testsdk.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index c5c46df6cd..ffd185ec55 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -99,6 +99,9 @@ class TestSDKExt(TestSDKBase):
             if not result.wasSuccessful():
                 fail = True
 
+            # Clean the workspace/sources to avoid `devtool add' failure because of non-empty source directory
+            bb.utils.remove(sdk_dir+'workspace/sources', True)
+
         if fail:
             bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
 
-- 
2.17.1

