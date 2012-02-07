Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ruo8Z-00019X-99
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:43:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 08:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104162871"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by azsmga001.ch.intel.com with ESMTP; 07 Feb 2012 08:25:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:25:00 +0000
Message-Id: <fce0db04f4b95798f3bdf6c925f1707faf14f2ed.1328631790.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1328631790.git.paul.eggleton@linux.intel.com>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1328631790.git.paul.eggleton@linux.intel.com>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/buildhistory: sort list fields in package info
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
X-List-Received-Date: Tue, 07 Feb 2012 16:43:23 -0000

Sort DEPENDS, PACKAGES, RDEPENDS, and RRECOMMENDS in package info files
so that any changes in order (which are not important) are smoothed out
in the change history.

Fixes [YOCTO #1961]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3964247..26d1a91 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -126,17 +126,28 @@ python buildhistory_emit_pkghistory() {
 	def squashspaces(string):
 		return re.sub("\s+", " ", string)
 
+	def sortpkglist(string):
+		pkgiter = re.finditer(r'[a-zA-Z0-9.-]+( \([><=]+ [^ )]+\))?', pkgs, 0)
+		pkglist = [p.group(0) for p in pkgiter]
+		pkglist.sort()
+		return ' '.join(pkglist)
+
+	def sortlist(string):
+		items = string.split(' ')
+		items.sort()
+		return ' '.join(items)
+
 	pn = d.getVar('PN', True)
 	pe = d.getVar('PE', True) or "0"
 	pv = d.getVar('PV', True)
 	pr = d.getVar('PR', True)
-	packages = squashspaces(d.getVar('PACKAGES', True))
+	packages = sortlist(squashspaces(d.getVar('PACKAGES', True)))
 
 	rcpinfo = RecipeInfo(pn)
 	rcpinfo.pe = pe
 	rcpinfo.pv = pv
 	rcpinfo.pr = pr
-	rcpinfo.depends = squashspaces(d.getVar('DEPENDS', True) or "")
+	rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
 	rcpinfo.packages = packages
 	write_recipehistory(rcpinfo, d)
 	write_latestlink(None, pe, pv, pr, d)
@@ -164,8 +175,8 @@ python buildhistory_emit_pkghistory() {
 		pkginfo.pe = pe
 		pkginfo.pv = pv
 		pkginfo.pr = pr
-		pkginfo.rdepends = squashspaces(getpkgvar(pkg, 'RDEPENDS') or "")
-		pkginfo.rrecommends = squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or "")
+		pkginfo.rdepends = sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
+		pkginfo.rrecommends = sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
 		pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
 
 		# Gather information about packaged files
-- 
1.7.5.4



