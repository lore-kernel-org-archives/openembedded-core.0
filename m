Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TjXZY-0000iU-Ft for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:53:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEFcabD013069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:38:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11710-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:38:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEFcRCf013063
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:38:28 GMT
Message-ID: <1355499507.32519.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 15:38:27 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Simplify overcomlicated cleanall function
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
X-List-Received-Date: Fri, 14 Dec 2012 15:53:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The code was written before SSTATETASKNAMES existed. Since it
does exist, lets simply the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ec2c123..29f6b1c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -346,27 +346,18 @@ def sstate_clean(ss, d):
 CLEANFUNCS += "sstate_cleanall"
 
 python sstate_cleanall() {
-    import fnmatch
-
     bb.note("Removing shared state for package %s" % d.getVar('PN', True))
 
     manifest_dir = d.getVar('SSTATE_MANIFESTS', True)
-    manifest_prefix = d.getVar("SSTATE_MANFILEPREFIX", True)
-    manifest_pattern = os.path.basename(manifest_prefix) + ".*"
-
     if not os.path.exists(manifest_dir):
         return
 
-    for manifest in (os.listdir(manifest_dir)):
-        if fnmatch.fnmatch(manifest, manifest_pattern):
-            name = manifest.replace(manifest_pattern[:-1], "")
-            namemap = d.getVar('SSTATETASKNAMES', True).split()
-            tasks = d.getVar('SSTATETASKS', True).split()
-            if name not in namemap:
-                continue
-            taskname = tasks[namemap.index(name)]
-            shared_state = sstate_state_fromvars(d, taskname[3:])
-            sstate_clean(shared_state, d)
+    namemap = d.getVar('SSTATETASKNAMES', True).split()
+    tasks = d.getVar('SSTATETASKS', True).split()
+    for name in namemap:
+        taskname = tasks[namemap.index(name)]
+        shared_state = sstate_state_fromvars(d, taskname[3:])
+        sstate_clean(shared_state, d)
 }
 
 def sstate_hardcode_path(d):




