Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C83B781EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 00:27:23 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v5so1085198pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FcsiOdcNMn+yM5gV0ZRWbC/2oPH+BxPuhPCBcILdmtY=;
	b=Iw4ryXpSILuZjzRwdgX2UiYgV0SFIeh+EBgIqnvWjJcM88CxuPKLyfKKg4UzgRVxlZ
	wqz2RitesTxtEr1LfNnp3yp66g+in6F5X6wbZVR3/pLA+ciCitCFQsed8hOz5AiW7b0w
	WCX3sicLjs8aAIgEqVw8XsdLeSVQgaeJNlk8LU+JYY8Co389hCLAZydavNGBDme37YqQ
	An8h42NWyjwqM0KgtwhR20F6rDfp72sMb2D7c5FuBELS+eNpu3GhFASUNcVjKtmaAp7o
	QmB+o05sHjDcVzMAfTyEBg6jeKcN7j8XHlPrJ3PDSihnBjFTOou9DGwv8KJQY2iMwA2N
	OviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FcsiOdcNMn+yM5gV0ZRWbC/2oPH+BxPuhPCBcILdmtY=;
	b=ajnyfnIWxrq2h9hEeeXCzEVsJswU/9yxQBTdA1d9+n/Ia0lZdTtIdI3aYjP9RnU67A
	Ve1cLwBy/F8X13Q8Re/k86x56TKzoFcgkkEIGNmYj2BgWz1qEcl1nl+6inZoXKN6aeCu
	mrlVyuBqKZzafwtLLhE0JKdzcNqPAtZU8DtMAc6c5eRhgT+kPdDfNoJQKTiS3ZyGFujc
	Fa0a2Jr0DRVGUGmNaYEHTd7iMlj5sI17396RJVXpZdNT8DswmK5E+keCjQkGTwFBogum
	sg7SKXnGG16PZ5yB/ebbPDvNdZzZ+hfrMQ3w4ZAbaWpjATNYrma7g7iIiQ1tOmqjLuok
	BdgQ==
X-Gm-Message-State: AHPjjUidM5hPYYJNDWmevxlzIhJwZv7THAorHFBlppl/rK4fxwMXp2Y5
	16cjVyyhDlnqOcOZ
X-Google-Smtp-Source: AOwi7QCytQonEcS/E0PZsP2rhFh3XHTWlzYb/vHDGpkMPcpQT6QxPy/FHhrw+C7wDNdkD+avN6CVaQ==
X-Received: by 10.99.185.86 with SMTP id v22mr352104pgo.236.1505780845228;
	Mon, 18 Sep 2017 17:27:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::a20b])
	by smtp.gmail.com with ESMTPSA id c7sm858487pfg.85.2017.09.18.17.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 17:27:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 17:27:16 -0700
Message-Id: <20170919002716.44275-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] nspr: Fix build with musl/mips
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
X-List-Received-Date: Tue, 19 Sep 2017 00:27:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nspr/nspr/0001-md-Fix-build-with-musl.patch    | 31 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.16.bb             |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..f3cd670026
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
@@ -0,0 +1,31 @@
+From 147f3c2acbd96d44025cec11800ded0282327764 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Sep 2017 17:22:43 -0700
+Subject: [PATCH] md: Fix build with musl
+
+The MIPS specific header <sgidefs.h> is not provided by musl
+linux kernel headers provide <asm/sgidefs.h> which has same definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/include/md/_linux.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 640b19c..31296a8 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -499,7 +499,7 @@
+ #elif defined(__mips__)
+ 
+ /* For _ABI64 */
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ 
+ #ifdef __MIPSEB__
+ #define IS_BIG_ENDIAN 1
+-- 
+2.14.1
+
diff --git a/meta/recipes-support/nspr/nspr_4.16.bb b/meta/recipes-support/nspr/nspr_4.16.bb
index a634afbf75..bb178fe712 100644
--- a/meta/recipes-support/nspr/nspr_4.16.bb
+++ b/meta/recipes-support/nspr/nspr_4.16.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch \
+           file://0001-md-Fix-build-with-musl.patch \
            file://nspr.pc.in \
 "
 
-- 
2.14.1


