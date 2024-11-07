Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF0AD5D677
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.77814.1731000254039318083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97998497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A0933F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/8] classes-recipe: add cython class
Date: Thu,  7 Nov 2024 17:24:02 +0000
Message-Id: <20241107172404.4017047-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206847

Recipes that use Cython typically also do some bespoke fixup.  Add a
class to centralise the logic:

- Set CYTHON_PREFIX_MAP to stop build paths appearing in generated
  objects
- Strip "Cython Metadata" blocks from generated code that ends up in the
  -src package

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cython.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes-recipe/cython.bbclass

diff --git a/meta/classes-recipe/cython.bbclass b/meta/classes-recipe/cyt=
hon.bbclass
new file mode 100644
index 00000000000..f37ebeb23fe
--- /dev/null
+++ b/meta/classes-recipe/cython.bbclass
@@ -0,0 +1,11 @@
+DEPENDS:append =3D " python3-cython-native"
+
+# Remap the build paths that appear in generated .c code
+export CYTHON_PREFIX_MAP =3D "${S}=3D${TARGET_DBGSRC_DIR} ${B}=3D${TARGE=
T_DBGSRC_DIR}"
+
+do_compile[postfuncs] =3D "strip_cython_metadata"
+strip_cython_metadata() {
+    # Remove the Cython Metadata headers that we don't need after the bu=
ild, and
+    # may contain build paths.
+    find ${S} -name "*.c" -print0 | xargs -0 sed -i -e "/BEGIN: Cython M=
etadata/,/END: Cython Metadata/d"
+}
--=20
2.34.1


