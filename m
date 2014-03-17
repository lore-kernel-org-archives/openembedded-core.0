Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id E29B66F724
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 18:11:06 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id um1so6032625pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1fmzxB2tfosKB9AfbiBKHjq1HzIt++2/Ljklc/z/LY0=;
	b=nF7MRGahLig+fL4rtie/tcyyzKwpFozrQpR9aiWx2GOKnhUHtIwLFrjpGLPn/QymPZ
	GpuclWlmVoAmG3BgCbyLEZNp2bdbg8v5X/+QlO4veTqQpjClRN5MQF1Igtn03/BU2N0x
	5+zJmWmEmclGVB8YH3bhWIl8LxIRd+LnM6cp1boiDnlAcVnrvFV7nvAIBVcOGAkxE+9T
	GNM/7DBqVMgWIBVeDG8Q2TfpZz7heqXlnnlzLz8foYp9JTNX0PCHwKZmoPerTs7Cf1BD
	OPX6X0xrFmQCVX5kPFbt+mBwrRfSRKdZuAop6TSvCZz7e7jigNpSJ7ni3/cWhVXAFwV6
	pakw==
X-Received: by 10.68.34.197 with SMTP id b5mr27529600pbj.16.1395079867165;
	Mon, 17 Mar 2014 11:11:07 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	pe3sm45210835pbc.23.2014.03.17.11.11.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 11:11:05 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 11:10:54 -0700
Message-Id: <1395079854-14185-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] gettext-0.16.1: kill target m4 macros from sysroot
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
X-List-Received-Date: Mon, 17 Mar 2014 18:11:07 -0000

Ever since the change to how aclocal files are copied (based on dependencies),
target m4 macros seem to more reliably be used in preference to native (which
they should), but in a non-gplv3 build, gettext is 0.16 while gettext-native is
0.18, causing a 0.16 po.m4 to be used with our 0.18 po/Makefile.in.in files,
causing at least some failed builds, including e2fsprogs.

Anyone inheriting gettext will have both gettext-native and gettext available,
and we don't want to use older macros from the target gettext in a non-gplv3
build, so kill them and let dependent recipes rely on gettext-native.

[YOCTO #5964]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 5d26f3e..5725e7f 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -95,4 +95,15 @@ do_install_append() {
 	rm -f ${D}${libdir}/preloadable_libintl.so
 }
 
+# Anyone inheriting gettext will have both gettext-native and gettext
+# available, and we don't want to use older macros from the target gettext in
+# a non-gplv3 build, so kill them and let dependent recipes rely on
+# gettext-native.
+
+SYSROOT_PREPROCESS_FUNCS += "remove_sysroot_m4_macros"
+
+remove_sysroot_m4_macros () {
+    rm -r "${SYSROOT_DESTDIR}${datadir}/aclocal"
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.4


