Return-Path: <spopovyc@cisco.com>
X-Greylist: delayed 565 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 18:36:49 UTC
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id 1698D72FA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=6163; q=dns/txt; s=iport;
	t=1490726213; x=1491935813;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=vkh5yWT69M/FMyxd2kGGdnjeNTjC+Fb47gro/OHk3/E=;
	b=U/y1kG+aU9wT3nT+pEJq+z1Q+BwHgGTLjt0llgAGWIRH9AiB1VSe2Ek6
	x2jFH4P13sti7m4G4jyLmG6mSYf+LD9eRoD6W5u7E/qvvvCVl8KJfoczd
	CcNGl3qJzqt5hvUl6pUyTxLEeeEX7txepLpZLp3pm9RGuvdfSSyIiR4Tp w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ATAwAaqtpY/4ENJK1VCBkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYMpK2GBC41xkHk4H5M9gg+CDiaCRoM2AoMjPxgBAgEBAQEBAQF?=
	=?us-ascii?q?rKEIOhEUBAwN5EBwDAQIvTwgZG4lfDa9Qik0BAQEBAQEBAwEBAQEkE4Y7gg2HF?=
	=?us-ascii?q?IYHBZwTTYZ8i1OBfFSOY4hYhmyEJh84gQQ6HxWFGhwZgUpANYNxhWEBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="403211096"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:27:25 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIRFr5006083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:27:24 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:26:48 +0000
Message-Id: <559792d4c7203270a678b3c1e09e709ebe04870b.1490722167.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1490722167.git.spopovyc@cisco.com>
References: <cover.1490722167.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH 2/2] automake: Adjust shebang lines to remove interpreter path hardcode
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
X-List-Received-Date: Tue, 28 Mar 2017 18:36:51 -0000

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

Also add RDEPENDS for class-nativesdk and add nativesdk-perl to
them.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 ...tion-in-shebangs-with-modern-use-warnings.patch | 99 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    | 13 ++-
 2 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch

diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
new file mode 100644
index 0000000..cae5ab9
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
@@ -0,0 +1,99 @@
+From 41e06b7a354774913dcd2e32a35440e407843357 Mon Sep 17 00:00:00 2001
+From: Serhii Popovych <spopovyc@cisco.com>
+Date: Wed, 10 Feb 2016 17:07:32 +0000
+Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
+ warnings" In some builds we might provide ac_cv_path_PERL as /usr/bin/env
+ perl to use newer version of the perl from users PATH rather than older from
+ standard system path.
+
+However using /usr/bin/env perl -w from shebang line isn't
+possible because it translates to something like
+/usr/bin/env -w perl and env complains about illegal option.
+
+To address this we can remove -w option from perl shebang
+line and add "use warnings" statement.
+
+Upstream-Status: Penging
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
index a3c72fd..442d093 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -17,16 +17,23 @@ RDEPENDS_${PN} += "\
     perl-module-vars "
 
 RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
+RDEPENDS_${PN}_class-nativesdk = "nativesdk-autoconf nativesdk-perl"
 
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


