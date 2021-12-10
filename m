Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82086C43217
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7844.1639146170247487876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B3712FC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6D63F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 06/10] freetype: remove obsolete support for renamed
 libtool
Date: Fri, 10 Dec 2021 14:22:38 +0000
Message-Id: <20211210142242.2698587-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159533

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../freetype/freetype/use-right-libtool.patch | 31 -------------------
 .../freetype/freetype_2.11.1.bb               |  4 +--
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/freetype/freetype/use-right-lib=
tool.patch

diff --git a/meta/recipes-graphics/freetype/freetype/use-right-libtool.pa=
tch b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
deleted file mode 100644
index b389455f5d4..00000000000
--- a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 50499e4482d40cff2ef05905c658ba4380e7e6fc Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 7 Jan 2016 21:13:07 +0000
-Subject: [PATCH] freetype: enable out-of-tree builds, and use host zlib
-
-Freetype think that it knows best about where libtool is, and explicitly=
 the
-libtool autoconf macros telling it where to find the libtool script.  Of=
 course
-we prefix the script with the target triplet, so it's wrong.  Fix this b=
y
-removing the forced assignment, so the configure script's knowledge of w=
here it
-put libtool is used.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- builds/unix/unix-cc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/builds/unix/unix-cc.in b/builds/unix/unix-cc.in
-index 89be450..72609d3 100644
---- a/builds/unix/unix-cc.in
-+++ b/builds/unix/unix-cc.in
-@@ -16,7 +16,7 @@ CC           :=3D @CC@
- COMPILER_SEP :=3D $(SEP)
- FT_LIBTOOL_DIR ?=3D $(PLATFORM_DIR)
-=20
--LIBTOOL :=3D $(FT_LIBTOOL_DIR)/libtool
-+LIBTOOL :=3D $(FT_LIBTOOL_DIR)/@LIBTOOL@ --tag CC
-=20
-=20
- # The object file extension (for standard and static libraries).  This =
can be
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.11.1.bb
index 78babdcbdb2..04b56adc6b2 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -12,9 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Da5927784=
d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=3D9f37b4e6afa3fef9dba8932b16=
bd3f97 \
                     file://docs/GPLv2.TXT;md5=3D8ef380476f642c20ebf40fec=
b0add2ec"
=20
-SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
-           file://use-right-libtool.patch \
-          "
+SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
 SRC_URI[sha256sum] =3D "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e9=
60e5684050f2c5c8"
=20
 UPSTREAM_CHECK_REGEX =3D "freetype-(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1


