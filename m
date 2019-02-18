Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1C37C892
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 00EA240BBA;
	Mon, 18 Feb 2019 22:49:24 +0000 (UTC)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TNxOi_nxdUPv; Mon, 18 Feb 2019 22:49:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E035D40B0C;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5557A16B4D5;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:07 -0500
Message-Id: <1a573a62eb0283fa80e857650064d5980e88e23c.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 6/6] grep: upgrade 3.1 -> 3.3
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

License checksum changed due to cleanup, all URLs converted to https.

need_charset_alias is no longer being used, drop the patch.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 33 ----------------------
 .../grep/{grep_3.1.bb => grep_3.3.bb}              | 10 +++----
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-extended/grep/{grep_3.1.bb => grep_3.3.bb} (74%)

diff --git a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4ba..0000000
--- a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/grep/grep_3.1.bb b/meta/recipes-extended/grep/grep_3.3.bb
similarity index 74%
rename from meta/recipes-extended/grep/grep_3.1.bb
rename to meta/recipes-extended/grep/grep_3.3.bb
index 71810dc..704a3ec 100644
--- a/meta/recipes-extended/grep/grep_3.1.bb
+++ b/meta/recipes-extended/grep/grep_3.3.bb
@@ -3,14 +3,12 @@ HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-          "
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "feca7b3e7c7f4aab2b42ecbfc513b070"
-SRC_URI[sha256sum] = "db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e"
+SRC_URI[md5sum] = "05d0718a1b7cc706a4bdf8115363f1ed"
+SRC_URI[sha256sum] = "b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.7.4


