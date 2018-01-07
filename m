Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 077F378757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:57:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 08:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; 
   d="scan'208";a="9306093"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 07 Jan 2018 08:57:41 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 08:57:39 -0800
Message-Id: <1515344260-81575-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/2] groff_1.22.3.bb: support SOURCE_DATE_EPOCH
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
X-List-Received-Date: Sun, 07 Jan 2018 16:57:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch backported from Debian:
https://sources.debian.net/src/groff/1.22.3-9/debian/patches/source-date-epoch.patch/

Various documents contain information such as:

%%Creator:​·​groff·​version·​1.​22.​3
%%CreationDate:​·​Sat·​Nov·​11·​01:​04:​26·​2017

The intent is to replace CreationDate by a value specified
by SOURCE_DATE_EPOCH (if present in environment).

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../groff/groff-1.22.3/source-date-epoch.patch     | 286 +++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb        |   1 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/source-date-epoch.patch

diff --git a/meta/recipes-extended/groff/groff-1.22.3/source-date-epoch.patch b/meta/recipes-extended/groff/groff-1.22.3/source-date-epoch.patch
new file mode 100644
index 0000000..6349529
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/source-date-epoch.patch
@@ -0,0 +1,286 @@
+Patch backported (and slightly edited to build correctly) from Debian.
+https://sources.debian.net/src/groff/1.22.3-9/debian/patches/source-date-epoch.patch/
+
+From abc23bc9245e18468817f2838361c3a08f7521e2 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Thu, 5 Nov 2015 11:47:34 +0000
+Subject: Implement `SOURCE_DATE_EPOCH' for reproducible builds.
+
+Author: Colin Watson <cjwatson@debian.org>
+Forwarded: yes
+Last-Update: 2015-11-05
+
+Patch-Name: source-date-epoch.patch
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ doc/groff.texinfo                 |  6 +++++
+ src/devices/grohtml/grohtml.man   |  7 ++++++
+ src/devices/grohtml/post-html.cpp |  5 ++--
+ src/devices/gropdf/gropdf.man     |  7 ++++++
+ src/devices/gropdf/gropdf.pl      |  3 ++-
+ src/devices/grops/grops.man       |  7 ++++++
+ src/devices/grops/ps.cpp          |  3 ++-
+ src/include/curtime.h             | 23 ++++++++++++++++++
+ src/libs/libgroff/Makefile.sub    |  2 ++
+ src/libs/libgroff/curtime.cpp     | 51 +++++++++++++++++++++++++++++++++++++++
+ src/roff/troff/input.cpp          |  3 ++-
+ 11 files changed, 112 insertions(+), 5 deletions(-)
+ create mode 100644 src/include/curtime.h
+ create mode 100644 src/libs/libgroff/curtime.cpp
+
+diff --git a/src/devices/grohtml/grohtml.man b/src/devices/grohtml/grohtml.man
+index 51eae224..4be4abbc 100644
+--- a/src/devices/grohtml/grohtml.man
++++ b/src/devices/grohtml/grohtml.man
+@@ -419,6 +419,13 @@ and
+ for more details.
+ .
+ .
++.TP
++.SM
++.B SOURCE_DATE_EPOCH
++A timestamp (expressed as seconds since the Unix epoch) to use as the
++creation timestamp in place of the current time.
++.
++.
+ .\" --------------------------------------------------------------------
+ .SH BUGS
+ .\" --------------------------------------------------------------------
+diff --git a/src/devices/grohtml/post-html.cpp b/src/devices/grohtml/post-html.cpp
+index fefbf014..b5fc5167 100644
+--- a/src/devices/grohtml/post-html.cpp
++++ b/src/devices/grohtml/post-html.cpp
+@@ -28,6 +28,7 @@ along with this program. If not, see <http://www.gnu.org/licenses/>. */
+ #include "html.h"
+ #include "html-text.h"
+ #include "html-table.h"
++#include "curtime.h"
+ 
+ #include <time.h>
+ 
+@@ -5013,7 +5014,7 @@ void html_printer::do_file_components (void)
+ 	.put_string(Version_string)
+ 	.end_comment();
+ 
+-      t = time(0);
++      t = current_time();
+       html.begin_comment("CreationDate: ")
+ 	.put_string(ctime(&t), strlen(ctime(&t))-1)
+ 	.end_comment();
+@@ -5126,7 +5127,7 @@ html_printer::~html_printer()
+     .put_string(Version_string)
+     .end_comment();
+ 
+-  t = time(0);
++  t = current_time();
+   html.begin_comment("CreationDate: ")
+     .put_string(ctime(&t), strlen(ctime(&t))-1)
+     .end_comment();
+diff --git a/src/devices/gropdf/gropdf.man b/src/devices/gropdf/gropdf.man
+index 3bbace6a..cc0c82f1 100644
+--- a/src/devices/gropdf/gropdf.man
++++ b/src/devices/gropdf/gropdf.man
+@@ -1029,6 +1029,13 @@ and
+ for more details.
+ .
+ .
++.TP
++.SM
++.B SOURCE_DATE_EPOCH
++A timestamp (expressed as seconds since the Unix epoch) to use as the
++creation timestamp in place of the current time.
++.
++.
+ .\" --------------------------------------------------------------------
+ .SH FILES
+ .\" --------------------------------------------------------------------
+diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
+index 035d1238..c25c4c67 100644
+--- a/src/devices/gropdf/gropdf.pl
++++ b/src/devices/gropdf/gropdf.pl
+@@ -239,13 +239,14 @@ elsif (exists($ppsz{$papersz}))
+     @defaultmb=@mediabox=(0,0,$ppsz{$papersz}->[0],$ppsz{$papersz}->[1]);
+ }
+ 
+-my (@dt)=localtime(time);
++my (@dt)=localtime($ENV{SOURCE_DATE_EPOCH} || time);
+ my $dt=PDFDate(\@dt);
+ 
+ my %info=('Creator' => "(groff version $cfg{GROFF_VERSION})",
+ 				'Producer' => "(gropdf version $cfg{GROFF_VERSION})",
+ 				'ModDate' => "($dt)",
+ 				'CreationDate' => "($dt)");
++
+ while (<>)
+ {
+     chomp;
+diff --git a/src/devices/grops/grops.man b/src/devices/grops/grops.man
+index 99fb7486..272c2d18 100644
+--- a/src/devices/grops/grops.man
++++ b/src/devices/grops/grops.man
+@@ -1419,6 +1419,13 @@ and
+ for more details.
+ .
+ .
++.TP
++.SM
++.B SOURCE_DATE_EPOCH
++A timestamp (expressed as seconds since the Unix epoch) to use as the
++creation timestamp in place of the current time.
++.
++.
+ .\" --------------------------------------------------------------------
+ .SH FILES
+ .\" --------------------------------------------------------------------
+diff --git a/src/devices/grops/ps.cpp b/src/devices/grops/ps.cpp
+index 745a503b..03e65372 100644
+--- a/src/devices/grops/ps.cpp
++++ b/src/devices/grops/ps.cpp
+@@ -28,6 +28,7 @@ along with this program. If not, see <http://www.gnu.org/licenses/>. */
+ #include "cset.h"
+ #include "nonposix.h"
+ #include "paper.h"
++#include "curtime.h"
+ 
+ #include "ps.h"
+ #include <time.h>
+@@ -1390,7 +1391,7 @@ ps_printer::~ps_printer()
+ #else
+     time_t
+ #endif
+-    t = time(0);
++    t = current_time();
+     fputs(ctime(&t), out.get_file());
+   }
+   for (font_pointer_list *f = font_list; f; f = f->next) {
+diff --git a/src/include/curtime.h b/src/include/curtime.h
+new file mode 100644
+index 00000000..a4105196
+--- /dev/null
++++ b/src/include/curtime.h
+@@ -0,0 +1,23 @@
++/* Copyright (C) 2015  Free Software Foundation, Inc.
++
++This file is part of groff.
++
++groff is free software; you can redistribute it and/or modify it under
++the terms of the GNU General Public License as published by the Free
++Software Foundation, either version 2 of the License, or
++(at your option) any later version.
++
++groff is distributed in the hope that it will be useful, but WITHOUT ANY
++WARRANTY; without even the implied warranty of MERCHANTABILITY or
++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++for more details.
++
++The GNU General Public License version 2 (GPL2) is available in the
++internet at <http://www.gnu.org/licenses/gpl-2.0.txt>. */
++
++#ifdef LONG_FOR_TIME_T
++long
++#else
++time_t
++#endif
++current_time();
+diff --git a/src/libs/libgroff/Makefile.sub b/src/libs/libgroff/Makefile.sub
+index 840d9934..4cb4937a 100644
+--- a/src/libs/libgroff/Makefile.sub
++++ b/src/libs/libgroff/Makefile.sub
+@@ -32,6 +32,7 @@ OBJS=\
+   cmap.$(OBJEXT) \
+   color.$(OBJEXT) \
+   cset.$(OBJEXT) \
++  curtime.$(OBJEXT) \
+   device.$(OBJEXT) \
+   errarg.$(OBJEXT) \
+   error.$(OBJEXT) \
+@@ -82,6 +83,7 @@ CCSRCS=\
+   $(srcdir)/cmap.cpp \
+   $(srcdir)/color.cpp \
+   $(srcdir)/cset.cpp \
++  $(srcdir)/curtime.cpp \
+   $(srcdir)/device.cpp \
+   $(srcdir)/errarg.cpp \
+   $(srcdir)/error.cpp \
+diff --git a/src/libs/libgroff/curtime.cpp b/src/libs/libgroff/curtime.cpp
+new file mode 100644
+index 00000000..00821b7f
+--- /dev/null
++++ b/src/libs/libgroff/curtime.cpp
+@@ -0,0 +1,51 @@
++/* Copyright (C) 2015  Free Software Foundation, Inc.
++
++This file is part of groff.
++
++groff is free software; you can redistribute it and/or modify it under
++the terms of the GNU General Public License as published by the Free
++Software Foundation, either version 2 of the License, or
++(at your option) any later version.
++
++groff is distributed in the hope that it will be useful, but WITHOUT ANY
++WARRANTY; without even the implied warranty of MERCHANTABILITY or
++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++for more details.
++
++The GNU General Public License version 2 (GPL2) is available in the
++internet at <http://www.gnu.org/licenses/gpl-2.0.txt>. */
++
++#include <errno.h>
++#include <limits.h>
++#include <stdlib.h>
++#include <string.h>
++#include <time.h>
++
++#include "errarg.h"
++#include "error.h"
++
++#ifdef LONG_FOR_TIME_T
++long
++#else
++time_t
++#endif
++current_time()
++{
++  char *source_date_epoch = getenv("SOURCE_DATE_EPOCH");
++
++  if (source_date_epoch) {
++    errno = 0;
++    char *endptr;
++    long epoch = strtol(source_date_epoch, &endptr, 10);
++
++    if ((errno == ERANGE && (epoch == LONG_MAX || epoch == LONG_MIN)) ||
++	(errno != 0 && epoch == 0))
++      fatal("$SOURCE_DATE_EPOCH: strtol: %1", strerror(errno));
++    if (endptr == source_date_epoch)
++      fatal("$SOURCE_DATE_EPOCH: no digits found: %1", endptr);
++    if (*endptr != '\0')
++      fatal("$SOURCE_DATE_EPOCH: trailing garbage: %1", endptr);
++    return epoch;
++  } else
++    return time(0);
++}
+diff --git a/src/roff/troff/input.cpp b/src/roff/troff/input.cpp
+index 9594f074..f7d2c18a 100644
+--- a/src/roff/troff/input.cpp
++++ b/src/roff/troff/input.cpp
+@@ -36,6 +36,7 @@ along with this program. If not, see <http://www.gnu.org/licenses/>. */
+ #include "input.h"
+ #include "defs.h"
+ #include "unicode.h"
++#include "curtime.h"
+ 
+ // Needed for getpid() and isatty()
+ #include "posix.h"
+@@ -8138,7 +8139,7 @@ static void init_registers()
+ #else /* not LONG_FOR_TIME_T */
+   time_t
+ #endif /* not LONG_FOR_TIME_T */
+-    t = time(0);
++    t = current_time();
+   // Use struct here to work around misfeature in old versions of g++.
+   struct tm *tt = localtime(&t);
+   set_number_reg("seconds", int(tt->tm_sec));
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index 7472f59..cce7a92 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
 	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 	file://0001-replace-perl-w-with-use-warnings.patch \
+	file://source-date-epoch.patch \
 "
 
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
-- 
2.7.4


