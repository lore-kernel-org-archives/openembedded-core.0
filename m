Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id D95F777A93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=7086; q=dns/txt; s=iport;
	t=1490726467; x=1491936067;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=7LW/rgesNW3OKwmJAI1Tw4Pd69eQdeSNCaauDDHNHwg=;
	b=EJzN4mH9NBDcN9WGfib2mnrkOjS1IP+5CBpYC8EjX+OJevuRy09JP8e8
	Qgl25UXffiVWAsl2eO502M0lAGSgJoKnea18KV8pLIb+6YGJtj4+UhvMS
	dV4E4quYYlqgZBYWliF3z+n2A8AcK2LLQtRAFcrwlk7/i51nR+yZhSzdn 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BCAwDYrdpY/4ENJK1VCBkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYMpK2GBC41xkHlXijeCVoYwgg+CDiaCRoM2AoMjPxgBAgEBAQE?=
	=?us-ascii?q?BAQFrKIUVAQMDeRAcAwECL08IGRuJXw2vYopMAQEBAQEBAQMBAQEBASMThjuJE?=
	=?us-ascii?q?w6GBwWJHoZDjH+GfItTAoF6VI5jiFiGbIQmHziBBDofFYUaHBmBSkA1hxWCPQE?=
	=?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="403597593"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:41:06 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIf5Fn019345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:41:05 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:40:55 +0000
Message-Id: <1490726455-54345-1-git-send-email-spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <9cd3399c646482fbcf00e7d4ecb6f8c0a3d8b5ea.1490722167.git.spopovyc@cisco.com>
References: <9cd3399c646482fbcf00e7d4ecb6f8c0a3d8b5ea.1490722167.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v2 2/2] autoconf: Adjust shebang lines to remove interpreter path hardcode
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
X-List-Received-Date: Tue, 28 Mar 2017 18:41:06 -0000

If build host perl (and other tools) is old and we use some kind
of toolchain to provide recent perl/python/etc to the OE build
we still locked to use build host perl due to hardcoded shebang
lines in autoconf scripts.

Behaviour was observed with Enterprise Linux 6 and devtoolset
toolchain from SCL (Software Collections) used to provide recent
version of perl (not provided with default buildtools-tarball).

Pass /usr/bin/env perl in ac_cv_path_PERL configuration variables
for class-native and class-nativesdk. Use patch to autoconf to replace
-w option in shebang line with modern way to enable warnings on perl
(i.e. "use warnings").

Note that ac_cv_path_PERL must be valid perl interpreter path
since configure will check perl version and Flock implementation.
It is not possible currently to use nativeperl from native
sysroot because autoconf does not DEPENDS on perl-native (and
doing so fails due to circular dependencies). Only possible
solution is to overwrite shebangs with nativeperl somewhere at
do_install() and update RDEPENDS for class-native. Or add perl
symlinks to nativeperl in sysroot.

For now it seems good to use perl found by /usr/bin/env from
autoconf-native.

Also add RDEPENDS for class-nativesdk and add nativesdk-perl
to them.

v2: Just realized that files in quilt directory (.pc) patched
    unnecessarily.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc        |   7 +-
 ...tion-in-shebangs-with-modern-use-warnings.patch | 120 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 3 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index b4e3356..408c5c9 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -27,13 +27,18 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-data-dumper \
 		 "
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_class-nativesdk = "nativesdk-m4 nativesdk-gnu-config nativesdk-perl"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
 
 inherit autotools texinfo
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+PERL = "${USRBINPATH}/perl"
+PERL_class-native = "/usr/bin/env perl"
+PERL_class-nativesdk = "/usr/bin/env perl"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
 
 do_configure() {
 	oe_runconf
diff --git a/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
new file mode 100644
index 0000000..38457d1
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
@@ -0,0 +1,120 @@
+From 236552ff5b9f1ebf666d8d0e9850007dcce03d26 Mon Sep 17 00:00:00 2001
+From: Serhii Popovych <spopovyc@cisco.com>
+Date: Wed, 10 Feb 2016 16:32:44 +0000
+Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
+ warnings"
+
+In some builds we might provide ac_cv_path_PERL as /usr/bin/env perl
+to use newer version of the perl from users PATH rather than
+older from standard system path.
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
+ bin/autom4te.in                                          | 3 ++-
+ bin/autoreconf.in                                        | 3 ++-
+ bin/autoscan.in                                          | 3 ++-
+ bin/autoupdate.in                                        | 3 ++-
+ bin/ifnames.in                                           | 3 ++-
+ 5 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/bin/autom4te.in b/bin/autom4te.in
+index 11773c9..a8f5e41 100644
+--- a/bin/autom4te.in
++++ b/bin/autom4te.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -42,6 +42,7 @@ use Autom4te::General;
+ use Autom4te::XFile;
+ use File::Basename;
+ use strict;
++use warnings;
+ 
+ # Data directory.
+ my $pkgdatadir = $ENV{'AC_MACRODIR'} || '@pkgdatadir@';
+diff --git a/bin/autoreconf.in b/bin/autoreconf.in
+index e245db4..1a318cb 100644
+--- a/bin/autoreconf.in
++++ b/bin/autoreconf.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -45,6 +45,7 @@ use Autom4te::XFile;
+ # Do not use Cwd::chdir, since it might hang.
+ use Cwd 'cwd';
+ use strict;
++use warnings;
+ 
+ ## ----------- ##
+ ## Variables.  ##
+diff --git a/bin/autoscan.in b/bin/autoscan.in
+index a67c48d..b931249 100644
+--- a/bin/autoscan.in
++++ b/bin/autoscan.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -43,6 +43,7 @@ use Autom4te::XFile;
+ use File::Basename;
+ use File::Find;
+ use strict;
++use warnings;
+ 
+ use vars qw(@cfiles @makefiles @shfiles @subdirs %printed);
+ 
+diff --git a/bin/autoupdate.in b/bin/autoupdate.in
+index 9737d49..92cb147 100644
+--- a/bin/autoupdate.in
++++ b/bin/autoupdate.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -44,6 +44,7 @@ use Autom4te::General;
+ use Autom4te::XFile;
+ use File::Basename;
+ use strict;
++use warnings;
+ 
+ # Lib files.
+ my $autom4te = $ENV{'AUTOM4TE'} || '@bindir@/@autom4te-name@';
+diff --git a/bin/ifnames.in b/bin/ifnames.in
+index ba2cd05..74b0278 100644
+--- a/bin/ifnames.in
++++ b/bin/ifnames.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ # -*- perl -*-
+ # @configure_input@
+ 
+@@ -44,6 +44,7 @@ BEGIN
+ use Autom4te::General;
+ use Autom4te::XFile;
+ use Autom4te::FileUtils;
++use warnings;
+ 
+ # $HELP
+ # -----
+-- 
+2.3.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index fd01585..8e67f4b 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://check-automake-cross-warning.patch \
             file://add_musl_config.patch \
             file://performance.patch \
             file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
+            file://autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-- 
2.7.4


