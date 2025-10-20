Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A6DCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:11:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.12266.1760944271124001532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ARQEFCr8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE5761A13A6;
	Mon, 20 Oct 2025 07:11:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3333606D5;
	Mon, 20 Oct 2025 07:11:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0405F102F23A2;
	Mon, 20 Oct 2025 09:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944265; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zVYonyeYZWqPNGgQ/QvLsQJLnE3M6Vs5W71shwYYqm0=;
	b=ARQEFCr8EKU1yPWj3FGHANVaCzV6SOyckp+RavhRb0BJK74z2vPl2jAmPxFeGFi+KcsFBa
	NN9afOf61BTCmbMn0SMmHwAUE1oXA2IDB3e5/8PSdzLJg6KIBs+0UFiNXckj+HRVQODEDA
	AcGvPpDL+FTz54tPknp8TFmStVGofsGnxRLJMttLR7t0HQTzH+GzE3m3y2YMJve9uextHS
	Q1uD9+sMDIp5Eg0Ok9JKZtPtCnRWaMGF67GWFKhQhgMeOfId5jhIn3TnqTM7Rk7Ru5HaxE
	FWr/zI1xWWog62vzwpXnohw3AGaYufQeZEmJanV/HsJb0ASWZvRxwTfHuP3qSQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Joshua Watt <jpewhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v2 09/11] lib: oeqa: spdx: Add tests for extra options
Date: Mon, 20 Oct 2025 09:09:49 +0200
Message-ID: <20251020070952.942165-10-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225107

From: Joshua Watt <jpewhacker@gmail.com>

Adds a test for several of the extra options provided by the SPDX
classes. In particular, these are the options that can produce
non-reproducible results, so are not enabled by default in OE core. This
test takes care to configure the build so that the tests do run in a
reproducible manner so that pre-built test objects can be pulled from
sstate

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14f534f15f7fe6362723d7f064d39783c5bd758f)
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 118 +++++++++++++++++++++++----
 1 file changed, 104 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index db124f4b93..c279ea162b 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -7,9 +7,11 @@
 import json
 import os
 import textwrap
+import hashlib
 from pathlib import Path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
+import oe.spdx30
=20
=20
 class SPDX22Check(OESelftestTestCase):
