Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Rc-0007vw-UI
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:56:38 +0100
Received: by gwaa20 with SMTP id a20so414923gwa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=l15M5nx/jqX5KzHbyelWPzCRVxafJ4ZwmDIhJut4rPc=;
	b=Nbh5vMyWq8zY9qLm/B+F+3c5J3NKNJWd+0dhK88TjkPLIUGIWvesbEJwTDRgyHsSsI
	t0aIfksmp/yFZIJOIhRYkHwF8Md9Y2ocVNJt2rNWdQ+2jFUZHm8BJiMz6e1af6hV1nV3
	9yg/wcf02XUUd4a6K1IMKzvX1w80dAWnvftDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wfaM1rsP4WDiy8PNTuFE763HbDDFmfB53YfvdyLX5gmVo1Gyr0WiR/5y7V8tKyJrZ8
	2IoNiQB7WVTjwUHsN5H9QlFnVcDC901dhhM2q6eQ7optWA6ievYDRJcxVhDCjQ1A8+3I
	2q8/5Nl7f/Jc2n8cLSB3i3JQfYuD7++teMBMg=
Received: by 10.150.161.5 with SMTP id j5mr1158528ybe.305.1299135185646;
	Wed, 02 Mar 2011 22:53:05 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.53.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:53:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:47 -0800
Message-Id: <1299135167-18330-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 06:56:38 -0000

* This patch passes the correct LDFLAGS to account for
  additional dependencies of librpmio on libbeecrypt and libsyck
  and hence fixes the build error.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   13 +++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
new file mode 100644
index 0000000..347d976
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
@@ -0,0 +1,13 @@
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



