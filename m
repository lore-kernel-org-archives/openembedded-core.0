Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RgDD3-00048o-UB
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 11:27:43 +0100
Received: by vbbfc21 with SMTP id fc21so10348019vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:20:27 -0800 (PST)
Received: by 10.52.24.35 with SMTP id r3mr16012325vdf.81.1325154027306;
	Thu, 29 Dec 2011 02:20:27 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id ic3sm23101707vdb.6.2011.12.29.02.20.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 02:20:26 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 12:20:15 +0200
Message-Id: <1325154015-3328-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] meta/classes/base.bbclass: base.bbclass should check for multiple (or) licenses in bb files
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
X-List-Received-Date: Thu, 29 Dec 2011 10:27:43 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

base.bbclass modified in order to check if there is an "or" operand, and if it is,
should check further if there are other non-excluded licenses.

[YOCTO #1844]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/base.bbclass |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fbcaefb..1010b5a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -402,8 +402,21 @@ python () {
                 import re
                 this_license = d.getVar('LICENSE', 1)
                 if this_license and re.search(dont_want_license, this_license):
-                    bb.note("SKIPPING %s because it's %s" % (pn, this_license))
-                    raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
+		    this_license_no_spaces = re.sub(r'\s', '', this_license)
+		    licenses = re.split('[|]', this_license_no_spaces)
+		    if len(licenses) != 0:
+			good_license=""
+		        for onelicense in licenses:
+			    if not re.search(dont_want_license, onelicense):
+				good_license = onelicense
+			if good_license == "":
+			    bb.note("SKIPPING %s because it's %s" % (pn, this_license))
+			    raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
+			else:
+			    bb.note("NOT SKIPPING %s because it's %s which contains %s" % (pn, this_license, good_license))
+		    else:
+			bb.note("SKIPPING %s because it's %s" % (pn, this_license))
+			raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
     srcuri = d.getVar('SRC_URI', 1)
     # Svn packages should DEPEND on subversion-native
-- 
1.7.5.4



