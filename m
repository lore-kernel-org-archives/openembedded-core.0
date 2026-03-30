Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6F710D14B3
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 13:28:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51289.1774877316172397801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 06:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Yj6qd7D5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DAFB3562
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32C3F3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774877315; bh=74TD6YN1FtFP+HqwemVIkt8TxRNVa9xChZyCAyw9uag=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yj6qd7D524+O5TdVVoY2COeHRERlQfnBPi09M918zKM4i751Zxn33XwhJXPmaf8zA
	 9zSxaGsS5KrUO3HhIJVabou4k5VOyACJphOvNn9HBUTPhVI5+Ub5UwZ817igZ/ZlTm
	 B+QOcl+vQL1sP3T1r3/u1HbJ/cY0M6LcEoxhsfqA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] autoconf: upgrade to 2.73
Date: Mon, 30 Mar 2026 14:28:24 +0100
Message-ID: <20260330132825.1784802-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132825.1784802-1-ross.burton@arm.com>
References: <20260330132825.1784802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234235

man-host-perl.patch and autoreconf-exclude.patch are now upstream.

Remove a hunk from autotest-automake-result-format.patch that has no
purpose.

License-Update: postal address changed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../autoconf/autoreconf-exclude.patch         | 121 ------------------
 .../autotest-automake-result-format.patch     |  15 ---
 .../autoconf/autoconf/man-host-perl.patch     |  31 -----
 .../{autoconf_2.72.bb =3D> autoconf_2.73.bb}    |  19 +--
 4 files changed, 7 insertions(+), 179 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-ex=
clude.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/man-host-perl=
.patch
 rename meta/recipes-devtools/autoconf/{autoconf_2.72.bb =3D> autoconf_2.=
73.bb} (81%)

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.p=
atch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
deleted file mode 100644
index 28141962008..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 1a50157aa11da48921200a0d8d4308863716eab0 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 12 Mar 2020 17:25:23 +0000
-Subject: [PATCH] autoreconf-exclude.patch
-
-Upstream-Status: Inappropriate [oe specific]
-
----
- bin/autoreconf.in | 26 ++++++++++++++++++++++++++
- 1 file changed, 26 insertions(+)
-
-diff --git a/bin/autoreconf.in b/bin/autoreconf.in
-index 98ebab6..937f758 100644
---- a/bin/autoreconf.in
-+++ b/bin/autoreconf.in
-@@ -83,6 +83,7 @@ Operation modes:
-   -i, --install            copy missing standard auxiliary files
-       --no-recursive       don't rebuild sub-packages
-   -s, --symlink            with -i, install symbolic links instead of c=
opies
-+  -x, --exclude=3DSTEPS      steps we should not run
-   -m, --make               when applicable, re-run ./configure && make
-   -W, --warnings=3DCATEGORY  report the warnings falling in CATEGORY
-                            (comma-separated list accepted)
-@@ -141,6 +142,10 @@ my $run_make =3D 0;
- # Recurse into subpackages
- my $recursive =3D 1;
-=20
-+# Steps to exclude
-+my @exclude;
-+my @ex;
-+
- ## ---------- ##
- ## Routines.  ##
- ## ---------- ##
-@@ -161,6 +166,7 @@ sub parse_args ()
- 	  'B|prepend-include=3Ds'	 =3D> \@prepend_include,
- 	  'i|install'            =3D> \$install,
- 	  's|symlink'            =3D> \$symlink,
-+  	  'x|exclude=3Ds'          =3D> \@exclude,
- 	  'm|make'               =3D> \$run_make,
- 	  'recursive!'           =3D> \$recursive);
-=20
-@@ -170,6 +176,8 @@ sub parse_args ()
-   parse_WARNINGS;
-   parse_warnings @warning;
-=20
-+  @exclude =3D map { split /,/ } @exclude;
-+
-   # Even if the user specified a configure.ac, trim to get the
-   # directory, and look for configure.ac again.  Because (i) the code
-   # is simpler, and (ii) we are still able to diagnose simultaneous
-@@ -493,8 +501,11 @@ sub autoreconf_current_directory ($)
-     }
-   else
-     {
-+      @ex =3D grep (/^autopoint$/, @exclude);
-+      if ($#ex =3D=3D -1) {
-       xsystem_hint ("autopoint is needed because this package uses Gett=
ext",
-                     $autopoint);
-+      }
-     }
-=20
-=20
-@@ -691,9 +702,12 @@ sub autoreconf_current_directory ($)
- 	{
- 	  $libtoolize .=3D " --ltdl";
- 	}
-+      @ex =3D grep (/^libtoolize$/, @exclude);
-+      if ($#ex =3D=3D -1) {
-       xsystem_hint ("libtoolize is needed because this package uses Lib=
tool",
- 		    $libtoolize);
-       $rerun_aclocal =3D 1;
-+      }
-     }
-   else
-     {
-@@ -730,8 +744,11 @@ sub autoreconf_current_directory ($)
-     }
-   elsif ($install)
-     {
-+      @ex =3D grep (/^gtkdocize$/, @exclude);
-+      if ($#ex =3D=3D -1) {
-       xsystem_hint ("gtkdocize is needed because this package uses Gtkd=
oc",
- 		    $gtkdocize);
-+      }
-     }
-   else
-     {
-@@ -769,7 +786,10 @@ sub autoreconf_current_directory ($)
-   # latter runs the former, and (ii) autoconf is stricter than
-   # autoheader.  So all in all, autoconf should give better error
-   # messages.
-+  @ex =3D grep (/^autoconf$/, @exclude);
-+  if ($#ex =3D=3D -1) {
-   xsystem ($autoconf);
-+  }
-=20
-=20
-   # -------------------- #
-@@ -790,7 +810,10 @@ sub autoreconf_current_directory ($)
-     }
-   else
-     {
-+      @ex =3D grep (/^autoheader$/, @exclude);
-+      if ($#ex =3D=3D -1) {
-       xsystem ($autoheader);
-+      }
-     }
-=20
-=20
-@@ -807,7 +830,10 @@ sub autoreconf_current_directory ($)
-       # We should always run automake, and let it decide whether it sha=
ll
-       # update the file or not.  In fact, the effect of '$force' is alr=
eady
-       # included in '$automake' via '--no-force'.
-+      @ex =3D grep (/^automake$/, @exclude);
-+      if ($#ex =3D=3D -1) {
-       xsystem ($automake);
-+      }
-     }
-=20
-   # ---------------------------------------------------- #
diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-re=
sult-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-auto=
make-result-format.patch
index 38725574bac..d88e16b52fb 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-fo=
rmat.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-fo=
rmat.patch
@@ -34,21 +34,6 @@ index bf18866..8097523 100644
      [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9]])
  	at_fn_validate_ranges at_option
  	AS_VAR_APPEND([at_groups], ["$at_option$as_nl"])
