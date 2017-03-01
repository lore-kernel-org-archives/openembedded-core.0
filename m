Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0C477513
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2pSB011995; Wed, 1 Mar 2017 16:02:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5MVvhaxMtLE6; Wed,  1 Mar 2017 16:02:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kKi011977
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004o0-O1; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:36 +0000
Message-Id: <1488384162-18397-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/12] oeqa/sdkext/context: Work around broken dependency checks to get sdk tests running
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:55 -0000

This is admitted a bit of a hack but it does allow a number of significant sdk
tests to run successfully and hence improves testing of eSDK which is good.

I'm therefore proposing we do this until we come up with a better solution
since the current lack of testing is worrying and would have caught other issues
had it been present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/context.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
index bee8c39..65da4c6 100644
--- a/meta/lib/oeqa/sdkext/context.py
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -7,6 +7,14 @@ from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 class OESDKExtTestContext(OESDKTestContext):
     esdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
 
+    # FIXME - We really need to do better mapping of names here, this at
+    # least allows some tests to run
+    def hasHostPackage(self, pkg):
+        # We force a toolchain to be installed into the eSDK even if its minimal
+        if pkg.startswith("packagegroup-cross-canadian-"):
+            return True
+        return self._hasPackage(self.host_pkg_manifest, pkg)
+
 class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
     _context_class = OESDKExtTestContext
 
-- 
2.7.4


