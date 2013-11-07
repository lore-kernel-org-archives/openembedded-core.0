Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFF0E6D44C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 05:38:12 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id wy17so88238pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 21:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wa9YfwiAT/jr9V+XbFPdidWIzg3UZFiH8qAr6YXV/s0=;
	b=uznPhI6zMWySUyQbb1h4zGTMyAFt7PLTmU1UtBTSDkP62m9IzZp9hKZRjAmwKMlUXU
	nOUkx40VLJSK6vGw5HVs8DosVe30WlXXPBWsxCFVNHsYsrH1BgsVMTajGZxFki8pxvOC
	+4lk/OLKogU5QniZeTyl0ha7thrVoaZ7t5ZWlDP0ov9vYmBpoCgMl77bBAPkfm0hIqIq
	JCsBCnru26FSM7vhup+j2fA/bjoG88P8CqUMd/wv7Qy7pwGHHRFE/ohCEhZrqrLFp7ZO
	1s7LlWXhtyHuu5osDmXjV5nLUdu71KsgftKq0R91yhKt2ZtDnVNx5HtJL+pyXW4UQuf9
	ldkw==
X-Received: by 10.66.144.161 with SMTP id sn1mr7698429pab.7.1383802694657;
	Wed, 06 Nov 2013 21:38:14 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ry4sm3205337pab.4.2013.11.06.21.38.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Nov 2013 21:38:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 21:35:00 -0800
Message-Id: <1383802501-10099-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] kbd: Fix stdarg related errors on uclibc
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
X-List-Received-Date: Thu, 07 Nov 2013 05:38:12 -0000

It does not get stdarg.h included indirectly as it happens
on uclibc due to different include chain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/kbd/kbd/uclibc-stdarg.patch | 36 +++++++++++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.0.bb            |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/kbd/kbd/uclibc-stdarg.patch

diff --git a/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch b/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch
new file mode 100644
index 0000000..be7f324
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/uclibc-stdarg.patch
@@ -0,0 +1,36 @@
+In file included from keymap.h:5:0,
+                 from ksyms.c:6:
+./keymap/common.h:65:38: error: unknown type name 'va_list'
+                  const char *format, va_list args),
+                                      ^
+./keymap/common.h:66:3: error: expected ';', ',' or ')' before 'const'
+   const void *data);
+   ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: kbd-2.0.0/src/libkeymap/contextP.h
+===================================================================
+--- kbd-2.0.0.orig/src/libkeymap/contextP.h	2013-08-13 06:46:23.000000000 -0700
++++ kbd-2.0.0/src/libkeymap/contextP.h	2013-11-05 22:33:49.200528226 -0800
+@@ -2,7 +2,7 @@
+ #define LK_CONTEXTP_H
+ 
+ #include "keymap.h"
+-
++#include <stdarg.h>
+ /**
+  * @brief Copy of struct kbdiacruc.
+  */
+Index: kbd-2.0.0/src/libkeymap/keymap/common.h
+===================================================================
+--- kbd-2.0.0.orig/src/libkeymap/keymap/common.h	2013-08-13 06:46:23.000000000 -0700
++++ kbd-2.0.0/src/libkeymap/keymap/common.h	2013-11-05 22:33:59.964528438 -0800
+@@ -6,6 +6,7 @@
+  */
+ 
+ #include <keymap/context.h>
++#include <stdarg.h>
+ 
+ /** Initializes the structures necessary to read and/or parse keymap.
+  *
diff --git a/meta/recipes-core/kbd/kbd_2.0.0.bb b/meta/recipes-core/kbd/kbd_2.0.0.bb
index e66018f..18d1da7 100644
--- a/meta/recipes-core/kbd/kbd_2.0.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.0.bb
@@ -10,7 +10,9 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.bz2 \
+           file://uclibc-stdarg.patch \
+          "
 
 SRC_URI[md5sum] = "1d9bbc36506b8c25740d028b0f6d2839"
 SRC_URI[sha256sum] = "f5eb125d5154bc0fe6f38175de9fcd394879485dadbba75c350d4ab050684a42"
-- 
1.8.4.2


