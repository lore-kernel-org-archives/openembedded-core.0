Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 72464710C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:41:23 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so21578180pab.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cKBXFMQZz54SHkopz+XaOEuuq05MrRtzSUha2XmQ0Uw=;
	b=rKTUxURFhRn19Iulpln0ivixNR3IH3uRGyv5DhBiI0+lPYo80PAZVGCR1b4tmQHf4g
	LpRSqCKD0gBkZ2zvfQ92uGJGUfsercjTXDsq1OqJxUXehpt798zgXd7v6DdIY4ZAnw+U
	hLcySwZdkJVTZ1dokydSy2pOXicWdZdqinYmKELmgWqeuyl08zb7mYecB76/cc+xMDCv
	RVsy7jwPo4kPPkR/YuN1cYXyyW6dyY7FtLBl8Lzj4vuuE1w97kL9alc11OW9OljbS3Gw
	UEau1t8ie0vUYkLeTBA/xL4qgx1VIrBMkFYyqFG9rVg4qYdty+RzSoVqVsorPL4GzUPt
	QJXA==
X-Received: by 10.68.220.105 with SMTP id pv9mr32863251pbc.8.1409010084723;
	Mon, 25 Aug 2014 16:41:24 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id r2sm1615785pdj.29.2014.08.25.16.41.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:41:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:45:04 -0700
Message-Id: <694d38c4d34ea4b77d542228b0b08526cbec6abb.1409010172.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
References: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
In-Reply-To: <cover.1409010172.git.raj.khem@gmail.com>
References: <cover.1409010172.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] systemd: Support building on uclibc
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
X-List-Received-Date: Mon, 25 Aug 2014 23:41:23 -0000

include missing.h to get MAX_HANDLE_SZ which
is not defined in uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Including-missing.h-to-get-MAX_HANDLE_SZ.patch |   29 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_213.bb           |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch b/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
new file mode 100644
index 0000000..ba4a21b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
@@ -0,0 +1,29 @@
+From 764ecbeda4813f33eafd45fdc3ccb9376356f475 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Aug 2014 15:40:31 -0700
+Subject: [PATCH] util: Including missing.h to get MAX_HANDLE_SZ
+
+Helps compiling on uclibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: [Backport]
+---
+ src/shared/util.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/util.h b/src/shared/util.h
+index 62eb604..036fc59 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -84,6 +84,7 @@
+ #endif
+ 
+ #include "macro.h"
++#include "missing.h"
+ #include "time-util.h"
+ 
+ /* What is interpreted as whitespace? */
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index ccdc10b..472a5d5 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
+           file://0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.7.10.4


