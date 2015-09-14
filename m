Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 84A2576FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:37 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so60380766qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=E8A4Vpiz3y6mMO3+dvnkZfN6aAFdQ5bdtVhXUe+zPdg=;
	b=QH0SWtW25dTLaLuJ1i1lslosAEC2pfxFats5Ku8wjK7XaPz4Nw8TLpswMXMBC6tTMl
	gCubSf9CYrLudOhMV7Mx+At54nHbmea4jBnLGgBWfwLhdNBb7jZZsuQHhpIPPqy9XvOZ
	w8Ni/HhauK38rXzD9FBIZuH/O8AjG8hA/XwHD1Xq8ZaA5MLFYlIcHZEyhIlX/+wv+fWN
	QRMjmfwPfUQcRbXeJ1N7TNo8q3S1dmOW/XpSamBMxMtHW7t96FtZl3R5udmsClE/AHB6
	5nJEvROhZNA2P7W0RfyXm1CQT+kPshw0xmmk8hSwRl9Aq/NSTxkKvoxdKjdrY0HNfOm8
	K3BA==
X-Received: by 10.55.27.203 with SMTP id m72mr23107389qkh.39.1442248297433;
	Mon, 14 Sep 2015 09:31:37 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:27 +0000
Message-Id: <d63e43271776f750645f3298b175b2e04898dca9.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 12/12] sysstat: Include needed headers explicitly
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:38 -0000

It depends on defines from .h files that are not includes as part of
source file, on glibc it works because they get included indirectly but
that can change any time since its internal glibc behaviour, at user
level the header needed should be explicitly included.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-needed-headers-explicitly.patch   | 62 ++++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_11.1.5.bb    |  2 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch b/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
new file mode 100644
index 0000000..c126523
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
@@ -0,0 +1,62 @@
+From 42325faa88d64cce799977d611b2792beb154643 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Sep 2015 08:36:59 +0000
+Subject: [PATCH] Include needed headers explicitly
+
+on glibc these headers get pulled in indirectly via other .h files
+but right fix is to include them directly when used
+
+fixes
+
+error: use of undeclared identifier 'PATH_MAX'
+error: called object type 'unsigned int' is not a function or function pointer
+dm_major = major(aux.st_rdev);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ common.c    | 1 +
+ ioconf.c    | 1 +
+ sa_common.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/common.c b/common.c
+index a23155b..ad86446 100644
+--- a/common.c
++++ b/common.c
+@@ -20,6 +20,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <limits.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <time.h>
+diff --git a/ioconf.c b/ioconf.c
+index 7d88c5d..6d67691 100644
+--- a/ioconf.c
++++ b/ioconf.c
+@@ -27,6 +27,7 @@
+ #include <errno.h>
+ #include <dirent.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ 
+ #include "ioconf.h"
+ #include "common.h"
+diff --git a/sa_common.c b/sa_common.c
+index b7351d9..c9e3299 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -20,6 +20,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <limits.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <time.h>
+-- 
+2.5.2
+
diff --git a/meta/recipes-extended/sysstat/sysstat_11.1.5.bb b/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
index 69d2ec2..bff8616 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
@@ -2,6 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+
 SRC_URI[md5sum] = "4d8e6e72d057189a1660462a678d9ada"
 SRC_URI[sha256sum] = "feb3a90d86ffd69cf5b88144a8876ae05bd42384f559676f08100671589fa2bb"
 
-- 
2.5.2


