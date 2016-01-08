Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id BB3CD7325A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:27 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id e32so258869264qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JPdbsQZnuC6VWHnFjhhe+LpEONujPC1PeAEfTagsgqk=;
	b=RIlYGc66Y6KiClur2oHDzqxp6YVnKnEx4GooDFKeFwbbzYf4yUSIBRbNe47toTA4wJ
	x5RioSDJzWkKFoUhEbp30ZyUtJJmp5eJvzkyLvGOwl/gVu4Q5h9GoODU2WAM1LIdihSX
	ksK4EUYkLQQjx6OOvatiJt5WbmdL1xj2f8I8suqyj0vJDfaVD4CRHDr7LCoWHTavoEFW
	Woxt/n6YMbECHRKdxI+PHc0uKujeWfCelXfLRZmddy0C3YGZcePudV6OJ7kz9ZBHI5q9
	mYNQkId+Uk7iFxpyWp5h41jzhoiM/WqViwlEKAb+yQG/2bQwe2NXz94Gb/M6SECWUPXW
	LV0A==
X-Received: by 10.140.224.138 with SMTP id u132mr25407852qhb.67.1452248367810; 
	Fri, 08 Jan 2016 02:19:27 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:29 +0000
Message-Id: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 01/53] powertop: Include right headers for timval struct
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-include-rquired-headers-for-typedefs.patch | 47 ++++++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.8.bb       |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
new file mode 100644
index 0000000..0fd6310
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
@@ -0,0 +1,47 @@
+From 0856d8145d187a7e5a49625247abe43a13f95acc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2015 19:36:28 +0000
+Subject: [PATCH] include rquired headers for typedefs
+
+timeval struct needs to include sys/time.h and sprintf() usage requires
+to include stdio.h headers from system
+
+Fixes
+src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier 'sprintf'; did you mean 'vswprintf'?
+src/devices/devfreq.h:35:18: error: field has incomplete type 'struct timeval'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/devices/devfreq.h    | 1 +
+ src/perf/perf_bundle.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
+index 16a60fb..4bede7c 100644
+--- a/src/devices/devfreq.h
++++ b/src/devices/devfreq.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_DEVFREQ_H
+ #define _INCLUDE_GUARD_DEVFREQ_H
+ 
++#include <sys/time.h>
+ #include "device.h"
+ #include "../parameters/parameters.h"
+ 
+diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
+index cf1ae11..232f894 100644
+--- a/src/perf/perf_bundle.cpp
++++ b/src/perf/perf_bundle.cpp
+@@ -27,6 +27,7 @@
+ #include <algorithm>
+ #include <string.h>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-- 
+2.5.2
+
diff --git a/meta/recipes-kernel/powertop/powertop_2.8.bb b/meta/recipes-kernel/powertop/powertop_2.8.bb
index a466067..1f2dfb8 100644
--- a/meta/recipes-kernel/powertop/powertop_2.8.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.8.bb
@@ -6,7 +6,9 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz \
+           file://0001-include-rquired-headers-for-typedefs.patch \
+"
 
 SRC_URI[md5sum] = "c55fedb69203e480801b18bd7b886241"
 SRC_URI[sha256sum] = "a87b563f73106babfa3e74dcf92f252938c061e309ace20a361358bbfa579c5a"
-- 
2.7.0


