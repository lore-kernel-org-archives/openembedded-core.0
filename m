Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8BA577A3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v36A5w4L008542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 03:05:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Apr 2017 03:05:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 03:05:50 -0700
Message-ID: <c5114b95af33f1ffc19c7c3c52c45f9c0549ac56.1491473008.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491473008.git.liezhi.yang@windriver.com>
References: <cover.1491473008.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] groff: replace "perl -w" with "use warnings"
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
X-List-Received-Date: Thu, 06 Apr 2017 10:05:57 -0000
Content-Type: text/plain

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
 .../0001-replace-perl-w-with-use-warnings.patch    | 102 +++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb        |   3 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch

diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch
new file mode 100644
index 0000000000..f1db5b0653
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch
@@ -0,0 +1,102 @@
+From 5b574542070db286c89b3827e8f15ed4b3b39034 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 6 Apr 2017 01:46:00 -0700
+Subject: [PATCH] replace "perl -w" with "use warnings"
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
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ font/devpdf/util/BuildFoundries.pl | 3 ++-
+ src/devices/gropdf/gropdf.pl       | 3 ++-
+ src/devices/gropdf/pdfmom.pl       | 3 ++-
+ src/utils/afmtodit/afmtodit.pl     | 3 ++-
+ 4 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/font/devpdf/util/BuildFoundries.pl b/font/devpdf/util/BuildFoundries.pl
+index 39f2f0d..a2bfd8e 100644
+--- a/font/devpdf/util/BuildFoundries.pl
++++ b/font/devpdf/util/BuildFoundries.pl
+@@ -1,4 +1,4 @@
+-#!/usr/bin/perl -w
++#!/usr/bin/perl
+ #
+ #   BuildFoundries   : Given a Foundry file generate groff and download files
+ #   Deri James       : Monday 07 Feb 2011
+@@ -22,6 +22,7 @@
+ # along with this program. If not, see <http://www.gnu.org/licenses/>.
+ 
+ use strict;
++use warnings;
+ 
+ my $where=shift||'';
+ my $devps=shift||'../devps';
+diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
+index 035d123..b933b32 100644
+--- a/src/devices/gropdf/gropdf.pl
++++ b/src/devices/gropdf/gropdf.pl
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ #
+ #	gropdf		: PDF post processor for groff
+ #
+@@ -21,6 +21,7 @@
+ # along with this program. If not, see <http://www.gnu.org/licenses/>.
+ 
+ use strict;
++use warnings;
+ use Getopt::Long qw(:config bundling);
+ use Compress::Zlib;
+ 
+diff --git a/src/devices/gropdf/pdfmom.pl b/src/devices/gropdf/pdfmom.pl
+index beec820..4b46ea4 100644
+--- a/src/devices/gropdf/pdfmom.pl
++++ b/src/devices/gropdf/pdfmom.pl
+@@ -1,4 +1,4 @@
+-#!@PERL@ -w
++#!@PERL@
+ #
+ #	pdfmom		: Frontend to run groff -mom to produce PDFs
+ #	Deri James	: Friday 16 Mar 2012
+@@ -24,6 +24,7 @@
+ # along with this program. If not, see <http://www.gnu.org/licenses/>.
+ 
+ use strict;
++use warnings;
+ use File::Temp qw/tempfile/;
+ my @cmd;
+ my $dev='pdf';
+diff --git a/src/utils/afmtodit/afmtodit.pl b/src/utils/afmtodit/afmtodit.pl
+index 4f2ce83..5c078ff 100644
+--- a/src/utils/afmtodit/afmtodit.pl
++++ b/src/utils/afmtodit/afmtodit.pl
+@@ -1,4 +1,4 @@
+-#! /usr/bin/perl -w
++#! /usr/bin/perl
+ # -*- Perl -*-
+ # Copyright (C) 1989-2014  Free Software Foundation, Inc.
+ #      Written by James Clark (jjc@jclark.com)
+@@ -19,6 +19,7 @@
+ # along with this program. If not, see <http://www.gnu.org/licenses/>.
+ 
+ use strict;
++use warnings;
+ 
+ @afmtodit.tables@
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index dd241f3f84..7472f59825 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
 	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+	file://0001-replace-perl-w-with-use-warnings.patch \
 "
 
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
@@ -24,6 +25,8 @@ inherit autotools texinfo
 EXTRA_OECONF = "--without-x"
 PARALLEL_MAKE = ""
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
 do_configure_prepend() {
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
 		sed -i \
-- 
2.11.0.rc2.dirty


