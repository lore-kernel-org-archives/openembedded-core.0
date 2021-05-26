Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3595.1622063500734889289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 14:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 787D411D4
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 14:11:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F4E3F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 14:11:34 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: revert libstc++-gdb.py installation changes
Date: Wed, 26 May 2021 22:11:32 +0100
Message-Id: <20210526211132.1058543-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Commit dbb87d in the GCC 11 branch was intended to make the installation =
of
this Python module more robust, but for unknown reasons the library_name
in libstdc++.la in baremetal builds (for example, Zephyr) is unset, so th=
e
module is just installed as "-gdb.py".

This may be a GCC bug, or a bug in our build. Until that is resolved,
revert the commit to fix the packaging.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-11.1.inc        |  1 +
 ...nstall-libstdc-gdb.py-more-robustly-.patch | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Ins=
tall-libstdc-gdb.py-more-robustly-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.1.inc
index aa7ac9be59..bf29879ded 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -68,6 +68,7 @@ SRC_URI =3D "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robust=
ly-.patch \
 "
 SRC_URI[sha256sum] =3D "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f=
076957afa1cc9ddf"
 SRC_URI[backports.sha256sum] =3D "69274bebd6c069a13443d4af61070e854740a6=
39ec4d66eedf3e80070363587b"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-li=
bstdc-gdb.py-more-robustly-.patch b/meta/recipes-devtools/gcc/gcc/0001-Re=
vert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
new file mode 100644
index 0000000000..a3e31e4f9d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-g=
db.py-more-robustly-.patch
@@ -0,0 +1,76 @@
+This change breaks installation on baremetal targets, so whilst the caus=
e is
+investigated revert the commit.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 8ec52bd0ba2141ef0bcc6f93e26a23d662b40f78 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 26 May 2021 19:54:29 +0100
+Subject: [PATCH] Revert "libstdc++: Install libstdc++*-gdb.py more robus=
tly
+ [PR 99453]"
+
+This reverts commit dbb87d6a9c37c8eca80d77782717a8144515c16d.
+---
+ libstdc++-v3/python/Makefile.am | 20 ++++++++++++++++----
+ libstdc++-v3/python/Makefile.in | 14 ++++++++++++--
+ 2 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makef=
ile.am
+index 0c2b207b86e..01517a2a522 100644
+--- a/libstdc++-v3/python/Makefile.am
++++ b/libstdc++-v3/python/Makefile.am
+@@ -44,9 +44,21 @@ gdb.py: hook.in Makefile
+ install-data-local: gdb.py
+ 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
+ ## We want to install gdb.py as SOMETHING-gdb.py.  SOMETHING is the
+-## full name of the final library.  We use the libtool .la file to get
+-## the correct name.
+-	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
+-	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++## full name of the final library.  We want to ignore symlinks, the
++## .la file, and any previous -gdb.py file.  This is inherently
++## fragile, but there does not seem to be a better option, because
++## libtool hides the real names from us.
++	@here=3D`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
++	  for file in libstdc++.*; do \
++	    case $$file in \
++	      *-gdb.py) ;; \
++	      *.la) ;; \
++	      *) if test -h $$file; then \
++	           continue; \
++	         fi; \
++	         libname=3D$$file;; \
++	    esac; \
++	  done; \
++	cd $$here; \
+ 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
+ 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
+diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makef=
ile.in
+index 2efe0b96a19..c35dbe55961 100644
+--- a/libstdc++-v3/python/Makefile.in
++++ b/libstdc++-v3/python/Makefile.in
+@@ -607,8 +607,18 @@ gdb.py: hook.in Makefile
+=20
+ install-data-local: gdb.py
+ 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
+-	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
+-	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
++	@here=3D`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
++	  for file in libstdc++.*; do \
++	    case $$file in \
++	      *-gdb.py) ;; \
++	      *.la) ;; \
++	      *) if test -h $$file; then \
++	           continue; \
++	         fi; \
++	         libname=3D$$file;; \
++	    esac; \
++	  done; \
++	cd $$here; \
+ 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
+ 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
+=20
+--=20
+2.25.1
+
--=20
2.25.1

