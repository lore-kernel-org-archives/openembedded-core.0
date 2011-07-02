Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qd25t-0002za-DH
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 17:26:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jul 2011 08:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,463,1304319600"; d="scan'208";a="23080538"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jul 2011 08:23:05 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jul 2011 23:23:01 +0800
Message-Id: <36ae4730622d317f089534e9a586dae600d9aa54.1309619979.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1309619979.git.dexuan.cui@intel.com>
References: <cover.1309619979.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309619979.git.dexuan.cui@intel.com>
References: <cover.1309619979.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1][v3]base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Sat, 02 Jul 2011 15:26:53 -0000

The patch removes METADATA_BRANCH and METADATA_REVISION, and treats the meta/
in the same way as other layers.
In the case some layers belonging to the same repo, the branch and revision
are only printed once, but all the layer names are still printed.

An example output can be:

OE Build Configuration:
BB_VERSION        = "1.13.1"
TARGET_ARCH       = "i586"
TARGET_OS         = "linux"
MACHINE           = "emenlow"
DISTRO            = "poky"
DISTRO_VERSION    = "1.0+snapshot-20110702"
TARGET_FPU        = ""
meta
meta-yocto        = "dcui/banner_v3:4b712dba68a98c827b8f3d0242da9153c4f65473"
meta-emenlow
meta-sugarbay
meta-n450         = "dcui/test1:76d1178ba1a43cf6457c89717134aeb9f1275fae"

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/base.bbclass |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..87fdb74 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -166,8 +166,29 @@ python base_eventhandler() {
 
 	if name.startswith("BuildStarted"):
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
-		statusvars = ['BB_VERSION', 'METADATA_BRANCH', 'METADATA_REVISION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
+		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
 		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
+
+		layers = (data.getVar("BBLAYERS", e.data, 1) or "").split()
+		layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
+			base_get_metadata_git_branch(i, None).strip(), \
+			base_get_metadata_git_revision(i, None)) \
+				for i in layers]
+		i = len(layers_branch_rev)-1
+		p1 = layers_branch_rev[i].find("=")
+		s1= layers_branch_rev[i][p1:]
+		while i > 0:
+			p2 = layers_branch_rev[i-1].find("=")
+			s2= layers_branch_rev[i-1][p2:]
+			if s1 == s2:
+				layers_branch_rev[i-1] = layers_branch_rev[i-1][0:p2]
+				i -= 1
+			else:
+				i -= 1
+				p1 = layers_branch_rev[i].find("=")
+				s1= layers_branch_rev[i][p1:]
+
+		statuslines += layers_branch_rev
 		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
 		print statusmsg
 
-- 
1.7.6



