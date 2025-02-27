Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD32C1B0FF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:35:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13416.1740670497811945609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25482BCC
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:35:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC3973F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:34:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: don't use host objcopy
Date: Thu, 27 Feb 2025 15:34:50 +0000
Message-ID: <20250227153450.3666227-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212017

The kernel/kvm test uses the host objcopy when building a payload, but
the host objcopy might not know how to deal with target binaries:

  CC testcases/kernel/kvm/lib_host.o
  objcopy: Unable to recognise the format of the input file `kvm_svm03-pa=
yload.elf'
  make[3]: *** [ltp/testcases/kernel/kvm/Makefile:67: kvm_svm03-payload.o=
] Error 1

Solve this by using the host-prefixed objcopy binary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-kernel-kvm-don-t-hardcode-objcopy.patch | 69 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240930.bb     |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-h=
ardcode-objcopy.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode=
-objcopy.patch b/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hard=
code-objcopy.patch
new file mode 100644
index 00000000000..1cbdec51284
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-kernel-kvm-don-t-hardcode-objcop=
y.patch
@@ -0,0 +1,69 @@
+From 0a42a8ee0ae8c6f1e603c1836b7c9c7fab0ca3a8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 27 Feb 2025 12:38:50 +0000
+Subject: [PATCH] kernel/kvm: don't hardcode objcopy
+
+testcases/kernel/kvm uses objcopy to contruct a payload binary, but in
+cross builds the host objcopy may not know how to handle target
+binaries:
+
+ CC testcases/kernel/kvm/lib_host.o
+ objcopy: Unable to recognise the format of the input file `kvm_svm03-pa=
yload.elf'
+ make[3]: *** [ltp/testcases/kernel/kvm/Makefile:67: kvm_svm03-payload.o=
] Error 1
+
+This is trivially fixed by searching for an objcopy tool (so
+host-prefixed in cross builds) and using that instead.
+
+Upstream-Status: Submitted [https://lore.kernel.org/ltp/20250227124330.9=
49015-1-ross.burton@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac                  | 1 +
+ include/mk/config.mk.in       | 1 +
+ testcases/kernel/kvm/Makefile | 4 ++--
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 344b2ae2c..0f2b6f332 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,6 +30,7 @@ AC_PROG_RANLIB
+ AC_DEFUN([AC_PROG_STRIP], [AC_CHECK_TOOL(STRIP, strip, :)])
+ AC_PROG_STRIP
+ AC_PROG_YACC
++AC_CHECK_TOOL([OBJCOPY], [objcopy], [:])
+=20
+ m4_ifndef([PKG_CHECK_EXISTS],
+ 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usua=
l dependency), see INSTALL])])
+diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
+index 2b7c8a071..4c3da304f 100644
+--- a/include/mk/config.mk.in
++++ b/include/mk/config.mk.in
+@@ -11,6 +11,7 @@ AR			:=3D @AR@
+ CC			:=3D @CC@
+ LEX			:=3D @LEX@
+ RANLIB			:=3D @RANLIB@
++OBJCOPY			:=3D @OBJCOPY@
+ STRIP			:=3D @STRIP@
+ YACC			:=3D @YACC@
+=20
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefi=
le
+index 07bdd9705..e93528a33 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -60,11 +60,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target=
.mk
+ %-payload.o: %.c lib_guest.o $(ARCH_OBJ)
+ ifdef VERBOSE
+ 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload=
.elf $^ $(GUEST_LDLIBS)
+-	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit=
_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
++	$(OBJCOPY) -O binary -j .init.boot -j .text -j .data -j .init -j .prei=
nit_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
+ 	$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --ofor=
mat=3D$(BIN_FORMAT) -o $@ $*-payload.bin
+ else
+ 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payloa=
d.elf $^ $(GUEST_LDLIBS)
+-	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preini=
t_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
++	@$(OBJCOPY) -O binary -j .init.boot -j .text -j .data -j .init -j .pre=
init_array -j .init_array --gap-fill=3D0 $*-payload.elf $*-payload.bin
+ 	@$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --ofo=
rmat=3D$(BIN_FORMAT) -o $@ $*-payload.bin
+ 	@echo KVM_CC $(target_rel_dir)$@
+ endif
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-ext=
ended/ltp/ltp_20240930.bb
index 0760170c7b0..c1cd157328f 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20240930.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.gi=
t;branch=3Dmaster;protocol=3Dht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
+           file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
            "
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


