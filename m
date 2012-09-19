Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TEGll-00026l-D1
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 11:40:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8J9RpZo029982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 02:27:51 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 19 Sep 2012 02:27:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Sep 2012 17:33:03 +0800
Message-ID: <45755d9258bbd9b25aa8c65144c575e13d9b04b7.1348038053.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1348038052.git.liezhi.yang@windriver.com>
References: <cover.1348038052.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] opkg 0.1.8: remove it since it doesn't work
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 09:40:33 -0000
Content-Type: text/plain

Remove opkg_0.1.8.bb and the related files since it doesn't work:

- It doesn't support the "--force_postinstall" option which is used by
  package_ipk.bbclass.

- It still doesn't work after remove the "--force_postinstall" option,
  it can't install the packages in complementary_pkgs.txt.

[YOCTO #3136]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch | 19 -------------------
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb        | 10 ----------
 meta/recipes-devtools/opkg/opkg_0.1.8.bb              | 11 -----------
 3 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg_0.1.8.bb

diff --git a/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch b/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
deleted file mode 100644
index f68524b..0000000
--- a/meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Without this, the FILE reference in this header can cause compile issues.
-
-RP - 29/1/10
-
-Upstream-Status: Accepted
-
-Index: trunk/libopkg/pkg_dest.h
-===================================================================
---- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
-+++ trunk/libopkg/pkg_dest.h	2010-01-29 09:37:33.000000000 +0000
-@@ -18,6 +18,8 @@
- #ifndef PKG_DEST_H
- #define PKG_DEST_H
- 
-+#include <stdio.h>
-+
- typedef struct pkg_dest pkg_dest_t;
- struct pkg_dest
- {
diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
deleted file mode 100644
index da2a39c..0000000
--- a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require opkg_${PV}.bb
-
-DEPENDS = "curl"
-PROVIDES += "opkg"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-${PV}:"
-
-EXTRA_OECONF += "--disable-gpg"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
deleted file mode 100644
index 901508a..0000000
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require opkg.inc
-
-SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
-           file://add_vercmp.patch \
-           file://headerfix.patch \
-          "
-
-SRC_URI[md5sum] = "c714ce0e4863bf1315e3b6913ffe3299"
-SRC_URI[sha256sum] = "ff94bf30bd662d49c4b5057e3a0818d062731adaa555d59abd677ec32a3c1c60"
-
-PR = "${INC_PR}.0"
-- 
1.7.11.2



