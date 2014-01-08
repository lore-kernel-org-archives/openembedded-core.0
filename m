Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8BC96D24B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:23:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 09:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="455560908"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.128])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2014 09:23:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 17:23:00 +0000
Message-Id: <d5afbc6d29c28e77fdfb98bff9d099806460a160.1389201662.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389201662.git.paul.eggleton@linux.intel.com>
References: <cover.1389201662.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389201662.git.paul.eggleton@linux.intel.com>
References: <cover.1389201662.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 2/2] cmake.bbclass: ensure CMAKE_SYSTEM_NAME is correct
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

From: Saul Wold <sgw@linux.intel.com>

Using TARGET_OS can add the ABIEXTENSION so ensure that is is removed for the Linux
TARGET_OS, we might have other TARGET_OSes so don't hard code CMAKE_SYSTEM_NAME

[YOCTO #5145]

(From OE-Core master rev: 7d8b700242b1b32c6b6d0735b497701800f54fc4)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 4ef9fca..5144cdf 100644
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
1.8.1.2


