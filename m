Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id C214273192
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:32 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p187so125048988qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kt0inYQ8e+7PdeAzDqnArbNL3sMIrgiBLfhPYq+A8+Q=;
	b=DofCV8J3vplQQePXrGpxne3ORb4kz8quqF9b0U5nXTKAgSE1VgLSw+izpEDewuoeUx
	cwbB0AisEKc2r3vvSbqfIicAPuSWDxWy3Ghf6SSDJFr5U6NziBaHDHBZi3hnVDK6jevM
	8C3zsDydoIroZZgnCLDWyXWBnpqPs7qxp24n5RPNTArettciE5sN6bERr/Q3AJSICyBm
	AXPQiD7k0RYxq9u18ZT2oZZG6/u8gbMmCs0dzHjg1zy6HnqYNU/VY04XkpFBYWHLaRCN
	Wc5trUF6Rmb/adbUDB6K/dAJASULzlRulACuMpMpHHVSYvI+Lu/T5/50GXMdwBUOWaLy
	MtNA==
X-Received: by 10.55.15.85 with SMTP id z82mr15264628qkg.50.1450569153247;
	Sat, 19 Dec 2015 15:52:33 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:12 +0000
Message-Id: <34c1af17ee715cf0016952cce7868370c3068628.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 03/17] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
new file mode 100644
index 0000000..f63868f
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
@@ -0,0 +1,30 @@
+From 6b5bbdfaac7f216fe8a02c4cf29e5eb2aee5a409 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2015 00:01:00 +0000
+Subject: [PATCH] include sys/types.h for dev_t definition
+
+Avoids the build failures when sys/types.h does not get included
+indirectly through other headers.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Status: Submitted
+
+ blktrace.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/blktrace.h b/blktrace.h
+index 380aec7..944fc08 100644
+--- a/blktrace.h
++++ b/blktrace.h
+@@ -5,6 +5,7 @@
+ #include <limits.h>
+ #include <byteswap.h>
+ #include <endian.h>
++#include <sys/types.h>
+ 
+ #include "blktrace_api.h"
+ #include "rbtree.h"
+-- 
+2.5.2
+
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 5b0be42..957cb70 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,7 +9,9 @@ SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
 PV = "1.1.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch"
+           file://ldflags.patch \
+           file://0001-include-sys-types.h-for-dev_t-definition.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.4


