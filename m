Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64091C25B7A
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12349.1715684066737070182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6898F1042
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:54:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F2B23F762
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:54:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] selftest/classes: add localpkgfeed class
Date: Tue, 14 May 2024 10:54:22 +0000
Message-Id: <20240514105423.2496922-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240514105423.2496922-1-ross.burton@arm.com>
References: <20240514105423.2496922-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 10:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199257

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
index 00000000000..bd6975637a8
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
+    d.setVarFlag("do_localpkgfeed", "rdeptask", f"do_package_write_{pack=
aging}")
+}
+
+python do_localpkgfeed() {
+    import oe.package_manager
+
+    packaging =3D get_packaging_class(d)
+    deploydir =3D d.getVar(f"DEPLOY_DIR_{packaging.upper()}")
+    task =3D f"package_write_{packaging}"
+
+    oe.package_manager.create_packages_dir(d, d.getVar("LOCALPKGFEED_DIR=
"), deploydir, task, True, True)
+}
--=20
2.34.1


