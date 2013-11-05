Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 600636D6EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:15:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5MFUFn005723; Tue, 5 Nov 2013 22:15:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CeUrCIPgFbbm; Tue,  5 Nov 2013 22:15:30 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5MFQXG005719
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Nov 2013 22:15:28 GMT
Message-ID: <1383689722.6271.184.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Nov 2013 22:15:22 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: lib/oe/sstatesig: Ensure packagegroups don't continually rebuild
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
X-List-Received-Date: Tue, 05 Nov 2013 22:15:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

packagegroups are allarch and shouldn't change depending on the target
or machine selected. In general they should have good stable namespaces
for their dependencies. As such we can exclude them from rebuilding when
dependency checksums change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 852fb7e..33ff892 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -11,6 +11,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
+    def isPackageGroup(fn):
+        inherits = " ".join(dataCache.inherits[fn])
+        return "packagegroup.bbclass" in inherits
 
     # Always include our own inter-task dependencies
     if recipename == depname:
@@ -27,6 +30,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
     # Only target packages beyond here
 
+    # packagegroups are assumed to have well behaved names which don't change between architecures/tunes
+    if isPackageGroup(fn):
+        return False  
+
     # Drop native/cross/nativesdk dependencies from target recipes
     if isNative(depname) or isCross(depname) or isNativeSDK(depname):
         return False


