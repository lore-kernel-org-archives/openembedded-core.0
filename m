Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8307FFF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:10 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701758"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:54 +0800
Message-Id: <71124dd7258e6cc2d95be6781c9476be27c79264.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 6/9] nss: Backport clang build fix
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:09 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 35bbb1deb4ddab3861dce7ca2ada778094fb353e)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ppc64-inline-assembler-for-clang-r-j.patch | 35 +++++++++++++++++++
 meta/recipes-support/nss/nss_3.45.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
new file mode 100644
index 0000000000..59e44e6841
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
@@ -0,0 +1,35 @@
+From 6b351dbb049b3b3ab6c0d51aa3c1c7fb3c9df80c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
+Date: Mon, 22 Jul 2019 11:07:41 -0700
+Subject: [PATCH] Bug 1493916 - Fix ppc64 inline assembler for clang r=jcj
+ Seems clang's inline assembler doesn't want registers to be prefixed with
+ "r", while gcc accepts both - r0 and 0 for GPR0.
+
+tested with clang 6.0 and gcc 8.1
+
+--HG--
+extra : amend_source : 87e09bb59c78bdb25b9573b9f29511e10b9db6fa
+extra : histedit_source : 9b3fad70ac2851bf7de14d42c34db4a5fba41710
+
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/671d89b6c4a6f41707bb044534751098e2e3f211]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nss/lib/freebl/mpi/mpcpucache.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/mpi/mpcpucache.c b/nss/lib/freebl/mpi/mpcpucache.c
+index 336b4cc..2ad291f 100644
+--- a/nss/lib/freebl/mpi/mpcpucache.c
++++ b/nss/lib/freebl/mpi/mpcpucache.c
+@@ -727,7 +727,7 @@ static inline void
+ dcbzl(char *array)
+ {
+     register char *a asm("r2") = array;
+-    __asm__ __volatile__("dcbzl %0,r0"
++    __asm__ __volatile__("dcbzl %0,0"
+                          : "=r"(a)
+                          : "0"(a));
+ }
+-- 
+2.24.0
+
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.45.bb
index e89e7d69d5..c8005a5b3a 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.45.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
+           file://0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch \
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
-- 
2.21.0


