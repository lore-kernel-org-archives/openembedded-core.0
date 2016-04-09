Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2BF771D9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 22:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u39MGngW012674 for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Apr 2016 23:16:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VtJf49ciTK8o
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 23:16:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u39MGlpe012670
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Apr 2016 23:16:48 +0100
Message-ID: <1460240207.9308.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Apr 2016 23:16:47 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] archiver: Fix ASSUME_PROVIDED issues
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
X-List-Received-Date: Sat, 09 Apr 2016 22:16:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the dependencies injected by this class for recipes in ASSUME_PROVIDED
e.g. tar-native or chrpath-native are ignored. We need to use their "replacement"
names, e.g. tar-replacement-native.

This avoids broken archives and sstate failures with these recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 15d2d04..89a24d9 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -53,6 +53,12 @@ do_deploy_all_archives[dirs] = "${WORKDIR}"
 
 python () {
     pn = d.getVar('PN', True)
+    assume_provided = (d.getVar("ASSUME_PROVIDED", True) or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES", True).split():
+            if p != pn:
+                pn = p
+                break
 
     included, reason = copyleft_should_include(d)
     if not included:



