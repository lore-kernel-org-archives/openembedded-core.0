Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlO-0000dD-1C
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f54.google.com with SMTP id fp12so8427199lab.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Wl6kb7OjXLya7Bhj7lzqhP6ehf4cEzdteB7sS5ievnc=;
	b=xAHP9z4Z6MIrr8SQtHDdtLaTTwzMLots1KyoD1AEPIB8vQ7f+qXM9U+7KA5PGR6v1e
	55UWooQWnJCWeS/fRMTNc4yNEabhXCeHafNQG6dfDJx3njtA36qTZSbxqZJHWwZbl58Z
	dF8WH4syUxjiBpf5J2IRMFdhlpi8D6Fs5iL3KFFAb0HuEJJeCU1fCOhOoYXfcjeycT67
	1C+kGtDrS/NzxcIM80kYKNlATjFZx89F7e9zI85GyFfVQ4BS6CjveC54JM5CB0bSrQ5v
	LMgl0QqK4zakIu7gkmS53H1hDth8L/cOxwfniW79Cn8/YuwhLmaJvMRCXh7U1pZHVeVG
	ufOg==
X-Received: by 10.112.11.68 with SMTP id o4mr20523883lbb.128.1357245397931;
	Thu, 03 Jan 2013 12:36:37 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id tq10sm18180367lab.8.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWj-0002D7-UI; Thu, 03 Jan 2013 22:36:33 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:18 +0200
Message-Id: <1357245391-11055-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-2-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 02/15] libtool: remove help2man dependency
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

Remove manpage creation. It wasn't working because of help2man
missing when libtool is being built. This attempt to create
manpages without help2man turns from no-op to hard error with
automake-1.13.
Removed prefix-manpage-fix.patch as only code it touched is being
removed by new dont-depend-on-help2man.patch

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    4 ++--
 .../libtool/libtool/dont-depend-on-help2man.patch  |   24 ++++++++++++++++++++
 .../libtool/libtool/prefix-manpage-fix.patch       |   21 -----------------
 3 files changed, 26 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 12a783a..bb4ddf0 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,11 +8,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
-           file://prefix-manpage-fix.patch \
            file://rename-with-sysroot.patch \
            file://use-sysroot-in-libpath.patch \
            file://fix-final-rpath.patch \
@@ -20,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-rpath.patch \
 	   file://respect-fstack-protector.patch \
            file://norm-rpath.patch \
+           file://dont-depend-on-help2man.patch \
           "
 
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
diff --git a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
new file mode 100644
index 0000000..b86ade6
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
@@ -0,0 +1,24 @@
+Upstream-status: Inappropriate
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libtool-2.4.2/Makefile.am libtool-2.4.2/Makefile.am
+--- libtool-2.4.2/Makefile.am	2011-10-17 13:17:04.000000000 +0300
++++ libtool-2.4.2/Makefile.am	2013-01-01 22:03:36.865586811 +0200
+@@ -327,17 +327,6 @@
+	cd $(srcdir)/doc && \
+	  $(MAKEINFO) --no-headers $(MAKEINFOFLAGS) -o notes.txt notes.texi
+
+-dist_man1_MANS		= $(srcdir)/doc/libtool.1 $(srcdir)/doc/libtoolize.1
+-MAINTAINERCLEANFILES	+= $(dist_man1_MANS)
+-update_mans = \
+-  PATH=".$(PATH_SEPARATOR)$$PATH"; export PATH; \
+-  $(HELP2MAN) --output=$@
+-$(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
+-	$(update_mans) --help-option=--help-all libtool
+-$(srcdir)/doc/libtoolize.1: $(srcdir)/libtoolize.in
+-	$(update_mans) libtoolize
+-
+-
+ ## ------------- ##
+ ## Installation. ##
+ ## ------------- ##
diff --git a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
deleted file mode 100644
index 879778c..0000000
--- a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-For cross environment, it not possible to run the generated executable.
-nstead use the build version of libtool to generate the man pages. 
-
-Date: 2010/07/09
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Index: libtool-2.4.2/Makefile.am
-===================================================================
---- libtool-2.4.2.orig/Makefile.am
-+++ libtool-2.4.2/Makefile.am
-@@ -333,7 +333,7 @@ update_mans = \
-   PATH=".$(PATH_SEPARATOR)$$PATH"; export PATH; \
-   $(HELP2MAN) --output=$@
- $(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
--	$(update_mans) --help-option=--help-all libtool
-+	$(update_mans) --help-option=--help-all ${build_alias}-libtool
- $(srcdir)/doc/libtoolize.1: $(srcdir)/libtoolize.in
- 	$(update_mans) libtoolize
- 
-- 
1.7.10.4



