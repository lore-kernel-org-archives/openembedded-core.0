Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKf-0008Vd-7t
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:26:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 08:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; 
   d="scan'208";a="3779457"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 08:21:24 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:38 +0800
Message-Id: <a59303a5b3249096635224817a6b20c828277132.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 6/7] package_rpm: fix strip_multilib function
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
X-List-Received-Date: Wed, 03 Aug 2011 15:26:05 -0000

The previous logic could only strip MLPREFIX from the first element in
an array, take an example, strip_multilib the [lib32-a lib32-b lib32-c]
will result in [a lib32-b lib32-c]. This commit change it to strip all
elements' multilib prefix.

CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9d0eeba..a29ce9d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -326,7 +326,7 @@ python write_specfile () {
 		for ext in multilibs.split():
 			eext = ext.split(':')
 			if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') == 0:
-				name = (eext[1] + '-').join(name.split(eext[1] + '-', 1)[1:])
+				name = " ".join(name.split(eext[1] + '-')[1:])
 		return name
 
 #		ml = bb.data.getVar("MLPREFIX", d, True)
@@ -720,7 +720,7 @@ python do_package_rpm () {
 	def strip_multilib(name, d):
 		ml = bb.data.getVar("MLPREFIX", d, True)
 		if ml and name and len(ml) != 0 and name.find(ml) == 0:
-			return ml.join(name.split(ml, 1)[1:])
+			return " ".join(name.split(ml)[1:])
 		return name
 
 	workdir = bb.data.getVar('WORKDIR', d, True)
-- 
1.7.1



