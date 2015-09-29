Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD77F7680E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 15:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TFWkcm013892 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 16:32:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id knnFOMM98Ezy
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 16:32:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TFWZIe013876
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 16:32:46 +0100
Message-ID: <1443540755.5162.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 16:32:35 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/package_manager: Handle empty package list in opkg case
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
X-List-Received-Date: Tue, 29 Sep 2015 15:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you build buildtools-tarball with opkg as the package manager, it
passes in an empty target packages list and fails.

This allows the code to cope with an empty package list (in sync
with the rpm backend).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c51e88b..630b957 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1512,7 +1512,7 @@ class OpkgPM(PackageManager):
         self.deploy_dir_unlock()
 
     def install(self, pkgs, attempt_only=False):
-        if attempt_only and len(pkgs) == 0:
+        if not pkgs:
             return
 
         cmd = "%s %s install %s" % (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))



