Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94D6F60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 18:47:10 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id us13so9694248pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=te52F2OV7lRSMPXRNe+K62TGHdrcKFayQkVlkWloTlM=;
	b=WDjwogNFQafOXG5lxAXKpP3+1pRv8K8qkT5vxnna1Mh5vJsXuSrqn5YUzCAcOW0Ka6
	auWw8ux12ESlpS0NPAOvTiq9xydGHJAw83Zn+GMsI6n4BJoG2H+QyBay9B6RnG60F4NU
	XUjlyL3PhcznJ2uih47Wh2y0a+dT3+E1hDUAhlxGdFQrSKAhVDCgtn+UNeaadnPbVqq5
	7j64u11Mr0+TmfuV1tHKyUFftCS+FVbGpA1EqJ+8SIfXes7WtnEj5pgAq4SK4RzGbnIn
	sevzBsNZRJZVlYGh08Ar3bd3Gy64CJQT7Rd/0wZRzeDSCMMU2baGJgkh00G0TQqoglPP
	TUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=te52F2OV7lRSMPXRNe+K62TGHdrcKFayQkVlkWloTlM=;
	b=afFSlLaEZIPKcAMquvv0iKNYw+H4HQgAAq4BfJMEGue4OaOZL1yYniP2T2LLZf0kjQ
	/f5Yq2EPCg5yqaIwNhDQOeeqN9Y6iCuI7QXPTw5N9YAv3C5hBjic3jgfOgEuhKfZprZF
	+qm3DnFiGBZcOaZkEjJpzsgKpHobmwzDpqYi6W5l/HfV2deObobVzlVenJoLdWWLvf7B
	khJgs9K9kUpCeBqWVNYIxtAkGz5y8ar8rJfhr8dk4ERiO4x6tj00npNJOPZf2i25NQGc
	c2HNAGbEJ2356pYnGYnISpe7tVLvg5lkk6CJIRruo9rDLGWvXjnFVrudXxpdcGJCfp+c
	Oy3w==
X-Gm-Message-State: ALyK8tIFp+9tItb8kYDtLL5HpkI3DiTbYL+Tp/54m6+CRKtODFL/EX3A45zEt2J86aZhBw==
X-Received: by 10.66.161.41 with SMTP id xp9mr10152610pab.78.1466794031360;
	Fri, 24 Jun 2016 11:47:11 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qc16sm1889741pab.1.2016.06.24.11.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 11:47:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:47:02 -0700
Message-Id: <20160624184702.7007-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] watchdog: Fix build with musl
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
X-List-Received-Date: Fri, 24 Jun 2016 18:47:12 -0000

A similar patch has been submitted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...inux-param.h-for-EXEC_PAGESIZE-definition.patch | 32 ++++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch b/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
new file mode 100644
index 0000000..198f198
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
@@ -0,0 +1,32 @@
+From 8f91385dbd5e7c14b36ecbd8a01ca82c709f6d77 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Jun 2016 18:19:29 +0000
+Subject: [PATCH] Include linux/param.h for EXEC_PAGESIZE definition
+
+Musl does not include linux/param.h whereas glibc
+does, so it fails to build on musl.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/watchdog.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/watchdog.c b/src/watchdog.c
+index acf6450..486384a 100644
+--- a/src/watchdog.c
++++ b/src/watchdog.c
+@@ -26,6 +26,9 @@
+ #include <sys/param.h>		/* For EXEC_PAGESIZE */
+ #include <linux/oom.h>
+ #include <linux/watchdog.h>
++#ifdef __linux__
++#include <linux/param.h>
++#endif
+ #include <string.h>
+ 
+ #include <libgen.h>
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 76a3b42..ee1a893 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -9,8 +9,9 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
-	   file://watchdog-init.patch \
-	   file://watchdog-conf.patch \
+           file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
+           file://watchdog-init.patch \
+           file://watchdog-conf.patch \
 "
 
 SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
-- 
2.9.0


