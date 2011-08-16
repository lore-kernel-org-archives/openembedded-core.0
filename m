Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QtFA6-0001iQ-0d
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:38:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2011 01:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38827080"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 01:33:32 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 16:33:47 +0800
Message-Id: <ededef6a572c333931233d5ca9459158dd465f8c.1313482889.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313482889.git.dongxiao.xu@intel.com>
References: <cover.1313482889.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313482889.git.dongxiao.xu@intel.com>
References: <cover.1313482889.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/4] gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS
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
X-List-Received-Date: Tue, 16 Aug 2011 08:38:14 -0000

When dynamically setting RDEPENDS, we need to add MLPREFIX to adapt
multilib case.

[YOCTO #1368]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 3bfb8ff..d0840d5 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -38,7 +38,7 @@ python populate_packages_append () {
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
 		rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
-		rdepends += " hicolor-icon-theme"
+		rdepends = rdepends + ' ' + bb.data.getVar('MLPREFIX', d) + "hicolor-icon-theme"
 		bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-- 
1.7.1



