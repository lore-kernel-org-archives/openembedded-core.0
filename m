Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDE197BF8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:34:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBK1Y5LI014035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2018 17:34:15 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Dec 2018 17:33:54 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 20:33:50 -0500
Message-ID: <fd734daa1ab5738f5064fde9d9810014aac258f9.1545269541.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1545269541.git.kai.kang@windriver.com>
References: <cover.1545269541.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] grub-efi-native: workaround for fedora 29
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
X-List-Received-Date: Thu, 20 Dec 2018 01:34:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

grub-efi-native fails to run do_configure on Fedora 29 host:

| checking for options to compile assembly...
| Assembler messages:
| Fatal error: The input and output files must be distinct

because the host 'as' in binutils-3.31 breaks if using two filesystems.
See:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=2a50366

Work-around this issue by forcing the configure time assembler check to
use a temp file in the src dir.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...workaround-for-as-from-binutils-2.31.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.02.bb        |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch

diff --git a/meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch b/meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch
new file mode 100644
index 0000000000..75dae16095
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch
@@ -0,0 +1,43 @@
+When /dev and $srcdir are not in a same file system, it may trigger a flaw of
+binutils 2.31 and cause grub-efi-native configure error:
+
+| checking for options to compile assembly...
+| Assembler messages:
+| Fatal error: The input and output files must be distinct
+
+Replace /dev/null with a temporary file during assemble check to avoid such
+failure.
+
+This is a workaround for binutils 2.31. When it is fixed on Fedora 29, this
+patch could be removed.
+
+Ref:
+https://bugzilla.redhat.com/show_bug.cgi?id=1660279
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index 44a67a7..6eb28fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -696,8 +696,9 @@ if test x"$test_program" = x ; then
+   grub_cv_cc_target_asm_compile=
+ else
+   found=no
++  tmpfile="$(mktemp $srcdir/asm-tests/XXXXXX)"
+   for arg in "" "-no-integrated-as"; do
+-    cmdline="$TARGET_CC -c -o /dev/null $TARGET_CCASFLAGS $arg $TARGET_CPPFLAGS $srcdir/asm-tests/$test_program.S"
++    cmdline="$TARGET_CC -c -o $tmpfile $TARGET_CCASFLAGS $arg $TARGET_CPPFLAGS $srcdir/asm-tests/$test_program.S"
+     echo "Running $cmdline" >&AS_MESSAGE_LOG_FD
+     if $cmdline >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
+       grub_cv_cc_target_asm_compile="$arg"
+@@ -705,6 +706,7 @@ else
+       break
+     fi
+   done
++  rm -f $tmpfile
+   if test x"$found" = xno ; then
+     AC_MSG_ERROR([could not compile assembly])
+   fi
diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 14fce97ff0..fc91864421 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -9,6 +9,8 @@ SRC_URI += " \
            file://cfg \
           "
 
+SRC_URI_append_class-native = " file://workaround-for-as-from-binutils-2.31.patch"
+
 S = "${WORKDIR}/grub-${PV}"
 
 # Determine the target arch for the grub modules
-- 
2.19.0.rc2


