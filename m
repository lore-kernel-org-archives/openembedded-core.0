Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 28B17769A7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 09:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 308272E77A;
	Sat, 24 Oct 2015 11:50:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 57WjVb1Kyzu2; Sat, 24 Oct 2015 11:50:47 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id BD76D2E76C;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A5342161;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9875B160;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 94B23340B3;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9O9okVs016315;
	Sat, 24 Oct 2015 11:50:46 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9O9okUT016314;
	Sat, 24 Oct 2015 11:50:46 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2015 11:50:17 +0200
Message-Id: <af0600e67e141cfa53a796602b98e740192f859e.1445679443.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445679443.git.pkj@axis.com>
References: <cover.1445679443.git.pkj@axis.com>
In-Reply-To: <cover.1445679443.git.pkj@axis.com>
References: <cover.1445679443.git.pkj@axis.com>
Cc: Christopher Larson <clarson@kergoth.com>
Subject: [PATCHv2 1/1] useradd-staticids.bbclass: Do not require trailing colons
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
X-List-Received-Date: Sat, 24 Oct 2015 09:50:50 -0000

Before, the users and groups specified in the passwd file and the
groups file had to have trailing colons to make sure there were enough
elements in the definitions, or bitbake would throw a Python
exception.  After this change one can omit the trailing colons, which
especially simplifies passwd files used only to specify static UIDs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 421a70a..924d6ea 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -2,6 +2,7 @@
 # we need a function to reformat the params based on a static file
 def update_useradd_static_config(d):
     import argparse
+    import itertools
     import re
 
     class myArgumentParser( argparse.ArgumentParser ):
@@ -16,6 +17,11 @@ def update_useradd_static_config(d):
         def error(self, message):
             raise bb.build.FuncFailed(message)
 
+    def list_extend(iterable, length, obj = None):
+        """Ensure that iterable is the specified length by extending with obj
+        and return it as a list"""
+        return list(itertools.islice(itertools.chain(iterable, itertools.repeat(obj)), length))
+
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
         # The following comes from --help on useradd from shadow
@@ -84,7 +90,10 @@ def update_useradd_static_config(d):
                     for line in f:
                         if line.startswith('#'):
                             continue
-                        field = line.rstrip().split(":")
+                        # Make sure there always are at least seven elements in
+                        # the field list. This allows for leaving out trailing
+                        # colons in the passwd file.
+                        field = list_extend(line.rstrip().split(":"), 7)
                         if field[0] == uaargs.LOGIN:
                             if uaargs.uid and field[2] and (uaargs.uid != field[2]):
                                 bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
@@ -220,7 +229,10 @@ def update_useradd_static_config(d):
                     for line in f:
                         if line.startswith('#'):
                             continue
-                        field = line.rstrip().split(":")
+                        # Make sure there always are at least four elements in
+                        # the field list. This allows for leaving out trailing
+                        # colons in the group file.
+                        field = list_extend(line.rstrip().split(":"), 4)
                         if field[0] == gaargs.GROUP and field[2]:
                             if gaargs.gid and (gaargs.gid != field[2]):
                                 bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
-- 
2.1.0


