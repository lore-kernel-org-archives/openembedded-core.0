Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B62AA731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD6CfH020055 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:06:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o3bWDHU0R-jC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:06:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD6Ace020051
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:06:11 GMT
Message-ID: <1453467969.27999.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 13:06:09 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/sdk: Partially revert "sdk.py: fix conflicts of packages"
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
X-List-Received-Date: Fri, 22 Jan 2016 13:06:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

OE-Core rev: f2b64f725803ad8be7c2876c531e057a4fe5ca7c (poky
1362986886cc96c8cc11fb60795f729b41770414) unintentionally broke opkg/dpkg
multilib support within the SDK by making things not honour
self.install_order. This reinstates that code for opkg/dpkg but
not rpm where the original problem was.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 6affa40..c4825c5 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -219,17 +219,10 @@ class OpkgSdk(Sdk):
 
         pm.update()
 
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        pm.install(pkgs)
-
-        pm.install(pkgs_attempt, True)
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                pm.install(pkgs_to_install[pkg_type],
+                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
     def _populate(self):
         bb.note("Installing TARGET packages")
@@ -306,17 +299,10 @@ class DpkgSdk(Sdk):
         pm.write_index()
         pm.update()
 
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        pm.install(pkgs)
-
-        pm.install(pkgs_attempt, True)
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                pm.install(pkgs_to_install[pkg_type],
+                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
     def _populate(self):
         bb.note("Installing TARGET packages")



