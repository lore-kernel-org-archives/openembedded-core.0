Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 937776098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:22:26 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so1446355eek.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 17:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=2m0sjzNsoJJ0CABCXELUpPpUbH1JGmv2fVsaR+R7FI0=;
	b=SvQ2qLVa+l7RxFbwnDO4F2SxnUH0y8s7eh7mUmOBdaSvNIC9ZHoWRpN1NzRMwWSx29
	i8LORt9EHT5I7BPzpuIBhDHmQugCCgpHDqjA4pPuNr1VOD7lLD+KUkMmL5Bvsn5d3pCc
	7C5WHLyFza0b/8TheurIFgCRJBbffdnbfdIkEdhvAjQakRPHAN61OCC0aOsKrgZvZ2j+
	r4ABjCNT+A+nS9DLn+N66ObeeSRWQKUDWz7hA3sFZXqW/elVO/is+uk8waCVYyF8El/P
	m3/GL+Mt11uws/X/5szRH68ujmRtcSHJ/hw8cBVBLLkPAuEuKK4BEOYE//EFA3HLFwhH
	ckMw==
X-Received: by 10.15.73.197 with SMTP id h45mr13739282eey.146.1371428546900;
	Sun, 16 Jun 2013 17:22:26 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id b3sm2702254eev.10.2013.06.16.17.22.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Jun 2013 17:22:26 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 01:22:02 +0100
Message-Id: <1371428523-21377-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH 1/2] opkg: fix header installation for libopkg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 00:22:27 -0000

When opkg is built outside the source directory, libopkg headers aren't all
installed as the search path for headers only includes the directory that make
is being ran in, not the source directory. So we fix this by adding
$(srcdir)/*.h to the list of header files to install.

Without this patch, "/usr/include/libopkg" will only include the file config.h.
With this patch, other files such as "opkg.h" are present which are needed to
compile software which uses libopkg.

The new patch has also been submitted upstream as a fix to opkg itself.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0001-Fix-libopkg-header-installation.patch     | 32 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch b/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch
new file mode 100644
index 0000000..c27fdb1
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch
@@ -0,0 +1,32 @@
+From 79a40cc4c3b5d6f8a90d9dc0ac5d2c40983764f7 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sun, 16 Jun 2013 23:27:27 +0100
+Subject: [PATCH] Fix libopkg header installation.
+
+When opkg is built outside the source directory, libopkg headers aren't all
+installed as the search path for headers only includes the directory that make
+is being ran in, not the source directory. So we fix this by adding
+$(srcdir)/*.h to the list of header files to install.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Submitted
+---
+ libopkg/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopkg/Makefile.am b/libopkg/Makefile.am
+index 043c5c4..b6f4f7b 100644
+--- a/libopkg/Makefile.am
++++ b/libopkg/Makefile.am
+@@ -2,7 +2,7 @@
+ AM_CFLAGS=-Wall -DHOST_CPU_STR=\"@host_cpu@\" -DBUILD_CPU=@build_cpu@ -DLIBDIR=\"@libdir@\" -DOPKGLIBDIR=\"@opkglibdir@\" -DOPKGETCDIR=\"@opkgetcdir@\" -DOPKGLOCKFILE=\"@opkglockfile@\" -DDATADIR=\"@datadir@\" -I$(top_srcdir) $(BIGENDIAN_CFLAGS) $(CURL_CFLAGS) $(GPGME_CFLAGS) $(PATHFINDER_CFLAGS)
+ 
+ libopkg_includedir=$(includedir)/libopkg
+-libopkg_include_HEADERS= *.h
++libopkg_include_HEADERS= *.h $(srcdir)/*.h
+ 
+ 
+ opkg_libcore_sources = \
+-- 
+1.8.3
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 382bfdd..9f3512d 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -2,6 +2,7 @@ require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://obsolete_automake_macros.patch \
+	   file://0001-Fix-libopkg-header-installation.patch \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.8.3


