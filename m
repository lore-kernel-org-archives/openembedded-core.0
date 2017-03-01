Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 793AD7755D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2poC011997; Wed, 1 Mar 2017 16:02:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u6WP3eScE8pY; Wed,  1 Mar 2017 16:02:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kVS011976
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004nv-NH; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:35 +0000
Message-Id: <1488384162-18397-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/12] oeqs/sdk*/case: Use universal_newlines for subprocess calls
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:56 -0000

This removes the need for some of the ugly decode calls with hardcoded
locales.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/case.py    | 2 +-
 meta/lib/oeqa/sdkext/case.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 782db8b..963aa8d 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -9,4 +9,4 @@ class OESDKTestCase(OETestCase):
     def _run(self, cmd):
         return subprocess.check_output(". %s > /dev/null; %s;" % \
                 (self.tc.sdk_env, cmd), shell=True,
-                stderr=subprocess.STDOUT).decode("utf-8")
+                stderr=subprocess.STDOUT, universal_newlines=True)
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
index 6f708aa..21b7188 100644
--- a/meta/lib/oeqa/sdkext/case.py
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -18,4 +18,4 @@ class OESDKExtTestCase(OESDKTestCase):
 
         return subprocess.check_output(". %s > /dev/null;"\
             " %s;" % (self.tc.sdk_env, cmd), stderr=subprocess.STDOUT,
-            shell=True, env=env).decode("utf-8")
+            shell=True, env=env, universal_newlines=True)
-- 
2.7.4


