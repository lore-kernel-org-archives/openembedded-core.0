Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qm5B7-0007dU-9q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:33:41 +0200
Received: by rex (Postfix, from userid 1000)
	id 285DE20C71; Wed, 27 Jul 2011 15:29:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:29:12 +0100
Message-Id: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Wed, 27 Jul 2011 14:33:41 -0000

This means if PKGARCHCOMPAT_ARMV7A is set, "armv7a-vfp-neon" is renamed
to be "armv7a". Other compatibility mappings can be added as needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f12b3cb..3ed1bb8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,6 +133,13 @@ def generate_git_config(e):
                 f.write(proxy_command)
                 f.close
 
+def pkgarch_mapping(d):
+    # Compatibility mappings of TUNE_PKGARCH (opt in)
+    if d.getVar("PKGARCHCOMPAT_ARMV7A", True):
+        if d.getVar("TUNE_PKGARCH", True) == "armv7a-vfp-neon":
+            d.setVar("TUNE_PKGARCH", "armv7a")
+
+
 addhandler base_eventhandler
 python base_eventhandler() {
 	from bb import note, error, data
@@ -203,6 +210,7 @@ python base_eventhandler() {
 
         if name == "ConfigParsed":
                 generate_git_config(e)
+                pkgarch_mapping(e.data)
 
 	if not data in e.__dict__:
 		return
-- 
1.7.4.1



