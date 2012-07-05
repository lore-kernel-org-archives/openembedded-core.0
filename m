Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKm-0005yg-MQ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:08 +0200
Received: by yenl13 with SMTP id l13so7051883yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7xQeUaDvkWLW6tv1Uj5J1kauzXmPUwws4kGM64vKo7c=;
	b=QfVwE+ZuC85sgwRhI/ou0Y6UEl1INpQDxEMyPjv5d3hJs5zt5tlBCxYSkmZGWakYZz
	gDbCeMGcinqdjYFaOkgrPVs+UCo9GS5ixwvqV1JBiPLtkw1fYpfdqBHYwKhZE8i9R4yM
	6vCaPkBmM5E5Nh5rFiEYV54DnZyVIb0AGVdxx/4nmEOYRTMsqo/OM0RenfOmpICofRE4
	Mi94UT6xFqTIBwuC9gJw5dnQ/rVwOmj/R6rKIL++8Bzj/KPcivnlHn6OJrZTdfKx47/j
	odTldG/i6nfG/sLUkethkZEPEz5TaV3BZubSgCMUrVyh9X8JlCQPcFA9WYW3igyxlA8h
	ckmQ==
Received: by 10.68.233.225 with SMTP id tz1mr6549326pbc.4.1341498963690;
	Thu, 05 Jul 2012 07:36:03 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:24 -0700
Message-Id: <54ee709e3fca5dfb297109ff4e15580fe6a0ec1b.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 05/14] diffutils: Fix build with eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:08 -0000

eglibc 2.16 has removed gets so we account for that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 ++++++++++++++++++++
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 ++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch

diff --git a/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch b/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
new file mode 100644
index 0000000..58ed62d
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
@@ -0,0 +1,22 @@
+check for gets before using it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: diffutils-3.2/lib/stdio.in.h
+===================================================================
+--- diffutils-3.2.orig/lib/stdio.in.h	2011-08-28 04:57:28.000000000 -0700
++++ diffutils-3.2/lib/stdio.in.h	2012-07-03 10:45:07.518322117 -0700
+@@ -693,11 +693,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
index 174866c..c46863d 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -5,9 +5,11 @@ SECTION = "base"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
+           file://remove-gets.patch \
+          "
 
 inherit autotools update-alternatives gettext
 
-- 
1.7.9.5



