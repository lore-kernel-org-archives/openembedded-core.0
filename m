Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73CD67DECF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:57:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4E3vIDV018221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:57:19 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 20:57:17 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2019 23:57:12 -0400
Message-ID: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/5] valgrind: fix vg_regtest return code
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
X-List-Received-Date: Tue, 14 May 2019 03:57:18 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...rn-a-valid-exit_code-from-vg_regtest.patch | 27 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
new file mode 100644
index 0000000000..e7af5efecc
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
@@ -0,0 +1,27 @@
+From 5eebdefd2251803e7d21081745018fcb16b2ba71 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Wed, 8 May 2019 20:16:52 -0400
+Subject: [PATCH] Return a valid exit_code from vg_regtest
+
+Upstream-Status: Pending
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ tests/vg_regtest.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
+index 909af3be8..f2799c4e3 100755
+--- a/tests/vg_regtest.in
++++ b/tests/vg_regtest.in
+@@ -403,6 +403,7 @@ sub mysystem($)
+             exit 1;
+         }
+     }
++    return $exit_code;
+ }
+ # if $keepunfiltered, copies $1 to $1.unfiltered.out
+ # renames $0 tp $1
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 3159f32230..9749fdb244 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
+           file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.17.0


