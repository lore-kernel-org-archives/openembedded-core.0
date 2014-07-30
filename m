Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id E2A5E65CAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 16:04:21 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1418075wes.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QOzrNVAKMsnADhxUwAZCvMKFWgSVa399cQRI8dBv/2s=;
	b=ZHt8v3559NV7sgG98S/T7+aD9ierz7qPHPzMHYg1/V15ZNMgIs2cM28+ecl+P61Cj9
	rLw6rkyBqUOqMOXEbFj3yW+AccDUuqhG9iCxdLP/kPVmkaDJqDjACcVMVzK4tqpgsOsv
	iBQ0Gj7f32vNHwBQTkukHBRhy9AbmytIupngWwe/6yQECrzJaYGtkkkzQ9xAeBdEeuVT
	B6rm18+HS9gMSAY+EZdkF33E0zQ28mwvpueNcuaY0t5Sw6sHLCzCih6snSn9LQGwJ/3V
	+8qLLLzL0G0+0g3IH50V3CbfUnm1Wbi2jJu0nfOpUIcnwW4NHLvjvqKxuA4mlV3o+3aC
	4kkw==
X-Received: by 10.180.36.238 with SMTP id t14mr7598356wij.38.1406736258426;
	Wed, 30 Jul 2014 09:04:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w10sm11004646wie.22.2014.07.30.09.04.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 09:04:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 18:04:36 +0200
Message-Id: <1406736276-25623-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [RFC][PATCH] qemu.bbclass: add -r ${OLDEST_KERNEL} parameter
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
X-List-Received-Date: Wed, 30 Jul 2014 16:04:22 -0000

* in some cases (e.g. with external toolchain which doesn't respect our
  reasonably old version set in OLDEST_KERNEL) it's possible to have libc
  which requires newer kernel than what we have on builders, qemu supports
  -r param to use different uname than what's returned by host system.
* change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to
  QEMU_OPTIONS which are used by qemuwrapper-cross
* maybe we should eventually convert all qemu_run_binary usages always include
  qemuwrapper-cross dependency and always call qemu through that (it
  seems very strange that qemu_target_binary is called from qemuwrapper
  and for allarch recipes it can return qemu-allarch as qemu binary).

  qemu_run_binary is used by:
  meta/classes/gtk-immodules-cache.bbclass:            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
  meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, binary):
  meta/recipes-core/systemd/systemd_213.bb:         ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
  meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \

  and qemuwrapper directly by:
  scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
  scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/qemu.bbclass | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index abee8aa..b2cf85d 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -29,19 +29,20 @@ def qemu_run_binary(data, rootfs_path, binary):
 
     libdir = rootfs_path + data.getVar("libdir", False)
     base_libdir = rootfs_path + data.getVar("base_libdir", False)
+    oldest_kernel = data.getVar("OLDEST_KERNEL", True)
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -r " + oldest_kernel + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
 
-QEMU_OPTIONS = ""
-QEMU_OPTIONS_iwmmxt    = "-cpu pxa270-c5"
-QEMU_OPTIONS_armv6     = "-cpu arm1136"
-QEMU_OPTIONS_armv7a    = "-cpu cortex-a8"
-QEMU_OPTIONS_e500v2    = "-cpu e500v2"
-QEMU_OPTIONS_e500mc    = "-cpu e500mc"
-QEMU_OPTIONS_e5500     = "-cpu e5500"
-QEMU_OPTIONS_e5500-64b = "-cpu e5500"
-QEMU_OPTIONS_e6500     = "-cpu e6500"
-QEMU_OPTIONS_e6500-64b = "-cpu e6500"
-QEMU_OPTIONS_ppc7400   = "-cpu 7400"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL}"
+QEMU_OPTIONS_append_iwmmxt    = " -cpu pxa270-c5"
+QEMU_OPTIONS_append_armv6     = " -cpu arm1136"
+QEMU_OPTIONS_append_armv7a    = " -cpu cortex-a8"
+QEMU_OPTIONS_append_e500v2    = " -cpu e500v2"
+QEMU_OPTIONS_append_e500mc    = " -cpu e500mc"
+QEMU_OPTIONS_append_e5500     = " -cpu e5500"
+QEMU_OPTIONS_append_e5500-64b = " -cpu e5500"
+QEMU_OPTIONS_append_e6500     = " -cpu e6500"
+QEMU_OPTIONS_append_e6500-64b = " -cpu e6500"
+QEMU_OPTIONS_append_ppc7400   = " -cpu 7400"
-- 
2.0.2


