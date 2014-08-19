Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5961765DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCcaAg004869 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:38:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ctwMxohvO5Jm
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:38:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCcYi6004865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:38:35 +0100
Message-ID: <1408451914.1669.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:38:34 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Only squash dependencies for allarch packagegroups
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
X-List-Received-Date: Tue, 19 Aug 2014 12:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The idea of squashing packagegroup dependencies was to avoid allarch 
packages rebuilding upon tune/arch changes. Now that the allarch class
inclusion is conditional, we can narrow down the packagegroup squashing
to be specifically applied to allarch recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index d58147f..4188873 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -14,6 +14,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isPackageGroup(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return "/packagegroup.bbclass" in inherits
+    def isAllArch(fn):
+        inherits = " ".join(dataCache.inherits[fn])
+        return "/allarch.bbclass" in inherits
     def isImage(fn):
         return "/image.bbclass" in " ".join(dataCache.inherits[fn])
 
@@ -36,8 +39,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
     # Only target packages beyond here
 
-    # packagegroups are assumed to have well behaved names which don't change between architecures/tunes
-    if isPackageGroup(fn):
+    # allarch packagegroups are assumed to have well behaved names which don't change between architecures/tunes
+    if isPackageGroup(fn) and isAllArch(fn):
         return False  
 
     # Exclude well defined machine specific configurations which don't change ABI



