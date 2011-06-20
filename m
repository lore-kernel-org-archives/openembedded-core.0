Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QYb1v-0000gi-5F
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 11:44:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jun 2011 02:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,392,1304319600"; d="scan'208";a="18328030"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2011 02:39:49 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 17:51:47 +0800
Message-Id: <1a4991408c32c951f842688548dd1b5f9b36b890.1308563041.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1308563041.git.lei.mei@intel.com>
References: <cover.1308563041.git.lei.mei@intel.com>
In-Reply-To: <cover.1308563041.git.lei.mei@intel.com>
References: <cover.1308563041.git.lei.mei@intel.com>
Subject: [PATCH 1/1] distrodata.bbclass: Get the extend recipe's information from non bbextended recipe
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
X-List-Received-Date: Mon, 20 Jun 2011 09:44:27 -0000

This patch will check whether the recipe is an extened recipe, if yes, some informaiton couldn't be got, so collect those information(like maintainer information or lastcheckversion) from non bbextended recipe.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/distrodata.bbclass |   46 ++++++++++++++++++++++++++++-----------
 1 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index f24cff8..e91200d 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -215,6 +215,7 @@ python checkpkg_eventhandler() {
 addtask checkpkg
 do_checkpkg[nostamp] = "1"
 python do_checkpkg() {
+	localdata = bb.data.createCopy(d)
 	import sys
 	import re
 	import tempfile
@@ -435,18 +436,38 @@ python do_checkpkg() {
 
 	"""generate package information from .bb file"""
 	pname = bb.data.getVar('PN', d, True)
-	pdesc = bb.data.getVar('DESCRIPTION', d, True)
-	pgrp = bb.data.getVar('SECTION', d, True)
-	pversion = bb.data.getVar('PV', d, True)
-	plicense = bb.data.getVar('LICENSE', d, True)
-	psection = bb.data.getVar('SECTION', d, True)
-	phome = bb.data.getVar('HOMEPAGE', d, True)
-	prelease = bb.data.getVar('PR', d, True)
-	ppriority = bb.data.getVar('PRIORITY', d, True)
-	pdepends = bb.data.getVar('DEPENDS', d, True)
-	pbugtracker = bb.data.getVar('BUGTRACKER', d, True)
-	ppe = bb.data.getVar('PE', d, True)
-	psrcuri = bb.data.getVar('SRC_URI', d, True)
+
+	if pname.find("-native") != -1:
+	    pnstripped = pname.split("-native")
+	    bb.note("Native Split: %s" % pnstripped)
+	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
+	    bb.data.update_data(localdata)
+
+	if pname.find("-cross") != -1:
+	    pnstripped = pname.split("-cross")
+	    bb.note("cross Split: %s" % pnstripped)
+	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
+	    bb.data.update_data(localdata)
+
+	if pname.find("-initial") != -1:
+	    pnstripped = pname.split("-initial")
+	    bb.note("initial Split: %s" % pnstripped)
+	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
+	    bb.data.update_data(localdata)
+
+	pdesc = bb.data.getVar('DESCRIPTION', localdata, True)
+	pgrp = bb.data.getVar('SECTION', localdata, True)
+	pversion = bb.data.getVar('PV', localdata, True)
+	plicense = bb.data.getVar('LICENSE', localdata, True)
+	psection = bb.data.getVar('SECTION', localdata, True)
+	phome = bb.data.getVar('HOMEPAGE', localdata, True)
+	prelease = bb.data.getVar('PR', localdata, True)
+	ppriority = bb.data.getVar('PRIORITY', localdata, True)
+	pdepends = bb.data.getVar('DEPENDS', localdata, True)
+	pbugtracker = bb.data.getVar('BUGTRACKER', localdata, True)
+	ppe = bb.data.getVar('PE', localdata, True)
+	psrcuri = bb.data.getVar('SRC_URI', localdata, True)
+	maintainer = bb.data.getVar('RECIPE_MAINTAINER', localdata, True)
 
 	found = 0
 	for uri in src_uri.split():
@@ -616,7 +637,6 @@ python do_checkpkg() {
 		else:
 			pmstatus = "UPDATE"
 	
-	maintainer = bb.data.getVar('RECIPE_MAINTAINER', d, True)
 	psrcuri = psrcuri.split()[0]
 	pdepends = "".join(pdepends.split("\t"))
 	pdesc = "".join(pdesc.split("\t"))
-- 
1.6.3.3



