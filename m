Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 647907999A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 15:11:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8TFBIxH008711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 08:11:18 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 08:11:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sat, 29 Sep 2018 23:21:08 +0800
Message-ID: <1538234468-29047-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <f7670593f1d04dfe9e212a4b86d766fa3cdb60cb.camel@linuxfoundation.org>
References: <f7670593f1d04dfe9e212a4b86d766fa3cdb60cb.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH V2] libidn2: improve reproducibility
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
X-List-Received-Date: Sat, 29 Sep 2018 15:11:18 -0000
Content-Type: text/plain

Since option `--with-libunistring-prefix' is used, it is not necessary
to explicitly add `-L*** -lunistring' to Libs.private in libidn2.pc
which breaks binary reproducibility.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...de-lib-name-to-replace-variable-detecting.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/libidn/libidn2_2.0.5.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/libidn/libidn2/0001-use-hardcode-lib-name-to-replace-variable-detecting.patch

diff --git a/meta/recipes-extended/libidn/libidn2/0001-use-hardcode-lib-name-to-replace-variable-detecting.patch b/meta/recipes-extended/libidn/libidn2/0001-use-hardcode-lib-name-to-replace-variable-detecting.patch
new file mode 100644
index 0000000..0186ee2
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2/0001-use-hardcode-lib-name-to-replace-variable-detecting.patch
@@ -0,0 +1,33 @@
+From 9c8370695042303a13cbed914ea9ae89040ed19c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 29 Sep 2018 22:36:45 +0800
+Subject: [PATCH] use hardcode lib name to replace variable detecting
+
+As pkgconfig menual introduced:
+`Libs.private: The link flags for private libraries required by this
+package but not exposed to applications.'
+
+Since option `--with-libunistring-prefix' is used, it is not necessary
+to explicitly add `-L*** -lunistring' to Libs.private in libidn2.pc
+which breaks binary reproducibility.
+
+Upstream-Status: Inappropriate[OE specific]]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libidn2.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libidn2.pc.in b/libidn2.pc.in
+index 0dade23..66f8d1a 100644
+--- a/libidn2.pc.in
++++ b/libidn2.pc.in
+@@ -8,4 +8,4 @@ Description: Library implementing IDNA2008 and TR46
+ Version: @PACKAGE_VERSION@
+ Cflags: -I${includedir}
+ Libs: -L${libdir} -lidn2
+-Libs.private: @LTLIBICONV@ @LTLIBUNISTRING@
++Libs.private: -lunistring
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0daf7a6..6064e52 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-use-hardcode-lib-name-to-replace-variable-detecting.patch \
           "
 SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
 SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
-- 
2.7.4


