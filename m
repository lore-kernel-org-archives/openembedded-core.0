Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A393C73172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:24 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a202so4846734oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ElfiXsRs9rTF+xQq0P02N7QWtwnqGFtXzdKaSSiUtQY=;
	b=UCFxraCgTmjh64j5uzZnuVrbBANbcRy/o9uuNvwHnYtHBRAyBwivE2+ELzatkPEYUl
	tB93MfufLuzdOXRShRjmOeH1ZDMSpegJljtdAYeT7znUtHaPrQRLyJwBnzjen+nVxIj6
	vMrzhSnOTJBleZdNLVinoq6DgNi0CzBjy8BfoVT9eoh8Pafu6Ji0EC+FICG4bR9/V6+L
	OPySQVExaPF+WM5wYRqyLDSMi367sHYmtXLVnfAsdeZKgHFGFpdeMd++iV6OQzZM8onh
	VGKkaKD7Kc8/XtnhfNklz/L4cKfHvd5W2wTkihU/Tmuwh1lcv024w0ohu4Gisq7OUnIw
	lwpA==
X-Received: by 10.202.1.18 with SMTP id 18mr95605663oib.100.1452583165701;
	Mon, 11 Jan 2016 23:19:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d2sm49992973oic.12.2016.01.11.23.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:19:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:18:36 -0800
Message-Id: <1452583117-812-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/5] strace: fix ARCH definition in tests/Makefile
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:27 -0000

TARGET_ARCH doesn't map to strace's ARCH variable, so we can't assign
one from the other. Forcing the incorrect value via the make command
line doesn't cause any problems with strace v4.10, but it will do for
strace v4.11.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../define-OS-ARCH-in-tests-Makefile-am.patch      | 26 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch

diff --git a/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch b/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
new file mode 100644
index 0000000..4b1bb26
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
@@ -0,0 +1,26 @@
+Ensure that OS and ARCH are defined in tests/Makefile.am
+
+For strace v4.10 this is a purely cosmetic fix, since the include
+paths derived from $(OS)/${ARCH) are never used. These variables are
+correctly defined by default in strace v4.11.
+
+Partial backport of upstream commit:
+
+  http://sourceforge.net/p/strace/code/ci/25c804ce42261b24b19d35c637bf2745c237ee07
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: strace-4.10/tests/Makefile.am
+===================================================================
+--- strace-4.10.orig/tests/Makefile.am
++++ strace-4.10/tests/Makefile.am
+@@ -1,5 +1,7 @@
+ # Automake input for strace tests.
+ 
++OS = linux
++ARCH = @arch@
+ AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CPPFLAGS = -I$(top_builddir)/$(OS)/$(ARCH) \
+ 	      -I$(top_srcdir)/$(OS)/$(ARCH) \
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 0b2316b..1b64743 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://run-ptest \
            file://Include-sys-stat.h-for-S_I-macros.patch \
            file://Include-linux-ioctl.h-for-_IOC_-macros.patch \
+           file://define-OS-ARCH-in-tests-Makefile-am.patch \
           "
 
 SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
@@ -37,7 +38,7 @@ do_install_append() {
 }
 
 do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS OS=linux ARCH="${TARGET_ARCH}"
+	oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
 
 do_install_ptest() {
-- 
1.9.1


