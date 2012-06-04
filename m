Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpm-000142-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:10 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so6631474dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N81rlhTWlKzJj5e4ab5TV/nVB0mgde03e8TZSgEi6f8=;
	b=yw8y8gkqA7nT4SCEQQHLwDRv+/Sc2YrSchQ4nnSeONcwSOGGUcVtrzykFtIABLboq/
	ZN75/m4Ld786nQrvUQ0YLKSV8M3HzfSq3Zz+sAlV19qbu3lk5yMKVEw8CE4RWYP0hbaf
	O7sci4uNal/nw+OmBZDU5phnlJ6ago1dMhN5tSdkUjCmUttjpvwwESSYQ5ksFNU8NY+N
	zwk+DyzHjs1lS+yKz97ur9T+vSHPVl7KwQf9rnFQf6PJKmS+SaW1jC5D5W5S0HqnOra8
	BGWhqMV3RRSKYzC8vNx3LL5ZsRKfS7Rd5KgM+7Wj2Gs0PdYk8lPvrBYwTYRBwN/g8QUS
	IpTA==
Received: by 10.68.223.129 with SMTP id qu1mr43168551pbc.165.1338848566711;
	Mon, 04 Jun 2012 15:22:46 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:44 -0700
Message-Id: <d454ef5eea88fa62fb45ab9a33eb31085941316a.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
References: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] rpm: Use link time check for libssp
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
X-List-Received-Date: Mon, 04 Jun 2012 22:33:10 -0000

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



