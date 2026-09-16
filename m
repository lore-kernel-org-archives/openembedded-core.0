Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C50C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:57:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15677.1789567076845010685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F+X6jiMB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E57C152B
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:57:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A37CE3F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789567076; bh=zwqCz8ty0a65sOvSUWoxtafMnFFzRqoc8dvdK39bt3Y=;
	h=From:To:Subject:Date:From;
	b=F+X6jiMBTrQPtMT6w3uSc6j7hja82L/EzmytMPM7G7SEBimsjXhJKo0nrtKnXpejO
	 GS2XM63IY7IzoWJFfJTsIShPTxG3f03sQXz46MI8dFaewh0ctUTh7HU/rk6UFBOMPV
	 UqcJVDcnv+pM0iWFfShHnYloM2vqfH9+rd3gZIfU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-packaging: fix rare failures in tests/property/test_specifier_matching.py
Date: Wed, 16 Sep 2026 14:57:51 +0100
Message-ID: <20260916135751.3526459-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 13:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245974

The packaging test suite uses Hypothesis, which generates data for test
suites dynamically. However there's a small chance that the test suite
fails as the generated data isn't usable, so apply a patch that has been
submitted upstream to improve the reliability of the data.

[ YOCTO #16403 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-packaging/reliable-test.patch     | 30 +++++++++++++++++++
 .../python/python3-packaging_26.3.bb          |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-packaging/reliab=
le-test.patch

diff --git a/meta/recipes-devtools/python/python3-packaging/reliable-test=
.patch b/meta/recipes-devtools/python/python3-packaging/reliable-test.pat=
ch
new file mode 100644
index 00000000000..1746c1d21e5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging/reliable-test.patch
@@ -0,0 +1,30 @@
+From 47b0db5b7b9a5fd9f4d1d3236e90f205c8b34625 Mon Sep 17 00:00:00 2001
+From: Christopher Pruijsen <christopher.pruijsen@gmail.com>
+Date: Fri, 11 Sep 2026 02:32:41 +0100
+Subject: [PATCH] test(specifiers): stop filtering compatible-release exa=
mples
+ by epoch
+
+assume() dropped most draws when the specifier and candidate epochs
+differed, so Hypothesis intermittently failed HealthCheck.filter_too_muc=
h.
+
+Upstream-Status: Submitted [https://github.com/pypa/packaging/pull/1409]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/property/test_specifier_matching.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/property/test_specifier_matching.py b/tests/property/=
test_specifier_matching.py
+index 4552ce8ce..4aedafe56 100644
+--- a/tests/property/test_specifier_matching.py
++++ b/tests/property/test_specifier_matching.py
+@@ -205,7 +205,9 @@ def test_compatible_release_matches_expected_compati=
ble(
+     ) -> None:
+         """~=3DV matches candidate iff candidate >=3D V and candidate m=
atches the
+         prefix wildcard derived from V."""
+-        assume(spec_ver.epoch =3D=3D candidate.epoch)
++        # Share an epoch without assume(), which rejects most draws and=
 trips
++        # Hypothesis HealthCheck.filter_too_much.
++        candidate =3D candidate.__replace__(epoch=3Dspec_ver.epoch)
+         spec =3D Specifier(f"~=3D{spec_ver}")
+         result =3D candidate in spec
+         # Also check via the expanded form
diff --git a/meta/recipes-devtools/python/python3-packaging_26.3.bb b/met=
a/recipes-devtools/python/python3-packaging_26.3.bb
index 424ee12ceed..628d8d7aa14 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.3.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a=
90b205c9167578ce91"
=20
 SRC_URI[sha256sum] =3D "94edc256424af38762eb31306eed28beb9f0efc50a883749=
2c9d6fd6004aed79"
=20
-SRC_URI +=3D "file://run-ptest.in"
+SRC_URI +=3D "file://run-ptest.in \
+            file://reliable-test.patch"
=20
 inherit pypi python_flit_core ptest
=20
--=20
2.43.0


