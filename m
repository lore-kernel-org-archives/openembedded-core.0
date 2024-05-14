Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C04C25B75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 16:15:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20269.1715703325940669626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 09:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90F0A1007
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:15:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AD323F641
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:15:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] selftest/classes: add localpkgfeed class
Date: Tue, 14 May 2024 16:15:20 +0000
Message-Id: <20240514161521.4082896-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240514161521.4082896-1-ross.burton@arm.com>
References: <20240514161521.4082896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 16:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199266

This class can be used to construct a subset of a deployed package feed
for use in tests which iterate the deploy directory, and as such a huge
feed of 30K+ packages can result in very slow tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/classes/localpkgfeed.bbclass | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-selftest/classes/localpkgfeed.bbclass

diff --git a/meta-selftest/classes/localpkgfeed.bbclass b/meta-selftest/c=
lasses/localpkgfeed.bbclass
new file mode 100644
index 00000000000..b796375e55c
--- /dev/null
+++ b/meta-selftest/classes/localpkgfeed.bbclass
@@ -0,0 +1,27 @@
+# Create a subset of the package feed that just contain the
+# packages depended on by this recipe.
+
+LOCALPKGFEED_DIR =3D "${WORKDIR}/localpkgfeed"
+
+addtask localpkgfeed after do_build
+do_localpkgfeed[cleandirs] =3D "${LOCALPKGFEED_DIR}"
+do_localpkgfeed[nostamp] =3D "1"
+
+def get_packaging_class(d):
+    package_class =3D d.getVar("PACKAGE_CLASSES").split()[0]
+    return package_class.replace("package_", "")
+
+python () {
+    packaging =3D get_packaging_class(d)
+    d.setVarFlag("do_localpkgfeed", "rdeptask", "do_package_write_" + pa=
ckaging)
+}
+
+python do_localpkgfeed() {
+    import oe.package_manager
+
+    packaging =3D get_packaging_class(d)
+    deploydir =3D d.getVar("DEPLOY_DIR_" + packaging.upper())
+    task =3D "package_write_" + packaging
+
+    oe.package_manager.create_packages_dir(d, d.getVar("LOCALPKGFEED_DIR=
"), deploydir, task, True, True)
+}
--=20
2.34.1


