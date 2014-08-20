Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id D4AC165DD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 10:59:31 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so7236624lab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=KrJGqwwsZhMsp02szhQzWvTDUF1XMB8jNXglJLXAcD8=;
	b=A9tHleVyTCTZvvak967ZfYw7PP9dwVBzVxuRmoQtrXCHDcAch3bNNA42VsBH501O4W
	JHEOCRw/q74v3ZRDr7mSIvZmwiish2wtUi1itMFQrgke6oprfLFmwBTMl97V8qTClceh
	LgK0Klv9OLt1IRFUvfeGTRLwLxXOzOngxcYRJ4ORx71F16ZB3UGSN+7cyYUYr8rxMYGI
	ninMPeAyvv3iGaRwIfRhQW9kbBNCuhBPcEHXhQkiEvH0HA4cTNvXKnosMMF0ACEyWaRv
	/nsVFWyJ3f3xDadIQY1689iyyJw3FUEDhU2XA2ybRpExFnN0QS+beoiuHUkbnjRML+9m
	U6Mw==
X-Received: by 10.153.6.39 with SMTP id cr7mr41833329lad.66.1408532371665;
	Wed, 20 Aug 2014 03:59:31 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id t3sm36604568lby.22.2014.08.20.03.59.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Aug 2014 03:59:30 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2014 10:59:13 +0000
Message-Id: <1408532353-27794-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] psmisc: Fix musl build failure
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
X-List-Received-Date: Wed, 20 Aug 2014 10:59:32 -0000

As in procps, we just need to include <limits.h> for PATH_MAX.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../files/0002-Include-limits.h-for-PATH_MAX.patch | 29 ++++++++++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch

diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000..d8d1482
--- /dev/null
+++ b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From aa66afecd8ba9cc4139f25ab15ec315173413a7d Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Wed, 20 Aug 2014 10:31:37 +0000
+Subject: [PATCH] Include <limits.h> for PATH_MAX
+
+When building against musl libc, PATH_MAX is defined in <limits.h>.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Pending
+---
+ src/pstree.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pstree.c b/src/pstree.c
+index 071e6c4..0d28260 100644
+--- a/src/pstree.c
++++ b/src/pstree.c
+@@ -41,6 +41,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
++#include <limits.h>
+ 
+ #include "i18n.h"
+ #include "comm.h"
+-- 
+2.0.4
+
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
index 9f328bb..66aba9e 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
 SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
 
-SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch"
+SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
+            file://0002-Include-limits.h-for-PATH_MAX.patch \
+            "
-- 
2.0.4


