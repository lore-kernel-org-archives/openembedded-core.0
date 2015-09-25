Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0E73373BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 04:59:24 +0000 (UTC)
Received: by qgx61 with SMTP id 61so61729247qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B1rErJV6Qf35lf3Q7Vj858GHIiV1OYvolJ7uv7Gwy8g=;
	b=BkqKa7cFWGvLj4mk/eEtuCFjfxIfO8gCOBOESPwU/jymRIOcD/Nprhx+tk5IkLWkVJ
	KOBLyqKE93NtUYFHeHmUSmIScZLly6FEm2rgZSpCvzsy1UtjnVRF+CTCI1oCPJuat4LW
	bz3Tn3fqPJ/Kyas+kKBylCwcQ8Uk39GzEFBGprKIpk1YZyY9JG0Inrg0fqZXpix7SSO+
	Fr2MqhL5XwNSy0+t0YbmiBiUOFQOX60qRizg2MkxUopbb2UKZNpadl2gRUst8MgAqeWW
	iht6M1O9eW3tXJaQrTZVACm2IbF6C7jSEdotAC2b33K/9GfHc7eOgOcH1/oNURb8BMzN
	6Egg==
X-Received: by 10.140.237.14 with SMTP id i14mr4114201qhc.28.1443157164515;
	Thu, 24 Sep 2015 21:59:24 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c188sm768477qka.37.2015.09.24.21.59.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 21:59:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 04:59:13 +0000
Message-Id: <1443157157-33969-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 1/4] powertop: Include right headers for timval struct
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
X-List-Received-Date: Fri, 25 Sep 2015 04:59:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-include-rquired-headers-for-typedefs.patch | 45 ++++++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.7.bb       |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
new file mode 100644
index 0000000..5df9961
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
@@ -0,0 +1,45 @@
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
diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
index 5ba07e9..4158dd2 100644
--- a/meta/recipes-kernel/powertop/powertop_2.7.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -6,7 +6,9 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz \
+           file://0001-include-rquired-headers-for-typedefs.patch \
+"
 
 SRC_URI[md5sum] = "e0d686e47daaf7e9d89031f7763432ef"
 SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca"
-- 
2.5.3


