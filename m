Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 947BA6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:12:17 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9A8CIWC016369
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 10:12:18 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.5.162])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9A8CHmJ006014;
	Wed, 10 Oct 2018 10:12:18 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C42C910037C0;
	Wed, 10 Oct 2018 10:12:17 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 10:10:34 +0200
Message-Id: <20181010081035.10735-3-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181010081035.10735-1-pascal.bach@siemens.com>
References: <20181010081035.10735-1-pascal.bach@siemens.com>
Subject: [PATCHv3 3/4] cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
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
X-List-Received-Date: Wed, 10 Oct 2018 08:12:18 -0000

The setting influences the build like other settings already in toolchain.cmake.
It is more appropriate to set it there instead of providing it as a random
command line parameter to CMake.

It also makes it easier to use the toolchain.cmake file independent of bitbake.
Like the devshell for example.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ce3c0278ff..0ef63795eb 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -108,6 +108,9 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
 
+# avoid treating imports as system includes
+set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON)
+
 EOF
 }
 
@@ -152,7 +155,6 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_VERBOSE_MAKEFILE=1 \
-	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
 }
-- 
2.11.0


