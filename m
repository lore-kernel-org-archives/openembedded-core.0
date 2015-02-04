Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 1743C6E6C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id C0DB137E1BC;
	Wed,  4 Feb 2015 11:53:21 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  4 Feb 2015 11:53:07 +0100
Message-Id: <1423047187-8369-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] wic: bail out on kickstart parse errors
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
X-List-Received-Date: Wed, 04 Feb 2015 10:53:22 -0000

Kickstart file errors are not emitted by the parser. In case errors, the
current code will continue to execute possibly creating a faulty or
incomplete image. The patch enables the parser to emit all encountered
errors. The error message is shown for the user and further execution is
ceased.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/kickstart/__init__.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 600098293aeff5a1f7756ba20381b8d054c10fd1..b1406a04575906f7d5822139eef5a4a2753040fc 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -58,16 +58,13 @@ def read_kickstart(path):
         def __init__(self):
             superclass.__init__(self, mapping=commandMap[using_version])
 
-    ks = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=False)
+    ks = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=True)
 
     try:
         ks.readKickstart(path)
     except (kserrors.KickstartParseError, kserrors.KickstartError), err:
-        if msger.ask("Errors occured on kickstart file, skip and continue?"):
-            msger.warning("%s" % err)
-            pass
-        else:
-            raise errors.KsError("%s" % err)
+        msger.warning("Errors occurred when parsing kickstart file: %s\n" % path)
+        msger.error("%s" % err)
 
     return ks
 
-- 
1.9.3


