Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SVAWJ-0000kR-A1
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:54:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4HNi73X026230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 16:44:07 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 May 2012 16:44:07 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 18:46:43 -0500
Message-ID: <986afd705334ee4df1c2890b6801822faa6b2a4e.1337298293.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337298293.git.mark.hatle@windriver.com>
References: <cover.1337298293.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/5 v2] ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
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
X-List-Received-Date: Thu, 17 May 2012 23:54:12 -0000
Content-Type: text/plain

RPM 5.4.9 now strongly encourages you to have the ossp-uuid library available.

Add this recipe, and change RPM to use the uuid functionality.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../ossp-uuid/0001-Change-library-name.patch       |  112 ++++++++++++++++++++
 ...erve-m-option-status-in-v-option-handling.patch |   55 ++++++++++
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |   51 +++++++++
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |   36 ++++++
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |   24 ++++
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |   16 +++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   58 ++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |   20 ++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   11 ++-
 9 files changed, 380 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
new file mode 100644
index 0000000..a46e244
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
@@ -0,0 +1,112 @@
+From: Piotr Roszatycki <dexter@debian.org>
+Date: Wed, 27 Jan 2010 16:53:11 +0100
+Subject: [PATCH] Change library name
+
+The soname was changed to ossp-uuid to prevend the name clash with e2fsprogs's
+uuid library.
+---
+ Makefile.in      |    6 +++---
+ perl/Makefile.PL |   12 ++++++------
+ php/config.m4    |    2 +-
+ uuid-config.in   |    2 +-
+ uuid.pc.in       |    4 ++--
+ 5 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index d28f4be..c2ba99d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -62,13 +62,13 @@ PERL        = @PERL@
+ PHP         = @PHP@
+ PG_CONFIG   = @PG_CONFIG@
+ 
+-LIB_NAME    = libuuid.la
++LIB_NAME    = libossp-uuid.la
+ LIB_OBJS    = uuid.lo uuid_md5.lo uuid_sha1.lo uuid_prng.lo uuid_mac.lo uuid_time.lo uuid_ui64.lo uuid_ui128.lo uuid_str.lo
+ 
+-DCE_NAME    = libuuid_dce.la
++DCE_NAME    = libossp-uuid_dce.la
+ DCE_OBJS    = uuid_dce.lo $(LIB_OBJS)
+ 
+-CXX_NAME    = libuuid++.la
++CXX_NAME    = libossp-uuid++.la
+ CXX_OBJS    = uuid++.lo $(LIB_OBJS)
+ 
+ PRG_NAME    = uuid
+diff --git a/perl/Makefile.PL b/perl/Makefile.PL
+index 92f4494..9c6fee6 100644
+--- a/perl/Makefile.PL
++++ b/perl/Makefile.PL
+@@ -33,9 +33,9 @@ use Config;
+ use ExtUtils::MakeMaker;
+ 
+ #   determine source directory
+-my ($srcdir) = map { my $d = $_; $d =~ s/\/libuuid\.la$//; $d }
+-               grep { -f $_ } ("../libuuid.la", glob("../*/libuuid.la"))
+-    or die "no source directory found (where libuuid.la is located)";
++my ($srcdir) = map { my $d = $_; $d =~ s/\/libossp-uuid\.la$//; $d }
++               grep { -f $_ } ("../libossp-uuid.la", glob("../*/libossp-uuid.la"))
++    or die "no source directory found (where libossp-uuid.la is located)";
+ 
+ #   determine extra build options
+ my $compat = 0;
+@@ -47,15 +47,15 @@ WriteMakefile(
+     VERSION_FROM      => 'uuid.pm',
+     ABSTRACT_FROM     => 'uuid.pod',
+     PREREQ_PM         => {},
+-    LIBS              => [ "-L$srcdir/.libs -L$srcdir -luuid" ],
++    LIBS              => [ "-L$srcdir/.libs -L$srcdir -lossp-uuid" ],
+     DEFINE            => '',
+     INC               => "-I. -I$srcdir",
+     PM                => { 'uuid.pm'   => '$(INST_LIBDIR)/uuid.pm',
+                            'uuid.pod'  => '$(INST_LIBDIR)/uuid.pod',
+                            ($compat ? ('uuid_compat.pm'  => '$(INST_LIBDIR)/../Data/UUID.pm')  : ()),
+                            ($compat ? ('uuid_compat.pod' => '$(INST_LIBDIR)/../Data/UUID.pod') : ()), },
+-    MAN3PODS          => { 'uuid.pod' => '$(INST_MAN3DIR)/OSSP::uuid.3',
+-                           ($compat ? ('uuid_compat.pod' => '$(INST_MAN3DIR)/Data::UUID.3') : ()), },
++    MAN3PODS          => { 'uuid.pod' => '$(INST_MAN3DIR)/OSSP::uuid.3pm',
++                           ($compat ? ('uuid_compat.pod' => '$(INST_MAN3DIR)/Data::UUID.3pm') : ()), },
+     TYPEMAPS          => [ 'uuid.tm' ],
+     test              => { TESTS => 'uuid.ts' . ($compat ? ' uuid_compat.ts' : '') },
+     NO_META           => 1,
+diff --git a/php/config.m4 b/php/config.m4
+index 5091b96..969b457 100644
+--- a/php/config.m4
++++ b/php/config.m4
+@@ -34,7 +34,7 @@ if test "$PHP_UUID" != "no"; then
+     PHP_NEW_EXTENSION(uuid, uuid.c, $ext_shared)
+     AC_DEFINE(HAVE_UUID, 1, [Have OSSP uuid library])
+     PHP_ADD_LIBPATH([..], )
+-    PHP_ADD_LIBRARY([uuid],, UUID_SHARED_LIBADD)
++    PHP_ADD_LIBRARY([ossp-uuid],, UUID_SHARED_LIBADD)
+     PHP_ADD_INCLUDE([..])
+     PHP_SUBST(UUID_SHARED_LIBADD)
+ 
+diff --git a/uuid-config.in b/uuid-config.in
+index 8d2a063..5b58812 100644
+--- a/uuid-config.in
++++ b/uuid-config.in
+@@ -121,7 +121,7 @@ do
+             output_extra="$output_extra $uuid_ldflags"
+             ;;
+         --libs)
+-            output="$output -luuid"
++            output="$output -lossp-uuid"
+             output_extra="$output_extra $uuid_libs"
+             ;;
+         * )
+diff --git a/uuid.pc.in b/uuid.pc.in
+index c76ad1e..de00c2f 100644
+--- a/uuid.pc.in
++++ b/uuid.pc.in
+@@ -36,7 +36,7 @@ Name: OSSP uuid
+ Description: Universally Unique Identifier (UUID) Library
+ Version: @UUID_VERSION_RAW@
+ URL: http://www.ossp.org/pkg/lib/uuid/
+-Cflags: -I${includedir}
+-Libs: -L${libdir} -luuid
++Cflags: -I${includedir}/ossp
++Libs: -L${libdir} -lossp-uuid
+ Libs.private: @LIBS@
+ 
+-- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
new file mode 100644
index 0000000..1467207
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
@@ -0,0 +1,55 @@
+From: Marco Nenciarini <marco.nenciarini@devise.it>
+Date: Wed, 27 Jan 2010 19:46:21 +0100
+Subject: [PATCH] uuid: preserve -m option status in -v option handling
+
+Bug: 531396
+---
+ uuid_cli.c |   19 ++++++++++---------
+ 1 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/uuid_cli.c b/uuid_cli.c
+index d1b0b11..14a67fe 100644
+--- a/uuid_cli.c
++++ b/uuid_cli.c
+@@ -140,11 +140,12 @@ int main(int argc, char *argv[])
+                 i = strtol(optarg, &p, 10);
+                 if (*p != '\0')
+                     usage("invalid argument to option 'v'");
++                version &= ~(UUID_MAKE_V1|UUID_MAKE_V3|UUID_MAKE_V4|UUID_MAKE_V5);
+                 switch (i) {
+-                    case 1: version = UUID_MAKE_V1; break;
+-                    case 3: version = UUID_MAKE_V3; break;
+-                    case 4: version = UUID_MAKE_V4; break;
+-                    case 5: version = UUID_MAKE_V5; break;
++                    case 1: version |= UUID_MAKE_V1; break;
++                    case 3: version |= UUID_MAKE_V3; break;
++                    case 4: version |= UUID_MAKE_V4; break;
++                    case 5: version |= UUID_MAKE_V5; break;
+                     default:
+                         usage("invalid version on option 'v'");
+                         break;
+@@ -213,10 +214,10 @@ int main(int argc, char *argv[])
+     }
+     else {
+         /* encoding */
+-        if (   (version == UUID_MAKE_V1 && argc != 0)
+-            || (version == UUID_MAKE_V3 && argc != 2)
+-            || (version == UUID_MAKE_V4 && argc != 0)
+-            || (version == UUID_MAKE_V5 && argc != 2))
++        if (   (version & UUID_MAKE_V1 && argc != 0)
++            || (version & UUID_MAKE_V3 && argc != 2)
++            || (version & UUID_MAKE_V4 && argc != 0)
++            || (version & UUID_MAKE_V5 && argc != 2))
+             usage("invalid number of arguments");
+         if ((rc = uuid_create(&uuid)) != UUID_RC_OK)
+             error(1, "uuid_create: %s", uuid_error(rc));
+@@ -232,7 +233,7 @@ int main(int argc, char *argv[])
+                 if ((rc = uuid_load(uuid, "nil")) != UUID_RC_OK)
+                     error(1, "uuid_load: %s", uuid_error(rc));
+             }
+-            if (version == UUID_MAKE_V3 || version == UUID_MAKE_V5) {
++            if (version & UUID_MAKE_V3 || version & UUID_MAKE_V5) {
+                 if ((rc = uuid_create(&uuid_ns)) != UUID_RC_OK)
+                     error(1, "uuid_create: %s", uuid_error(rc));
+                 if ((rc = uuid_load(uuid_ns, argv[0])) != UUID_RC_OK) {
+-- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
new file mode 100644
index 0000000..060a754
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
@@ -0,0 +1,51 @@
+From: Marco Nenciarini <marco.nenciarini@devise.it>
+Date: Tue, 2 Feb 2010 12:16:49 +0100
+Subject: [PATCH] Fix whatis entries
+
+Fix whatis entry of uuid.1, uuid.3ossp and uuid++.3ossp manpages
+---
+ uuid++.pod   |    2 +-
+ uuid.pod     |    2 +-
+ uuid_cli.pod |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/uuid++.pod b/uuid++.pod
+index 8b5a4b1..89c5efb 100644
+--- a/uuid++.pod
++++ b/uuid++.pod
+@@ -31,7 +31,7 @@
+ 
+ =head1 NAME
+ 
+-B<OSSP uuid> - B<Universally Unique Identifier> (C++ API)
++B<uuid++> - B<Universally Unique Identifier> (C++ API)
+ 
+ =head1 VERSION
+ 
+diff --git a/uuid.pod b/uuid.pod
+index 4ad3742..0179a46 100644
+--- a/uuid.pod
++++ b/uuid.pod
+@@ -31,7 +31,7 @@
+ 
+ =head1 NAME
+ 
+-B<OSSP uuid> - B<Universally Unique Identifier>
++B<uuid> - B<Universally Unique Identifier>
+ 
+ =head1 VERSION
+ 
+diff --git a/uuid_cli.pod b/uuid_cli.pod
+index ddec6bb..df9dc83 100644
+--- a/uuid_cli.pod
++++ b/uuid_cli.pod
+@@ -31,7 +31,7 @@
+ 
+ =head1 NAME
+ 
+-B<OSSP uuid> - B<Universally Unique Identifier Command-Line Tool>
++B<uuid> - B<Universally Unique Identifier Command-Line Tool>
+ 
+ =head1 VERSION
+ 
+-- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
new file mode 100644
index 0000000..1f92cea
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
@@ -0,0 +1,36 @@
+Description: Support dash-less args to from_string.
+Author: Tim Retout <diocles@debian.org>
+Bug-Debian: http://bugs.debian.org/635607
+
+The module Data::GUID depends on Data::UUID supporting this behaviour.
+
+--- a/perl/uuid_compat.pm
++++ b/perl/uuid_compat.pm
+@@ -93,7 +93,9 @@
+     $uuid->import('str',
+           $str =~ /^0x/
+         ? join '-', unpack('x2 a8 a4 a4 a4 a12', $str)
+-        : $str
++        : $str =~ /-/
++        ? $str
++        : join '-', unpack('A8 A4 A4 A4 A12', $str)
+     );
+     return $uuid->export('bin');
+ }
+--- a/perl/uuid_compat.ts
++++ b/perl/uuid_compat.ts
+@@ -28,7 +28,7 @@
+ ##  uuid_compat.ts: Data::UUID Backward Compatibility Perl API (Perl test suite part)
+ ##
+ 
+-use Test::More tests => 14;
++use Test::More tests => 16;
+ 
+ BEGIN {
+     use_ok('Data::UUID');
+@@ -53,3 +53,5 @@
+ ok($uuid8 = $ug->from_string("6ba7b811-9dad-11d1-80b4-00c04fd430c8"));
+ ok($ug->compare($uuid7, $uuid8) == 0);
+ 
++ok($uuid9 = $ug->from_string("6ba7b8119dad11d180b400c04fd430c8"));
++ok($ug->compare($uuid7, $uuid9) == 0);
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
new file mode 100644
index 0000000..97daca4
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
@@ -0,0 +1,24 @@
+Remove hardcoded libtool name, fall back to generated name
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur uuid-1.6.2.orig/Makefile.in uuid-1.6.2/Makefile.in
+--- uuid-1.6.2.orig/Makefile.in	2012-05-14 14:37:19.579672930 -0500
++++ uuid-1.6.2/Makefile.in	2012-05-14 14:37:49.112733787 -0500
+@@ -32,6 +32,7 @@
+ VPATH       = @srcdir@
+ srcdir      = @srcdir@
+ top_srcdir  = @top_srcdir@
++top_builddir = @top_builddir@
+ S           = $(srcdir)
+ C           = .
+ 
+@@ -55,7 +56,7 @@
+ CP          = cp
+ RMDIR       = rmdir
+ SHTOOL      = $(S)/shtool
+-LIBTOOL     = $(C)/libtool
++LIBTOOL     = @LIBTOOL@
+ TRUE        = true
+ POD2MAN     = pod2man
+ PERL        = @PERL@
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
new file mode 100644
index 0000000..78f3c94
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
@@ -0,0 +1,16 @@
+We don't want anything stripped
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur uuid-1.6.2.orig/Makefile.in uuid-1.6.2/Makefile.in
+--- uuid-1.6.2.orig/Makefile.in	2012-05-14 14:42:42.225789456 -0500
++++ uuid-1.6.2/Makefile.in	2012-05-14 15:03:03.119733400 -0500
+@@ -254,7 +254,7 @@
+ 	-@if [ ".$(WITH_CXX)" = .yes ]; then \
+ 	    $(LIBTOOL) --mode=install $(SHTOOL) install -c -m 644 $(CXX_NAME) $(DESTDIR)$(libdir)/; \
+ 	fi
+-	@$(LIBTOOL) --mode=install $(SHTOOL) install -c -s -m 755 uuid $(DESTDIR)$(bindir)/
++	@$(LIBTOOL) --mode=install $(SHTOOL) install -c -m 755 uuid $(DESTDIR)$(bindir)/
+ 	$(SHTOOL) install -c -m 644 $(S)/uuid.1 $(DESTDIR)$(mandir)/man1/
+ 	-@if [ ".$(WITH_PERL)" = .yes ]; then \
+ 	    (cd $(S)/perl && $(MAKE) $(MFLAGS) install DESTDIR=$(DESTDIR)); \
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
new file mode 100644
index 0000000..cc1ec75
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -0,0 +1,58 @@
+SUMMARY = "Universally Unique Identifier (UUID) library" 
+DESCRIPTION = "OSSP uuid is a ISO-C:1999 application programming interface \
+(API) and corresponding command line interface (CLI) for the generation of \
+DCE 1.1, ISO/IEC 11578:1996 and RFC 4122 compliant Universally Unique \
+Identifier (UUID). It supports DCE 1.1 variant UUIDs of version 1 (time \
+and node based), version 3 (name based, MD5), version 4 (random number \
+based) and version 5 (name based, SHA-1)."
+DESCRIPTION_uuid = "This package contains a tool to create Universally \
+Unique Identifiers (UUID) from the command-line."
+
+HOMEPAGE = "http://www.ossp.org/pkg/lib/uuid/"
+SECTION = "libs"
+
+LICENSE = "ossp_uuid"
+LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6ad9d9d769ee960e"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz \
+	   file://0001-Change-library-name.patch \
+	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
+	   file://0003-Fix-whatis-entries.patch \
+	   file://0004-fix-data-uuid-from-string.patch \
+	   file://uuid-libtool.patch \
+	   file://uuid-nostrip.patch \
+	  "
+SRC_URI[md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
+SRC_URI[sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
+
+S = "${WORKDIR}/uuid-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--without-dce --without-cxx --without-perl --without-perl-compat --without-php --without-pgsql"
+EXTRA_OECONF = "--includedir=${includedir}/ossp"
+
+do_configure_prepend() {
+  # This package has a completely custom aclocal.m4
+  # so we need to back it up and make it usable...
+  if [ ! -e m4/ossp.m4 ]; then
+    mkdir m4
+    mv aclocal.m4 m4/ossp.m4
+  fi
+
+  rm -f libtool.m4
+}
+
+do_install_append() {
+  mkdir -p  ${D}${includedir}/ossp
+  mv ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/pkgconfig/ossp-uuid.pc
+}
+
+PACKAGES =+ "uuid"
+FILES_uuid = "${bindir}/uuid"
+FILES_${PN} = "${libdir}/libossp-uuid.so.16*"
+FILES_${PN}-dev += "${bindir}/uuid-config"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch b/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
new file mode 100644
index 0000000..1f4ba98
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
@@ -0,0 +1,20 @@
+Fix integration of ossp-uuid
+
+We need to avoid including the util-linux uuid library, instead
+we need ossp-uuid.  There is a related hack in do_configure to
+make sure that we use the right .pc file as well.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
+--- rpm-5.4.9.orig/configure.ac	2012-05-17 16:37:20.594790192 -0500
++++ rpm-5.4.9/configure.ac	2012-05-17 16:39:23.126933596 -0500
+@@ -1909,7 +1909,7 @@
+ esac
+ RPM_CHECK_LIB(
+     [OSSP uuid], [uuid],
+-    [ossp-uuid uuid], [uuid_import], [uuid.h],
++    [ossp-uuid], [uuid_import], [uuid.h],
+     [no,external:none], [],
+     [ dnl # enable OSSP uuid native API support for embedded Lua
+       if test ".$WITH_LUA" = .yes; then
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3c22f22..2ae1b4e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -42,8 +42,8 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "libpcre attr acl popt file"
-PR = "r38"
+DEPENDS = "libpcre attr acl popt ossp-uuid file"
+PR = "r39"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -67,6 +67,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-resolvedep.patch \
 	   file://rpm-no-perl-urpm.patch \
 	   file://rpm-lua.patch \
+	   file://rpm-ossp-uuid.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
@@ -143,7 +144,7 @@ EXTRA_OECONF += "--verbose \
 		--without-gnutls \
 		--with-pcre \
 		--enable-utf8 \
-		--without-uuid \
+		--with-uuid \
 		--with-attr \
 		--with-acl \
 		--with-popt=external \
@@ -328,6 +329,10 @@ do_configure() {
 
 	./autogen.sh
 
+	# NASTY hack to make sure configure files the right pkg-config file...
+	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
+	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i configure
+
 	export varprefix=${localstatedir}
 	export CC_FOR_BUILD="${BUILD_CC}"
 	oe_runconf
-- 
1.7.3.4



