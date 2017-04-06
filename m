Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9F377A45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:06:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v36A5xPK009102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 03:06:01 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Apr 2017 03:05:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 03:05:51 -0700
Message-ID: <5202440801102f06224b3e7f2beda88364edd7ad.1491473008.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
In-Reply-To: <cover.1491473008.git.liezhi.yang@windriver.com>
References: <cover.1491473008.git.liezhi.yang@windriver.com>
Subject: [PATCH 2/7] mc: replace "perl -w" with "use warnings"
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
X-List-Received-Date: Thu, 06 Apr 2017 10:06:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The shebang's max length is usually 128 as defined in
/usr/include/linux/binfmts.h:
  #define BINPRM_BUF_SIZE 128

There would be errors when @PERL@ (hostools/perl) is longer than 128,
use '/usr/bin/env perl' can fix the problem, but '/usr/bin/env perl -w'
doesn't work:

/usr/bin/env: perl -w: No such file or directory

So replace "perl -w" with "use warnings" to make it work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-mc-replace-perl-w-with-use-warnings.patch | 129 +++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.18.bb              |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch

diff --git a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
new file mode 100644
index 0000000000..bf8037cd28
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
@@ -0,0 +1,129 @@
+From cdc7c278212ae836eecb4cc9d42c29443cc128a0 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 6 Apr 2017 02:24:28 -0700
+Subject: [PATCH] mc: replace "perl -w" with "use warnings"
+
+The shebang's max length is usually 128 as defined in
+/usr/include/linux/binfmts.h:
+  #define BINPRM_BUF_SIZE 128
+
+There would be errors when @PERL@ is longer than 128, use
+'/usr/bin/env perl' can fix the problem, but '/usr/bin/env perl -w'
+doesn't work:
+
+/usr/bin/env: perl -w: No such file or directory
+
+So replace "perl -w" with "use warnings" to make it work.
+
+The man2hlp.in already has "use warnings;", so just remove '-w' is OK.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/man2hlp/man2hlp.in           | 2 +-
+ src/vfs/extfs/helpers/a+.in      | 4 +++-
+ src/vfs/extfs/helpers/mailfs.in  | 3 ++-
+ src/vfs/extfs/helpers/patchfs.in | 3 ++-
+ src/vfs/extfs/helpers/ulib.in    | 4 +++-
+ src/vfs/extfs/helpers/uzip.in    | 3 ++-
+ 6 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/src/man2hlp/man2hlp.in b/src/man2hlp/man2hlp.in
+index f095830..558a674 100644
+--- a/src/man2hlp/man2hlp.in
++++ b/src/man2hlp/man2hlp.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ #
+ #  Man page to help file converter
+ #  Copyright (C) 1994, 1995, 1998, 2000, 2001, 2002, 2003, 2004, 2005,
+diff --git a/src/vfs/extfs/helpers/a+.in b/src/vfs/extfs/helpers/a+.in
+index 579441c..fe446f4 100644
+--- a/src/vfs/extfs/helpers/a+.in
++++ b/src/vfs/extfs/helpers/a+.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ #
+ # External filesystem for mc, using mtools
+ # Written Ludek Brukner <lubr@barco.cz>, 1997
+@@ -9,6 +9,8 @@
+ 
+ # These mtools components must be in PATH for this to work
+ 
++use warnings;
++
+ sub quote {
+     $_ = shift(@_);
+     s/([^\w\/.+-])/\\$1/g;
+diff --git a/src/vfs/extfs/helpers/mailfs.in b/src/vfs/extfs/helpers/mailfs.in
+index e9455be..059f41f 100644
+--- a/src/vfs/extfs/helpers/mailfs.in
++++ b/src/vfs/extfs/helpers/mailfs.in
+@@ -1,6 +1,7 @@
+-#! @PERL@ -w
++#! @PERL@
+ 
+ use bytes;
++use warnings;
+ 
+ # MC extfs for (possibly compressed) Berkeley style mailbox files
+ # Peter Daum <gator@cs.tu-berlin.de> (Jan 1998, mc-4.1.24)
+diff --git a/src/vfs/extfs/helpers/patchfs.in b/src/vfs/extfs/helpers/patchfs.in
+index ef407de..3ad4b53 100644
+--- a/src/vfs/extfs/helpers/patchfs.in
++++ b/src/vfs/extfs/helpers/patchfs.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ #
+ # Written by Adam Byrtek <alpha@debian.org>, 2002
+ # Rewritten by David Sterba <dave@jikos.cz>, 2009
+@@ -9,6 +9,7 @@
+ 
+ use bytes;
+ use strict;
++use warnings;
+ use POSIX;
+ use File::Temp 'tempfile';
+ 
+diff --git a/src/vfs/extfs/helpers/ulib.in b/src/vfs/extfs/helpers/ulib.in
+index 418611f..82c7ccf 100644
+--- a/src/vfs/extfs/helpers/ulib.in
++++ b/src/vfs/extfs/helpers/ulib.in
+@@ -1,9 +1,11 @@
+-#! @PERL@ -w
++#! @PERL@
+ #
+ # VFS to manage the gputils archives.
+ # Written by Molnár Károly (proton7@freemail.hu) 2012
+ #
+ 
++use warnings;
++
+ my %month = ('jan' => '01', 'feb' => '02', 'mar' => '03',
+              'apr' => '04', 'may' => '05', 'jun' => '06',
+              'jul' => '07', 'aug' => '08', 'sep' => '09',
+diff --git a/src/vfs/extfs/helpers/uzip.in b/src/vfs/extfs/helpers/uzip.in
+index b1c4f90..c8eb335 100644
+--- a/src/vfs/extfs/helpers/uzip.in
++++ b/src/vfs/extfs/helpers/uzip.in
+@@ -1,4 +1,4 @@
+-#! @PERL@ -w
++#! @PERL@
+ #
+ # zip file archive Virtual File System for Midnight Commander
+ # Version 1.4.0 (2001-08-07).
+@@ -9,6 +9,7 @@
+ use POSIX;
+ use File::Basename;
+ use strict;
++use warnings;
+ 
+ #
+ # Configuration options
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/mc/mc_4.8.18.bb b/meta/recipes-extended/mc/mc_4.8.18.bb
index 78abb275ba..17f3f73af7 100644
--- a/meta/recipes-extended/mc/mc_4.8.18.bb
+++ b/meta/recipes-extended/mc/mc_4.8.18.bb
@@ -7,6 +7,7 @@ DEPENDS = "ncurses glib-2.0 util-linux"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
+           file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
 SRC_URI[md5sum] = "cc56f0c9abd63c4caa3636bba3a08bfb"
 SRC_URI[sha256sum] = "5b591e10dcbea95233434da40cdad4663d360229adf89826576c319667c103cb"
@@ -22,6 +23,8 @@ PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
 	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
-- 
2.11.0.rc2.dirty


