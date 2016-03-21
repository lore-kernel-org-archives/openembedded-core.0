Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 79C4F6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:11:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2016 22:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="915344782"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2016 22:11:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:10:57 +1300
Message-Id: <772c57eb4c5ee3ca33665bae17b895eafb77b9ec.1458537025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] classes/packagegroup: drop complementary -ptest if ptest not in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2016 05:11:36 -0000

If ptest isn't in DISTRO_FEATURES, there won't be any -ptest packages
and thus no need for the -ptest package for the packagegroup either.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packagegroup.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 92e0bbe..d56248f 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -27,8 +27,11 @@ python () {
     if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) != '1':
         # Add complementary packagegroups
         genpackages = []
+        complementary_types = ['-dbg', '-dev']
+        if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+            complementary_types.append('-ptest')
         for pkg in packages:
-            for postfix in ['-dbg', '-dev', '-ptest']:
+            for postfix in complementary_types:
                 genpackages.append(pkg+postfix)
                 d.setVar("ALLOW_EMPTY_%s" % pkg+postfix, "1")
         d.setVar('PACKAGES', ' '.join(packages+genpackages))
-- 
2.5.5


