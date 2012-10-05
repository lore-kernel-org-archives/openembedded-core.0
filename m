Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKEA2-0000fW-2I
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:14 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 21E552FE87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:53:05 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:47 -0700
Message-Id: <7c7dcb05685d840c70474d409f6a58ae459c46f0.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 21E552FE87.BB226
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 5/6] openjade-native: fix undefined Getopts error, use std namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 20:06:16 -0000

From: Dennis Lan <dennis.yxun@gmail.com>

Using Gentoo Linux as the build host, it fails without this patch
Use Getopt::Std in place of getopts.pl.

https://bugs.gentoo.org/show_bug.cgi?id=420083

which following error:
/usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
/usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
make[2]: *** [InterpreterMessages.h] Error 2
make[2]: *** Waiting for unfinished jobs....
Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
make[2]: *** [DssslAppMessages.h] Error 2

(from OE-Core rev 169a89b10817b742c063fcd76721e4dbbcca6199)

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
new file mode 100644
index 0000000..b47fd46
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
@@ -0,0 +1,44 @@
+commit fcc5b94f118495b1a467edcda6c6f631691c3f69
+Author: Dennis Lan <dennis.yxun@gmail.com>
+Date:   Tue Jul 3 09:25:42 2012 +0800
+
+    openjade: fix undefined Getopts error, use std namespace
+    
+    Using Gentoo Linux as the build host, it fails without this patch
+    Use Getopt::Std in place of getopts.pl.
+    
+    Upstream-Status: Inappropriate [no upstream]
+    Original-Author-By: Mike Gilbert <floppym@gentoo.org>
+    Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
+
+diff --git a/msggen.pl b/msggen.pl
+index 0c33968..2ee3f66 100644
+--- a/msggen.pl
++++ b/msggen.pl
+@@ -4,6 +4,7 @@
+ # See the file COPYING for copying permission.
+ 
+ use POSIX;
++use Getopt::Std;
+ 
+ # Package and version.
+ $package = 'openjade';
+@@ -18,8 +19,7 @@ $gen_c = 0;
+ undef $opt_l;
+ undef $opt_p;
+ undef $opt_t;
+-do 'getopts.pl';
+-&Getopts('l:p:t:');
++getopts('l:p:t:');
+ $module = $opt_l;
+ $pot_file = $opt_p;
+ 
+@@ -72,7 +72,7 @@ while (<DEF>) {
+     else {
+ 	$field[0] =~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
+ 	$type[$num] = substr($field[0], 0, 1);
+-	$argc = int(substr($field[0], 1, 1));
++	$argc = substr($field[0], 1, 1);
+     }
+     $nargs[$num] = $argc;
+     $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index cd6a5aa..266210d 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -7,13 +7,14 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "opensp-native sgml-common-native"
 RDEPENDS_${PN} = "sgml-common-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
+           file://msggen.pl.patch \
            file://reautoconf.patch \
 	   file://user-declared-default-constructor.patch"
 
-- 
1.7.9.5



