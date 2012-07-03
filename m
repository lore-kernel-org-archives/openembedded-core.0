Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SlxKA-0005fv-3Y
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:15:02 +0200
Received: by yenl13 with SMTP id l13so4678068yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3/1RVjdyb/tw2Lp0lEn7h3oIwM09lKXWDnoM6yaIISI=;
	b=obfVqXrk4ZyxOpLxp/garquuV0oPPqYmtXiyILiUBzWqZcQiSBtGCfLablOVEK5uBT
	wXUjVSbu0+j6c8VpFA/6sbb5QF0jDLeONw6gzl6GWe1SaO+Jx3vzpoLwZ6M76YGJg5Ib
	E83FvBv7gloKJFmvwL0ApeJolL+n66cVxAGCpomaQ2eKKCXhtxvFGWDh/Kc/GA26bx27
	Zt6I+eBMh5BhOuSU41CPrYQWtJUeTexTmmlUBWsLolb+cQHKTyJU6ZduPCEeK5phvzoJ
	iLbXqoedC630ietwiEgtFh3WliJd4SfKhRQh+uCw137eeScKh63fjzx7zetOhjQgyUne
	A0FQ==
Received: by 10.100.244.19 with SMTP id r19mr5717577anh.48.1341299040274;
	Tue, 03 Jul 2012 00:04:00 -0700 (PDT)
Received: from localhost.localdomain ([64.191.99.80])
	by mx.google.com with ESMTPS id g22sm30070368yhh.20.2012.07.03.00.03.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 00:03:59 -0700 (PDT)
From: Dennis Lan <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 07:03:46 +0000
Message-Id: <1341299026-10073-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH v3] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Tue, 03 Jul 2012 07:15:02 -0000

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

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
---
 .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
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
index 5b29c1f..a539c35 100644
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
1.7.9.rc2



