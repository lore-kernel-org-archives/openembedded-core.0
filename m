Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrK-0004fO-2p
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752230"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:48 -0800
Message-Id: <05a5f6036d4c7ab6ff35be2ecb9c868e4666776a.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 062/113] meta/classes/base.bbclass: base.bbclass should check for multiple (or) licenses in bb files
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:32 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

base.bbclass modified in order to check if there is an "or" operand, and if it is,
should check further if there are other non-excluded licenses.

[YOCTO #1844]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/base.bbclass |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e65a722..4ac809a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -401,8 +401,21 @@ python () {
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
1.7.6.4



