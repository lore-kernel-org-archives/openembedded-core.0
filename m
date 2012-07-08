Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFY-0001HK-0g
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:20 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7xQeUaDvkWLW6tv1Uj5J1kauzXmPUwws4kGM64vKo7c=;
	b=zPehqJWViPnwjwSgEOAZakddv48qlzZz6S1i4IuSlR8cQtDUuDR/VQNj07+oXvPAmt
	Ac1OEWi5ISK+2xvMYqbBsqAOnd8xCZY4+fmqJBV8PbIZ8Et2jkRan++2f9Tmc7SJG+/R
	smUo32hBw3bn1lv0Cocm+6tndBAD4KgIY8IWbNlWz0AdOlPHMqDY/nLWNZYh39mbQJPQ
	HG6yp8VfbUNPe+uvjCsuzi5RdGxR8HQK8EFPPI9jkTK2nTlZWekznmYmv9Hb3j/tMyJf
	bAO1ikBJR6bv/waHd9ssOI7Xt3705NZViBfUjTWp65etQ0nK5xVGuEsKiZUZaeJT6GLP
	OGqQ==
Received: by 10.66.88.65 with SMTP id be1mr59382001pab.28.1341763873604;
	Sun, 08 Jul 2012 09:11:13 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:23 -0700
Message-Id: <e0acdc765cffbbad2022f06f368a689e22d651d4.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 05/19] diffutils: Fix build with eglibc 2.16
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:20 -0000

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



