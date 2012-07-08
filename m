Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFi-0001HK-4b
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:30 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eaamBkeGwnJ5ZGt6NhuuEJLAUO8snuouNlsXYBsgBLo=;
	b=M1H+OGb+lh+duppeDvFPVnvq/x+y64CcEOayjGDicl3Hc0a0M5NkvP76YzXh069HHS
	sRBupO087/JwllzRsNsQfm86VDqoFZcG/lu+2NRXp1v/+9USrSsHYoi/oJVIdiFHCf37
	1ZdBv9x42ZUqhDuobM4c6Y+zm0v4TVVGaua/W6RKRKyWz8muR1bu+IH7Kolt6NzKBHad
	H3d/jN3bAcVpW/q/g24uO+myMnTNbMuMw3ibmfTlmlL1Ay5A7dai72i5nIdqsk2M879K
	I1JYsloMk1vpHZ1VYdnGEyvW5JxVM5HbvoHXxtjTUgL+S+qKqSgyyy5a9Hl1CXl5Yzpi
	hqYw==
Received: by 10.66.72.136 with SMTP id d8mr59446721pav.21.1341763883811;
	Sun, 08 Jul 2012 09:11:23 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:30 -0700
Message-Id: <880420572e79361f5b2b522fad39bebb8e99109a.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 12/19] valgrind: Fix build with eglibc 2.16
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
X-List-Received-Date: Sun, 08 Jul 2012 16:27:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
new file mode 100644
index 0000000..c622637
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
@@ -0,0 +1,32 @@
+Add case for glibc 2.16 and correct error message to denote support until 2.16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: valgrind-3.7.0/configure.in
+===================================================================
+--- valgrind-3.7.0.orig/configure.in	2012-07-04 12:57:10.557192441 -0700
++++ valgrind-3.7.0/configure.in	2012-07-04 12:57:58.785194776 -0700
+@@ -788,6 +788,13 @@
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.16)
++	AC_MSG_RESULT(2.16 family)
++	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
+@@ -801,7 +808,7 @@
+ 
+      *)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.14])
++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
+ 	AC_MSG_ERROR([or Darwin libc])
+ 	;;
+ esac
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 6b54472..97b135c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -17,7 +17,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://fix_for_automake_1.11.2.patch \
            file://configure-fix.patch \
-           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch"
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
+           file://configure-with-glibc-2.16.patch \
+          "
 
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
-- 
1.7.9.5



