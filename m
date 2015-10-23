Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7962F77054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 634C7180F2;
	Fri, 23 Oct 2015 12:38:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RQu+5YPLjWBH; Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 92C571810C;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7B041128;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 6D93F121;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 6B8E53404E;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9NAcVd6005181;
	Fri, 23 Oct 2015 12:38:31 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9NAcVA5005180;
	Fri, 23 Oct 2015 12:38:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 12:38:18 +0200
Message-Id: <b1fb2b65b6ffde36ca2d6e8f24874ff7004de038.1445596115.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445596115.git.pkj@axis.com>
References: <cover.1445596115.git.pkj@axis.com>
In-Reply-To: <cover.1445596115.git.pkj@axis.com>
References: <cover.1445596115.git.pkj@axis.com>
Subject: [PATCH 1/1] useradd-staticids.bbclass: Do not require trailing colons
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
X-List-Received-Date: Fri, 23 Oct 2015 10:38:33 -0000

Before, the users and groups specified in the passwd file and the
groups file had to have trailing colons to make sure there were enough
elements in the definitions, or bitbake would thow a Python exception.
After this change one can omit the trailing colons, which especially
simplifies passwd files used only to specify static UIDs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 421a70a..aa1b15b 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -84,7 +84,11 @@ def update_useradd_static_config(d):
                     for line in f:
                         if line.startswith('#'):
                             continue
-                        field = line.rstrip().split(":")
+                        # Make sure there always are at least seven elements in
+                        # the field list. This allows for leaving out trailing
+                        # colons in the passwd file.
+                        line = line.rstrip() + "::::::"
+                        field = line.split(":")
                         if field[0] == uaargs.LOGIN:
                             if uaargs.uid and field[2] and (uaargs.uid != field[2]):
                                 bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
@@ -220,7 +224,11 @@ def update_useradd_static_config(d):
                     for line in f:
                         if line.startswith('#'):
                             continue
-                        field = line.rstrip().split(":")
+                        # Make sure there always are at least four elements in
+                        # the field list. This allows for leaving out trailing
+                        # colons in the group file.
+                        line = line.rstrip() + ":::"
+                        field = line.split(":")
                         if field[0] == gaargs.GROUP and field[2]:
                             if gaargs.gid and (gaargs.gid != field[2]):
                                 bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
-- 
2.1.0


