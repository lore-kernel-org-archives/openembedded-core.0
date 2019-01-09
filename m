Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC9F7C03A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:21:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x097L3nV005571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:21:03 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:21:02 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:40 +0800
Message-ID: <1547018383-19134-7-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 6/9] wget: upgrade 1.19.5 -> 1.20.1
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
X-List-Received-Date: Wed, 09 Jan 2019 07:21:02 -0000
Content-Type: text/plain

Drop 0001-Unset-need_charset_alias-when-building-for-musl.patch as it
had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 30 ----------------------
 meta/recipes-extended/wget/wget_1.19.5.bb          |  9 -------
 meta/recipes-extended/wget/wget_1.20.1.bb          |  8 ++++++
 3 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/wget/wget_1.19.5.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.20.1.bb

diff --git a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 0b3c6f5..0000000
--- a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
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
-Index: wget-1.16.3/lib/Makefile.am
-===================================================================
---- wget-1.16.3.orig/lib/Makefile.am
-+++ wget-1.16.3/lib/Makefile.am
-@@ -846,7 +846,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/wget/wget_1.19.5.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
deleted file mode 100644
index e37d8c7..0000000
--- a/meta/recipes-extended/wget/wget_1.19.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://0002-improve-reproducibility.patch \
-          "
-
-SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
-SRC_URI[sha256sum] = "b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.20.1.bb b/meta/recipes-extended/wget/wget_1.20.1.bb
new file mode 100644
index 0000000..d176bd0
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.20.1.bb
@@ -0,0 +1,8 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0002-improve-reproducibility.patch \
+          "
+
+SRC_URI[md5sum] = "f6ebe9c7b375fc9832fb1b2028271fb7"
+SRC_URI[sha256sum] = "b783b390cb571c837b392857945f5a1f00ec6b043177cc42abb8ee1b542ee1b3"
+
+require wget.inc
-- 
2.7.4


