Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 963C673D3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:09 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so25067225igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GekBQPw1tM5edjD0fgtFnS9QiJ3No/xxIptsvyiawwY=;
	b=LCTLyZvHZPOwVY/5Av6RwEHNt667ifSZ7t0cukuUs9eWh+hLZ1C6FSQ6eWFlc4uip6
	ZXpbgBrlfyBhogk2zyFVv3NYmRIP1iwtYtprQ8f90kl3CchtBNv+m09cZR6+AMhttcTa
	pL90hZBMC3E9IMiVYvRq2h0iq3RcLz9c0lV3xurU00FR6pGzRXYKzT1+yUfiC3zZkp0J
	s1+2J7cdV6k3EMvScayzPy1KUQfhW9eZO3IS0Eo+2q+YH3WHQqt4Z4idXDTwARA//rKI
	cAfKE9w8haJIZeEMBe/AKy5zAjO3q8qnq9AsywocJrrH9eXlNXuimCdortWK+N0MsMwM
	OYTg==
X-Received: by 10.50.142.38 with SMTP id rt6mr25186319igb.39.1428341831059;
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:41 +0000
Message-Id: <4fa1c5d1e93c915d0866eafda93f0d88359daa08.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 13/24] libdaemon: Explicitly include unisttd.h instead of sys/unistd.h
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:10 -0000

Fixes build errors on musl

Change-Id: Ia00bdc9c0578c8d5e1249c9d433079d795e83cb2
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libdaemon/libdaemon/fix-includes.patch           | 20 ++++++++++++++++++++
 meta/recipes-support/libdaemon/libdaemon_0.14.bb     |  4 +++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libdaemon/libdaemon/fix-includes.patch

diff --git a/meta/recipes-support/libdaemon/libdaemon/fix-includes.patch b/meta/recipes-support/libdaemon/libdaemon/fix-includes.patch
new file mode 100644
index 0000000..1027ae8
--- /dev/null
+++ b/meta/recipes-support/libdaemon/libdaemon/fix-includes.patch
@@ -0,0 +1,20 @@
+musl complains
+fatal error: sys/unistd.h: No such file or directory
+and rightly so
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- libdaemon-0.14.orig/examples/testd.c
++++ libdaemon-0.14/examples/testd.c
+@@ -21,9 +21,9 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <string.h>
++#include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
+ #include <sys/select.h>
+ 
+ #include <libdaemon/dfork.h>
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index e928781..070ee18 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -6,7 +6,9 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
 
-SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
+SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz \
+           file://fix-includes.patch \
+          "
 
 SRC_URI[md5sum] = "509dc27107c21bcd9fbf2f95f5669563"
 SRC_URI[sha256sum] = "fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834"
-- 
2.1.4


