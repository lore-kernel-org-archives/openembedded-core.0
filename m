Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81C597750D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2po8011997; Wed, 1 Mar 2017 16:02:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wS_RCIk7LOIF; Wed,  1 Mar 2017 16:02:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kwV011975
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004nq-Mm; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:34 +0000
Message-Id: <1488384162-18397-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/12] oeqa/sdkext: Ensure we run a deterministic set of tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2017 16:02:53 -0000

The directory list of sdk tests to run can vary so this code effectively selects
a random set of SDK tests to run in the eSDK. We want to attemp all the SDK tests
so remove the element selection.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
index 8dbcd80..bee8c39 100644
--- a/meta/lib/oeqa/sdkext/context.py
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -14,8 +14,8 @@ class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
     help = 'esdk test component'
     description = 'executes esdk tests'
 
-    default_cases = [OESDKTestContextExecutor.default_cases[0],
-            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'cases')]
+    default_cases = OESDKTestContextExecutor.default_cases + \
+            [os.path.join(os.path.abspath(os.path.dirname(__file__)), 'cases')]
     default_test_data = None
 
 _executor_class = OESDKExtTestContextExecutor
-- 
2.7.4


