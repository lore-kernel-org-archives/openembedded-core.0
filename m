Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF71784DF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 22:36:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBAMaisQ021265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 10 Dec 2017 22:36:45 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eOADE-0005X3-Ri; Sun, 10 Dec 2017 22:36:44 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Dec 2017 22:36:41 +0000
Message-Id: <1512945401-21217-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512945401-21217-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1512945401-21217-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] multilib_global: Handle PREFERRED_RPROVIDER
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
X-List-Received-Date: Sun, 10 Dec 2017 22:36:46 -0000

Running:

$ oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs

after commit cdcebd81c872cb7386c658998e27cf24e1d0447c results in:

NOTE: Resolving any missing task queue dependencies
NOTE: Multiple providers are available for runtime lib32-initd-functions (lib32-initscripts, lib32-lsbinitscripts)
Consider defining a PREFERRED_RPROVIDER entry to match lib32-initd-functions

and will occasionally pick a different value on the second stamps run
causing a test failure. Update the multilib code to handle
PREFERRED_RPROVIDER too.

There is a bigger worry here which is why the builds aren't deterministic. This is
caused by a bug in bitbake's providers.py and a separate fix will be sent for that
which would cause this test to always pass or always fail.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_global.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index fd0bfe1..0b41a8a 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -13,11 +13,14 @@ def preferred_ml_updates(d):
 
     versions = []
     providers = []
+    rproviders = []
     for v in d.keys():
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
         if v.startswith("PREFERRED_PROVIDER_"):
             providers.append(v)
+        if v.startswith("PREFERRED_RPROVIDER_"):
+            rproviders.append(v)
 
     for v in versions:
         val = d.getVar(v, False)
@@ -91,6 +94,29 @@ def preferred_ml_updates(d):
         if prov != provexp and d.getVar(prov, False):
             d.renameVar(prov, provexp)
 
+    for prov in rproviders:
+        val = d.getVar(prov, False)
+        pkg = prov.replace("PREFERRED_RPROVIDER_", "")
+        for p in prefixes:
+            newval = p + "-" + val
+
+            # implement variable keys
+            localdata = bb.data.createCopy(d)
+            override = ":virtclass-multilib-" + p
+            localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+            newname = localdata.expand(prov)
+            if newname != prov and not d.getVar(newname, False):
+                d.setVar(newname, localdata.expand(newval))
+
+            # implement alternative multilib name
+            newname = localdata.expand("PREFERRED_RPROVIDER_" + p + "-" + pkg)
+            if not d.getVar(newname, False) and newval != None:
+                d.setVar(newname, localdata.expand(newval))
+        # Avoid future variable key expansion
+        provexp = d.expand(prov)
+        if prov != provexp and d.getVar(prov, False):
+            d.renameVar(prov, provexp)
+
     def translate_provide(prefix, prov):
         if not prov.startswith("virtual/"):
             return prefix + "-" + prov
-- 
2.7.4


