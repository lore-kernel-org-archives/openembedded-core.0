Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18JrDbaeEVqRQhkv5WiEqCICaIvHdKOAoQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmagX-0008Ao-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 02:12:13 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6T07ws2031422
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 19:07:58 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 19:07:57 -0500
Message-Id: <1311898077-13062-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] sanity.bbclass: Add sanity check that TUNE_PKGARCH appears in PACKAGE_ARCHS
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
X-List-Received-Date: Fri, 29 Jul 2011 00:12:13 -0000

Its possible we get duplications if we explicity add TUNE_PKGARCH to
PACKAGE_ARCHS so instead just add a sanity check to verify it.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/sanity.bbclass |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b054146..999e15d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -375,8 +375,10 @@ def check_sanity(e):
     elif oeroot.find (' ') != -1:
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
-    # Check that we don't have duplicate entries in PACKAGE_ARCHS
+    # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
     pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
+    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
+    tunefound = False
     seen = {}
     dups = []
 
@@ -385,9 +387,15 @@ def check_sanity(e):
 	    dups.append(pa)
 	else:
 	    seen[pa] = 1
+	if pa == tunepkg:
+	    tunefound = True
+
     if len(dups):
        messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
 
+    if tunefound == False:
+       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+
     if messages != "":
         raise_sanity_error(messages)
 
-- 
1.7.3.4



