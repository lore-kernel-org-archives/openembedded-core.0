Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1827EC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b6so304364wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=icg7TZH3jmyGTIrz1D+ebb0AOdfBqtXdzPAj3HhClG4E/6s401hTWwDcH4y47sTe1A
	SvANEmHtqg0OfsW8pGxbj8kLg8dviMzXFFY7IoSPoJcq9BLAhKfveXLWZh2mMJzkLqEx
	trtgeCvC1fU4lg1MaNXym9agjzw2coLITPb646KGmulNDvZMzkQbH9DyRoSHNcZWZeZS
	xs16hGLKHjjfQ6nPdPcrXgfYp+akdpLU4oOyyoTn9UXFskgr7WGMe2bsPNzBtD2clZBh
	NnHGnsuG7szOC1gS/KUkVNhdnugpLdhU5GDtgc/dHrz3bW52yqvY+nN3BqhY1HaSJ0R+
	AFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=CncsmCCFROJ3sQhXBtFwjL5S0vBc8rDvP0tSZ2eIQDHUjo4Mt+xlC4uKluTjQF1kPR
	Xd0IkhjPIHnm1xwjEG8m+0xslGtVqP3sIzR4mhP2GcXQiDwPSHx0r7++3RgBR7B4GI+g
	MyRGriRbl9dR7wkzVLkucuONlhk8XSNGRkwl6YBRyqHt74b/bG/7kwlmlvWvDSgKVqAX
	DwdO/nyBPVwXWLXgxazuLJHal1Isrw+9t7SrYmgpduNZJIK1srBWh1XsRF68VvNJMdP/
	1vSHz6Xrno3ig2rGvkBJkj37wgyNuRQBKpKaroY8FBdujz/897C3AXp+9NJtWpLChLg7
	YV8g==
X-Gm-Message-State: APjAAAVx9DAlnM1QZH16tc7c6eKaIEleI0wsiJhpuo3z99SAxwsfv1FQ
	8RsjWLmW1hDvjpNLaDD3AxGFFxwX
X-Google-Smtp-Source: APXvYqzy/zciyR2NalpN1xN1jCZ96RzsEpYODGsMYxjP2GInomHWvaDvo8b1jgudOwybWMmYbdl9kQ==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr153533wrp.186.1575309308284; 
	Mon, 02 Dec 2019 09:55:08 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:45 +0100
Message-Id: <20191202175459.112655-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/18] lrzsz: fix issues with newer versions of gettext
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-issues-with-recent-gettext-versions.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       | 11 ++---
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch
new file mode 100644
index 00000000000..c8a05f3818b
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch
@@ -0,0 +1,42 @@
+From 245c104267363c13f2ba83eca4409c673ee99fcf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 21 Nov 2019 12:34:56 +0100
+Subject: [PATCH] Fix issues with recent gettext versions
+
+[external] is required by recent gettext versions,
+USE_INCLUDED_LIBINTL is no longer defined by the gettext m4
+macro and was never documented anyway.
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.in     | 2 +-
+ intl/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index aa20263..4bde433 100644
+--- a/configure.in
++++ b/configure.in
+@@ -256,7 +256,7 @@ AC_SUBST(CFLAGS)
+ AC_SUBST(LDFLAGS)
+ AC_SUBST(LIBS)
+ 
+-AM_GNU_GETTEXT
++AM_GNU_GETTEXT([external])
+ 
+ AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME",[locale directory])
+ 
+diff --git a/intl/Makefile.in b/intl/Makefile.in
+index bbac1d5..7629a94 100644
+--- a/intl/Makefile.in
++++ b/intl/Makefile.in
+@@ -138,7 +138,7 @@ libgnuintl.h.msvc-static libgnuintl.h.msvc-shared README.woe32 Makefile.msvc
+ DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c \
+ COPYING.LIB-2 gettext.h libgettext.h plural-eval.c libgnuintl.h
+ 
+-all: all-@USE_INCLUDED_LIBINTL@
++all: all-no-no
+ all-yes: libintl.$la libintl.h charset.alias ref-add.sed ref-del.sed
+ all-no: all-no-@BUILD_INCLUDED_LIBINTL@
+ all-no-yes: libgnuintl.$la
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 34556b2c294..47962bcfffc 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -13,14 +13,15 @@ DEPENDS = ""
 PR = "r6"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
-	   file://autotools.patch \
-	   file://makefile.patch \
-	   file://gettext.patch \
-	   file://acdefine.patch \
-	   file://lrzsz_fix_for_automake-1.12.patch \
+           file://autotools.patch \
+           file://makefile.patch \
+           file://gettext.patch \
+           file://acdefine.patch \
+           file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
+           file://0009-Fix-issues-with-recent-gettext-versions.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.17.1


