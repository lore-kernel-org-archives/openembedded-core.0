Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EA9626DE0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:59:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARHvY7r007331 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:57:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YNstVct5OAyN
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:57:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARHvTvg007324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:57:31 GMT
Message-ID: <1385575046.11222.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 17:57:26 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig.py: Fix image regeneration issue
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
X-List-Received-Date: Wed, 27 Nov 2013 18:03:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the "ABI safe" recipes, we've been excluding those from signatures. This
is fine in the general case but in the specific case of image recipes it breaks.

A good test case is the interfaces file. Editing this causes init-ifupdown
to rebuild but not an image containing it (e.g. core-image-minimal).

We need to ensure the checksums are added to the image recipes and this change
does that.

[YOCTO #5585] 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 33ff892..329c84d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -14,6 +14,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isPackageGroup(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return "packagegroup.bbclass" in inherits
+    def isImage(fn):
+        return "image.bbclass" in " ".join(dataCache.inherits[fn])
 
     # Always include our own inter-task dependencies
     if recipename == depname:
@@ -39,7 +41,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in siggen.abisaferecipes:
+    if depname in siggen.abisaferecipes and not isImage(fn):
         return False
 
     # Exclude well defined recipe->dependency



