Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A088763F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:56:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so3758327wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lzCPilZz8lc8SEcIAbHcIHkDDmoWjcCmb5DVYIQUw20=;
	b=UP9L1G1yUIC+WeyJo740G2HXizQ5yka3FoCDa+G8Tx2y/F73C+FtkTNqIOSZv3MRph
	50Em+UXvXttKQx7LxJRxl0I8UfZG6B1dp0nDwWITdacMoOmJ/SV5/yam7oNxaRkePLqm
	QZM/99bHvjupX7B+n6FCrYZ1AuPAYELxhPY5xadyweHJcGnxf8Qws4wbBOmVwDybXWqt
	hap/oC+B6f8i/myT+R+fkXiohmWGfm/Pk9QgNXCXzPaC40682eiFOKfYdB05+3W5h3BY
	W1oX6cPCXHpTRv5ae134EVVC9AGhClJvTNwYDyHbH3YzosoHbE8xtINALWse1QdKmuDB
	J2cg==
X-Gm-Message-State: AEkoouv+GZwubqepxXm3Hi7GHKjcfriVRapX7x2YI1wLXHqjEd4BcRzj1EDVj5wUo0yUQg==
X-Received: by 10.28.20.77 with SMTP id 74mr30517273wmu.1.1471506991434;
	Thu, 18 Aug 2016 00:56:31 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q65sm1318701wmd.24.2016.08.18.00.56.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 00:56:30 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 08:56:24 +0100
Message-Id: <20160818075626.15973-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818075626.15973-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] module.bbclass: use Module.symvers for dependants
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
X-List-Received-Date: Thu, 18 Aug 2016 07:56:32 -0000
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

While 1) by itself is not really a big issue, 2) prevents
the packaging process from generating cross-source tree
package dependencies.

As a first step to solve the missing dependencies in
packages created, we:
1) install Module.symvers of all external kernel module
   builds (into a location that is automatically packaged
   into the -dev package)
2) make use of KBUILD_EXTRA_SYMBOLS and pass the location
   of all Module.symvers of all kernel-module-* packages
   we depend on

This solves both problems mentioned above.

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


