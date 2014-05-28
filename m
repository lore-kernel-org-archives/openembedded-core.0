Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 236346B49F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 16:38:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4SGcpAv015760 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 17:38:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7iKvWstX4PR3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 17:38:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4SGcinW015751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 17:38:46 +0100
Message-ID: <1401295116.2607.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 17:38:36 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Move saferecipedeps handling to be earlier
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
X-List-Received-Date: Wed, 28 May 2014 16:38:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We want to use the saferecipedeps handling code to allow gcc-cross-* to
work on multiple different tunes. Its currently in target only code
so it needs to be earlier to allow it to work on native-> target
dependencies.

This change has no effect on existing uses but makes gcc-cross become
shared as desired.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 40f9974..acff2a0 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -26,6 +26,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     if depname in excludelist and recipename != depname:
         return False
 
+    # Exclude well defined recipe->dependency
+    if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
+        return False
+
     # Don't change native/cross/nativesdk recipe dependencies any further
     if isNative(recipename) or isCross(recipename) or isNativeSDK(recipename):
         return True
@@ -40,10 +44,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     if depname in siggen.abisaferecipes and not isImage(fn):
         return False
 
-    # Exclude well defined recipe->dependency
-    if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
-        return False
-
     # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
     # if we're just doing an RRECOMMENDS_xxx = "kernel-module-*", not least because the checksum
     # is machine specific.



