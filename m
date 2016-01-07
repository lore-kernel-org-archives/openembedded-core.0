Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45AD073183
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 14:42:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f206so99921794wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8HRf2cvXSEDqvyRrTcX4dDXNyh7cPohtik8zI9Mt48w=;
	b=faJkIKBQGIPHGsF927xdui373+DCCDNEuaNS7w1I2MJmA8EqUUAquGfMHbm+l3hy9d
	1ViTSDvnNoun8uqf3VdWK8whyWTJyPTpSE9e9L5KSpV75FKesvEnqhgyAZ2u33mXpc4F
	TlO0QN5NAHaE/NSlZY7tRZPgZT1OV4x4Vyi/EG0pCs5ZSprStN7TmuE14cj8pdgDIEBM
	H6GTUURIrBeDTf3pdUV+TixzTBfkq/OUpsyaRcnxZP1Ev48dofYxH4mVyOFn///mrYVm
	CdKz1aqLY1lEIrIiKpD2/GHp8v9PA3EA3W4zthLF91mBazGef/K7g/krOP+X74L00xTW
	KVUA==
X-Received: by 10.194.120.134 with SMTP id lc6mr132229880wjb.130.1452177742186;
	Thu, 07 Jan 2016 06:42:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh6sm101435702wjb.0.2016.01.07.06.42.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 06:42:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 15:42:44 +0100
Message-Id: <1452177764-9314-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] libbsd: upgrade to 0.8.1
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
X-List-Received-Date: Thu, 07 Jan 2016 14:42:22 -0000

* fixes building lldpd from meta-networking, more information in:
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=807730
  http://cgit.freedesktop.org/libbsd/commit/?id=48ac79b1883981f5135b5b9c76ca268e6cbe65b2
* update LIC_FILES_CHKSUM and LICENSE according to:
  http://cgit.freedesktop.org/libbsd/commit/?id=6bcb1312f4691b92d0193e4a923a776dc6f233df
  http://cgit.freedesktop.org/libbsd/commit/?id=290a1ce8f262a7f30a77c0a89eaa28876de876ed
  be aware that it doesn't list all LICENSEs, only those where
  common license text already exists (feel free to add additional
  texts).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libbsd/0001-Use-local-SHA512-header.patch      | 75 ----------------------
 .../libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb}    | 35 +++++++---
 2 files changed, 27 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb} (37%)

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
similarity index 37%
rename from meta/recipes-support/libbsd/libbsd_0.8.0.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.1.bb
index 3456968..45420d5 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.1.bb
@@ -8,17 +8,36 @@ DESCRIPTION = "This library provides useful functions commonly found on BSD syst
                code over and over again on each project."
 
 HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
-LICENSE = "BSD-4-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b99a70657f41053dc4b49d0ae73f7a78"
+# There seems to be more licenses used in the code, I don't think we want to list them all here, complete list:
+# OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort
+# License: BSD-2-clause
+# License: BSD-2-clause
+# License: BSD-2-clause-NetBSD
+# License: BSD-2-clause-author
+# License: BSD-2-clause-verbatim
+# License: BSD-3-clause
+# License: BSD-3-clause
+# License: BSD-3-clause
+# License: BSD-3-clause-Peter-Wemm
+# License: BSD-3-clause-Regents
+# License: BSD-4-clause-Christopher-G-Demetriou
+# License: BSD-4-clause-Niels-Provos
+# License: BSD-5-clause-Peter-Wemm
+# License: Beerware
+# License: Expat
+# License: ISC
+# License: ISC-Original
+# License: public-domain
+# License: public-domain-Colin-Plumb
+LICENSE = "BSD-4-Clause & ISC & PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=145ec05a217d8f879f29cfc5f83084be"
 SECTION = "libs"
-DEPENDS = ""
 
 SRC_URI = " \
-	http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-	file://0001-Use-local-SHA512-header.patch \
-	"
+    http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+"
 
-SRC_URI[md5sum] = "262bdd1aa3bee6066a8c9cb49bb6c584"
-SRC_URI[sha256sum] = "fbb732084bd960e4c78b688aac875be98e290cc6fe462b2ff8ee946a6473e38c"
+SRC_URI[md5sum] = "f3daff0283af6e30f25d68be2deac4ef"
+SRC_URI[sha256sum] = "adbc8781ad720bce939b689f38a9f0247732a36792147a7c28027c393c2af9b0"
 
 inherit autotools pkgconfig
-- 
2.7.0


