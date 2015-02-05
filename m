Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA4E72DE6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:00 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id eu11so10692563pac.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vrAdTsacOBQyi5Dt5wQAAHwEV29Bsnj6giq0Fa5SBdw=;
	b=oTklFVWiJBtkvIDmcvIQDvRqOkfqQ3pZoSSudhnepl1TKtwG5hNAtlWO5AKhx8yrai
	SJEfO6mnXxYmZPBPl95txwO6lhA7gkIbilwcE/ATO1DO3DrYyOHB//dtAC5MmyxVcZLy
	0XEy3jAfSAYxPcjRw+FXS6EvQAH4hqpi+6NhOuxQdXKnMViLlAmPmxXXR0kOt/nFPjwF
	PI7364JETbxZkzcav5hJPfJF+oqlB3Zo93yro7j3e6Oyfr1Exlp3JJGx9OKo2TFcUeYY
	GR25fPjZnPwP1ylEJ85BIgLSEBvWEt1ZPWn57m0i9es9QJiVw/LNuUaJ3SD/yAzn9Zm2
	0QCw==
X-Received: by 10.66.184.144 with SMTP id eu16mr5876380pac.18.1423152301826;
	Thu, 05 Feb 2015 08:05:01 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:32 -0800
Message-Id: <64d53ccb17a5ea2038d966b2c5b19ff03e34a0e5.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 24/61] guile: fixed installed-vs-shipped error
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:03 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
guile-2.0.11: guile: Files/directories were installed but not shipped
  /usr/lib64/libguile-2.0*-gdb.scm [installed-vs-shipped]

This is because when there is no file in the directory:
for f in libguile-2.0*; do
    [snip]
done

The f would be libguile-2.0* itself, make sure the libs are installed
firstly will fix the problem.

(From OE-Core rev: adf32ca3d0657cb5d363ae7a3fdb539c6627cf39)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../guile/files/libguile-Makefile.am-depends.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch

diff --git a/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch b/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
new file mode 100644
index 0000000..1045cbe
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
@@ -0,0 +1,39 @@
+From 9c4e120a7a87db34d22a50883a5a525170b480d7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 6 Jan 2015 23:10:51 -0800
+Subject: [PATCH] libguile/Makefile.am: install-data-hook: depends on
+ install-libLTLIBRARIES
+
+It may install such a file:
+/usr/lib64/libguile-2.0*-gdb.scm
+
+This is because when there is no file in the directory:
+for f in libguile-2.0*; do
+    [snip]
+done
+
+The f would be libguile-2.0* itself.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libguile/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libguile/Makefile.am b/libguile/Makefile.am
+index 281faac..fe0a3ba 100644
+--- a/libguile/Makefile.am
++++ b/libguile/Makefile.am
+@@ -449,7 +449,7 @@ EXTRA_libguile_@GUILE_EFFECTIVE_VERSION@_la_SOURCES = _scm.h		\
+ install-exec-hook:
+ 	rm -f $(DESTDIR)$(bindir)/guile-snarf.awk
+ 
+-install-data-hook: libguile-2.0-gdb.scm
++install-data-hook: libguile-2.0-gdb.scm install-libLTLIBRARIES
+ 	@$(MKDIR_P) $(DESTDIR)$(libdir)
+ ## We want to install libguile-2.0-gdb.scm as SOMETHING-gdb.scm.
+ ## SOMETHING is the full name of the final library.  We want to ignore
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index bd23c2b..8fda850 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
            file://workaround-ice-ssa-corruption.patch \
+           file://libguile-Makefile.am-depends.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.9.1


