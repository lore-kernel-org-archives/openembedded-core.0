Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 676257319C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730798"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:06:58 +1200
Message-Id: <506ececdce893c5b3d930faba0c808f797d8dc79.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 02/10] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:37 -0000

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


