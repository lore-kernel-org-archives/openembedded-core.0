Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbR3i-0001MT-UN
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 07:42:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2011 22:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21334389"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2011 22:38:20 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	paul.eggleton@linux.intel.com
Date: Tue, 28 Jun 2011 13:37:38 +0800
Message-Id: <674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1309239001.git.dexuan.cui@intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309239001.git.dexuan.cui@intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 05:42:03 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/base.bbclass |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..4766c77 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -165,9 +165,21 @@ python base_eventhandler() {
 			note(msg)
 
 	if name.startswith("BuildStarted"):
+		corebase = data.getVar("COREBASE", e.data, 1)
+		corelayers = [corebase + "/meta", corebase + "/meta-yocto"]
+		layers = (data.getVar("BBLAYERS", e.data, 1) or "").split()
+		layers = [i for i in layers if i not in corelayers]
+		fmt_str = "%-27s = \"%s\""
+		layer_branches = [fmt_str % (os.path.basename(i)+"_BRANCH", \
+			base_get_metadata_git_branch(i, None).strip()) for i in layers]
+		layer_revisions = [fmt_str % (os.path.basename(i)+"_REVISION", \
+			base_get_metadata_git_revision(i, None)) for i in layers]
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
 		statusvars = ['BB_VERSION', 'METADATA_BRANCH', 'METADATA_REVISION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
-		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
+		statuslines = [fmt_str % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
+		for i in range(len(layer_branches)):
+			statuslines.insert(3+2*i, layer_branches[i])
+			statuslines.insert(3+2*i+1, layer_revisions[i])
 		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
 		print statusmsg
 
-- 
1.7.4.1



