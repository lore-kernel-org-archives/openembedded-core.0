Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B186C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 11:36:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38286.1785929801252215989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 04:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FX3lwaPq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B649B153B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 632E73F66F
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785929800; bh=pcvrxi0UpI+2zb1pt6KExRnX/nk7WfTLpsleaIvs5K8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FX3lwaPq4BMFAzERA9SZSb/zmlv4rMygqW6xZcZbYyBwHuH5dHIBQLJpksRgEb43j
	 6FaiERWrKlh+/zvjiE7i24q9kCAFT05py2gQPh4bjdJ0YOVXyOt4y1zyXkSt5fV0iH
	 rhhkUPPEFDCRRrg9IDJwcwIQLX/YSz/J66/bVUpo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-packaging: upgrade 26.2 -> 26.3
Date: Wed,  5 Aug 2026 12:36:34 +0100
Message-ID: <20260805113634.79174-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805113634.79174-1-ross.burton@arm.com>
References: <20260805113634.79174-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 11:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242863

- Add a public VersionRange API and SpecifierSet.to_range(),
  representing the versions a specifier set accepts as an interval set
  that supports intersection, union, difference, complement, set
  relations, membership tests, and filtering.
  VersionRange.to_specifier_set() converts a range back to a
  SpecifierSet where a PEP 440 form exists.
- PEP 808: accept Metadata-Version: 2.6.
- Add a limit argument to parse_tag() for compressed tag sets.
- Add a prefer_sdist_predicate argument to Pylock.select() to prefer
  source distributions over wheels for selected packages.
- Add pure_python_tags() to generate the pure-Python tags for a Python
  version without touching the running platform.
- Add SpecifierSet.is_subset(), SpecifierSet.is_superset(), and
  SpecifierSet.is_disjoint(), which compare the versions two specifier
  sets accept.
- Drop support for Python 3.8; packaging now requires Python 3.9 or
  later.
- Prefer native linux_* platform tags over manylinux and musllinux tags
  on Linux. - Add a musl/Alpine test job and make the test suite pass on
  musl.

The tests now work on musl so don't skip the manylinux tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-packaging_26.2.bb =3D> python3-packaging_26.3.bb}  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.2.bb =3D> pyth=
on3-packaging_26.3.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.2.bb b/met=
a/recipes-devtools/python/python3-packaging_26.3.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-packaging_26.2.bb
rename to meta/recipes-devtools/python/python3-packaging_26.3.bb
index 81ae6f27329..424ee12ceed 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/packaging"
 LICENSE =3D "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a90b205c9167578c=
e91"
=20
-SRC_URI[sha256sum] =3D "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075a=
adb987c2fb221661"
+SRC_URI[sha256sum] =3D "94edc256424af38762eb31306eed28beb9f0efc50a883749=
2c9d6fd6004aed79"
=20
 SRC_URI +=3D "file://run-ptest.in"
=20
@@ -15,8 +15,6 @@ RDEPENDS:${PN} +=3D "python3-profile"
=20
 # This test needs tomli_w which isn't currently in meta/
 SKIPLIST =3D "--ignore=3Dtests/test_pylock.py"
-# Tests don't handle manylinux+musl (https://github.com/pypa/packaging/i=
ssues/850)
-SKIPLIST:append:libc-musl =3D " --deselect=3Dtests/test_manylinux.py::te=
st_is_manylinux_compatible_old --deselect=3Dtests/test_tags.py::TestManyl=
inuxPlatform --deselect=3Dtests/test_tags.py::TestSysTags"
=20
 do_compile:class-native () {
     python_flit_core_do_manual_build
--=20
2.43.0


