Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 98AEB76F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDosJJ007362 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HHAppNeF2Rq0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDognX007307
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:50:53 +0100
Message-ID: <1443621042.5162.88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:50:42 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] multilib_global: Add handling of SIGGEN variables for multilib
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
X-List-Received-Date: Wed, 30 Sep 2015 13:50:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

multilib task signatures turned out to have issues since
SIGGEN_EXCLUDERECIPES_ABISAFE and SIGGEN_EXCLUDE_SAFE_RECIPE_DEP
did not have multilib mappings. This adds those mappings in which
in turn improves multilib task checksums to match the standard
non-mulitlib versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 612cfb6..67dc72b 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -93,20 +93,38 @@ def preferred_ml_updates(d):
         if prov != provexp and d.getVar(prov, False):
             d.renameVar(prov, provexp)
 
+    def translate_provide(prefix, prov):
+        if not prov.startswith("virtual/"):
+            return prefix + "-" + prov
+        if prov == "virtual/kernel":
+            return prov
+        prov = prov.replace("virtual/", "")
+        return "virtual/" + prefix + "-" + prov
 
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
         if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
             continue
-        virt = ""
-        if p.startswith("virtual/"):
-            p = p.replace("virtual/", "")
-            virt = "virtual/"
         for pref in prefixes:
-            extramp.append(virt + pref + "-" + p)
+            extramp.append(translate_provide(pref, p))
     d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
 
+    abisafe = (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
+    extras = []
+    for p in prefixes:
+        for a in abisafe:
+            extras.append(p + "-" + a)
+    d.appendVar("SIGGEN_EXCLUDERECIPES_ABISAFE", " " + " ".join(extras))
+
+    siggen_exclude = (d.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+    extras = []
+    for p in prefixes:
+        for a in siggen_exclude:
+            a1, a2 = a.split("->")
+            extras.append(translate_provide(p, a1) + "->" + translate_provide(p, a2))
+    d.appendVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", " " + " ".join(extras))
+
 python multilib_virtclass_handler_vendor () {
     if isinstance(e, bb.event.ConfigParsed):
         for v in e.data.getVar("MULTILIB_VARIANTS", True).split():



