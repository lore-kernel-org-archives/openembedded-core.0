Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B560B61EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:40:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41EebMR002504 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:40:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 77ib5zN91BwX
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:40:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41Ee2nY002474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:40:03 +0100
Message-ID: <1398955196.30460.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 15:39:56 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Silence PREFERRED_PROVIDER warnings for sdk builds
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
X-List-Received-Date: Thu, 01 May 2014 14:40:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately expandKeys() notices overlap between the SDK and TARGET
PREFERRED_PROVIDERS entries when we set things up for the SDK recipes.

To avoid this, delete one of the sets of keys to avoid supurious warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1c40043..5c2d6a2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -284,7 +284,7 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise"
 python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
@@ -312,6 +312,18 @@ python base_eventhandler() {
 
         statusheader = e.data.getVar('BUILDCFG_HEADER', True)
         bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
+
+    # This code is to silence warnings where the SDK variables overwrite the 
+    # target ones and we'd see dulpicate key names overwriting each other
+    # for various PREFERRED_PROVIDERS
+    if isinstance(e, bb.event.RecipePreFinalise):
+        if e.data.getVar("TARGET_PREFIX", True) == e.data.getVar("SDK_PREFIX", True):
+            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
+            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial")
+            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
+            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
+            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
+
 }
 
 addtask configure after do_patch



