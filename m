Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F5CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:11:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9836.1791972703530734886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oS62ws+T;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5CC153B
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 03:11:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A6233F673
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791972702; bh=IS+lkR6V8WucS9BwC2AkPrBSpJx9YZFd5rTpB9WHTZA=;
	h=From:To:Subject:Date:From;
	b=oS62ws+TyTjdsQ9hT6jS9mO9/rnqKoZJGEOtgZ2uvSCI2HQCW5A1IihifyMsm/3q3
	 pBcZ3ZHYnn0YfNmhlhNh79f6yYv3VSrybDHjVJRtNYTGWHO3FtuKP0ZOtn5PjOP0at
	 bCaMuxnypW/M/OIHJiPMpHl41HiXfA0wB8jeuy0Y=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-packaging: refresh patch
Date: Wed, 14 Oct 2026 11:11:38 +0100
Message-ID: <20261014101138.3948702-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 10:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247753

There were several proposed fixes for the intermittent failures, update
our patch to the one that was actually merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-packaging/reliable-test.patch     | 79 +++++++++++++++----
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-packaging/reliable-test=
.patch b/meta/recipes-devtools/python/python3-packaging/reliable-test.pat=
ch
index 1746c1d21e5..f830917f97c 100644
--- a/meta/recipes-devtools/python/python3-packaging/reliable-test.patch
+++ b/meta/recipes-devtools/python/python3-packaging/reliable-test.patch
@@ -1,30 +1,79 @@
-From 47b0db5b7b9a5fd9f4d1d3236e90f205c8b34625 Mon Sep 17 00:00:00 2001
-From: Christopher Pruijsen <christopher.pruijsen@gmail.com>
-Date: Fri, 11 Sep 2026 02:32:41 +0100
-Subject: [PATCH] test(specifiers): stop filtering compatible-release exa=
mples
- by epoch
+From ef837aad3127167671eb37b9f6bd8a94ec7ce26e Mon Sep 17 00:00:00 2001
+From: Louis Deconinck <louis.dck@gmail.com>
+Date: Tue, 13 Oct 2026 21:17:05 +0200
+Subject: [PATCH] test: avoid filtering compatible release examples (#140=
7)
=20
-assume() dropped most draws when the specifier and candidate epochs
-differed, so Hypothesis intermittently failed HealthCheck.filter_too_muc=
h.
+Assisted-by: Codex
=20
-Upstream-Status: Submitted [https://github.com/pypa/packaging/pull/1409]
+Signed-off-by: Louis Deconinck <louis.dck@gmail.com>
+
+Upstream-Status: Backport [https://github.com/pypa/packaging/pull/1407]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- tests/property/test_specifier_matching.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ tests/property/strategies.py              | 13 ++++++++++++-
+ tests/property/test_specifier_matching.py |  7 ++++---
+ 2 files changed, 16 insertions(+), 4 deletions(-)
=20
+diff --git a/tests/property/strategies.py b/tests/property/strategies.py
+index 4ce828b76..b42b6dcb4 100644
+--- a/tests/property/strategies.py
++++ b/tests/property/strategies.py
+@@ -85,9 +85,11 @@ def pep440_versions(
+     *,
+     include_local: bool =3D True,
+     min_segments: int =3D 1,
++    epoch: int | None =3D None,
+ ) -> Version:
+     """Generate a random PEP 440 version."""
+-    epoch =3D draw(st.sampled_from([None, 0, 1, 2, 3]))
++    if epoch is None:
++        epoch =3D draw(st.sampled_from([None, 0, 1, 2, 3]))
+     num_segments =3D draw(st.integers(min_value=3Dmin_segments, max_val=
ue=3D4))
+     release =3D tuple(draw(small_ints) for _ in range(num_segments))
+=20
+@@ -153,6 +155,15 @@ def multi_segment_versions(draw: st.DrawFn) -> Vers=
ion:
+     return v
+=20
+=20
++@st.composite
++def compatible_release_version_pairs(draw: st.DrawFn) -> tuple[Version,=
 Version]:
++    """Generate compatible-release examples whose versions share an epo=
ch."""
++    epoch =3D draw(st.integers(min_value=3D0, max_value=3D3))
++    spec_ver =3D draw(pep440_versions(include_local=3DFalse, min_segmen=
ts=3D2, epoch=3Depoch))
++    candidate =3D draw(pep440_versions(epoch=3Depoch))
++    return spec_ver, candidate
++
++
+ @st.composite
+ def versions_with_local(draw: st.DrawFn) -> Version:
+     """Generate a PEP 440 version that always has a local segment."""
 diff --git a/tests/property/test_specifier_matching.py b/tests/property/=
test_specifier_matching.py
-index 4552ce8ce..4aedafe56 100644
+index 4552ce8ce..d85eadaa7 100644
 --- a/tests/property/test_specifier_matching.py
 +++ b/tests/property/test_specifier_matching.py
-@@ -205,7 +205,9 @@ def test_compatible_release_matches_expected_compati=
ble(
+@@ -12,6 +12,7 @@
+ from packaging.version import Version
+ from tests.property.strategies import (
+     SETTINGS,
++    compatible_release_version_pairs,
+     multi_segment_versions,
+     nonlocal_versions,
+     ops,
+@@ -198,14 +199,14 @@ class TestCompatibleReleaseDefinition:
+     and a version identifier. It matches any candidate version that is =
expected
+     to be compatible with the specified version."""
+=20
+-    @given(spec_ver=3Dmulti_segment_versions(), candidate=3Dpep440_vers=
ions())
++    @given(versions=3Dcompatible_release_version_pairs())
+     @SETTINGS
+     def test_compatible_release_matches_expected_compatible(
+-        self, spec_ver: Version, candidate: Version
++        self, versions: tuple[Version, Version]
      ) -> None:
          """~=3DV matches candidate iff candidate >=3D V and candidate m=
atches the
          prefix wildcard derived from V."""
 -        assume(spec_ver.epoch =3D=3D candidate.epoch)
-+        # Share an epoch without assume(), which rejects most draws and=
 trips
-+        # Hypothesis HealthCheck.filter_too_much.
-+        candidate =3D candidate.__replace__(epoch=3Dspec_ver.epoch)
++        spec_ver, candidate =3D versions
          spec =3D Specifier(f"~=3D{spec_ver}")
          result =3D candidate in spec
          # Also check via the expanded form
--=20
2.43.0


