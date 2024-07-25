Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72BAC3DA64
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39438.1721921438291314690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 08:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06A901007
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:31:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 208BD3F766
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:30:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] setuptools3: check for a PEP517 build system selection
Date: Thu, 25 Jul 2024 16:30:26 +0100
Message-Id: <20240725153029.828624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 15:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202507

Some recipes use setuptools3 but should be using a PEP517-compliant
backend, be it the setuptools itself via python_setuptools_build_meta or
an alternative backend such as flit/hatch/poetry.

As we can't currently assume Python 3.11 on the build host we need to
parse the pyproject.toml manually, but this should be sufficient for the
limited parsing needed.

This task emits a QA error if a build backend is set, and can be ignored
by using INSANE_SKIP if needed.

[ YOCTO #14736 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index d71a0895398..64a78e9a367 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -12,6 +12,20 @@ SETUPTOOLS_BUILD_ARGS ?=3D ""
=20
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
+python do_check_backend() {
+    import re
+    filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
+    if os.path.exists(filename):
+        for line in open(filename):
+            match =3D re.match(r"build-backend\s*=3D\s*\W([\w.]+)\W", li=
ne)
+            if not match: continue
+
+            msg =3D f"inherits setuptools3 but has pyproject.toml with {=
match[1]}, use the correct class"
+            if "pep517-backend" not in (d.getVar("INSANE_SKIP") or "").s=
plit():
+                oe.qa.handle_error("pep517-backend", msg, d)
+}
+addtask check_backend after do_patch before do_configure
+
 setuptools3_do_configure() {
     :
 }
--=20
2.34.1


