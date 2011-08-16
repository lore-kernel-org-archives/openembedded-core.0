Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QtFA1-0001iN-Jt
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:38:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2011 01:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,379,1309762800"; d="scan'208";a="39965898"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2011 01:33:29 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 16:33:45 +0800
Message-Id: <9681e293f27b5661114728d455c06023fa619a1e.1313482889.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313482889.git.dongxiao.xu@intel.com>
References: <cover.1313482889.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313482889.git.dongxiao.xu@intel.com>
References: <cover.1313482889.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/4] package_rpm: enhance strip_multilib function
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
X-List-Received-Date: Tue, 16 Aug 2011 08:38:13 -0000

The previous logic could only strip MLPREFIX from the first element in
an array, take an example, strip_multilib the [lib32-a lib32-b lib32-c]
will result in [a lib32-b lib32-c]. We need to strip prefix one by one.

This commit change the logic to strip all elements' multilib prefix.

[YOCTO #1368]

CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b15786d..7a0c6da 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -357,8 +357,8 @@ python write_specfile () {
 		multilibs = d.getVar('MULTILIBS', True) or ""
 		for ext in multilibs.split():
 			eext = ext.split(':')
-			if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') == 0:
-				name = (eext[1] + '-').join(name.split(eext[1] + '-', 1)[1:])
+			if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') >= 0:
+				name = "".join(name.split(eext[1] + '-'))
 		return name
 
 #		ml = bb.data.getVar("MLPREFIX", d, True)
@@ -755,8 +755,8 @@ python do_package_rpm () {
 	# and dependency information...
 	def strip_multilib(name, d):
 		ml = bb.data.getVar("MLPREFIX", d, True)
-		if ml and name and len(ml) != 0 and name.find(ml) == 0:
-			return ml.join(name.split(ml, 1)[1:])
+		if ml and name and len(ml) != 0 and name.find(ml) >= 0:
+			return "".join(name.split(ml))
 		return name
 
 	workdir = bb.data.getVar('WORKDIR', d, True)
-- 
1.7.1



