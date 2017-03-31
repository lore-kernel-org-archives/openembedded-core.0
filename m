Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id B014977D57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=6430; q=dns/txt; s=iport;
	t=1490975516; x=1492185116;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=JSbZMJOt1Facprp15mbCoEE+bNdXE5VoP4LZRYdUV4w=;
	b=Hv0YIbfiDJ28mc0H5tR4ZwaPOpByQHeFxA9yhn33SdaBs49O/+wXXGPS
	1kP7FbGb1EWFhVho+reAZVBejoMfWXF7muQPSqM5A3/pgzrr+Bd8pUHnP
	5+F9lXU54k2RzFBk/zu7sYeBqrR46c2kS5JMSPuOPQ/PJK+i0w4AURHpc g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A4BQB+et5Y/4oNJK1UCBkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYMpK2GBC4tlgg+Qfjgfk0GCD4IOJoJGgzYCg0Y/GAECAQEBAQE?=
	=?us-ascii?q?BAWsoQg6ERQEDA3kQHAMBAi9PCBkbiWUNsBOKWwEBAQEBAQEDAQEBASQThjuCD?=
	=?us-ascii?q?YcUhgcFnBxOhn2LU4F9VI5piFyGb4QmHziBBTsgFYUbHBmBSkA1g2uFcAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.36,252,1486425600"; d="scan'208";a="401862659"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	31 Mar 2017 15:51:55 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id v2VFpYwg027027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 31 Mar 2017 15:51:55 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 15:51:29 +0000
Message-Id: <af419aa685c2a4f3bd84980b9b20ad3604093575.1490973339.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1490973338.git.spopovyc@cisco.com>
References: <cover.1490973338.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v5 2/2] automake: Adjust shebang lines to remove interpreter path hardcode
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
X-List-Received-Date: Fri, 31 Mar 2017 15:51:55 -0000

If build host perl (and other tools) is old and we use some kind
of toolchain to provide recent perl/python/etc to the OE build
we still locked to use build host perl due to hardcoded shebang
lines in automake scripts.

Behaviour was observed with Enterprise Linux 6 and devtoolset
toolchain from SCL (Software Collections) used to provide recent
version of perl (not provided with default buildtools-tarball).

Pass /usr/bin/env perl in ac_cv_path_PERL configuration variables
for class-native and class-nativesdk. Use patch to automake to replace
-w option in shebang line with modern way to enable warnings on perl
(i.e. "use warnings").

Also add nativesdk-autoconf to RDEPENDS to bring runtime dependencies
inline with other targets.

Note that ac_cv_path_PERL must be valid perl interpreter path
since configure will check perl version and Flock implementation.
It is not possible currently to use nativeperl from native
sysroot because automake does not DEPENDS on perl-native (and
doing so fails due to circular dependencies). Only possible
solution is to overwrite shebangs with nativeperl somewhere at
do_install() and update RDEPENDS for class-native. Or add perl
symlinks to nativeperl in sysroot.

For now it seems good to use perl found by /usr/bin/env from
automake-native.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
v5: Rebase against current master
v4: - skipped -
v3: Kill remnants of nativesdk-perl in RDEPENDS left from internal
    imlementation part.
    Thanks to Richard Purdie <richard.purdie@linuxfoundation.org>
v2: Corrected Upstream-Status tag.

 ...tion-in-shebangs-with-modern-use-warnings.patch | 101 +++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  13 ++-
 2 files changed, 111 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch

diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
new file mode 100644
index 0000000..fe1d3d0
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
@@ -0,0 +1,101 @@
+From 41e06b7a354774913dcd2e32a35440e407843357 Mon Sep 17 00:00:00 2001
+From: Serhii Popovych <spopovyc@cisco.com>
+Date: Wed, 10 Feb 2016 17:07:32 +0000
+Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
+ warnings"
+
+In some builds we might provide ac_cv_path_PERL as /usr/bin/env
+perl to use newer version of the perl from users PATH rather than older from
+standard system path.
+
+However using /usr/bin/env perl -w from shebang line isn't
+possible because it translates to something like
+/usr/bin/env -w perl and env complains about illegal option.
+
+To address this we can remove -w option from perl shebang
+line and add "use warnings" statement.
+
+Upstream-Status: Pending
+Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
+---
+ bin/aclocal.in     | 3 ++-
+ bin/automake.in    | 3 ++-
+ t/wrap/aclocal.in  | 3 ++-
+ t/wrap/automake.in | 3 ++-
+ 4 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/bin/aclocal.in b/bin/aclocal.in
+index 349f24a..50cb8d3 100644
+--- a/bin/aclocal.in
++++ b/bin/aclocal.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -33,6 +33,7 @@ BEGIN
+ }
+ 
+ use strict;
++use warnings;
+ 
+ use Automake::Config;
+ use Automake::General;
+diff --git a/bin/automake.in b/bin/automake.in
+index eedc8bc..e0a01cf 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
+ package Automake;
+ 
+ use strict;
++use warnings;
+ 
+ BEGIN
+ {
+diff --git a/t/wrap/aclocal.in b/t/wrap/aclocal.in
+index e64b546..9996899 100644
+--- a/t/wrap/aclocal.in
++++ b/t/wrap/aclocal.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ # @configure_input@
+ 
+ # Copyright (C) 2012-2014 Free Software Foundation, Inc.
+@@ -19,6 +19,7 @@
+ BEGIN
+ {
+   use strict;
++  use warnings;
+   @Aclocal::perl_libdirs = ('@abs_top_srcdir@/lib');
+   unshift @Aclocal::perl_libdirs, '@abs_top_builddir@/lib'
+     if '@srcdir@' ne '.';
+diff --git a/t/wrap/automake.in b/t/wrap/automake.in
+index 8b943b1..be61226 100644
+--- a/t/wrap/automake.in
++++ b/t/wrap/automake.in
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ # @configure_input@
+ 
+ # Copyright (C) 2012-2014 Free Software Foundation, Inc.
+@@ -19,6 +19,7 @@
+ BEGIN
+ {
+   use strict;
++  use warnings;
+   @Automake::perl_libdirs = ('@abs_top_srcdir@/lib');
+   unshift @Automake::perl_libdirs, '@abs_top_builddir@/lib'
+     if '@srcdir@' ne '.';
+-- 
+2.3.0
+
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index a3c72fd..a6904c8 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -17,16 +17,23 @@ RDEPENDS_${PN} += "\
     perl-module-vars "
 
 RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
+RDEPENDS_${PN}_class-nativesdk = "nativesdk-autoconf"
 
-SRC_URI += " file://python-libdir.patch \
+SRC_URI += "file://python-libdir.patch \
             file://buildtest.patch \
             file://performance.patch \
-            file://new_rt_path_for_test-driver.patch"
+            file://new_rt_path_for_test-driver.patch \
+            file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
+            "
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
 SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+PERL = "${USRBINPATH}/perl"
+PERL_class-native = "${USRBINPATH}/env perl"
+PERL_class-nativesdk = "${USRBINPATH}/env perl"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
 
 do_install_append () {
     install -d ${D}${datadir}
-- 
2.7.4


