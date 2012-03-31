Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKK-0005iQ-Rc
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Mar 2012 23:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="135924199"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2012 23:53:15 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:23 +0800
Message-Id: <1daecbca1597bad1486b92f939a87344af8d13e7.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
References: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
Subject: [PATCH 3/5] autotools.bbclass: Drop -nativesdk dependency to lib-cross.
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:21 -0000

-nativesdk recipes should not have dependency to lib-cross, which is
never used. This unnecessary dependency would result different task hash
values in sstate for different MACHINE settings.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/autotools.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 66eba9f..941c06d 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -12,6 +12,7 @@ def autotools_dep_prepend(d):
 	if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
 		deps += 'libtool-native '
 		if not bb.data.inherits_class('native', d) \
+                        and not bb.data.inherits_class('nativesdk', d) \
                         and not bb.data.inherits_class('cross', d) \
                         and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
                     deps += 'libtool-cross '
-- 
1.7.0.4



