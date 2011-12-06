Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RXrAf-0003Hy-G5
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 10:18:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2011 01:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83931009"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2011 01:11:53 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 17:09:52 +0800
Message-Id: <2fba54d2f6ada2272efaf8cd50b137bb7d2eaf26.1323162150.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1323162150.git.lei.mei@intel.com>
References: <cover.1323162150.git.lei.mei@intel.com>
In-Reply-To: <cover.1323162150.git.lei.mei@intel.com>
References: <cover.1323162150.git.lei.mei@intel.com>
Subject: [PATCH 1/1] distrodata.bbclass:Fix some recipes upstream version check issue.
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
X-List-Received-Date: Tue, 06 Dec 2011 09:18:41 -0000

Some recipes,like rt-tests,clutter-box2d,iproute2,didn't declare upstream protocal, but in distrodata.bbclass, we use rsync as the default protocal,
this will lead an error when checking upstream version.
Change default protocal from rsync to git in distrodata.bbclass.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/distrodata.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 0c0b549..ff5b836 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -562,7 +562,7 @@ python do_checkpkg() {
 		if 'protocol' in parm:
 			gitproto = parm['protocol']
 		else:
-			gitproto = "rsync"
+			gitproto = "git"
 		gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
 		gitcmd2 = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
 		tmp = os.popen(gitcmd).read()
-- 
1.7.0.4



