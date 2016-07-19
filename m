Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9699F60722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 14:37:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id q128so21680247wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g/2FMKl38xw1/gomS6KOoHOjQzhNdOe9f8vtAPeMwqk=;
	b=FKQVQ4i/Sn2IXUlcN+rxH7c7auZ/qBlgRTcZfP7Nxlq8J0a/E0QFO6HQ4LYBT7st9S
	f9Kzh4isuBGVL5ZOUDRPRLZprF1wOwoWaw0PdMDQ4KcrC5ah1YIn5vCQHKxQ6kjLMfcm
	5zhr1dK8521y3whGTWvLKMmXu1xDBmEBT/Z0+n9YEF2fhGbza4OsdU8mc5IWjpttBCwC
	XLc/JrytT8WXhKjW6P/yngBkKTpGBS5T3eY0NdC95fjhz1m5uTj6NisuTesvx05VXprB
	kwSMO3ccylOQVtxE6925/LkjFyvIkB5K1Zjlo2uocMqE1W1V7TncEJ3QeERYRBUjSkbf
	iEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g/2FMKl38xw1/gomS6KOoHOjQzhNdOe9f8vtAPeMwqk=;
	b=EVFY6nLR0/HwS4s9DT8ysQ2PeSUf13j917oDXdusoHBjG0BQXRR0HsWlaNvzHitHt6
	YGcURWZZykDCiSztCSJJPQl39OA9bx9aRppp9Bm6MgZ2F5oXZqD6R5RIDlv/NdUPpMci
	a7L6yvWzbQ47eNS1g4wleoXKPyZLQNUfr388XRKoj7kOLRR8UCS5xefndtL5SuwVMylS
	v2mr2YplyuZrK0ZKf3R/hZ284HlalXcsTBWlRbIEWA2TaiIpJ0HOY2E2r90vAIV4BqZR
	kqQSpcW9419a2/F+kXza3Odxg9QdYKrGfDillUcEeV2Q2q8ffRv4w4wL7WfjcgNaaAbW
	/CXw==
X-Gm-Message-State: ALyK8tLmaxk2OaGLYeIqbchqbaKwX16OhFqzqbB74DaHseiR0YTEXDDXMKP4bxYv3EbRlQLN
X-Received: by 10.28.144.80 with SMTP id s77mr4970684wmd.41.1468939072260;
	Tue, 19 Jul 2016 07:37:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i80sm7244453wmf.11.2016.07.19.07.37.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 07:37:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 15:37:47 +0100
Message-Id: <1468939067-17286-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468939067-17286-1-git-send-email-ross.burton@intel.com>
References: <1468939067-17286-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] intltool: remove broken XML::Parser detection
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
X-List-Received-Date: Tue, 19 Jul 2016 14:37:52 -0000

intltool.m4 has a chunk of code that runs during configure which probes for a
perl binary and verifies that it has the XML::Parser module.  However in builds
using intltool-native the perl binary that it finds is likely to not be the one
that the intltool scripts will be using as the scripts hardcode nativeperl yet
the m4 fragment searches for "perl" in $PATH.  If the host perl doesn't have
XML::Parser the configure will fail, despite the fact that the scripts will
work.

Solve this by taking an old patch from the upstream bug system to simply remove
the check in intltool.m4 as it's generally useless, and remove existing patches
that almost but not quite solved this issue.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../intltool/intltool/remove-perl-check.patch      | 42 ++++++++++++++++++++++
 .../intltool/intltool/remove-xml-check.patch       | 33 -----------------
 .../intltool/intltool/use-nativeperl.patch         | 20 -----------
 meta/recipes-devtools/intltool/intltool_0.51.0.bb  | 21 +++++------
 4 files changed, 50 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
 delete mode 100644 meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
 delete mode 100644 meta/recipes-devtools/intltool/intltool/use-nativeperl.patch

