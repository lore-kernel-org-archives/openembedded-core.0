Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D1572716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnLUl028739 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MgIKqStKQNjQ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAn8i4028714
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:20 +0100
Message-ID: <1430218148.13022.156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:49:08 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] testimage: Fix sdk test manifest handling
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
X-List-Received-Date: Tue, 28 Apr 2015 10:49:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix SDK_MANIFEST -> SDK_TARGET_MANIFEST and add support for host 
version too which is useful in SDK QA tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index dc163c7..1557675 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -287,12 +287,18 @@ def testsdk_main(d):
             self.sdkenv = sdkenv
             self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
             self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
-            manifest = os.path.join(d.getVar("SDK_MANIFEST", True))
+            manifest = d.getVar("SDK_TARGET_MANIFEST", True)
             try:
                 with open(manifest) as f:
                     self.pkgmanifest = f.read()
             except IOError as e:
                 bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
+            hostmanifest = d.getVar("SDK_HOST_MANIFEST", True)
+            try:
+                with open(hostmanifest) as f:
+                    self.hostpkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
 
     # test context
     tc = TestContext()



