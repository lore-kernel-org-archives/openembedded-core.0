Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TjXaz-0000sF-Er for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:54:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEFe4GP013093
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:40:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11710-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:39:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEFdvGP013083
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:39:58 GMT
Message-ID: <1355499596.32519.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 15:39:56 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Improve stamp-extra-info task handling to avoid warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:54:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you change a machine to a different package architecture, you will see sstate
errors about overwriting files as the code stands today. Instead it should clean
out the files safely and correctly. This patch changes the naming of stamp-extra-info
manifest files to avoid this problem. It will potentially trigger warnings during
builds in existing TMPDIRs until the system adjusts to the new naming, these are
harmless.

[YOCTO #3521]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d3daf1c..94be3ce 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -124,10 +124,12 @@ def sstate_install(ss, d):
     sharedfiles = []
     shareddirs = []
     bb.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
-    manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+
+    d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
-        manifest = manifest + "." + extrainf
+        d2.setVar("SSTATE_MANMACH", extrainf)
+    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
 
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
@@ -315,10 +317,12 @@ def sstate_clean_manifest(manifest, d):
 def sstate_clean(ss, d):
     import oe.path
 
-    manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
-        manifest = manifest + "." + extrainf
+        d2.setVar("SSTATE_MANMACH", extrainf)
+    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    bb.error(str(manifest))
 
     if os.path.exists(manifest):
         locks = []




