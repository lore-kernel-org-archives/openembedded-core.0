Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOw5-00044V-Dc
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:49 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N81rlhTWlKzJj5e4ab5TV/nVB0mgde03e8TZSgEi6f8=;
	b=GiQoiNjO6leeXN/I5iQSb9fJ5xbiYpIM8hninfVAWoWZHYpXaZfSYtDGw7xRpPv2Tb
	dfzzZx6hAlOwubasIW+FjI272mlZjia35TNdDCqgtP1wmtqdU+IPVrxLZmy2/+PLDF0a
	eO5+uBS0jE3l8G66oS9vZ1bl26oGshIf+pK9m5hRipzfQ+xzEBstSGk0F2uwZq+dq2HU
	wm4Ti6XfCWR2iTV2nDy5tZQU3tsLqVcOhU3xY6jIyKehopQ6NUZc5R7nKCY2HTzyNRJX
	Oww1XB9kNdDksF5AjgWjwp8ARXGNDpFwpcQmTHZlMZFIMQ/mRuR7iLGCvMlGuWAcC9Qv
	iFSw==
Received: by 10.68.194.6 with SMTP id hs6mr7751212pbc.133.1339260260081;
	Sat, 09 Jun 2012 09:44:20 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:03 -0700
Message-Id: <071e80a6050c7004bf386ccb6d83dcf081f1a38a.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 05/16] rpm: Use link time check for libssp
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:49 -0000

-fstack-protector needs libssp to link with
so when checking for this option support we
need to find if libssp is staged in root file
system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch

diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
new file mode 100644
index 0000000..84d0430
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
@@ -0,0 +1,13 @@
+Index: rpm-5.4.0/configure.ac
+===================================================================
+--- rpm-5.4.0.orig/configure.ac	2012-06-01 11:41:19.741480143 -0700
++++ rpm-5.4.0/configure.ac	2012-06-01 11:41:51.773481676 -0700
+@@ -193,7 +193,7 @@
+  my_save_cflags="$CFLAGS"
+  CFLAGS=$c
+  AC_MSG_CHECKING([whether GCC supports $c])
+- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
++ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
+     [AC_MSG_RESULT([yes])]
+     [my_cflags=$c],
+     [AC_MSG_RESULT([no])]
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index f4938fd..a8bff65 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -74,6 +74,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm_fix_for_automake-1.12.patch \
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
+	   file://fstack-protector-configure-check.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \
-- 
1.7.5.4



