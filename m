Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8684E731C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:53:49 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z61so5091501wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 08:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/oQGJkRK5PGBYoDybtRMyhKQPM9mY0sx9RQD0f+9Wng=;
	b=Cik0KLZ7l5uxB2KKLzuxe4p5IQnQ3rjQaBoPf3YGa8t8gR/rkCYwA4aoa6QjfdTkim
	IWNLVGi0KUNs7DAyPn7azd3ZbnHbA1kJn3Qe9im2rXDWD4amHD41F2wd03K22XBqsgkl
	0AOujvTwa4HAn/3I+Cg0Ef6CZ6hDG2B3eK0mjug9FKK5BPlWjpw4HJxafdfLrWWR/S2a
	NrAlCNwQtsFkj7+6GUa7DDdKYrpn8QcOQ5DCE+vzCP0u8/Os10cnGXy2R/VeiUWjg9cT
	WhTdaivi7aUCFCXWka/BreZB/SvQF1sxNQypnVQ0sLBWboYB7ZF/Yu7CgKTVc+vs34u0
	uI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/oQGJkRK5PGBYoDybtRMyhKQPM9mY0sx9RQD0f+9Wng=;
	b=FGiaaKwnafG9sh1plT4nPfWtL6lUTyPPAvr9Vtf26c6G54CqbWL+yPNTrCVi/lN7ZT
	4LTeiyYwV5LxkauSM7b/a9V7n6SBC6LnyyUxTWvgaCo9S0VCTFRKeE7g5WzHxeIcm14o
	6Nfu9j1+fp7MPeQARm6NmXXXjhzKhRgtnrs9c2NddFLBzieSFGxTkaMeIngXDrHVLH8g
	8QBfNdmyYoybanXEETGUqulqONHo55WRl3/+mR6UWluhUUXDDgC8Ux3pFeUnE/PUL4xa
	w/nUjB3Ucxa3nD0MXqNBd/iLLc2VcjmYH3m9ts1PmNDqyrePX2k0C+J4RpMJ8R7XA4lf
	RsYg==
X-Gm-Message-State: AMke39lJKRwASXV07yGSZTuNKEJ53o/dEn0eiN1aFn0zfkGmMog8hyeWoVskRueZIa47LQ==
X-Received: by 10.223.147.130 with SMTP id 2mr7264969wrp.53.1487350428796;
	Fri, 17 Feb 2017 08:53:48 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	x39sm13662366wrb.3.2017.02.17.08.53.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 08:53:48 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 18:50:33 +0200
Message-Id: <1487350233-9392-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] LSB 4.1: lsb_release script incompatible with busybox head and find
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
X-List-Received-Date: Fri, 17 Feb 2017 16:53:49 -0000

Busybox implementation only supports head -1 option if ENABLE_INCLUDE_SUSv2
or ENABLE_FEATURE_FANCY_HEAD configuration options are enabled. Also the -and
option for find is only supported if ENABLE_DESKTOP configuration option is
enabled. These configuration options are not enabled in several builds, which is
why this patch is needed.

[YOCTO #11041]

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 ...elease-to-work-with-busybox-head-and-find.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/lsb/lsb_4.1.bb               |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsb/lsb/fix-lsb_release-to-work-with-busybox-head-and-find.patch

diff --git a/meta/recipes-extended/lsb/lsb/fix-lsb_release-to-work-with-busybox-head-and-find.patch b/meta/recipes-extended/lsb/lsb/fix-lsb_release-to-work-with-busybox-head-and-find.patch
new file mode 100644
index 0000000..0bfdaaf
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb/fix-lsb_release-to-work-with-busybox-head-and-find.patch
@@ -0,0 +1,34 @@
+# Copyright (c) 2013 LG Electronics, Inc.
+
+# Busybox implementation only supports head -1 option if ENABLE_INCLUDE_SUSv2
+# or ENABLE_FEATURE_FANCY_HEAD configuration options are enabled. Also the -and
+# option for find is only supported if ENABLE_DESKTOP configuration option is
+# enabled. These configuration options are not enabled in build-webos, which is
+# why this patch is needed.
+
+diff -ru orig-lsb-release-1.4/lsb_release lsb-release-1.4/lsb_release
+--- orig-lsb-release-1.4/lsb_release	2013-03-13 09:13:56.518509117 +0200
++++ lsb-release-1.4/lsb_release	2013-03-13 11:50:03.765119076 +0200
+@@ -209,7 +209,7 @@
+             || [ -n "$(echo $DISTRIB_DESCRIPTION |                            \
+                        sed -e "s/.*$DESCSTR_DELI.*//")" ]
+         then
+-            TMP_DISTRIB_DESC=$(head -1 $FILENAME 2>/dev/null)
++            TMP_DISTRIB_DESC=$(head -n 1 $FILENAME 2>/dev/null)
+             [ -z "$DISTRIB_DESCRIPTION" ]                                     \
+                 && DISTRIB_DESCRIPTION=$TMP_DISTRIB_DESC
+         else
+@@ -249,10 +249,10 @@
+         then
+             CHECKFIRST=$(find $INFO_ROOT/ -maxdepth 1                         \
+                    -name \*$INFO_DISTRIB_SUFFIX                               \
+-                   -and ! -name $INFO_LSB_FILE                                \
+-                   -and -type f                                               \
++                   -type f                                                    \
+                    2>/dev/null                                                \
+-                   | head -1 ) # keep one of the files found (if many)
++                   | grep -v $INFO_LSB_FILE                                   \
++                   | head -n 1 ) # keep one of the files found (if many)
+         fi
+         InitDistribInfo $CHECKFIRST
+     fi
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index ece0eab..bc9048b 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r2"
+PR = "r3"
 
 LSB_CORE = "lsb-core-${TARGET_ARCH}"
 LSB_CORE_x86 = "lsb-core-ia32"
@@ -15,6 +15,7 @@ RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
+           file://fix-lsb_release-to-work-with-busybox-head-and-find.patch \
            file://init-functions \
            file://lsb_killproc \
            file://lsb_log_message \
-- 
2.1.4


