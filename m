Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.44311.1585547276551582979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=EUbbLgRp;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2302; q=dns/txt; s=iport;
  t=1585547276; x=1586756876;
  h=from:to:cc:subject:date:message-id;
  bh=kDp0+iMrULMAkrIwOpGRKVNnYXAJOEGgRM4D+nXN73g=;
  b=EUbbLgRpyQeTvfOe2Fu8+tPMA4xkziZSvSMfRD99GsQ7TekLUGzUoAbs
   gu5omx5QwTmh8Nea/TqPsltcJQpwunTCQrgQ8JDQMaJlqVqVn85u0rkB0
   L+nU0g4u3l1mAmOQNfOiqMmr626TsvEgvhYFFnrqCt+66GrjFtC4g6XC6
   k=;
X-IronPort-AV: E=Sophos;i="5.72,323,1580774400"; 
   d="scan'208";a="455029477"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2020 05:47:55 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTP id 02U5ltZG029569;
	Mon, 30 Mar 2020 05:47:55 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 52ADEE0D; Sun, 29 Mar 2020 22:47:55 -0700 (PDT)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] qemu: Add check for missing header
Date: Mon, 30 Mar 2020 05:47:48 +0000
Message-Id: <20200330054748.51126-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.18.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com

Header missing and configure script detect this.
Add check before include header (if_alg.h).

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...mu-Do-not-include-file-if-not-exists.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 972767615d..530ee82fa9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-3.patch \
            file://0001-Add-enable-disable-udev.patch \
 	   file://CVE-2020-7211.patch \
+	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
new file mode 100644
index 0000000000..9cb3de7944
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
@@ -0,0 +1,31 @@
+From 98c2da129db19ee63d7e21b77a0ef70822c95069 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 25 Mar 2020 21:21:35 +0200
+Subject: [PATCH] qemu: Do not include file if not exists
+
+Script configure checks for if_alg.h and check failed but
+if_alg.h still included.
+
+Upstream-status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07188.html]
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ linux-user/syscall.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index fc18f244..68d62666 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -106,7 +106,9 @@
+ #include <linux/blkpg.h>
+ #include <netpacket/packet.h>
+ #include <linux/netlink.h>
++#if defined(CONFIG_AF_ALG)
+ #include <linux/if_alg.h>
++#endif
+ #include "linux_loop.h"
+ #include "uname.h"
+ 
+-- 
+2.20.1
+
-- 
2.20.1

