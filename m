Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1407FC25B77
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57681.1716200317419086004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF95FEC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:19:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1D8A3F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] toolchain-scripts: export the target endianism and word size
Date: Mon, 20 May 2024 10:18:31 +0000
Message-Id: <20240520101833.1798907-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520101833.1798907-1-ross.burton@arm.com>
References: <20240520101833.1798907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199566

Some build systems (notably, Meson) like to be told when cross-compiling
what the target endian and word size is.  We don't have these exported
via the variables, so add them using siteinfo as a source of data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes=
-recipe/toolchain-scripts.bbclass
index 6bfe0b6de0d..cbef412e796 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -16,6 +16,13 @@ DEBUG_PREFIX_MAP =3D ""
=20
 EXPORT_SDK_PS1 =3D "${@ 'export PS1=3D\\"%s\\"' % d.getVar('SDK_PS1') if=
 d.getVar('SDK_PS1') else ''}"
=20
+def siteinfo_with_prefix(d, prefix):
+    # Return a prefixed value from siteinfo
+    for item in siteinfo_data_for_machine(d.getVar("TARGET_ARCH"), d.get=
Var("TARGET_OS"), d):
+        if item.startswith(prefix):
+            return item.replace(prefix, "")
+    raise KeyError
+
 # This function creates an environment-setup-script for use in a deploya=
ble SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script.  Remember that $SDKTARGETSYSROOT sho=
uld
@@ -63,6 +70,8 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"=
' >>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian=
-')}"' >>$script
=20
 	echo 'unset command_not_found_handle' >> $script
=20
--=20
2.34.1


