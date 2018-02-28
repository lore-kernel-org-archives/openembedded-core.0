Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBA3788EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:56:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1S5ufuM027584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:56:42 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 21:56:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Feb 2018 13:56:39 +0800
Message-ID: <cc7b5c36944049bc5c69151a2d3c7adf242b04f5.1519797175.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1519797175.git.Qi.Chen@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] systemd-boot: upgrade to 236
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
X-List-Received-Date: Wed, 28 Feb 2018 05:56:40 -0000
Content-Type: text/plain

Upgrade systemd-boot to 236.

As systemd has dropped autotools support, fix configure and compile
failures related to meson.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-boot_234.bb      | 43 ---------------
 meta/recipes-core/systemd/systemd-boot_236.bb      | 49 +++++++++++++++++
 .../systemd/0001-Also-check-i586-for-ia32.patch    | 28 ++++++++++
 ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62 ++++++++++++++++++++++
 4 files changed, 139 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-boot_234.bb
 create mode 100644 meta/recipes-core/systemd/systemd-boot_236.bb
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
deleted file mode 100644
index 88a14ac..0000000
--- a/meta/recipes-core/systemd/systemd-boot_234.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-require systemd.inc
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
-
-DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
-
-SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
-
-inherit autotools pkgconfig gettext
-inherit deploy
-
-EFI_CC ?= "${CC}"
-# Man pages are packaged through the main systemd recipe
-EXTRA_OECONF = " --enable-gnuefi \
-                 --with-efi-includedir=${STAGING_INCDIR} \
-                 --with-efi-ldsdir=${STAGING_LIBDIR} \
-                 --with-efi-libdir=${STAGING_LIBDIR} \
-                 --disable-manpages \
-                 EFI_CC='${EFI_CC}' \
-               "
-
-# Imported from the old gummiboot recipe
-TUNE_CCARGS_remove = "-mfpmath=sse"
-COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
-COMPATIBLE_HOST_x86-x32 = "null"
-
-do_compile() {
-	SYSTEMD_BOOT_EFI_ARCH="ia32"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		SYSTEMD_BOOT_EFI_ARCH="x64"
-	fi
-
-	oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
-}
-
-do_install() {
-	# Bypass systemd installation with a NOP
-	:
-}
-
-do_deploy () {
-	install ${B}/systemd-boot*.efi ${DEPLOYDIR}
-}
-addtask deploy before do_build after do_compile
diff --git a/meta/recipes-core/systemd/systemd-boot_236.bb b/meta/recipes-core/systemd/systemd-boot_236.bb
new file mode 100644
index 0000000..1a0135a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-boot_236.bb
@@ -0,0 +1,49 @@
+require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
+
+DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
+
+SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
+            file://0027-remove-nobody-user-group-checking.patch \
+            file://0001-Also-check-i586-for-ia32.patch \
+            file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
+            "
+
+inherit meson pkgconfig gettext
+inherit deploy
+
+EFI_CC ?= "${CC}"
+
+EXTRA_OEMESON += "-Defi=true \
+                  -Dgnu-efi=true \
+                  -Defi-includedir=${STAGING_INCDIR}/efi \
+                  -Defi-ldsdir=${STAGING_LIBDIR} \
+                  -Defi-libdir=${STAGING_LIBDIR} \
+                  -Dman=false \
+                  -Defi-cc='${EFI_CC}' \
+                  -Defi-ld='${LD}' \
+                  "
+
+
+# Imported from the old gummiboot recipe
+TUNE_CCARGS_remove = "-mfpmath=sse"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST_x86-x32 = "null"
+
+do_compile() {
+	SYSTEMD_BOOT_EFI_ARCH="ia32"
+	if [ "${TARGET_ARCH}" == "x86_64" ]; then
+		SYSTEMD_BOOT_EFI_ARCH="x64"
+	fi
+	ninja src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
+}
+
+do_install() {
+	# Bypass systemd installation with a NOP
+	:
+}
+
+do_deploy () {
+	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
+}
+addtask deploy before do_build after do_compile
diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
new file mode 100644
index 0000000..892b25e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
@@ -0,0 +1,28 @@
+From 4616e6f228d2678420ee7d5bb1c8a0c8ebb27be8 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 20:42:41 -0800
+Subject: [PATCH] Also check i586 for ia32
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ddc061c12..abd1261d6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1182,7 +1182,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT', get_option('slow-tests'))
+ if get_option('efi')
+         efi_arch = host_machine.cpu_family()
+ 
+-        if efi_arch == 'x86'
++        if efi_arch == 'x86' or efi_arch == 'i586'
+                 EFI_MACHINE_TYPE_NAME = 'ia32'
+                 gnu_efi_arch = 'ia32'
+         elif efi_arch == 'x86_64'
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
new file mode 100644
index 0000000..e2e19ba
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
@@ -0,0 +1,62 @@
+From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 21:42:23 -0800
+Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when cross-compiling
+
+When cross-compiling, efi_cc and efi_ld may take the form of
+'xxx-gcc --sysroot=xxx', and this would cause run_command and
+the alike fail.
+
+Fix to split them to make commands run correctly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/boot/efi/meson.build | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 992a3ba4c..9f9ec4911 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -157,7 +157,7 @@ if have_gnu_efi
+                 o_file = custom_target(file + '.o',
+                                        input : file,
+                                        output : file + '.o',
+-                                       command : [efi_cc, '-c', '@INPUT@', '-o', '@OUTPUT@']
++                                       command : efi_cc.split() + ['-c', '@INPUT@', '-o', '@OUTPUT@']
+                                                  + compile_args,
+                                        depend_files : efi_headers)
+                 if (common_sources + systemd_boot_sources).contains(file)
+@@ -168,7 +168,17 @@ if have_gnu_efi
+                 endif
+         endforeach
+ 
+-        libgcc_file_name = run_command(efi_cc, '-print-libgcc-file-name').stdout().strip()
++        find_libgcc_cmd_all = efi_cc + ' -print-libgcc-file-name'
++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
++        find_libgcc_args = []
++        cmd_args_all = find_libgcc_cmd_all.split()
++        foreach arg : cmd_args_all
++                if arg != find_libgcc_cmd
++                        find_libgcc_args += arg
++                endif
++        endforeach
++
++        libgcc_file_name = run_command(find_libgcc_cmd, find_libgcc_args).stdout().strip()
+         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
+         stub_efi_name = 'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
+         no_undefined_symbols = find_program('no-undefined-symbols.sh')
+@@ -179,7 +189,7 @@ if have_gnu_efi
+                         tuple[0],
+                         input : tuple[2],
+                         output : tuple[0],
+-                        command : [efi_ld, '-o', '@OUTPUT@'] +
++                        command : efi_ld.split() + ['-o', '@OUTPUT@'] +
+                                   efi_ldflags + tuple[2] +
+                                   ['-lefi', '-lgnuefi', libgcc_file_name])
+ 
+-- 
+2.13.0
+
-- 
1.9.1


