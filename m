Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB14775D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 15:25:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so25280436wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0VEGn0a0kkQFGIFLdxt8XJ2m+1hinGl3KNxCHOUpMwg=;
	b=OcFKbVw6Z2fr7DfpIiiU7S7yg4g7i1L0xwKfJzDtmV/pV6zt/eHZR0yVOeqMZmv0tH
	wcRbEcRD0abiQMnOronN9FILjQnxqJ6ji4nNbQwJ3om7sfJs0sss/XfFhahs6j/aLAJz
	o3qfcdMmJq7kyJidEGFRAZzX9ehOaI1y1J7JEGDZCJymXRpgiHBClnzz68Aq3Xad8VbQ
	fvUkKluazdeUQdX4Lga7hUYsUCt3NdVHcpgycED+47WRVIEdvZzxbZvDjLgWwoOMpzcZ
	3Us7tUEZp/AsebrdKVKAViqoVbye3WsGlXRu1J3+vFWa0Xdc5OJfcstulBguG9ehaTHW
	8vDg==
X-Gm-Message-State: AEkooutaXmRXkYqCns5VTCtAAY4yJ/20zGHHhcVp0c+/uLpTtrmPcvchINKRe9MPko1B9Q==
X-Received: by 10.28.62.204 with SMTP id l195mr11362131wma.117.1471447545553; 
	Wed, 17 Aug 2016 08:25:45 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a21sm27188657wma.10.2016.08.17.08.25.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 08:25:44 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 16:25:37 +0100
Message-Id: <20160817152538.14181-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160817152538.14181-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 1/2] module.bbclass: use Module.symvers for dependants
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
X-List-Received-Date: Wed, 17 Aug 2016 15:25:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling multiple external kernel modules, where one
depends on the other, there are two problems at the
moment:
1) we get compile time warnings from the kernel build
   system due to missing symbols (from modpost).
2) Any modules generated are missing dependency
   information (in the .modinfo elf section) for any
   dependencies outside the current source tree and
   outside the kernel itself.

This is expected, but the kernel build system has a way to
deal with this - the dependent module is expected to
specify KBUILD_EXTRA_SYMBOLS (as a space-separated list)
to point to any and all Module.symvers of kernel modules
that are dependencies.

While problems 1) and 2) by themselves are not big issues,
they prevent the packaging process from generating cross-
source tree package dependencies.

As a first step to solve this, we:
1) install Module.symvers of all external kernel module
   builds (into a location that is automatically packaged
   into the -dev package)
2) make use of KBUILD_EXTRA_SYMBOLS and pass the location
   of all Module.symvers of all kernel-module-* packages
   we depend on

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/module.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 01c9309..68e3d34 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -8,6 +8,15 @@ EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
 
+python __anonymous () {
+    depends = d.getVar('DEPENDS', True)
+    extra_symbols = []
+    for dep in depends.split():
+        if dep.startswith("kernel-module-"):
+            extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
+    d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
+}
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
@@ -15,6 +24,7 @@ module_do_compile() {
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
+		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 		   ${MAKE_TARGETS}
 }
 
@@ -24,6 +34,11 @@ module_do_install() {
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 	           ${MODULES_INSTALL_TARGET}
+
+	install -d -m0755 ${D}${includedir}/${BPN}
+	cp -a --no-preserve=ownership ${B}/Module.symvers ${D}${includedir}/${BPN}
+	# it doesn't actually seem to matter which path is specified here
+	sed -e 's:${B}/::g' -i ${D}${includedir}/${BPN}/Module.symvers
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.9.3


