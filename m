Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3B6C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 11:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5969.1786534649243422330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 04:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WKKM5Ttj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883471596
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 04:37:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA0E53F632
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786534648; bh=VzFPrKFj4+K2jB3RH+Z/L+z79tIzhs1lh/2jIlUIwMQ=;
	h=From:To:Subject:Date:From;
	b=WKKM5TtjKJdvL8S190zeYbsVjjuJcxiAScJfUA28lBNKAnfwAR4zqJoQxSJAyD4NI
	 2Pl/krb2Yl7mczIQCm94eTwNg4PntPwlvSq8qG3zo+Xci5C9hxKFDTQe0ScQszaW0y
	 WiNEiqoW+fWy4KZm0qPjh8M8cFX9GyDXSICWRqX8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-build: verify that found dependencies are valid
Date: Wed, 12 Aug 2026 12:35:29 +0100
Message-ID: <20260812113529.2829703-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 11:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243276

Due to how recipes are removed from the sysroot, it is possible for
packages to be found by python's importlib when they do not exist. This
is because when a recipe is removed from the sysroot we only delete the
files and leave empty directories, so if a recipe that provides a python
package is removed then the foo-1.2.3.dist-info/ directory remains and
that is found by importlib.

Add a check to the dependency resolve in pypa/build so that it verifies
that found packages have some metadata (by checking for a name). This
will fail on these ghost packages as they have no metadata files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-build/check-valid-dist.patch      | 31 +++++++++++++++++++
 .../python/python3-build_1.5.1.bb             |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-build/check-vali=
d-dist.patch

diff --git a/meta/recipes-devtools/python/python3-build/check-valid-dist.=
patch b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
new file mode 100644
index 00000000000..dd6f256e266
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
@@ -0,0 +1,31 @@
+Ignore invalid distributions when checking dependencies
+
+If there's an empty directory foo-1.2.dist-info/ on the search path then
+importlib will return that as a distribution called "foo".
+
+However it has no code and no metadata, so doesn't exist in any real way=
.
+Check that the found distribution is in some way valid by verifying that
+it has a name set.
+
+In Yocto this can happen if foo was removed as a dependency from the sys=
root:
+the dist-info directory is empties but remains in the sysroot.
+
+Upstream-Status: Submitted [https://github.com/pypa/build/pull/1145]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/src/build/_util.py w/src/build/_util.py
+index c365003..ba047c7 100644
+--- i/src/build/_util.py
++++ w/src/build/_util.py
+@@ -67,6 +67,11 @@ def _check_dependency(
+         yield (*ancestral_req_strings, normalised_req_string)
+         return
+=20
++    if not dist.name:
++        # If the distribution doesn't have a name it has no metadata
++        yield (*ancestral_req_strings, normalised_req_string)
++        return
++
+     if req.specifier and not req.specifier.contains(dist.version, prere=
leases=3DTrue):
+         # the installed version is incompatible.
+         yield (*ancestral_req_strings, normalised_req_string)
diff --git a/meta/recipes-devtools/python/python3-build_1.5.1.bb b/meta/r=
ecipes-devtools/python/python3-build_1.5.1.bb
index dd741cb8623..d572ca846fc 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "https://github.com/pypa/build"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
=20
+SRC_URI +=3D "file://check-valid-dist.patch"
+
 SRC_URI[sha256sum] =3D "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1ad=
c43df56542d644fb"
=20
 inherit pypi python_flit_core
--=20
2.43.0


