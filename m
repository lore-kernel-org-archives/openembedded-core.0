Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBB27846E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7DA4418595
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id s_lXDfaei0lu
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6D44E18594
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5978F1A07C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D9721A07B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 419F72308
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:28:39 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v81GScrq013910
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Sep 2017 18:28:38 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v81GSc61013909
	for openembedded-core@lists.openembedded.org;
	Fri, 1 Sep 2017 18:28:38 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 18:28:36 +0200
Message-Id: <20170901162836.13868-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] package_deb.bbclass: Handle colons in dependencies
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
X-List-Received-Date: Fri, 01 Sep 2017 16:28:41 -0000

Perl dependencies may look as "Perl(Foo::Bar)", but dpkg does not
support the non-alphanumeric characters. There was already special
handling present for turning '(' and ')' into '__'. This change does
the same for ':'.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package_deb.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index c5824aab97..83baa6c21b 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -192,8 +192,8 @@ def deb_write_pkg(pkg, d):
         mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
-            # dpkg does not allow for '(' or ')' in a dependency name
-            # replace these instances with '__' and '__'
+            # dpkg does not allow for '(', ')' or ':' in a dependency name
+            # Replace any instances of them with '__'
             #
             # In debian '>' and '<' do not mean what it appears they mean
             #   '<' = less or equal
@@ -202,8 +202,7 @@ def deb_write_pkg(pkg, d):
             #
             for dep in var:
                 if '(' in dep:
-                    newdep = dep.replace('(', '__')
-                    newdep = newdep.replace(')', '__')
+                    newdep = re.sub(r'[(:)]', '__', dep)
                     if newdep != dep:
                         var[newdep] = var[dep]
                         del var[dep]
-- 
2.12.0


