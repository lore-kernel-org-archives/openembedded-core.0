Return-Path: <clopez@igalia.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jul 2016 21:30:35 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 330F260797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 21:30:35 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2ClAwAfR41X/5tjdVtbKgGDFFY1R7ZWgg+BehIQhy84FAEBAQEBAQFlJ4UuAXyBAog0AQmgR5UqAYhuhiqJWYF9C4MHBZkkhhOITAKCN4x8ApAeHjaDdWwBh2EBAQE
X-IPAS-Result: A2ClAwAfR41X/5tjdVtbKgGDFFY1R7ZWgg+BehIQhy84FAEBAQEBAQFlJ4UuAXyBAog0AQmgR5UqAYhuhiqJWYF9C4MHBZkkhhOITAKCN4x8ApAeHjaDdWwBh2EBAQE
X-IronPort-AV: E=Sophos;i="5.28,385,1464645600"; d="scan'208";a="152790867"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 18 Jul 2016 23:20:34 +0200
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim) id 1bPFxq-00052F-3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 23:20:34 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 23:19:56 +0200
Message-Id: <1468876796-16026-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] webkitgtk: Switch the ARMv7 build to Thumb2 and enable back the JSC JIT.
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
X-List-Received-Date: Mon, 18 Jul 2016 21:30:37 -0000

* The JSC JIT is broken on ARMv7 without Thumb2.

[YOCTO #9474]

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index c5e5432..536fa23 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -71,10 +71,6 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 
-# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
-# displaying problems or ephiphany hang.
-EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
-
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
@@ -89,7 +85,18 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
+
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
+# https://bugs.webkit.org/show_bug.cgi?id=159880
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
+ARM_INSTRUCTION_SET_armv7a = "thumb"
+ARM_INSTRUCTION_SET_armv7r = "thumb"
+ARM_INSTRUCTION_SET_armv7m = "thumb"
+ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
 # Invalid data memory access: 0x00000000
 # ...
-- 
2.1.4


