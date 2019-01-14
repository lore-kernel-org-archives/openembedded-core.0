Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5ABD6D470
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:04:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z5so805341wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xu64NiB+FTnWdGKbIH2XR1H19eRJuivV72Gin+IkNHU=;
	b=ArchrwaZPkm6xhTLlcLwbg1r/6YHzIyn6UYkREPAOpcd2GdxVOLRz+GrGlQuu2Be2A
	pC8b/Yyr7m90fJaOQ3GKOWVRfO9cgDMyoHN7QC7HoAx/LqCoEcASDdaSoTbkEcCQMNBR
	YnI9JeIcTEhFAocWN6uLH952NtGwYHi/v+ZmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xu64NiB+FTnWdGKbIH2XR1H19eRJuivV72Gin+IkNHU=;
	b=RGAzFdbs6c84rZLi9j1ZgkvjloCYJpKXu4KeK9eEuv6A0arTQWY8V98/COOY9phbIO
	41j52M5LiFcV+e8V2Ux1NSfeNHvCoh9URMjBYcmIW0SDRnSD+TRgwMh+nHB9hu4TUCAW
	fx1zrnzSQBTRCJf4mq9LYM8xnKb/6hP//gt4xJzh9/GX99UdqzRW8vaeEzEsSsrl5lvE
	5E+Dj4W9XCLUmQ2ZP+jkdzeIdMqmWb4ViDa9VZhrvrl4LwmSYz6zIrtq8JN62rdqzewi
	zP55IVnJMxmlOjVumQ/qeqN2myAO1ssEZ4EVESjbXlN88VaqoDHcgz49CJ6VSkgapPSl
	7/ig==
X-Gm-Message-State: AJcUukc7rzpvl3sEMgwN/bcZ1RYBqoYdHzaDTte2wPBxkBqUS5H9FaDj
	VbjDr54a5cdVxZwFAHunJrufRpZMmRM=
X-Google-Smtp-Source: ALg8bN7q4KhMD75M751yhF7R3YLKcQEEMM0VCV0EZWbeYvYFbo+MbYw+otDIKpwsxEmX9/ergwG6Ow==
X-Received: by 2002:adf:9205:: with SMTP id 5mr562077wrj.189.1547507076135;
	Mon, 14 Jan 2019 15:04:36 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm87732099wre.34.2019.01.14.15.04.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 15:04:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 23:04:32 +0000
Message-Id: <20190114230432.22116-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
References: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta: Fix python code quoting issues
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
X-List-Received-Date: Mon, 14 Jan 2019 23:04:36 -0000
Content-Transfer-Encoding: 8bit

python 3.8 will be stricter about python quoting. Fix up several misquoted
expressions and fix Deprecation warnings like:

Var <do_compile>:1: DeprecationWarning: invalid escape sequence \$

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cml1.bbclass                                       | 2 +-
 meta/classes/gtk-doc.bbclass                                    | 2 +-
 meta/classes/populate_sdk_base.bbclass                          | 2 +-
 .../gobject-introspection/gobject-introspection_1.58.2.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 926747f2ba6..7f6df4011bc 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,7 +26,7 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    oe_terminal("${SHELL} -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index b4f6754906a..bedb36ec8b7 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -41,7 +41,7 @@ do_compile_prepend_class-target () {
     if [ ${GTKDOC_ENABLED} = True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/gtkdoc-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 677ba3cf12f..a4afc61c465 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -257,7 +257,7 @@ EOF
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
-		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE").replace('&', '\&')}#g' \
+		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE").replace('&', '\\&')}#g' \
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
index 242899accc4..d00f3bd3441 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
@@ -76,7 +76,7 @@ do_configure_prepend_class-native() {
 do_configure_prepend_class-target() {
         # Write out a qemu wrapper that will be given to gi-scanner so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/g-ir-scanner-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
-- 
2.19.1


