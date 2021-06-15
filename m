Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.47.1623774838303454693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 09:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3BDC13A1
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 09:33:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C22A3F694
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 09:33:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: replace gdb helper install revert with the upstream fix
Date: Tue, 15 Jun 2021 17:33:54 +0100
Message-Id: <20210615163354.282584-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A change in the gcc-11 branch broke installation of the GDB helper on
bare-metal targets without a shared libstdc++.so.  This now fixed
upstream so replacce the revert with a backport of the patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-11.1.inc        |  2 +-
 ...nstall-libstdc-gdb.py-more-robustly-.patch | 76 -------------------
 ...nstallation-of-python-hooks-PR-99453.patch | 57 ++++++++++++++
 3 files changed, 58 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Ins=
tall-libstdc-gdb.py-more-robustly-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-instal=
lation-of-python-hooks-PR-99453.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.1.inc
index 69e4c8bacc..c21242af58 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -68,7 +68,7 @@ SRC_URI =3D "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robust=
ly-.patch \
+           file://0001-libstdc-Fix-installation-of-python-hooks-PR-99453=
.patch \
            file://0038-arc-Update-64bit-move-split-patterns.patch \
            file://0039-arc-Fix-u-maddhisi-patterns.patch \
            file://0040-arc-Update-doloop_end-patterns.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-li=
bstdc-gdb.py-more-robustly-.patch b/meta/recipes-devtools/gcc/gcc/0001-Re=
vert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
deleted file mode 100644
index a3e31e4f9d..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-g=
db.py-more-robustly-.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-This change breaks installation on baremetal targets, so whilst the caus=
e is
-investigated revert the commit.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 8ec52bd0ba2141ef0bcc6f93e26a23d662b40f78 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 26 May 2021 19:54:29 +0100
-Subject: [PATCH] Revert "libstdc++: Install libstdc++*-gdb.py more robus=
tly
- [PR 99453]"
-
-This reverts commit dbb87d6a9c37c8eca80d77782717a8144515c16d.
----
- libstdc++-v3/python/Makefile.am | 20 ++++++++++++++++----
- libstdc++-v3/python/Makefile.in | 14 ++++++++++++--
- 2 files changed, 28 insertions(+), 6 deletions(-)
-
-diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makef=
ile.am
-index 0c2b207b86e..01517a2a522 100644
---- a/libstdc++-v3/python/Makefile.am
-+++ b/libstdc++-v3/python/Makefile.am
-@@ -44,9 +44,21 @@ gdb.py: hook.in Makefile
- install-data-local: gdb.py
- 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
- ## We want to install gdb.py as SOMETHING-gdb.py.  SOMETHING is the
--## full name of the final library.  We use the libtool .la file to get
--## the correct name.
--	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
--	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+## full name of the final library.  We want to ignore symlinks, the
-+## .la file, and any previous -gdb.py file.  This is inherently
-+## fragile, but there does not seem to be a better option, because
-+## libtool hides the real names from us.
-+	@here=3D`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
-+	  for file in libstdc++.*; do \
-+	    case $$file in \
-+	      *-gdb.py) ;; \
-+	      *.la) ;; \
-+	      *) if test -h $$file; then \
-+	           continue; \
-+	         fi; \
-+	         libname=3D$$file;; \
-+	    esac; \
-+	  done; \
-+	cd $$here; \
- 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
- 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
-diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makef=
ile.in
-index 2efe0b96a19..c35dbe55961 100644
---- a/libstdc++-v3/python/Makefile.in
-+++ b/libstdc++-v3/python/Makefile.in
-@@ -607,8 +607,18 @@ gdb.py: hook.in Makefile
-=20
- install-data-local: gdb.py
- 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
--	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
--	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+	@here=3D`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
-+	  for file in libstdc++.*; do \
-+	    case $$file in \
-+	      *-gdb.py) ;; \
-+	      *.la) ;; \
-+	      *) if test -h $$file; then \
-+	           continue; \
-+	         fi; \
-+	         libname=3D$$file;; \
-+	    esac; \
-+	  done; \
-+	cd $$here; \
- 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
- 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
-=20
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-=
of-python-hooks-PR-99453.patch b/meta/recipes-devtools/gcc/gcc/0001-libst=
dc-Fix-installation-of-python-hooks-PR-99453.patch
new file mode 100644
index 0000000000..d82f533cb4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-pyth=
on-hooks-PR-99453.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ad4c21f0f59b52357019148ec94d767aa2acd8f2 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Tue, 1 Jun 2021 11:00:16 +0100
+Subject: [PATCH] libstdc++: Fix installation of python hooks [PR 99453]
+
+When no shared library is installed, the new code to determine the name
+of the -gdb.py file yields an empty string. Use the name of the static
+library in that case.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/99453
+	* python/Makefile.am: Use archive name for printer hook if no
+	dynamic library name is available.
+	* python/Makefile.in: Regenerate.
+
+(cherry picked from commit 9f7bc160b4a0f27dce248d1226e3ae7104b0e67b)
+---
+ libstdc++-v3/python/Makefile.am | 4 ++++
+ libstdc++-v3/python/Makefile.in | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makef=
ile.am
+index 0c2b207b86e..8efefa5725c 100644
+--- a/libstdc++-v3/python/Makefile.am
++++ b/libstdc++-v3/python/Makefile.am
+@@ -48,5 +48,9 @@ install-data-local: gdb.py
+ ## the correct name.
+ 	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
+ 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++	if [ -z "$$libname" ]; then \
++	  libname=3D`sed -ne "/^old_library=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;}=
" \
++		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++	fi; \
+ 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
+ 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
+diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makef=
ile.in
+index 2efe0b96a19..9904a9197de 100644
+--- a/libstdc++-v3/python/Makefile.in
++++ b/libstdc++-v3/python/Makefile.in
+@@ -609,6 +609,10 @@ install-data-local: gdb.py
+ 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
+ 	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
+ 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++	if [ -z "$$libname" ]; then \
++	  libname=3D`sed -ne "/^old_library=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;}=
" \
++		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++	fi; \
+ 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
+ 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
+=20
+--=20
+2.25.1
+
--=20
2.25.1

