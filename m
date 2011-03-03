Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvB6z-0003vm-Bd
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:10:45 +0100
Received: by gwaa20 with SMTP id a20so654578gwa.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=uh84VJ2UxXAeQPNJt1tWiui462iNZGtfQOV3Thxx+8g=;
	b=cRJRn8/iR38bQ280ZW0PsCxWp6iqJaw98EFRxmjefrywSrbsfR/UCq4YGiq/JqVIAx
	kQHjxrZtFLw2t1ztjyNUEz92nLVBUuHc4cASEj9wCzhrWWXa5Nm9bMESnpYTYyWRvMXl
	T6gwy58V+WQBWsXyPBP575eX1xBXeZKZV235k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WdwkBqLCBXVM/0I6hlrHrN2ymtpvmfJxsDGJ2SGj1S8loU62+q3jTqErsAATrHSdVT
	4w4tXlr15IJjaRRaxCzS4+2Gq4VobSb3Gnw3XY8fW5MALfRjZYwQhoSxN1a0GW4Es4Jb
	dsoBbKdqFtMEWGjsB41HfWMqgKmEpgHXcHhJ0=
Received: by 10.236.77.132 with SMTP id d4mr1931781yhe.42.1299168551957;
	Thu, 03 Mar 2011 08:09:11 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f13sm875467yhf.33.2011.03.03.08.09.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 08:09:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2011 08:09:06 -0800
Message-Id: <1299168546-20430-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv4 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 16:10:45 -0000

* This patch passes the correct LDFLAGS to account for
  additional dependencies of librpmio on libbeecrypt and libsyck
  and hence fixes the build error.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   24 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
new file mode 100644
index 0000000..9e7bba0
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
@@ -0,0 +1,24 @@
+Source: None
+Status: Needs to go Upstream
+Author: Khem Raj <raj.khem@gmail.com>
+Date: 2011-03-03
+Description:
+This patch fixes build issue found when compiling rpm-natibe on ubuntu
+11.04-alpha. Problem is that linker does not get correct set of dependent
+libraries when linking mtree binary which results in undefined symbols
+in librpmio.so. This patch adds correct flags to mtree_LDADD to account
+for rpmio deps
+
+Index: rpm-5.4.0/tools/Makefile.am
+===================================================================
+--- rpm-5.4.0.orig/tools/Makefile.am
++++ rpm-5.4.0/tools/Makefile.am
+@@ -169,7 +169,7 @@ grep_LDADD =		$(RPMIO_LDADD_COMMON)
+ 
+ mtree_SOURCES =		rpmmtree.c
+ mtree_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
+-mtree_LDADD =		$(RPM_LDADD_COMMON)
++mtree_LDADD =		$(RPMIO_LDADD_COMMON)
+ 
+ rpmrepo_SOURCES =	rpmrepo.c
+ rpmrepo_CPPFLAGS =	$(AM_CPPFLAGS) -I$(top_srcdir)/scripts -I$(top_builddir)/scripts $(CPPFLAGS)
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 0003f48..3704816 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPL 2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "bzip2 zlib python perl db openssl elfutils expat libpcre attr acl popt"
-PR = "r13"
+PR = "r14"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -56,6 +56,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-showrc.patch \
 	   file://rpm-nofsync.patch \
 	   file://rpm-solvedb.patch \
+	   file://rpm-tools-mtree-LDFLAGS.patch \
 	  "
 
 #           file://hdraddorappend.patch \
-- 
1.7.4.1