-@@ -728,10 +735,10 @@ m4_divert_push([HELP_MODES])dnl
- cat <<_ATEOF || at_write_fail=3D1
-=20
- Operation modes:
--  -h, --help     print the help message, then exit
--  -V, --version  print version number, then exit
--  -c, --clean    remove all the files this test suite might create and =
exit
--  -l, --list     describes all the tests, or the selected TESTS
-+  -h, --help      print the help message, then exit
-+  -V, --version   print version number, then exit
-+  -c, --clean     remove all the files this test suite might create and=
 exit
-+  -l, --list      describes all the tests, or the selected TESTS
- _ATEOF
- m4_divert_pop([HELP_MODES])dnl
- m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl
 @@ -757,6 +764,7 @@ Execution tuning:
    -d, --debug    inhibit clean up and top-level logging
  [                 default for debugging scripts]
diff --git a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch =
b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
deleted file mode 100644
index 0f49583a641..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1c033f2a23941c46d88b9ac279f87bf2c6e99499 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 15 Jul 2020 16:03:21 +0100
-Subject: [PATCH] Don't use the target perl when regenerating the man pag=
es.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- man/local.mk | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/man/local.mk b/man/local.mk
-index 775c131..ba94753 100644
---- a/man/local.mk
-+++ b/man/local.mk
-@@ -77,13 +77,12 @@ SUFFIXES +=3D .w .1
- 	@echo "Updating man page $@"
- 	$(MKDIR_P) $(@D)
- 	PATH=3D"$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH"; \
--	PERL=3D"$(PERL)"; \
- 	PACKAGE_NAME=3D"$(PACKAGE_NAME)"; \
- 	VERSION=3D"$(VERSION)"; \
- 	RELEASE_YEAR=3D"$(RELEASE_YEAR)"; \
- 	top_srcdir=3D"$(top_srcdir)"; \
- 	channeldefs_pm=3D"$(channeldefs_pm)"; \
--	export PATH PERL PACKAGE_NAME VERSION RELEASE_YEAR; \
-+	export PATH PACKAGE_NAME VERSION RELEASE_YEAR; \
- 	export top_srcdir channeldefs_pm; \
- 	$(HELP2MAN) \
- 	    --include=3D$(srcdir)/$*.x \
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.73.bb
similarity index 81%
rename from meta/recipes-devtools/autoconf/autoconf_2.72.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.73.bb
index b599f270c79..2dd8fb27721 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
@@ -8,27 +8,22 @@ SECTION =3D "devel"
 DEPENDS =3D "m4-native autoconf-native automake-native gnu-config-native=
 help2man-native"
 DEPENDS:remove:class-native =3D "autoconf-native automake-native help2ma=
n-native"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef=
16c \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6=
dce \
 		    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
=20
 SRC_URI =3D " \
            ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://program_prefix.patch \
-           file://autoreconf-exclude.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
-           file://man-host-perl.patch \
 "
 SRC_URI:append:class-native =3D " file://no-man.patch"
=20
-SRC_URI[sha256sum] =3D "afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef7=
9ebedc4467d92d6e"
+SRC_URI[sha256sum] =3D "259ddfa3bddc799cfb81489cc0f17dfdf1bd6d1505dda53c=
0f45ff60d6a4f9a7"
=20
-# Remove this when upgrading past 2.72, as package managers sort 2.72e (=
the
-# fifth release candidate) after 2.72.
-PKGV =3D "2.72e+really${PV}"
-
-RDEPENDS:${PN} =3D "m4 gnu-config \
+RDEPENDS:${PN} =3D "m4 \
+		  gnu-config \
 		  perl \
 		  perl-module-bytes \
 		  perl-module-carp \
@@ -45,13 +40,13 @@ RDEPENDS:${PN} =3D "m4 gnu-config \
 		  perl-module-file-spec \
 		  perl-module-file-spec-unix \
 		  perl-module-file-stat \
-                  perl-module-file-temp \
+		  perl-module-file-temp \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
-                  perl-module-list-util \
+		  perl-module-list-util \
 		  perl-module-overloading \
 		  perl-module-posix \
-                  perl-module-scalar-util \
+		  perl-module-scalar-util \
 		  perl-module-symbol \
 		  perl-module-thread-queue \
 		  perl-module-threads \
--=20
2.43.0


