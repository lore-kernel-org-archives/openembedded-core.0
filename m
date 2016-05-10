Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 075B173175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:25:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145787"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:25:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:19 +1200
Message-Id: <b73eccca0833557388edf44ce68bffca048b5454.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 5/6] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Tue, 10 May 2016 23:25:06 -0000

cmake outputs percentage complete as part of its compilation process, so
we can enable BitBake's new progress scanning for do_compile here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/cmake.bbclass                        | 1 +
 meta/recipes-devtools/cmake/cmake-native_3.4.3.bb | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 02f313a..f06600f 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -124,6 +124,7 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+do_compile[progress] = "percent"
 cmake_do_compile()  {
 	cd ${B}
 	base_do_compile
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
index cb4e749..33930fb 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
@@ -14,3 +14,5 @@ CMAKE_EXTRACONF = "\
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
+
+do_compile[progress] = "percent"
-- 
2.5.5


