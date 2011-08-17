Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf5-0004F2-2h
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163413"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:29 -0700
Message-Id: <ca729de4b261e4feba74fdf0b2578890bc80ea90.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/27] package_rpm: enhance strip_multilib function
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:35 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



