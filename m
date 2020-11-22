Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web11.19155.1606049356222242960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 04:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AMCnD6R008682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2020 13:49:14 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.1.247])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0AMCnDSa029070;
	Sun, 22 Nov 2020 13:49:13 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 323B86D18C0;
	Sun, 22 Nov 2020 13:49:13 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Pascal Bach <pascal.bach@siemens.com>,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH 1/2] bitbake.conf: Split optimization into common part
Date: Sun, 22 Nov 2020 13:48:52 +0100
Message-Id: <20201122124853.30262-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

This option allows correctly handle the release/debug flags separation in
upper recipe like cmake.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d38eac094..5555093e24 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -569,7 +569,7 @@ TARGET_CPPFLAGS = ""
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 export CFLAGS = "${TARGET_CFLAGS}"
-TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
 BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
@@ -616,8 +616,9 @@ DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTEND
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
-FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
+COMMON_OPTIMIZATION = "${DEBUG_FLAGS} -pipe"
+FULL_OPTIMIZATION = "-O2"
+DEBUG_OPTIMIZATION = "-Og"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
-- 
2.11.0

