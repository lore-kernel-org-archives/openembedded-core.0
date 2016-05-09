Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2D6A70031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 13:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49DDkvl016341 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:13:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HNXJsEROhJR8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 14:13:46 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49DDiOQ016338
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:13:45 +0100
Message-ID: <1462799624.21831.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 May 2016 14:13:44 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lib/classextend: Fix determinism issue
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
X-List-Received-Date: Mon, 09 May 2016 13:13:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The ordering of dependency variables needs to be deterministic to avoid task checksums
changing. Use an OrderedDict to achieve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 5107ecd..4c8a000 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -1,3 +1,5 @@
+import collections
+
 class ClassExtender(object):
     def __init__(self, extname, d):
         self.extname = extname
@@ -77,7 +79,7 @@ class ClassExtender(object):
             self.d.setVar("EXTENDPKGV", orig)
             return
         deps = bb.utils.explode_dep_versions2(deps)
-        newdeps = {}
+        newdeps = collections.OrderedDict()
         for dep in deps:
             newdeps[self.map_depends(dep)] = deps[dep]
 



