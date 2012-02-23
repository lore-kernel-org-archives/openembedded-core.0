Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0VsZ-0005wF-B2 for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:26:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NAI6sg009226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 10:18:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09173-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 10:18:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NAHvCt009220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 10:17:58 GMT
Message-ID: <1329992278.32110.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2012 10:17:58 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstatesig.py: Move package exclusion list to the layer config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 10:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its desireable for other layers to be able to append to the list of packages
with 'safe ABI's which are excluded from the sstate signatures.

I can't emphasise enough how careful you need to be with this list, anything
excluded here needs to be things which don't change interface and are consistent
between different machines.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ad95405..c0c2930 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -18,3 +18,4 @@ PATH := "${PATH}:${COREBASE}/scripts"
 
 QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
 
+SIGGEN_EXCLUDERECIPES_ABISAFE = "sysvinit-inittab shadow-securetty opkg-config-base netbase formfactor xserver-xf86-config pointercal base-files"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5a64882..7b80c18 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -1,6 +1,6 @@
 import bb.siggen
 
-def sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache):
+def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Return True if we should keep the dependency, False to drop it
     def isNative(x):
         return x.endswith("-native")
@@ -30,7 +30,7 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-files']:
+    if depname in siggen.abisaferecipes:
         return False
 
     # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
@@ -50,16 +50,18 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache):
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
+        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
-        return sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache)
+        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
 class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"
     def init_rundepcheck(self, data):
+        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
-        return sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache)
+        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic




