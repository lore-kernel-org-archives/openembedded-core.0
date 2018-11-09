Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63B9E6C119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 09:02:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA992KvG032568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 01:02:30 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 01:02:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:12:22 +0800
Message-ID: <cb45fc25b42e280523a2a8c0173dd7b494cb4635.1541754618.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754618.git.hongxu.jia@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libjitterentropy: add 2.1.2
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
X-List-Received-Date: Fri, 09 Nov 2018 09:02:55 -0000
Content-Type: text/plain

From the following kernel commit we know: Fedora has integrated the jitter
entropy daemon to work around slow boot problems, especially on VM's that
don't support virtio-rng

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=81e69df38e2911b642ec121dec319fad2a4782f3

Do the same thing for Yocto.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-fix-do_install-failure-on-oe.patch  | 33 ++++++++++++++++++++++
 .../libjitterentropy/libjitterentropy_2.1.2.bb     | 28 ++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
 create mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb

diff --git a/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch b/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
new file mode 100644
index 0000000..30ff4fe
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
@@ -0,0 +1,33 @@
+From 00cefca0eefecec657969b50cd4e1ed5b057a857 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 25 Oct 2018 16:30:06 +0800
+Subject: [PATCH] fix do_install failure on oe
+
+- Do not strip at do_install
+
+- Create includedir
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 5e31276..76fcbfa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,7 +51,8 @@ install:
+ 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
+ 	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
+-	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++	install -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb
new file mode 100644
index 0000000..3b5b4e4
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Hardware RNG based on CPU timing jitter"
+DESCRIPTION = "The Jitter RNG provides a noise source using the CPU execution timing jitter. \
+It does not depend on any system resource other than a high-resolution time \
+stamp. It is a small-scale, yet fast entropy source that is viable in almost \
+all environments and on a lot of CPU architectures."
+HOMEPAGE = "http://www.chronox.de/jent.html"
+LICENSE = "GPLv2+ | BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e52365752b36cfcd7f9601d80de7d8c6 \
+                    file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
+                    file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
+                   "
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
+           file://0001-fix-do_install-failure-on-oe.patch \
+          "
+SRCREV = "f5a80c6f3fcc6deebd0eabf75324f48aed1afbce"
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+
+LDFLAGS += "-Wl,-O0"
+
+do_install () {
+    oe_runmake install INCDIR="/include" \
+                       DESTDIR="${D}" \
+                       PREFIX="${exec_prefix}" \
+                       LIBDIR="${baselib}"
+}
+
-- 
2.7.4


