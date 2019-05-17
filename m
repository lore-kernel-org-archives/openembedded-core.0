Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D9E0360107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:56:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4550wb5FRmz5c
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 09:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558079775;
	bh=Qeen8xxCVNZfhfjaKHvFlBGHzhyqfvl5pe5Y4KowS/w=;
	h=From:To:Subject:Date:From;
	b=FS+p9piXkc6hDedsTn21Eknm7C0iPUY0U+bAITz4Ugu5gL/nooYpjzkVrgwvIa8P9
	w0IcDUIV2IbL4BXs2K16G8ESlaFl4jvpUCGGFVvFspXtN6vfIVJzU48CYklnUvev0k
	Fv8GzoFTPczix2Gpvb9fx56Hl35EWsnh3ToLeEuiUjxSGrew/gHbsS1LotW0GJD2v4
	N0qcsovGgiHxOLLT63GZ4BvO47PU8yQaCKEQPJEqT5fgXVUsVlPj6g9+ILQyXEK+3e
	XixG/D3IdPiPxLkXDit+YcyhVEKtVyiL7lKwwhPP/oz7FF/wAyCKArqwmZ9RlzR0zk
	Mth5wTTTg3axEpP1SpFvLdaS6iOKrrp0ajBxskAIKNOzwUaC6+RRFqPkD9EJGfigaT
	bsgOW3N7Foxq+cUwUezu9XPWOadoajDvho2w1qTtIZt60YJL0WSIshRRQzP1vvB5+7
	9tGZPv4m8I3MQduT4Aqifpfl2+5jyRdIsE7UXLx0nocOYNyCIoHHxoez6DPi9OrFWH
	NljK3vnBL4gfozlZBwZxuoRNVkUurdi6kc7+KOkt4eZd3anpQsvoUjCsIBNAvLn0p/
	XL4W3i+J/RzocF2HJci0VYZlPbTYtp/YVeKQPsEby1ZFDxN6t/cwkAiQnebN/+GrIc
	2/VaWJRnThQz3nexFeL0YNQc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 10:56:14 +0300
Message-Id: <20190517075614.11005-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ofono: Use external ell instead of an internal copy
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
X-List-Received-Date: Fri, 17 May 2019 07:56:16 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/ofono/ofono.inc     |  4 +--
 ...in-Quiet-ld-errors-with-external-ell.patch | 36 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  1 +
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 0472414b19..e1185c6e6b 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-introspection-data
 
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
+DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
@@ -19,7 +19,7 @@ PACKAGECONFIG ??= "\
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
 
-EXTRA_OECONF += "--enable-test"
+EXTRA_OECONF += "--enable-test --enable-external-ell"
 
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
diff --git a/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch b/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch
new file mode 100644
index 0000000000..f9858e7f20
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-main-Quiet-ld-errors-with-external-ell.patch
@@ -0,0 +1,36 @@
+From 48e31f9fc3cf3c486c3d27a67b2687f6df0c5c71 Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Thu, 16 May 2019 15:10:53 -0500
+Subject: main: Quiet ld errors with external ell
+
+When oFono is built with --enable-external-ell, the compiler for some
+reason does not generate a debug section on some systems.  This is due
+to the fact that l_debug is never called.  However, ell also does not
+call l_debug, yet when built-in ell is used, the section is created by
+the compiler.
+
+For now work around this by adding a no-op l_debug() call in main.c.
+The real fix is to migrate all of the oFono logging functionality to use
+ell instead.
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/main.c b/src/main.c
+index 8623a060..4529cde1 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -236,6 +236,7 @@ int main(int argc, char **argv)
+ 	event_loop = g_main_loop_new(NULL, FALSE);
+ 
+ 	l_log_set_stderr();
++	l_debug("");
+ 	l_debug_enable("*");
+ 	l_main_init();
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
index a22b99a728..a5fa81de2f 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.29.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -5,6 +5,7 @@ SRC_URI  = "\
   file://ofono \
   file://0001-build-Fix-a-race-condition.patch \
   file://0001-build-Add-check-for-explicit_bzero-support.patch \
+  file://0001-main-Quiet-ld-errors-with-external-ell.patch \
 "
 SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
 SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


