Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BAFED71A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 23:22:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 16:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,481,1498546800"; d="scan'208";a="1215164808"
Received: from swold-mobl2.jf.intel.com ([10.24.9.251])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2017 16:22:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  5 Sep 2017 16:22:02 -0700
Message-Id: <20170905232202.19347-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH v2] systemtap: Bump SRCREV for 4.12 Linux kernel support
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
X-List-Received-Date: Tue, 05 Sep 2017 23:22:07 -0000

This SRCREV bump brings in support for the 4.12 Linux Kernel, this kernel
also has some newer CONFIG settings. The newer DEBUG_INFO and DEBUG_INFO_DWARF4
settings can be used with systemtap to get the full information.  We do not
normally enabled these for a 'production' (standard) kernel, but can be
enabled via menuconfig.

When installing staprun and stapbpf on the target and native ensure we
don't try to create a new group and chown it.  There is no need since we
will be running as root, so we add a patch to comment that code out.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...apbpf-don-t-support-installing-a-non-root.patch | 62 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  5 +-
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
new file mode 100644
index 00000000000..9f11648fefd
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
@@ -0,0 +1,62 @@
+From 3e13a006fe3dff9489269274093bf868532036e2 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Tue, 5 Sep 2017 16:02:55 -0700
+Subject: [PATCH] staprun/stapbpf: don't support installing a non-root
+
+Since we are in a known environment and installing as root and
+expect to be running as root, don't create the group or chmod
+the binaries.
+
+Upstream-Status: Inappropriate [Embedded]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ stapbpf/Makefile.am | 14 +++++++-------
+ staprun/Makefile.am | 12 ++++++------
+ 2 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
+index 421b044ef..f7daeb2b2 100644
+--- a/stapbpf/Makefile.am
++++ b/stapbpf/Makefile.am
+@@ -39,11 +39,11 @@ git_version.stamp ../git_version.h:
+ 
+ # Why the "id -u" condition?  This way, an unprivileged user can run
+ # make install, and have "sudo stap ...." or "sudo stapbpf ...." work later.
+-install-exec-hook:
+-	if [ `id -u` -eq 0 ]; then \
+-		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
+-		getent group stapusr >/dev/null \
+-		&& chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
+-		&& chmod 04110 "$(DESTDIR)$(bindir)/stapbpf"; \
+-	fi
++#install-exec-hook:
++#	if [ `id -u` -eq 0 ]; then \
++#		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
++#		getent group stapusr >/dev/null \
++#		&& chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
++#		&& chmod 04110 "$(DESTDIR)$(bindir)/stapbpf"; \
++#	fi
+ endif
+diff --git a/staprun/Makefile.am b/staprun/Makefile.am
+index 4073aa01c..2925e34c3 100644
+--- a/staprun/Makefile.am
++++ b/staprun/Makefile.am
+@@ -72,9 +72,9 @@ git_version.stamp ../git_version.h:
+ 
+ # Why the "id -u" condition?  This way, an unprivileged user can run
+ # make install, and have "sudo stap ...." or "sudo staprun ...." work later.
+-install-exec-hook:
+-	if [ `id -u` -eq 0 ]; then \
+-		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
+-		getent group stapusr >/dev/null && chgrp stapusr "$(DESTDIR)$(bindir)/staprun"; \
+-		chmod 04110 "$(DESTDIR)$(bindir)/staprun"; \
+-	fi
++#install-exec-hook:
++#	if [ `id -u` -eq 0 ]; then \
++#		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
++#		getent group stapusr >/dev/null && chgrp stapusr "$(DESTDIR)$(bindir)/staprun"; \
++#		chmod 04110 "$(DESTDIR)$(bindir)/staprun"; \
++#	fi
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a6aedd38a6e..3dc688a18fe 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "b8ea350dc13adb6190d9044a5b80110a4c441270"
+SRCREV = "45d0e7a09a15a21078d0ebf2db5175ed9e87014e"
 PV = "3.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
@@ -12,7 +12,8 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-buildrun-remove-quotes-around-I-include-line.patch \
-          "
+           file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           "
 
 # systemtap doesn't support mips
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
-- 
2.13.5


