Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39416CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:30:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11349.1782394250783247481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=e/7PZKm+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1B3165C
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:30:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.2.203.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAE033F62B
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782394250; bh=1IvcA+31FYrgjzg9ANSwUd8pCpLuVeuL7Qjf7LIvWhE=;
	h=From:To:Subject:Date:From;
	b=e/7PZKm+uCdzEaLW2LrN7kbebRswmoPWJbDLGNeO3WPxnEOK2ku8z09Oc6tr808C7
	 uLDQKtGJqSMyns/CmDs8AusrSXYWFIPIpx1gSY5ObpL1CCfolJLN7j3mDjItCtnsqX
	 W18SpEtumU28ciN/GaonEAow6C9eXzB5Sb5NEoKQ=
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] e2fsprogs: fix parallel library build ordering
Date: Thu, 25 Jun 2026 14:30:39 +0100
Message-Id: <20260625133039.2105064-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239563

Add a patch which fixes ordering problems in parallel e2fsprogs builds
with --enable-elf-shlibs.

Library subdirectories can otherwise return from "make all" before both
the static archive and the ELF shared library image have been created.
Consumers from other subdirectories can then link against incomplete or
incorrect artifacts.
On x86-64 this can make libext2fs.so fall back to the non-PIC
libcom_err.a and fail on R_X86_64_TPOFF32 relocations from
lib/et/error_message.o.

The patch also tightens lib/ss ordering so generated files and install
directories are present before parallel consumers use them.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 ...-Fix-parallel-library-build-ordering.patch | 95 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.4.bb             |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-Fi=
x-parallel-library-build-ordering.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-Fix-paral=
lel-library-build-ordering.patch b/meta/recipes-devtools/e2fsprogs/e2fspr=
ogs/0001-lib-Fix-parallel-library-build-ordering.patch
new file mode 100644
index 000000000000..dd46045738ee
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-Fix-parallel-lib=
rary-build-ordering.patch
@@ -0,0 +1,95 @@
+From eba1a107a25cc7fce230a48c713673645e11a49c Mon Sep 17 00:00:00 2001
+From: Luca Fancellu <luca.fancellu@arm.com>
+Date: Thu, 11 Jun 2026 13:00:00 +0100
+Subject: [PATCH] lib: Fix parallel library build ordering
+
+When building with --enable-elf-shlibs, Makefile.elf-lib adds `all:: ima=
ge`
+to build the shared library image.
+The static library stub also adds `all:: subdirs $(LIBRARY).a`.
+
+The archive and ELF image are consumed through the top-level lib directo=
ry
+by other subdirectories, so a library subdirectory must not return from
+"make all" before both outputs have been created.
+
+If libcom_err.so has not been created yet, libext2fs.so can fall back to
+libcom_err.a. On x86-64 that can fail because lib/et/error_message.o con=
tains
+a thread-local object and the non-PIC static object has R_X86_64_TPOFF32
+relocations that cannot be used when linking a shared object.
+
+Make the static archive target depend on the ELF image when Makefile.elf=
-lib
+is included, so the normal library build creates the shared object and
+top-level `.so` symlinks before returning to the parent recursive make.
+
+lib/ss has an additional ordering issue: its first local all:: rule only=
 names
+mk_cmds, while libss.a and ss.pc are added later. Put libss.a and ss.pc =
on
+that first all:: target rule as well so lib/ss cannot complete after gen=
erating
+only mk_cmds and leave debugfs without lib/ss/ss_err.h. Also make ss_err=
.h
+depend on ss_err.c so parallel consumers do not run compile_et twice for=
 the
+same generated pair.
+
+Finally, create the lib/ss install directories in the install recipe bef=
ore
+copying headers and data files. The ELF shared-library fragment also con=
tributes
+install and installdirs double-colon rules, so relying on the aggregate
+installdirs target can still let the header copy run before $(includedir=
)/ss
+exists during parallel install.
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/276]
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ lib/Makefile.elf-lib | 7 +++++++
+ lib/ss/Makefile.in   | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/lib/Makefile.elf-lib b/lib/Makefile.elf-lib
+index cc1e6a708571..966766044b5f 100644
+--- a/lib/Makefile.elf-lib
++++ b/lib/Makefile.elf-lib
+@@ -22,6 +22,13 @@ ELF_SONAME =3D $(ELF_IMAGE).so.$(ELF_SO_VERSION)
+=20
+ image:		$(ELF_LIB)
+=20
++# The static library makefile fragment also defines "all::" without a r=
ecipe.
++# With GNU make, a later no-recipe "all:: image" rule is not sufficient=
 to make
++# "make all" visit this fragment's prerequisite. Tie the ELF image to t=
he
++# static archive target so normal subdirectory builds create both outpu=
ts
++# before returning to the parent recursive make.
++$(LIBRARY).a: image
++
+ $(ELF_LIB): $(OBJS)
+ 	$(E) "	GEN_ELF_SOLIB $(ELF_LIB)"
+ 	$(Q) (cd elfshared; $(CC) -o $(ELF_LIB) \
+diff --git a/lib/ss/Makefile.in b/lib/ss/Makefile.in
+index bb50418939aa..937e98ac81d6 100644
+--- a/lib/ss/Makefile.in
++++ b/lib/ss/Makefile.in
+@@ -58,7 +58,7 @@ SRCS=3D	$(srcdir)/invocation.c $(srcdir)/help.c \
+ 	$(srcdir)/list_rqs.c $(srcdir)/pager.c $(srcdir)/requests.c \
+ 	$(srcdir)/data.c $(srcdir)/get_readline.c
+=20
+-all:: mk_cmds
++all:: mk_cmds libss.a ss.pc
+=20
+ @MAKEFILE_LIBRARY@
+ @MAKEFILE_ELF@
+@@ -105,6 +105,8 @@ ss_err.c ss_err.h: ss_err.et
+ 	$(E) "	COMPILE_ET ss_err.et"
+ 	$(Q) $(COMPILE_ET) $(srcdir)/ss_err.et
+=20
++ss_err.h: ss_err.c
++
+ ct.tab.c ct.tab.h: ct.y
+ 	$(RM) -f ct.tab.* y.*
+ 	$(YACC) -d $(srcdir)/ct.y
+@@ -136,6 +138,9 @@ install:: libss.a $(INSTALL_HFILES) installdirs ss_e=
rr.h mk_cmds ss.pc
+ 	$(Q) $(INSTALL_DATA) libss.a $(DESTDIR)$(libdir)/libss.a
+ 	-$(Q) $(RANLIB) $(DESTDIR)$(libdir)/libss.a
+ 	$(Q) $(CHMOD) $(LIBMODE) $(DESTDIR)$(libdir)/libss.a
++	$(Q) $(MKDIR_P) $(DESTDIR)$(includedir)/ss \
++		$(DESTDIR)$(datadir)/ss $(DESTDIR)$(bindir) \
++		$(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(man1dir)
+ 	$(Q) $(RM) -f $(DESTDIR)$(includedir)/ss/*
+ 	$(Q) for i in $(INSTALL_HFILES); do \
+ 		echo "	INSTALL_DATA $(DESTDIR)$(includedir)/ss/$$i"; \
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
index 90f8f37b8ef0..ed396da8a2ee 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
@@ -4,6 +4,7 @@ SRC_URI +=3D "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-lib-Fix-parallel-library-build-ordering.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patc=
h \
--=20
2.34.1


