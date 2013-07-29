Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9676A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:29:19 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so4556269wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=mSxkDk1bEkduIksDeav5PXh7K9ChTSAwk4U7HfhFEHg=;
	b=UdzTweVFan6O/Hc0cVFq1zco5Ke7gJOx0WNOj7wurQvCZPRCJfGnAkN+orE1dJ1FZa
	02byeHTphOZ0cOTkhxp7gOGAMtTflTTcU0LN/D/0rTsId5o55tHJ3nbicdWcp+/aqrtx
	yzGhK/eKaFiEoOCyshDbnh+5BfhCxC7H9na6f/Ln9EGh58uaDErnPh1N9XTVMjZBdQ48
	sa3N+7DGgRpaq2G1ToLfUglM77t/2B3XgoFunezduSU/0BLibwe/J7WeJqFlfU4FxY9o
	79+ZGud8Jh3vE7NXSGLAi25qwbLQEASaYbqphnxLa/OzT1CmWidCkkz2SNEpEEjyj3FL
	5DMg==
X-Received: by 10.194.63.46 with SMTP id d14mr43004738wjs.81.1375082958614;
	Mon, 29 Jul 2013 00:29:18 -0700 (PDT)
Received: from desktop.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id em1sm13702237wib.3.2013.07.29.00.29.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 00:29:17 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2013 08:28:32 +0100
Message-Id: <1375082912-22426-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] opkg: Bump SRCREV as patch has been applied upstream
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
X-List-Received-Date: Mon, 29 Jul 2013 07:29:19 -0000

The previous patch to fix the installation of libopkg headers has been accepted
upstream and is the next commit after the SRCREV used by the opkg recipe.
Therefore the patch can be replaced by a simple update of the SRCREV.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0001-Fix-libopkg-header-installation.patch     | 32 ----------------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch b/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch
deleted file mode 100644
index 784c412..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-Fix-libopkg-header-installation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 79a40cc4c3b5d6f8a90d9dc0ac5d2c40983764f7 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sun, 16 Jun 2013 23:27:27 +0100
-Subject: [PATCH] Fix libopkg header installation.
-
-When opkg is built outside the source directory, libopkg headers aren't all
-installed as the search path for headers only includes the directory that make
-is being ran in, not the source directory. So we fix this by adding
-$(srcdir)/*.h to the list of header files to install.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-Status: Submitted
----
- libopkg/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libopkg/Makefile.am b/libopkg/Makefile.am
-index 043c5c4..b6f4f7b 100644
---- a/libopkg/Makefile.am
-+++ b/libopkg/Makefile.am
-@@ -2,7 +2,7 @@
- AM_CFLAGS=-Wall -DHOST_CPU_STR=\"@host_cpu@\" -DBUILD_CPU=@build_cpu@ -DLIBDIR=\"@libdir@\" -DOPKGLIBDIR=\"@opkglibdir@\" -DOPKGETCDIR=\"@opkgetcdir@\" -DOPKGLOCKFILE=\"@opkglockfile@\" -DDATADIR=\"@datadir@\" -I$(top_srcdir) $(BIGENDIAN_CFLAGS) $(CURL_CFLAGS) $(GPGME_CFLAGS) $(PATHFINDER_CFLAGS)
- 
- libopkg_includedir=$(includedir)/libopkg
--libopkg_include_HEADERS= *.h
-+libopkg_include_HEADERS= *.h $(srcdir)/*.h
- 
- 
- opkg_libcore_sources = \
--- 
-1.8.3
-
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 9f3512d..3a47b95 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -2,12 +2,11 @@ require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://obsolete_automake_macros.patch \
-	   file://0001-Fix-libopkg-header-installation.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "649"
+SRCREV = "650"
 PV = "0.1.8+svnr${SRCPV}"
 
 PR = "${INC_PR}.0"
-- 
1.8.3.4


