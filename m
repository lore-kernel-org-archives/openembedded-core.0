Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qtezk-0005UE-AP
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 14:13:16 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so354594ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=aARW5NGoBQuUgWIlU9+6II8NDyf/oJLiFUhrB2v1fFg=;
	b=lE1ZECZyPJaHsG5M3nCqwFpEZ+zi93XJ01xhEokLVmwo7lc40mpZBJFzjwlQsrWBLZ
	3G6nDEWLBaYnOO2r1a3bcWHkD/wjC67cA69VKlj0LJ8vVsb0bCIUDIHzOKX+5I5IiSM7
	6kgaWP+rOkjyGIP/fnIsJojPaIUgb9pK9NnMA=
Received: by 10.14.145.145 with SMTP id p17mr236522eej.130.1313582920159;
	Wed, 17 Aug 2011 05:08:40 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id r5sm579624eef.2.2011.08.17.05.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 05:08:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 16:08:30 +0400
Message-Id: <1313582910-21617-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1313582910-21617-1-git-send-email-dbaryshkov@gmail.com>
References: <1313582910-21617-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 3/3] meta-efl/screenshot: fix building with current gettext/auto*
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
X-List-Received-Date: Wed, 17 Aug 2011 12:13:16 -0000

Current auto*/gettext stopped substituting @MKINSTALLDIRS@ variable
which is necessary in screenshot/po/Makefile. Fix that by calling
AM_MKINSTALLDIRS manually.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../screenshot/screenshot-fix-mkinstalldirs.patch  |   23 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch

diff --git a/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch b/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
new file mode 100644
index 0000000..14f1141
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
@@ -0,0 +1,23 @@
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Subject: fix screenshot po/ building
+Upstream-Status: Pending
+
+Somehow configure doesn't substitute @MKINSTALLDIRS@ by default anymore,
+however this substitution is required for po/Makefile
+
+Fix that by calling AM_MKINSTALLDIRS from configure.ac
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: E-MODULES-EXTRA/screenshot/configure.ac
+===================================================================
+--- E-MODULES-EXTRA.orig/screenshot/configure.ac	2011-08-17 15:49:22.000000000 +0400
++++ E-MODULES-EXTRA/screenshot/configure.ac	2011-08-17 15:49:34.000000000 +0400
+@@ -24,6 +24,7 @@
+ define([AC_LIBTOOL_LANG_F77_CONFIG], [:])dnl
+ AC_PROG_LIBTOOL
+ 
++AM_MKINSTALLDIRS
+ m4_ifdef([AM_GNU_GETTEXT_VERSION], [
+ AM_GNU_GETTEXT_VERSION([0.14])
+ ])
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index a3678e6..465ffcf 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -2,6 +2,7 @@ LICENSE = "MIT"
 PV = "0.3.0+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
 
 require e-module.inc
 
-- 
1.7.2.5



