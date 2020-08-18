Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.62154.1597741480235962394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 02:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07I94doQ003127
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 02:04:39 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 18 Aug 2020 02:04:26 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V5] gpgme: fix multilib header conflict
Date: Tue, 18 Aug 2020 16:59:29 +0800
Message-ID: <20200818085929.1763928-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

 --- usr/include/gpgme-32.h	2018-03-09 20:34:56.000000000 +0800
 +++ usr/include/gpgme-64.h	2018-03-09 20:34:56.000000000 +0800
@@ -18,7 +18,7 @@
  * License along with this program; if not, see <https://gnu.org/licenses/>.
  * SPDX-License-Identifier: LGPL-2.1-or-later
  *
- * Generated from gpgme.h.in for i686-pokymllib32-linux-gnu.
+ * Generated from gpgme.h.in for x86_64-poky-linux-gnu.
  */

 #ifndef GPGME_H
@@ -106,12 +106,12 @@

 /* Check for a matching _FILE_OFFSET_BITS definition.  */
-#if 64
+#if 0
 #ifndef _FILE_OFFSET_BITS
-#error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.
+#error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see the section "Largefile support (LFS)" in the GPGME manual.
 #else
-#if (_FILE_OFFSET_BITS) != (64)
-#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 64, please see the section "Largefile support (LFS)" in the GPGME manual.
+#if (_FILE_OFFSET_BITS) != (0)
+#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 0, please see the section "Largefile support (LFS)" in the GPGME manual.
 #endif
 #endif
 #endif

LFS support is enabled by default, and this header is generated during
build according to current configure

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..b51534351d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
@@ -83,3 +83,7 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
-- 
2.17.1

