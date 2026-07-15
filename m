Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DF9C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:03:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3741.1784113376718834502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mxiEipGU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 019081477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB5883F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784113376; bh=IId/aItR1BU4az2xAejzKWYckW8dqawnf71YPPnd0Mo=;
	h=From:To:Subject:Date:From;
	b=mxiEipGUZZrqsPgKOTPmzMsJMLMgNusnSbH7lT6l0YLT/LwhyXg/A87xzRPcOVxur
	 o1MTtNW9Ln564Xj6KoRhtYuTBU8zAKGE0qBePJjVjOqnlSK6mCeYK+bBU1kYyvu0eU
	 aTfJqgJBuZupBf0Q+PzveGKZhArXZXgVfUUSsYJY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pkgconf: upgrade 2.5.1 -> 3.0.3
Date: Wed, 15 Jul 2026 12:02:53 +0100
Message-ID: <20260715110253.1693306-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240948

Abridged release notes:

* Restore correct handling of sysroots when emulating legacy pkg-config, =
and
  add explicit regression tests for this case.

* DEPRECATION: The autotools build system will be dropped after the 3.0 r=
elease.
  Building pkgconf with muon is recommended for early bootstrap and meson=
 in later
  stages of bootstrap.
  Alternatively users can use pkgconf-lite for early bootstrap.

* SPDX Software Bill of Materials (SBOM) generation

* The libpkgconf API and ABI were substantially reworked, breaking both A=
PI and
  ABI compatibility.  Consumers will need source changes as well as a reb=
uild.
  The libpkgconf soversion is now 8.

* Correctness fixes:
  - The built-in pkg-config and pkgconf packages are now constructed from=
 the
    configured personality instead of being hardcoded, so their reported =
data
    reflects the active personality.  They are also exposed as proper ver=
sioned
    virtual packages.
  - ${pc_sysrootdir} now defaults to an empty string instead of '/'.
  - Variable substitution was reimplemented using a bytecode engine, whic=
h
    tracks whether special variables such as ${pc_sysrootdir} have alread=
y been
    applied so that they are not substituted more than once.
  - Requires.internal is now treated as a weaker form of Requires.private=
: its
    dependency nodes need not be satisfied when link libraries are not
    requested.
  - pkgconf now warns about .pc files that duplicate a dependency-list fi=
eld,
    whose behavior is inconsistent across pkg-config implementations.
  - Version comparison was reworked to use a structured algorithm modeled=
 on
    apk-tools.
  - Newline folding behavior when parsing multi-line fields has been adju=
sted.
  - Bare variable expansions inside fragment lists are now re-parsed so t=
hat any
    flags they expand to are tokenized correctly.
  - ${pc_sysrootdir} is now only injected when it matches a complete path
    boundary, and obviously bogus sysroot_dir definitions are ignored, fi=
xing
    incorrect sysroot injection.
  - Arguments are now combined when a flag is expected to carry a separat=
e
    value, such as -I dir or -framework name.
  - SPDX license expressions in the License field are now properly parsed=
 and
    validated.  Patches by Tuukka Pasanen.

License-Update: copyright statement updated

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pkgconf/{pkgconf_2.5.1.bb =3D> pkgconf_3.0.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.5.1.bb =3D> pkgconf_3.0.=
3.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.3.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
index 7d9205e5606..dfb6919ff71 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
@@ -12,7 +12,7 @@ RPROVIDES:${PN} +=3D "pkgconfig"
 # The pkgconf license seems to be functionally equivalent to BSD-2-Claus=
e or
 # ISC, but has different wording, so needs its own name.
 LICENSE =3D "pkgconf"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2214222ec1a820bd6cc75167a5692=
5e0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1e33c297f35e165ecf4fbc81974dc=
9ca"
=20
 SRC_URI =3D "\
     https://distfiles.ariadne.space/pkgconf/pkgconf-${PV}.tar.xz \
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582c=
fffd658b0a50c243"
+SRC_URI[sha256sum] =3D "aa033abb2b777ba4e66635495a931e53c49d86e4e4e38af6=
8c0f76d666cbd8cf"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig
--=20
2.43.0


