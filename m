Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkC-0004rp-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109850974"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:11 +0000
Message-Id: <015c5eb8f18fbe93b5d3551b824ef9961d87fb51.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] classes/buildhistory: squash spaces out of image variables
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
X-List-Received-Date: Tue, 14 Feb 2012 13:48:32 -0000

Values of image variables that are lists (e.g. IMAGE_INSTALL) are easier
to read if there are no extraneous spaces in them, so ensure that there
is only one space between each item.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1b6b249..d1a9670 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -123,9 +123,6 @@ python buildhistory_emit_pkghistory() {
 		except EnvironmentError:
 			return None
 
-	def squashspaces(string):
-		return re.sub("\s+", " ", string)
-
 	def sortpkglist(string):
 		pkgiter = re.finditer(r'[a-zA-Z0-9.-]+( \([><=]+ [^ )]+\))?', string, 0)
 		pkglist = [p.group(0) for p in pkgiter]
@@ -349,12 +346,23 @@ def buildhistory_get_layers(d):
 	return layertext
 
 
+def squashspaces(string):
+	import re
+	return re.sub("\s+", " ", string).strip()
+
+
 def buildhistory_get_imagevars(d):
 	imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
+	listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS"
 
+	imagevars = imagevars.split()
+	listvars = listvars.split()
 	ret = ""
-	for var in imagevars.split():
+	for var in imagevars:
 		value = d.getVar(var, True) or ""
+		if var in listvars:
+			# Squash out spaces
+			value = squashspaces(value)
 		ret += "%s = %s\n" % (var, value)
 	return ret.rstrip('\n')
 
-- 
1.7.5.4



