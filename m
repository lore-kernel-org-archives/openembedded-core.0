Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A993C73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JV4B026722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:24 -0800
Message-ID: <05a450ae3f42ae5f1380e42cf6de5f4eb39a6719.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] iputils: s20121221 -> s20151218
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:30 -0000
Content-Type: text/plain

* Remove fix-build-command-line-argument-with-gnutls.patch which is
  already in the source.
* Add libgcrypt to DEPENDS since it depends on it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...x-build-command-line-argument-with-gnutls.patch |   37 --------------------
 .../{iputils_s20121221.bb => iputils_s20151218.bb} |    7 ++--
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
 rename meta/recipes-extended/iputils/{iputils_s20121221.bb => iputils_s20151218.bb} (90%)

diff --git a/meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch b/meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
deleted file mode 100644
index b9cd82e..0000000
--- a/meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Backport
-
-From 568e990d30fc7e9416e0a6f8c74ea5013921eaec Mon Sep 17 00:00:00 2001
-From: Arjan van de Ven <arjanvandeven@gmail.com>
-Date: Wed, 16 Jan 2013 03:12:15 +0900
-Subject: [PATCH] ping6: Fix build command line argument with gnutls.
-
-The ping6 command can use either openssl or gnutls...
-and the Makefile has a bunch of setup for defining which of the two to use.
-
-Unfortunately, the final -D define on the commandline to enable gnutls
-inside the ping6.c file didn't actually make it onto the gcc
-commandline.
-This patch adds the $(DEF_CRYPTO) Makefile variable to fix this gap.
-
-Signed-off-by: Arjan van de Ven <arjanvandeven@gmail.com>
-Signed-off-by: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
----
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c62d9df..89249f5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -149,7 +149,7 @@ LIB_clockdiff = $(LIB_CAP)
- DEF_ping_common = $(DEF_CAP) $(DEF_IDN)
- DEF_ping  = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS)
- LIB_ping  = $(LIB_CAP) $(LIB_IDN)
--DEF_ping6 = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS) $(DEF_ENABLE_PING6_RTHDR)
-+DEF_ping6 = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS) $(DEF_ENABLE_PING6_RTHDR) $(DEF_CRYPTO)
- LIB_ping6 = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV) $(LIB_CRYPTO)
- 
- ping: ping_common.o
--- 
-1.7.2.5
-
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20151218.bb
similarity index 90%
rename from meta/recipes-extended/iputils/iputils_s20121221.bb
rename to meta/recipes-extended/iputils/iputils_s20151218.bb
index 49913d6..4c3523d 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20151218.bb
@@ -11,18 +11,17 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
                     file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "gnutls docbook-utils-native sgmlspl-native libcap"
+DEPENDS = "gnutls docbook-utils-native sgmlspl-native libcap libgcrypt"
 
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/use_gethostbyname2.diff \
            file://debian/targets.diff \
            file://nsgmls-path-fix.patch \
-           file://fix-build-command-line-argument-with-gnutls.patch \
           "
 
-SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
-SRC_URI[sha256sum] = "450f549fc5b620c23c5929aa6d54b7ddfc7ee1cb1e8efdc5e8bb21d8d0c5319f"
+SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
+SRC_URI[sha256sum] = "549f58d71951e52b46595829134d4e330642f522f50026917fadc349a54825a1"
 
 UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
 
-- 
1.7.9.5


