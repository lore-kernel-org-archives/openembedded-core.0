Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 41C2B6F89A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 22:54:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2UMs0J9018560 for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 23:54:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iDGvxkCoSyka
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 23:54:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2UMrt5Q018538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 23:53:56 +0100
Message-ID: <1396220030.14790.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Mar 2014 23:53:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Anchor inherits class tests
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
X-List-Received-Date: Sun, 30 Mar 2014 22:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was a nasty sstate hash corruption issue occurring where the
fact the testimage bbclass was inherited meant that the checksum
changed due to testimage.bbclass being confused with image.bbclass.

This patch anchors the bbclass names to avoid this confusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 8b0e344..aa25c3a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -10,12 +10,12 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return x.startswith("nativesdk-")
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
-        return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
+        return inherits.find("/module-base.bbclass") != -1 or inherits.find("/linux-kernel-base.bbclass") != -1
     def isPackageGroup(fn):
         inherits = " ".join(dataCache.inherits[fn])
-        return "packagegroup.bbclass" in inherits
+        return "/packagegroup.bbclass" in inherits
     def isImage(fn):
-        return "image.bbclass" in " ".join(dataCache.inherits[fn])
+        return "/image.bbclass" in " ".join(dataCache.inherits[fn])
 
     # Always include our own inter-task dependencies
     if recipename == depname:



