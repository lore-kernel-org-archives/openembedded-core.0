Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqmdQ-0007K7-9t for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 15:46:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79Dfp64013854
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 14:41:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13359-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 14:41:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79DfiDG013848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 14:41:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Aug 2011 14:41:10 +0100
Message-ID: <1312897271.14274.293.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base.bbclass: Add MULTI_PROVIDER_WHITELIST manipulation for multilib
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
X-List-Received-Date: Tue, 09 Aug 2011 13:46:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids errors about multiple providers being built for a given target.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e686652..4332d24 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -184,6 +184,20 @@ def preferred_ml_updates(d):
             if not d.getVar(newname, False):
                 d.setVar(newname, p + "-" + val)
 
+
+    mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
+    extramp = []
+    for p in mp:
+        if p.endswith("-native") or p.endswith("-nativesdk"):
+            continue
+        virt = ""
+        if p.startswith("virtual/"):
+            p = p.replace("virtual/", "")
+            virt = "virtual/"
+        for pref in prefixes:
+            extramp.append(virt + pref + "-" + p)
+    d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
+
 addhandler base_eventhandler
 python base_eventhandler() {
 	from bb import note, error, data



