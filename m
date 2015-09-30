Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 66EA876F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDnnMM007175 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zytl4RYtNMTQ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDo0Yu007189
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:11 +0100
Message-ID: <1443621000.5162.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:50:00 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/sstate: Add task_resolved handler for virtual/xxx mappings
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
X-List-Received-Date: Wed, 30 Sep 2015 13:50:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In SIGGEN_EXCLUDERECIPES_ABISAFE and SIGGEN_EXCLUDE_SAFE_RECIPE_DEP
we really need to be able to use virtual/xxx namespaces but this
currently doesn't work.

To make this work, we need to translate them into the resolved
providers. After such a hook was added to bitbake, we can add
this translation here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index cba0a84..fa41145 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -94,6 +94,28 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.machine = data.getVar("MACHINE", True)
         self.mismatch_msgs = []
         pass
+
+    def tasks_resolved(self, virtmap, virtpnmap, dataCache):
+        # Translate virtual/xxx entries to PN values
+        newabisafe = []
+        for a in self.abisaferecipes:
+            if a in virtpnmap:
+                newabisafe.append(virtpnmap[a])
+            else:
+                newabisafe.append(a)
+        self.abisaferecipes = newabisafe
+        newsafedeps = []
+        for a in self.saferecipedeps:
+            a1, a2 = a.split("->")
+            if a1 in virtpnmap:
+                a1 = virtpnmap[a1]
+            if a2 in virtpnmap:
+                a2 = virtpnmap[a2]
+            newsafedeps.append(a1 + "->" + a2)
+        self.saferecipedeps = newsafedeps
+        bb.warn(str(self.abisaferecipes))
+        bb.warn(str(self.saferecipedeps))
+
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 



