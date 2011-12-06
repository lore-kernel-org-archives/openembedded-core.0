Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxf7-0004iL-Kf
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:33 +0100
Received: by mail-gx0-f175.google.com with SMTP id h1so6444446ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HgDsy9qJ4enZHkMe4Veo6aEPSxf+3Wz9KeLX9me5ifE=;
	b=SoFFTY5IrgquKuMgE6BB0x7X4T2JWpJV5Pr388d7wnAfunb7S0eZjaBiu/+Vc50auo
	kauMDv8TmboXMQHf+zDPwcbEBCkkZAZG0xciaiwj0g3sNvsp0l13064YKgKJjcZxDqJJ
	7DFzSGiPFalrpAAR6Oa5qY0kS/rrxxfhAJLsc=
Received: by 10.101.132.21 with SMTP id j21mr3156262ann.131.1323187667689;
	Tue, 06 Dec 2011 08:07:47 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:28 +0000
Message-Id: <e66da1c8168aeaa4be6b5c9240bf9d8b685ff184.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
Subject: [PATCH 2/5] initramfs-module-debug: add
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 16:14:33 -0000

Adds support to dynamic debugging of initramfs using bootparam in
following format:

 - shell                 : starts a shell before and after each module
 - shell=before:<module> : starts a shell before <module> is loaded and run
 - shell=after:<module>  : starts a shell after <module> is loaded and run

 - shell-debug                 : run set -x as soon as possible
 - shell-debug=before:<module> : run set -x before <module> is loaded and run
 - shell-debug=after:<module>  : run set -x after <module> is loaded and run

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-module-debug/debug     |   82 ++++++++++++++++++++
 .../initrdscripts/initramfs-module-debug_1.0.bb    |   15 ++++
 2 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-debug/debug
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-debug_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-debug/debug b/meta/recipes-core/initrdscripts/initramfs-module-debug/debug
new file mode 100644
index 0000000..00bfd7d
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-debug/debug
@@ -0,0 +1,82 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+# Adds support to dynamic debugging of initramfs using bootparam in
+# following format:
+#   shell                 : starts a shell before and after each module
+#   shell=before:<module> : starts a shell before <module> is loaded and run
+#   shell=after:<module>  : starts a shell after <module> is loaded and run
+#
+#   shell-debug                 : run set -x as soon as possible
+#   shell-debug=before:<module> : run set -x before <module> is loaded and run
+#   shell-debug=after:<module>  : run set -x after <module> is loaded and run
+
+DEBUG_SHELL="false"
+
+debug_hook_handler() {
+	status=$1
+	module=$2
+
+	if [ -n "$bootparam_shell" ] && [ "$bootparam_shell" != "true" ]; then
+		shell_wanted_status=`expr $bootparam_shell : '\(.*\):.*'`
+		shell_wanted_module=`expr $bootparam_shell : '.*:\(.*\)'`
+
+		if [ "$shell_wanted_status" = "before" ]; then
+			shell_wanted_status=pre
+		else
+			shell_wanted_status=post
+		fi
+	fi
+
+	if [ "$bootparam_shell" = "true" ] ||
+		( [ "$status" = "$shell_wanted_status" ] &&
+			[ "$module" = "$shell_wanted_module" ] ); then
+		if [ "$status" = "pre" ]; then
+			status_msg="before"
+		else
+			status_msg="after"
+		fi
+
+		msg "Starting shell $status_msg $module..."
+		sh
+	fi
+
+	if [ -n "$bootparam_shell_debug" ] && [ "$bootparam_shell_debug" != "true" ]; then
+		shell_debug_wanted_status=`expr $bootparam_shell_debug : '\(.*\):.*'`
+		shell_debug_wanted_module=`expr $bootparam_shell_debug : '.*:\(.*\)'`
+
+		if [ "$shell_debug_wanted_status" = "before" ]; then
+			shell_debug_wanted_status=pre
+		else
+			shell_debug_wanted_status=post
+		fi
+	fi
+
+	if [ "$bootparam_shell_debug" = "true" ] ||
+		( [ "$status" = "$shell_debug_wanted_status" ] &&
+			[ "$module" = "$shell_debug_wanted_module" ] ); then
+		if [ "$DEBUG_SHELL" = "true" ]; then
+			return 0
+		fi
+
+		if [ "$status" = "pre" ]; then
+			status_msg="before"
+		else
+			status_msg="after"
+		fi
+
+		msg "Starting shell debugging $status_msg $module..."
+		DEBUG_SHELL="true"
+		set -x
+	fi
+}
+
+debug_enabled() {
+	return 0
+}
+
+debug_run() {
+	add_module_pre_hook "debug_hook_handler"
+	add_module_post_hook "debug_hook_handler"
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-debug_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-debug_1.0.bb
new file mode 100644
index 0000000..d0380f4
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-debug_1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "initramfs debug helper"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "initramfs-base"
+
+inherit allarch
+
+SRC_URI = "file://debug"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
+}
+
+FILES_${PN} = "/init.d/*"
-- 
1.7.2.5



