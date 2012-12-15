Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjpjh-0001Yx-Rt
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 12:16:56 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1978429bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ILA9XwS/gxpnmTPh6J79ieAzgmCZtQu3raHDPYQYWhw=;
	b=wypHtOaGnqNnetMXH01odAfcpeukvHlZyQakvET+DGz8yjUFkuWbCAc9baVEIUqs/0
	SKpQkm3W/i/zOwF6RlPSgiTHo2S+Gn663LL93Cf2TztXA44dJxt5rYWFjofhMDt6mycA
	SITFEIX2ALKT7lUpRuq+12JLIcj4MyXWQ2oXfPoP4sib/wTl10E1QrXECEWQ5BxpP4q9
	PpBUKn3iVF9ahz3uqycUoegbX8X7fNsBmhieZh5uXGbBFtfcSnZ3zRLLWQcqa11N1zf/
	883wTXNuf65Mi9kC6Gvd+JLFQ5/ZFgYxdbAgo1EA5E5tvJzYFg+dhHWmL9HwtaxFeSgS
	QqmQ==
Received: by 10.204.156.81 with SMTP id v17mr3775622bkw.18.1355569336383;
	Sat, 15 Dec 2012 03:02:16 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id l17sm6159995bkw.12.2012.12.15.03.02.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 03:02:15 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjpVV-00018C-3U; Sat, 15 Dec 2012 13:02:13 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 13:02:08 +0200
Message-Id: <1355569328-4307-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355569328-4307-1-git-send-email-cazfi74@gmail.com>
References: <1355569328-4307-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] coreutils: update to upstream version 8.19
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
X-List-Received-Date: Sat, 15 Dec 2012 11:16:57 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 --------------------
 .../coreutils-build-with-acl.patch                 |    0
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.14.bb => coreutils_8.19.bb}       |    9 ++++----
 4 files changed, 4 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.19}/coreutils-build-with-acl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.19}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.19.bb} (92%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
deleted file mode 100644
index 4f61c92..0000000
--- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-use gets iff its defined. eglibc 2.16 removed gets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: coreutils-8.14/lib/stdio.in.h
-===================================================================
---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
-+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
-@@ -713,11 +713,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-8.19/coreutils-build-with-acl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
rename to meta/recipes-core/coreutils/coreutils-8.19/coreutils-build-with-acl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.19/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.19/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.19.bb
similarity index 92%
rename from meta/recipes-core/coreutils/coreutils_8.14.bb
rename to meta/recipes-core/coreutils/coreutils_8.19.bb
index 04c9eb2..bd01704 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.19.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=5;endline=16;md5=2e9acd8818fe6db4c2981d20ca632553"
-PR = "r5"
+                    file://src/ls.c;beginline=4;endline=15;md5=2e9acd8818fe6db4c2981d20ca632553"
+PR = "r0"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -15,11 +15,10 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://remove-gets.patch \
            file://coreutils-build-with-acl.patch \
           "
-SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
-SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
+SRC_URI[md5sum] = "1a01231a2f3ed37c0efc073ccdda9375"
+SRC_URI[sha256sum] = "ad3873183fd8cfc7672b3ba54644672e59352f9b2dc7e3ad251c1174dde8a9e7"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 
-- 
1.7.10.4



