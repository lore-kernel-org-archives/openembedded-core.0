Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E71F60234
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 17:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455sQV1Gvkz5w
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 19:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558200098;
	bh=IzjbrhXSQl90yoTRKUED/HMuR4F2fjgJx17H/KWV+8g=;
	h=From:To:Subject:Date:From;
	b=eZtQKg4UdiMfHXg1sZ/aKRWGo87n+8SVuk2L5kJcB+FE85v/5BCnCiYdH3wY/clFG
	3yBT04yYRRXOHzwXrSCFPqElZu7od92+bu8kisP8UJSdeV3q4IEuBPp79X86rpT8iB
	npKcu80nfziiCUYV2N+naARYn4f0a3BBoe8krMnQVAP1JbVW8EBwAe5KG6aEAVUig+
	+1L24OA8ErkVHuutp+D6IWTqc6gA62KtfeB1SWVB5miN8wVockSv1zWEJH5zKHtHHo
	+hIZZ1X6AeMp9kdL8DGamgc2hW8N3vTiM65uAvTn+CX3/cWf054+HtXZvlRkc1V1Wr
	q22b4Z7HWnf+H1BF0064s7JKxwVwUFknrI9MlYXhwQSTnL61+a03qRUpd4AznhE4Va
	vJNYHJoZ4OcR1rYKeanMwRm7l1H+mOWGV/ki42L6d8jVvG24k2Uz4a8UI6WC/e5zzN
	iDv2n7kO+C5SODCRuqdYJMRbaXqXQb+pkVFQCh2v3gVJsrbdDhvSiX8g8lNSBGZP1V
	qcwBcSGfJbat/H5Dc7NT6E3kSY6sfQWFBTi6pG8LuVrXQ3FMyT+jgd7na87Wdh89t4
	fbYG4NTCxtUI7T+BlEzZANu/PEsUAHLhlbkx9GeJAjRP8N25uXX1ufP4zA/heHdoCO
	DoV5NZbhMCOPZGbghql9RdBQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 20:21:36 +0300
Message-Id: <20190518172136.11368-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] nss-myhostname: Stop trying to build for musl
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
X-List-Received-Date: Sat, 18 May 2019 17:21:38 -0000

There's no point in building an NSS module for a C library
that doesn't support NSS.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-Check-for-nss.h-presense-before-use.patch | 53 -------------------
 .../nss-myhostname/nss-myhostname_0.3.bb      |  3 +-
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
deleted file mode 100644
index 82f25743af..0000000000
--- a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Jan 2016 20:29:06 +0000
-Subject: [PATCH] nss-myhostname: Check for nss.h presense before use
-
-We do not have nss.h on musl e.g. and configury is already checking for
-nss.h presence, use this to define needed data structures if nss.h is
-missing on a given libc implementation on a platform
-
-include stdint.h for uint32_h definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- nss-myhostname.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/nss-myhostname.c b/nss-myhostname.c
-index 293166c..6f287f5 100644
---- a/nss-myhostname.c
-+++ b/nss-myhostname.c
-@@ -21,7 +21,27 @@
- ***/
- 
- #include <limits.h>
-+#include <stdint.h>
-+#ifdef HAVE_NSS_H
- #include <nss.h>
-+#else
-+enum nss_status {
-+    NSS_STATUS_TRYAGAIN = -2,
-+    NSS_STATUS_UNAVAIL,
-+    NSS_STATUS_NOTFOUND,
-+    NSS_STATUS_SUCCESS,
-+    NSS_STATUS_RETURN
-+};
-+/* Data structure used for the 'gethostbyname4_r' function.  */
-+struct gaih_addrtuple
-+  {
-+    struct gaih_addrtuple *next;
-+    char *name;
-+    int family;
-+    uint32_t addr[4];
-+    uint32_t scopeid;
-+  };
-+#endif
- #include <sys/types.h>
- #include <netdb.h>
- #include <errno.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index de5b7cf598..244d9e204e 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -7,7 +7,6 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
-           file://0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch \
            "
 
 SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
@@ -15,6 +14,8 @@ SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67
 
 inherit autotools distro_features_check
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 # The systemd has its own copy of nss-myhostname
 CONFLICT_DISTRO_FEATURES = "systemd"
 
-- 
2.17.1


