Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4480C65CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037610"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:53 +1200
Message-Id: <a5363ea00cd2b15229f5893dd4a611090a917651.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:34 -0000

cmake outputs percentage complete as part of its compilation process, so
we can enable BitBake's new progress scanning for do_compile here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/cmake.bbclass                        | 1 +
 meta/recipes-devtools/cmake/cmake-native_3.5.2.bb | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index e788310..b18152a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -124,6 +124,7 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+do_compile[progress] = "percent"
 cmake_do_compile()  {
 	cd ${B}
 	base_do_compile VERBOSE=1
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
index cb4e749..33930fb 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.5.2.bb
@@ -14,3 +14,5 @@ CMAKE_EXTRACONF = "\
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
+
+do_compile[progress] = "percent"
-- 
2.5.5


