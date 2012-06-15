Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxP-0001Uo-AZ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:31 +0200
Received: by dalh21 with SMTP id h21so3477206dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=leXRDNx87etUIsGikV2+XSQn7bVJs2MRphI55K+vHWM=;
	b=oSCpKWUVLY/lC3qPdPiv7Iz4FOFI4Uz4Iv3my376jyt7yEh4cOuvCD4bxxWCDAeni3
	kXLeue6h0rQq6GDErjcA6hauxKzUiRifV8xd6UPhbi5nwji34Z3/iM7aEg3faebVWtWG
	brja5KAXVqwH/ZQ9CUBPOLMEiA45ylRsrpJ/bKgGaMbEvIWFhMT4w2XGTmHgYOXusGCG
	bBU46ODssCboE9EjZBWw8KXqIAbpTA9Ljd7XL5tgr8K/e/9lZbcLmTwUjNheEyBtJUTp
	sW/0MnDSS5+vYssDH1j821c/mQ09bg66/MYleUUTJvBDpychcalYk5qDUt84AOjjzIyI
	RKbg==
Received: by 10.68.129.198 with SMTP id ny6mr15946708pbb.22.1339740832627;
	Thu, 14 Jun 2012 23:13:52 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:31 -0700
Message-Id: <1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 4/9] rpm: Use link time check for libssp
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:31 -0000

-fstack-protector needs libssp to link with
so when checking for this option support we
need to find if libssp is staged in root file
system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
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
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 404916a..ccf015a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -74,6 +74,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-pkgconfigdeps.patch \
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
+	   file://fstack-protector-configure-check.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.5.4



