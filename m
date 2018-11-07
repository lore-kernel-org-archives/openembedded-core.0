Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A927A7553F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 18:00:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA7HxYIE005527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 09:59:44 -0800
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 7 Nov 2018 09:59:23 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Nov 2018 12:59:22 -0500
Message-ID: <20181107175922.6631-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: drop mips n32 support
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
X-List-Received-Date: Wed, 07 Nov 2018 18:00:13 -0000
Content-Type: text/plain

valgrind for qemumips64 multilib builds fails to configure
for libn32 with the error:
   configure:6190: checking for 32 bit build support
   ...
   fatal error: bits/long-double-32.h: No such file or directory
It seems that the toolchain is producing:
   tmp-glibc/sysroots-components/mips64-n32/libn32-glibc/usr/include/bits/long-double-n32.h

Until the toolchain problem is resolved, skip valgrind for libn32.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 4ec1f9284f..33d9c09a66 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -63,6 +63,7 @@ VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
 VALGRIND_riscv64 = ""
 VALGRIND_linux-gnux32 = ""
+VALGRIND_linux-gnun32 = ""
 
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 7f0a93f6f8..97e58a446a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -54,6 +54,7 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
 
 # Disable for some MIPS variants
 COMPATIBLE_HOST_mipsarchr6 = 'null'
+COMPATIBLE_HOST_linux-gnun32 = 'null'
 
 inherit autotools ptest multilib_header
 
-- 
2.17.0


