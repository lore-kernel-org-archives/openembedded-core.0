Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C29C7E08C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 20:55:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so1435517wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4WCty8wi1weyfbnQtn0Qh3rE6fUWuZ4SwKHi7ALAPoI=;
	b=lQThmdUbprDy0RGx2hbNwXFkJH87CKlGuN0/papx/iml6KRuUkxt3x0QVCjtWtfHo/
	25vgefGkE87LCw117cNmqjzL0KH86m1NnuaUTZMe/nK1myOU9xRs3P96aBlWJ53mLOa3
	08LlLZd3p4d2PQFguHHwnjgoBvCjokhTLzpJ8Yvx17xp0RA1lJ9NMsohUZ8HKAukyopA
	m8HyVzHE0ZO05gy5eT3qKjQXDVF+f5DMsR6CrXJoefzf7CcvF8fXBzqD4dx078+9Wq8u
	CanGUDioXD3cvDuGP6fItFmkazMt3Sun1sVJ84VjjZe1UV3nG1PAllGMHg6VF+VXljXc
	t+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4WCty8wi1weyfbnQtn0Qh3rE6fUWuZ4SwKHi7ALAPoI=;
	b=jsj7jJXbXq759AO/sSErVaRRV8hSfdc5L8y8pMAhVgAPDR9MKv4+rvV8DOLouyZU5R
	637IssiazXxsQlqjXrGm2FCMyiCsu3LBKbNoA/vYneUmNlO7/fU7ahkpJx3oRmCmdnsP
	DEfz6uirf5SeqDNFNYeunrKJZVtzCExQM7XjnqEbq8fyqgMOxBFyS6bFkoGJns/zYKPS
	QTdPbFAik+GRfqshEVQgsH2vS5EIxGVqtTii0J/wrkd6KEZHZMXBg2fLo4I1c5H6/B4B
	47oskXPN/sGhvJDhnz56QX2DtUagIFppmkwkyQ2G5BZz/tW+Mo7JLDV6eF/E3RO3xlBA
	k/4w==
X-Gm-Message-State: APjAAAVBvm3zsvEqKz1Cd0zuyCi9PH44s6Tq2yBYydfbvgGXEFvF/9NV
	ekG0eePX4eM0/c6rTaa8NIsD5k1EG+A=
X-Google-Smtp-Source: APXvYqw6W2ikSnLShymxDcC4NOXWGoPVzIZsY4+Pmq6Bwi7k8Lj5NOP9Im5a/WR6fczEiX2Pfb8nJQ==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr21963300wrq.285.1559681707920;
	Tue, 04 Jun 2019 13:55:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r131sm7529338wmf.4.2019.06.04.13.55.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 13:55:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 21:55:00 +0100
Message-Id: <20190604205500.10166-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libical: tidy up Perl finding
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
X-List-Received-Date: Tue, 04 Jun 2019 20:55:07 -0000

Instead of patching out the Perl detection, seed the search for perl with
HOSTTOOLS_DIR/perl.  This search usually fails because we don't let
find_program() hunt in the system paths currently.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libical/Remove-cmake-check-for-Perl.patch      | 30 ----------------------
 meta/recipes-support/libical/libical_2.0.0.bb      |  4 ++-
 2 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch

diff --git a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
deleted file mode 100644
index b50f50e7017..00000000000
--- a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 918cd8764a845a9d25918a444fbaa5070d2be609 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 21 Aug 2015 16:38:05 +0300
-Subject: [PATCH] Remove cmake check for Perl
-
-We set "CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY" in cmake bbclass to
-make sure cmake does not find host programs. In this case we actually
-are fine with host perl: remove the check.
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: libical-2.0.0/CMakeLists.txt
-===================================================================
---- libical-2.0.0.orig/CMakeLists.txt
-+++ libical-2.0.0/CMakeLists.txt
-@@ -116,8 +116,7 @@ if(SHARED_ONLY)
-   set(LIBRARY_TYPE SHARED)
- endif()
- 
--# must have Perl to create the derived stuff
--find_package(Perl REQUIRED)
-+set(PERL_EXECUTABLE perl)
- 
- # Ensure finding 64bit libs when using 64-bit compilers
- if(CMAKE_CL_64)
diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index daa47abcbcf..fc33f8ea2df 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-           file://Remove-cmake-check-for-Perl.patch \
            file://0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch \
            "
 DEPENDS = "icu"
@@ -18,6 +17,9 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
 
+# No need to use perl-native, the host perl is sufficient.
+EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
+
 do_install_append_class-target () {
     # Remove build host references
     sed -i \
-- 
2.11.0


