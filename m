Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5316.1585792032269412661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:47:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EF08350A999D
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2020 09:36:49 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:47:08 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:47:16 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libusb1: upgrade 1.0.22 -> 1.0.23
Date: Thu, 2 Apr 2020 02:16:58 -0700
Message-ID: <1585819019-28752-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585819019-28752-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585819019-28752-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EF08350A999D.A577E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

no-dll.patch
removed since it is no available for 1.0.23

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libusb/libusb1/no-dll.patch               | 19 -------------------
 .../{libusb1_1.0.22.bb => libusb1_1.0.23.bb}  |  5 ++---
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-support/libusb/libusb1/no-dll.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.22.bb => libusb1_1.0.23.bb} (88%)

diff --git a/meta/recipes-support/libusb/libusb1/no-dll.patch b/meta/recipes-support/libusb/libusb1/no-dll.patch
deleted file mode 100644
index 6e6bb83d1f..0000000000
--- a/meta/recipes-support/libusb/libusb1/no-dll.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-As all invokes all-recursive which uses sub-makes to invoke all-am, the
-resulting makefile wants to build libusb-1.0.la twice. In non-parallel builds
-the second attempt is skipped as the target already exists, but in highly
-parallel builds it's likely that two makes will be building libusb-1.0.la at the
-same time.
-
-Solve this by removing the explicit all target, which as libusb-1.0.dll isn't
-built under Linux is redundant anyway.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/libusb/Makefile.am b/libusb/Makefile.am
-index 0cab0a0..c880213 100644
---- a/libusb/Makefile.am
-+++ b/libusb/Makefile.am
-@@ -1,2 +0,0 @@
--all: libusb-1.0.la libusb-1.0.dll
--
diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-support/libusb/libusb1_1.0.23.bb
similarity index 88%
rename from meta/recipes-support/libusb/libusb1_1.0.22.bb
rename to meta/recipes-support/libusb/libusb1_1.0.23.bb
index 1d9d772575..2fd658b4ef 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.23.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
-           file://no-dll.patch \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "466267889daead47674df933cea9cacb"
-SRC_URI[sha256sum] = "75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157"
+SRC_URI[md5sum] = "be79ed4a4a440169deec8beaac6aae33"
+SRC_URI[sha256sum] = "4fc17b2ef3502757641bf8fe2c14ad86ec86302a2b785abcb0806fd03aa1201f"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.17.1



