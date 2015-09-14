Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 95B55762B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:34 +0000 (UTC)
Received: by qgt47 with SMTP id 47so119397842qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WVbQ+8Q4znnrq72qQaswQEA3X2z7+OntRchvathPwwA=;
	b=xa8XMxuxRKA8paIkm4/tpER1DvHcZhHb2RwRP/yglGzoWTTIkM3o2ulx28MFbbdP70
	WY/Uok4VqzeCiAiMwxoHtABkzRgBQnQ4Go710EIz8ZvO0DlwYyoQ1FmjxGMvnFhVVLpY
	a8S4uZjgvkqmNElO+1YRVWP02ERIVjKwBiHQR/++e0MyLmbx+IvvTl6IIgQeS2lA3SIj
	vTr6yRryfgqCzlBPIX1ZOOk8qbYjQM1o4UKzSoL8ryCiOEW+r7505MJ0g5YtcIXWgSGQ
	H0ttvJAfrvkPhZedyPurAlE8zSgrZJQ/t6j6bXaooS86eb+SF6ZW0t5+sKczcE0BJ4Nr
	3Yng==
X-Received: by 10.140.27.130 with SMTP id 2mr23493848qgx.72.1442248295270;
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:23 +0000
Message-Id: <cb95f9267480e927c5c0d9d9f598f4673b332c30.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 08/12] opkg: Include stdio.h for FILE definition
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:35 -0000

Helps with compling it on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-stdio.h-for-getting-FILE-defined.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
new file mode 100644
index 0000000..acc1338
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
@@ -0,0 +1,45 @@
+From 58f4d3d63cd6097154205ea7ee042005036659b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Sep 2015 21:43:32 -0700
+Subject: [PATCH] libopkg: include stdio.h for getting FILE defined
+To: opkg-devel@googlegroups.com
+Cc: paul@paulbarker.me.uk
+
+For some libc(musl) stdio.h may not get included indirectly which means
+we need to mention it in explicit include list
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ libopkg/opkg_verify.c | 1 +
+ libopkg/pkg_src.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libopkg/opkg_verify.c b/libopkg/opkg_verify.c
+index 41dc3f4..a71591d 100644
+--- a/libopkg/opkg_verify.c
++++ b/libopkg/opkg_verify.c
+@@ -18,6 +18,7 @@
+ 
+ #include <malloc.h>
+ #include <string.h>
++#include <stdio.h>
+ 
+ #include "file_util.h"
+ #include "opkg_conf.h"
+diff --git a/libopkg/pkg_src.c b/libopkg/pkg_src.c
+index e31ec21..6b49a00 100644
+--- a/libopkg/pkg_src.c
++++ b/libopkg/pkg_src.c
+@@ -20,6 +20,7 @@
+ 
+ #include <malloc.h>
+ #include <unistd.h>
++#include <stdio.h>
+ 
+ #include "file_util.h"
+ #include "opkg_conf.h"
+-- 
+2.5.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
index f4dbb2d..884368f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
+           file://0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch \
 "
 
 SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-- 
2.5.2


