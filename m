Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAim-0002JS-K4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:34:00 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:22:32 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so361045wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=LhWIvDRtZiHEU8tSGPB+fErsx17TF6SPjcZEw/YivHU=;
	b=haaiDbQlJbhQBzy48SPbOcTSiRvG0DzMYZcVvdIWkvNq7x+0hNKJMwAQiAycCISfvO
	UmYBdPwhsLEgSiUrQ0vPA6B2QE9agvb65ITm+lFdJ9WHefii6LeArujO9BDWDbEhnVBD
	qCL7Ph44cPDK1Ix5YvESzfFEu+x7l3I6d9xmX+yEOq+zySNijyIZtIjaDZ5WXmBGVbkj
	vgSmIitY5kBJE8FC4Gv0VWCiD85lKVrLVak5viF+ZTyYTqjFNsvsbGDONidHpz0fFTDD
	ak9BIHfiuLgvc3icO7jYUMtE+8vPRuM6lLN0YFWe1hude4NONGigKiWkThulUfh69UOS
	LA0Q==
Received: by 10.180.83.106 with SMTP id p10mr5486237wiy.21.1342542152721;
	Tue, 17 Jul 2012 09:22:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm27732790wib.10.2012.07.17.09.22.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:22:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:22:10 +0100
Message-Id: <245f335b9d6103daba1c90403a94a50eec80e64d.1342542040.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
In-Reply-To: <cover.1342542040.git.ross.burton@intel.com>
References: <cover.1342542040.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlAMZ6ch9K7VLM1GYDRM59EqV83rtgakHaTq9qjCHMZ0MVqTQRF9r8M/stkB/SJR+oyDddc
Subject: [PATCH 3/3] web-webkit: don't link using g++, it's not needed anymore
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
X-List-Received-Date: Tue, 17 Jul 2012 16:34:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit_git.bb            |    9 ++---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch

diff --git a/meta/recipes-sato/web/web-webkit/link-with-g++.patch b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
deleted file mode 100644
index e0c6784..0000000
--- a/meta/recipes-sato/web/web-webkit/link-with-g++.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-The main webkit library links against stdc++ so we need to use g++ for 
-linking. The easiest way to achieve this is to add a dummy cpp file.
-This also means we have to add AC_PROG_CXX else libtool 2.2.2 gets upset.
-
-RP - 14/4/08 
-
-Upstream-Status: Inappropriate [configuration]
-
---- webkit.orig/src/Makefile.am
-+++ webkit/src/Makefile.am
-@@ -1,11 +1,11 @@
- AM_CPPFLAGS=-DPKGDATADIR=\"$(pkgdatadir)\"
- AM_CFLAGS = -Wall -export-dynamic $(WEB_CFLAGS)
- 
- bin_PROGRAMS = web2
- 
--web2_SOURCES = web2.h web2-main.c web2-utils.c web2-utils.h
-+web2_SOURCES = web2.h web2-main.c web2-utils.c web2-utils.h dummy.cpp
- web2_LDADD   = $(WEB_LIBS)
- 
- MAINTAINERCLEANFILES = config.h.in Makefile.in
- 
- uidir = $(pkgdatadir)
-Index: webkit/configure.ac
-===================================================================
---- webkit.orig/configure.ac	2008-04-14 22:15:25.000000000 +0100
-+++ webkit/configure.ac	2008-04-14 22:16:31.000000000 +0100
-@@ -7,6 +7,7 @@
- 
- AC_ISC_POSIX
- AC_PROG_CC
-+AC_PROG_CXX
- AC_STDC_HEADERS
- AC_PROG_LIBTOOL
- 
diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index dae7faf..0c79324 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -13,10 +13,9 @@ RRECOMMENDS_${PN} += "glib-networking"
 
 SRCREV = "b0676c190f876cbdb1df202fbcec42f212374503"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://link-with-g++.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
 S = "${WORKDIR}/git"
 
@@ -24,8 +23,4 @@ EXTRA_OECONF = "--enable-libowl"
 
 inherit autotools pkgconfig
 
-do_configure_prepend() {
-    touch ${S}/src/dummy.cpp
-}
-
 FILES_${PN} += "${datadir}/web2"
-- 
1.7.10



