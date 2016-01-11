Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10FEE731F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JWeW019664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:26 -0800
Message-ID: <b1d2e001bac3a8fb36f650fba5472ef918f68e07.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] libbsd: 0.8.0 -> 0.8.1
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:32 -0000
Content-Type: text/plain

* Remove 0001-Use-local-SHA512-header.patch which is already in the source.
* Update LIC_FILES_CHKSUM, the licenses are the same, it uses "Debian
  copyright machine readable format 1.0" now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libbsd/0001-Use-local-SHA512-header.patch      |   75 --------------------
 .../libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb}    |    7 +-
 2 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb} (73%)

diff --git a/meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch b/meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
deleted file mode 100644
index af47b2b..0000000
--- a/meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 8493c7f27da2dcd2de71e9c7782c3d020d89c2a2 Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@hadrons.org>
-Date: Tue, 1 Dec 2015 03:39:10 +0100
-Subject: [PATCH] Use local SHA512 header
-
-Actually use the local private SHA512 header instead of relying on the
-OpenSSL one for no good reason. Add definition for expected macro
-SHA512_DIGEST_LENGTH.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport
----
- src/getentropy_aix.c   | 2 +-
- src/getentropy_hpux.c  | 3 ++-
- src/getentropy_linux.c | 3 ++-
- src/hash/sha512.h      | 2 ++
- 4 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/getentropy_aix.c b/src/getentropy_aix.c
-index cbd4037..d4ccab7 100644
---- a/src/getentropy_aix.c
-+++ b/src/getentropy_aix.c
-@@ -39,7 +39,7 @@
- #include <string.h>
- #include <termios.h>
- 
--#include <openssl/sha.h>
-+#include "hash/sha512.h"
- 
- #include <libperfstat.h>
- 
-diff --git a/src/getentropy_hpux.c b/src/getentropy_hpux.c
-index 45ac84b..294d83a 100644
---- a/src/getentropy_hpux.c
-+++ b/src/getentropy_hpux.c
-@@ -41,7 +41,8 @@
- #include <errno.h>
- #include <unistd.h>
- #include <time.h>
--#include <openssl/sha.h>
-+
-+#include "hash/sha512.h"
- 
- #include <sys/vfs.h>
- 
-diff --git a/src/getentropy_linux.c b/src/getentropy_linux.c
-index 0a5d6b8..d7a8ae5 100644
---- a/src/getentropy_linux.c
-+++ b/src/getentropy_linux.c
-@@ -47,7 +47,8 @@
- #include <errno.h>
- #include <unistd.h>
- #include <time.h>
--#include <openssl/sha.h>
-+
-+#include "hash/sha512.h"
- 
- #include <linux/types.h>
- #include <linux/random.h>
-diff --git a/src/hash/sha512.h b/src/hash/sha512.h
-index 43c5aaf..4f368a1 100644
---- a/src/hash/sha512.h
-+++ b/src/hash/sha512.h
-@@ -31,6 +31,8 @@
- 
- #include <sys/types.h>
- 
-+#define SHA512_DIGEST_LENGTH		64
-+
- typedef struct SHA512Context {
- 	uint64_t state[8];
- 	uint64_t count[2];
--- 
-2.6.2
-
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.0.bb b/meta/recipes-support/libbsd/libbsd_0.8.1.bb
similarity index 73%
rename from meta/recipes-support/libbsd/libbsd_0.8.0.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.1.bb
index 3456968..effd5df 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.1.bb
@@ -9,16 +9,15 @@ DESCRIPTION = "This library provides useful functions commonly found on BSD syst
 
 HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 LICENSE = "BSD-4-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b99a70657f41053dc4b49d0ae73f7a78"
+LIC_FILES_CHKSUM = "file://COPYING;md5=145ec05a217d8f879f29cfc5f83084be"
 SECTION = "libs"
 DEPENDS = ""
 
 SRC_URI = " \
 	http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-	file://0001-Use-local-SHA512-header.patch \
 	"
 
-SRC_URI[md5sum] = "262bdd1aa3bee6066a8c9cb49bb6c584"
-SRC_URI[sha256sum] = "fbb732084bd960e4c78b688aac875be98e290cc6fe462b2ff8ee946a6473e38c"
+SRC_URI[md5sum] = "f3daff0283af6e30f25d68be2deac4ef"
+SRC_URI[sha256sum] = "adbc8781ad720bce939b689f38a9f0247732a36792147a7c28027c393c2af9b0"
 
 inherit autotools pkgconfig
-- 
1.7.9.5


