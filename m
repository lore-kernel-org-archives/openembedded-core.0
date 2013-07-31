Return-Path: <ronunes@gmail.com>
Received: from mail-qe0-f44.google.com (mail-qe0-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9D726ADE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 21:16:23 +0000 (UTC)
Received: by mail-qe0-f44.google.com with SMTP id 6so701105qeb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ccir4Ffi2vQCI7nmAOWwJRHuGUkKlJk8yxj2yjQLZbc=;
	b=A6MahsSoVYD7P6Vz3IFAUUBICLsQvdcEpBQkG4tqzjJV9BpqQlolRQJgZtWAOzr73l
	zy5fM72YrkLx9PpH3KrAO9MClrZN0FMprZnKIgMf/V4BQKA00ej9TuovWK+NLF4PZjjK
	RQvkXeMvG2pfeV+fGtb9p5nGb3oE0uED69Kwtnj76mzQ4+3W1keXFRvbmEfWjKg5TXzO
	GR5HgzgB9kLi+00hK+a6DUKFsNqsWhBv+UlYug8qvzzalPRSvruV+PkUpB0ySWCRYZ3M
	L20ha3b8EgjqCRpeIQ+sy1pv1i56WtsNNMi7LgjCy36H0SKvlaj8LTIBCJTINYVtxnXX
	70bg==
X-Received: by 10.229.157.76 with SMTP id a12mr5741058qcx.66.1375305378496;
	Wed, 31 Jul 2013 14:16:18 -0700 (PDT)
Received: from B35650-11.home (pool-173-76-208-216.bstnma.fios.verizon.net.
	[173.76.208.216])
	by mx.google.com with ESMTPSA id n16sm65781qae.8.2013.07.31.14.16.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 14:16:17 -0700 (PDT)
From: ronunes@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 17:15:15 -0400
Message-Id: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Rogerio Nunes <rogerio.nunes@freescale.com>
Subject: [master, dylan][PATCH] packagegroup-core-tools-testapps: isolate x11 dependent tools
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
X-List-Received-Date: Wed, 31 Jul 2013 21:16:24 -0000

From: Rogerio Nunes <rogerio.nunes@freescale.com>

This patch groups x11 dependent tools in a separete variable,
and when DISTRO_FEATURES does not contain x11, this group is
not included in the package RDEPENDS.

Signed-off-by: Rogerio Nunes <rogerio.nunes@freescale.com>
---
 .../packagegroup-core-tools-testapps.bb            |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 343ae1c..1861ebe 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,24 +24,28 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
+X11TOOLS = "\
+    fstests \
+    owl-video \
+    mesa-demos \
+    x11perf \
+    xrestop \
+    xwininfo \
+    xprop \
+    xvideo-tests \
+    "
+
 RDEPENDS_${PN} = "\
     blktool \
-    fstests \
     tslib-calibrate \
     tslib-tests \
     lrzsz \
     ${KEXECTOOLS} \
     alsa-utils-amixer \
     alsa-utils-aplay \
-    owl-video \
     gst-meta-video \
     gst-meta-audio \
-    mesa-demos \
-    x11perf \
-    xrestop \
-    xwininfo \
-    xprop \
-    xvideo-tests \
     ltp \
     connman-client \
+    ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
     "
-- 
1.7.9.5