diff --git a/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch b/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
new file mode 100644
index 0000000..bea0895
--- /dev/null
+++ b/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
@@ -0,0 +1,42 @@
+Remove the perl checks in intltool.m4.  This can find a different perl binary to
+the one that the intltool scripts will actually be using (as they hard-code a
+specific binary), for example in the intltool-native case they'll be using
+nativeperl yet this fragment can find and test the host perl.
+
+This can result in recipes failing in do_configure as intltool.m4 finds a host
+perl which doesn't have XML::Parser installed, despite the fact that intltool
+will work fine as nativeperl has XML::Parser.
+
+Upstream-Status: Submitted (https://bugs.launchpad.net/intltool/+bug/1197875)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- a/intltool.m4.orig	2013-07-02 11:22:23.000000000 -0700
++++ b/intltool.m4	2013-07-02 11:22:32.000000000 -0700
+@@ -131,27 +131,6 @@ if test -z "$xgversion" -o -z "$mmversio
+     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
+ fi
+ 
+-AC_PATH_PROG(INTLTOOL_PERL, perl)
+-if test -z "$INTLTOOL_PERL"; then
+-   AC_MSG_ERROR([perl not found])
+-fi
+-AC_MSG_CHECKING([for perl >= 5.8.1])
+-$INTLTOOL_PERL -e "use 5.8.1;" > /dev/null 2>&1
+-if test $? -ne 0; then
+-   AC_MSG_ERROR([perl 5.8.1 is required for intltool])
+-else
+-   IT_PERL_VERSION=`$INTLTOOL_PERL -e "printf '%vd', $^V"`
+-   AC_MSG_RESULT([$IT_PERL_VERSION])
+-fi
+-if test "x$2" != "xno-xml"; then
+-   AC_MSG_CHECKING([for XML::Parser])
+-   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
+-       AC_MSG_RESULT([ok])
+-   else
+-       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
+-   fi
+-fi
+-
+ # Substitute ALL_LINGUAS so we can use it in po/Makefile
+ AC_SUBST(ALL_LINGUAS)
+ 
diff --git a/meta/recipes-devtools/intltool/intltool/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
deleted file mode 100644
index fc69e37..0000000
--- a/meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
-
-Upstream-Status: Inappropriate [OE specific]
-
-Index: intltool-0.40.6/intltool.m4
-===================================================================
---- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
-+++ intltool-0.40.6/intltool.m4	2011-11-23 15:39:34.689561872 -0800
-@@ -122,14 +122,16 @@
-    IT_PERL_VERSION="`$INTLTOOL_PERL -e \"printf '%vd', $^V\"`"
-    AC_MSG_RESULT([$IT_PERL_VERSION])
- fi
--if test "x$2" != "xno-xml"; then
--   AC_MSG_CHECKING([for XML::Parser])
--   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
--       AC_MSG_RESULT([ok])
--   else
--       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
--   fi
--fi
-+
-+# Disable this check since we know XML::Parser is installed
-+#if test "x$2" != "xno-xml"; then
-+#   AC_MSG_CHECKING([for XML::Parser])
-+#   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
-+#       AC_MSG_RESULT([ok])
-+#   else
-+#       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
-+#   fi
-+#fi
- 
- # Substitute ALL_LINGUAS so we can use it in po/Makefile
- AC_SUBST(ALL_LINGUAS)
diff --git a/meta/recipes-devtools/intltool/intltool/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
deleted file mode 100644
index 5f5fed3..0000000
--- a/meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-OE has perl binary as 'nativeperl' in native sysroot so we look for it
-in order to avoid intltool searching and finding perl from /usr/bin
-on build system which may not have all the modules that it needs.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [OE specific]
-Index: intltool-0.40.6/intltool.m4
-===================================================================
---- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
-+++ intltool-0.40.6/intltool.m4	2011-08-09 08:07:16.427347846 -0700
-@@ -110,7 +110,7 @@
-     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
- fi
- 
--AC_PATH_PROG(INTLTOOL_PERL, perl)
-+AC_PATH_PROG(INTLTOOL_PERL, nativeperl)
- if test -z "$INTLTOOL_PERL"; then
-    AC_MSG_ERROR([perl not found])
- fi
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 0a610a3..a7ea3b7 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -6,23 +6,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
            file://intltool-nowarn.patch \
            file://perl-522-deprecations.patch \
-           ${NATIVEPATCHES} \
+           file://remove-perl-check.patch \
+           file://noperlcheck.patch \
            "
 SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
 SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
 
-# All of the intltool scripts have the correct paths to perl already
-# embedded into them and can find perl fine, so we add the remove xml-check
-# in the intltool.m4 via the remove-xml-check.patch
-NATIVEPATCHES = "file://noperlcheck.patch \
-                 file://remove-xml-check.patch"
-NATIVEPATCHES_class-native = "file://use-nativeperl.patch"
-
 UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
 
 DEPENDS = "libxml-parser-perl-native"
 RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
 DEPENDS_class-native = "libxml-parser-perl-native"
+
+inherit autotools pkgconfig perlnative
+
+export PERL = "${bindir}/env perl"
+PERL_class-native = "/usr/bin/env nativeperl"
+
 # gettext is assumed to exist on the host
 RDEPENDS_${PN}_class-native = "libxml-parser-perl-native"
 RRECOMMENDS_${PN} = "perl-modules"
@@ -33,9 +33,4 @@ FILES_${PN} += "${datadir}/aclocal"
 
 INSANE_SKIP_${PN} += "dev-deps"
 
-inherit autotools pkgconfig perlnative
-
-export PERL = "${bindir}/env perl"
-PERL_class-native = "/usr/bin/env nativeperl"
-
 BBCLASSEXTEND = "native"
-- 
2.8.1


