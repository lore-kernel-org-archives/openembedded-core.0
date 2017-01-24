Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20964719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 20:15:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0OKF0rR001581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:15:00 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 24 Jan 2017 12:15:00 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2017 12:15:00 -0800
Message-ID: <1485288900-19603-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] gnutls: avoid accidentally using libseccomp
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
X-List-Received-Date: Tue, 24 Jan 2017 20:15:01 -0000
Content-Type: text/plain

Specify whether to use libseccomp or not.  Do not
just let configure check for it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/gnutls/gnutls.inc |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 003dc55..14fcdca 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -21,6 +21,17 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
+# We cannot use PACKAGECONFIG for this since there is no controlling
+# configure option.
+#
+# To use seccomp, uncomment the two variables.  You must also
+# have CONFIG_SECCOMP enabled in the kernel.
+#
+#DEPENDS_append_class-target = " libseccomp"
+#lcl_LIBSECCOMP_class-target = "ac_cv_libseccomp=yes"
+
+lcl_LIBSECCOMP ?= "ac_cv_libseccomp=no"
+
 PACKAGECONFIG ??= "libidn zlib"
 
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
@@ -38,6 +49,7 @@ EXTRA_OECONF = " \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
     --without-libunistring-prefix \
+    ${lcl_LIBSECCOMP} \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
1.7.9.5


