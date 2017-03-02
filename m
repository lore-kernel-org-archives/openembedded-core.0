Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A37372FCB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v22G9huM001409; Thu, 2 Mar 2017 16:09:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9wYyvUHGELDo; Thu,  2 Mar 2017 16:09:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v22G9bsu001406
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Mar 2017 16:09:39 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjTIP-00028d-T5; Thu, 02 Mar 2017 16:09:37 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Mar 2017 16:09:36 +0000
Message-Id: <1488470976-8170-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testsdk: Use auto.conf instead of local.conf to set SSTATE_MIRROR
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
X-List-Received-Date: Thu, 02 Mar 2017 16:09:45 -0000

The local.conf file can get overritten and changed by the SDK so (ab)use
auto.conf instead to ensure our configuration tweaks get applied.

Also ensure we append to any other configured SSTATE_MIRROR variable
that already exists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 0e6949e..d566b43 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -154,8 +154,9 @@ def testsdkext_main(d):
 
         # Use our own SSTATE_DIR and DL_DIR so that updates to the eSDK come from our sstate cache
         # and we don't spend hours downloading kernels for the kernel module test
-        with open(os.path.join(sdk_dir, 'conf', 'local.conf'), 'a+') as f:
-            f.write('SSTATE_MIRRORS = "file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
+        # Abuse auto.conf since local.conf would be overwritten by the SDK
+        with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
+            f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
             f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
             f.write('INHERIT += "own-mirrors"')
 
-- 
2.7.4


