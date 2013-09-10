Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DDBA86C021
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:28:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 10:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="393703682"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.204])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2013 10:28:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 10:28:15 -0700
Message-Id: <1378834095-8523-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1378834095-8523-1-git-send-email-sgw@linux.intel.com>
References: <1378834095-8523-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] cmake.bbclass: ensure CMAKE_SYSTEM_NAME is correct
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
X-List-Received-Date: Tue, 10 Sep 2013 17:28:15 -0000

Using TARGET_OS can add the ABIEXTENSION so ensure that is is removed for the Linux
TARGET_OS, we might have other TARGET_OSes so don't hard code CMAKE_SYSTEM_NAME

[YOCTO #5145]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 1e72371..30c1792 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -35,7 +35,7 @@ cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
-set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed 's/^./\u&/'` )
+set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
 set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
-- 
1.8.3.1