@@ -72,8 +74,6 @@ class SPDX3CheckBase(object):
     """
=20
     def check_spdx_file(self, filename):
-        import oe.spdx30
-
         self.assertExists(filename)
=20
         # Read the file
@@ -85,13 +85,16 @@ class SPDX3CheckBase(object):
         return objset
=20
     def check_recipe_spdx(self, target_name, spdx_path, *, task=3DNone, =
extraconf=3D""):
-        config =3D textwrap.dedent(
-            f"""\
-            INHERIT:remove =3D "create-spdx"
-            INHERIT +=3D "{self.SPDX_CLASS}"
-            {extraconf}
-            """
+        config =3D (
+            textwrap.dedent(
+                f"""\
+                INHERIT:remove =3D "create-spdx"
+                INHERIT +=3D "{self.SPDX_CLASS}"
+                """
+            )
+            + textwrap.dedent(extraconf)
         )
+
         self.write_config(config)
=20
         if task:
@@ -119,11 +122,17 @@ class SPDX3CheckBase(object):
         return self.check_spdx_file(filename)
=20
     def check_objset_missing_ids(self, objset):
-        if objset.missing_ids:
+        for o in objset.foreach_type(oe.spdx30.SpdxDocument):
+            doc =3D o
+            break
+        else:
+            self.assertTrue(False, "Unable to find SpdxDocument")
+
+        missing_ids =3D objset.missing_ids - set(i.externalSpdxId for i =
in doc.import_)
+        if missing_ids:
             self.assertTrue(
                 False,
-                "The following SPDXIDs are unresolved:\n  "
-                + "\n  ".join(objset.missing_ids),
+                "The following SPDXIDs are unresolved:\n  " + "\n  ".joi=
n(missing_ids),
             )
=20
=20
@@ -187,12 +196,93 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCas=
e):
         objset =3D self.check_recipe_spdx(
             "baremetal-helloworld",
             "{DEPLOY_DIR_IMAGE}/baremetal-helloworld-image-{MACHINE}.spd=
x.json",
-            extraconf=3Dtextwrap.dedent(
-                """\
+            extraconf=3D"""\
                 TCLIBC =3D "baremetal"
+                """,
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
+    def test_extra_opts(self):
+        HOST_SPDXID =3D "http://foo.bar/spdx/bar2"
+
+        EXTRACONF =3D textwrap.dedent(
+            f"""\
+            SPDX_INVOKED_BY_name =3D "CI Tool"
+            SPDX_INVOKED_BY_type =3D "software"
+
+            SPDX_ON_BEHALF_OF_name =3D "John Doe"
+            SPDX_ON_BEHALF_OF_type =3D "person"
+            SPDX_ON_BEHALF_OF_id_email =3D "John.Doe@noreply.com"
+
+            SPDX_PACKAGE_SUPPLIER_name =3D "ACME Embedded Widgets"
+            SPDX_PACKAGE_SUPPLIER_type =3D "organization"
+
+            SPDX_AUTHORS +=3D "authorA"
+            SPDX_AUTHORS_authorA_ref =3D "SPDX_ON_BEHALF_OF"
+
+            SPDX_BUILD_HOST =3D "host"
+
+            SPDX_IMPORTS +=3D "host"
+            SPDX_IMPORTS_host_spdxid =3D "{HOST_SPDXID}"
+
+            SPDX_INCLUDE_BUILD_VARIABLES =3D "1"
+            SPDX_INCLUDE_BITBAKE_PARENT_BUILD =3D "1"
+            SPDX_INCLUDE_TIMESTAMPS =3D "1"
+
+            SPDX_PRETTY =3D "1"
+            """
+        )
+        extraconf_hash =3D hashlib.sha1(EXTRACONF.encode("utf-8")).hexdi=
gest()
+
+        objset =3D self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx=
.json",
+            # Many SPDX variables do not trigger a rebuild, since they a=
re
+            # intended to record information at the time of the build. A=
s such,
+            # the extra configuration alone may not trigger a rebuild, a=
nd even
+            # if it does, the task hash won't necessarily be unique. In =
order
+            # to make sure rebuilds happen, but still allow these test o=
bjects
+            # to be pulled from sstate (e.g. remain reproducible), chang=
e the
+            # namespace prefix to include the hash of the extra configur=
ation
+            extraconf=3Dtextwrap.dedent(
+                f"""\
+                SPDX_NAMESPACE_PREFIX =3D "http://spdx.org/spdxdocs/{ext=
raconf_hash}"
                 """
-            ),
+            )
+            + EXTRACONF,
         )
=20
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
+
+        for o in objset.foreach_type(oe.spdx30.SoftwareAgent):
+            if o.name =3D=3D "CI Tool":
+                break
+        else:
+            self.assertTrue(False, "Unable to find software tool")
+
+        for o in objset.foreach_type(oe.spdx30.Person):
+            if o.name =3D=3D "John Doe":
+                break
+        else:
+            self.assertTrue(False, "Unable to find person")
+
+        for o in objset.foreach_type(oe.spdx30.Organization):
+            if o.name =3D=3D "ACME Embedded Widgets":
+                break
+        else:
+            self.assertTrue(False, "Unable to find organization")
+
+        for o in objset.foreach_type(oe.spdx30.SpdxDocument):
+            doc =3D o
+            break
+        else:
+            self.assertTrue(False, "Unable to find SpdxDocument")
+
+        for i in doc.import_:
+            if i.externalSpdxId =3D=3D HOST_SPDXID:
+                break
+        else:
+            self.assertTrue(False, "Unable to find imported Host SpdxID"=
)
--=20
2.43.0


