Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA83E6D251
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 09:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="455560895"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.128])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2014 09:23:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 17:22:59 +0000
Message-Id: <481527bbbd687df5456916b5279546d02731f7e2.1389201662.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389201662.git.paul.eggleton@linux.intel.com>
References: <cover.1389201662.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389201662.git.paul.eggleton@linux.intel.com>
References: <cover.1389201662.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/2] cmake: set system name correctly
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
X-List-Received-Date: Wed, 08 Jan 2014 17:23:03 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

For unknown reasons, the cmake class is using SDK_OS as the
target system OS. This makes no sense but only shows up as a problem
when you try a different SDK OS. Fix it to use TARGET_OS which is
the correct thing to do. For the vast majority of users this will
make no difference.

(From OE-Core master rev: 57be84259f0885865c85d7bac350979430b956b5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index e64c30c..4ef9fca 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -35,7 +35,7 @@ cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
-set( CMAKE_SYSTEM_NAME `echo ${SDK_OS} | sed 's/^./\u&/'` )
+set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed 's/^./\u&/'` )
 set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
-- 
1.8.1.2


