Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFe-0001Uh-Sy
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:27 +0200
Received: by pbbrq2 with SMTP id rq2so16967057pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=o6AqQP/sULEpfPi6GnPZoAAWgGg8YfdYPUaQFdmn8uM=;
	b=ormfXqa/Q9dFRc7SmUy24GW4tWviLWdgXAHUO3KIqQDPk6H/P26lPNpN/PRp9QK/k6
	8jzPLeipkDi6Dfxi1BqpRkMXouG06oIC34svcGDrSu4qs73zVbq0RgoS0aMh4IgzEQLt
	9zqAVK2B2fl18etcfLGGc1wwdOm40BcogFeav2wJQqHaOsnf399Ni5E9PiSIAT5/EPW+
	3Pk+GZT7HZIVRvtLNfu2aRBrIUivHP3ez9C2P4FSy6QdyAYZI4CHjbxzmFuZyQSCqjSb
	FDG5L1t9PgAajqNmGySadCgS43AcVOzKNOsAUSV/zNE3C0uKdyZGefVvBRT/cKRRTETi
	fhHg==
Received: by 10.68.194.6 with SMTP id hs6mr54065958pbc.133.1341763878021;
	Sun, 08 Jul 2012 09:11:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:26 -0700
Message-Id: <4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_2.5.bb           |    6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch

diff --git a/meta/recipes-devtools/bison/bison/remove-gets.patch b/meta/recipes-devtools/bison/bison/remove-gets.patch
new file mode 100644
index 0000000..2dfa00f
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/remove-gets.patch
@@ -0,0 +1,20 @@
+gets has been removed from eglibc 2.16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: bison-2.5/lib/stdio.in.h
+===================================================================
+--- bison-2.5.orig/lib/stdio.in.h	2012-07-04 09:09:48.336532195 -0700
++++ bison-2.5/lib/stdio.in.h	2012-07-04 09:10:22.868533884 -0700
+@@ -180,8 +180,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index fc3bb6d..687f06a 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-PR = "r1"
+PR = "r2"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
 	  "
 
 SRC_URI = "${BASE_SRC_URI} \
-        file://fix_cross_manpage_building.patch "
+           file://fix_cross_manpage_building.patch \
+           file://remove-gets.patch \
+          "
 
 SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
 SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
-- 
1.7.9.5



