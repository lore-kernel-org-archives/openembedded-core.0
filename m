Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFW-0001HK-Fj
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:18 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DnltGUQxAzq4IRCm9QT2360hMetoZMy2jAB0mLXZr+o=;
	b=kgV0xOm5YMFZEG7Icf7aradIdmgQD8zRcAUVHm/67eLZOD2/kxdBUJpNcUZnatvDCx
	G9n5OVv9W9uojDeZk3eGMm3O3OFhKJKYwTCsQWGSrvnD43XC3HegjXPub6IaUqXj4aI1
	N8ZB7LzkYn0Le5mUXvwvfTUxqNlx6biNZjwWldxut2FSMdy09XoEtCL1qWVauGEAxXFJ
	grkkawbSt3DV/HjZ9SuGHpkp75JQAgq9HwGEqYm3eYEEeYhqhoJi4H4C7E6lngRihsAB
	ZEUjLT/c1WCyim/2+kHuJYutAwOW1GeUCwGhf5EX4iLgr4AXxv0nnvAhjXMQgbDx6Jyi
	gXzQ==
Received: by 10.68.216.2 with SMTP id om2mr52968689pbc.26.1341763872190;
	Sun, 08 Jul 2012 09:11:12 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:22 -0700
Message-Id: <d0ab787edc73dab9cf24e3d08b42b9d306446ab7.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 04/19] coreutils: Fix build with eglibc 2.16
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:18 -0000

eglibc 2.16 has removed gets so we account for that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
new file mode 100644
index 0000000..4f61c92
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
@@ -0,0 +1,23 @@
+use gets iff its defined. eglibc 2.16 removed gets
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: coreutils-8.14/lib/stdio.in.h
+===================================================================
+--- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
++++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
+@@ -713,11 +713,13 @@
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
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 214bedb..9a714a9 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r4"
+PR = "r5"
 DEPENDS = "gmp libcap"
 DEPENDS_virtclass-native = ""
 
@@ -15,6 +15,7 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
+           file://remove-gets.patch \
           "
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
-- 
1.7.9.5



