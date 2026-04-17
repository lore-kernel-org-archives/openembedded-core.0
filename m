Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6262CF436BA
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 16:07:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48807.1776442030301146742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 09:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tRZWxP3d;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F33731DB5
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 09:07:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A4563F641
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776442029; bh=KN1t3LdMDCUe2/jBqupFfO4PobyXP0cOVxFYiIfPvSU=;
	h=From:To:Subject:Date:From;
	b=tRZWxP3d3BInguwIC6nd40vNfQYI5Xokwud5oblHnh9XB/iyaqzoN2+nm9elz2HfN
	 b+n28UYAAMDlYhucDfILUz1xQL+chkokzhRvdbQ6wKKKp/RUIm+sF2k4i4klLtXfa6
	 030AInHeCpZAb31+Vui0Isd6szIrKYv/a5Nn6nhU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: prefer valid dists when searching for entry points
Date: Fri, 17 Apr 2026 17:06:55 +0100
Message-ID: <20260417160655.4111529-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 16:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235507

When bitbake regenerates a sysroot due to upgrades it will remove any
previously installed files but keep the directories. This can result in
site-packages containing:

  setuptools/                  <-- the actual Python code
  setuptools-82.0.0.dist-info  <-- empty metadata directory
  setuptools-82.0.1.dist-info  <-- populated metadata directory

When importlib_metadata.entry_points() iterates the distributions it
will take the list of dists *in on-disk order* and then remove
duplicates. If the empty directory comes first in the unsorted directory
listing then that is the only one that is returned.

This eventually results in mysterious errors from setuptools:

  error: invalid command 'egg_info'

Solve this by sorting the distribution list so that valid dists are
first.

[ YOCTO #16235 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-prefer-valid-entrypoints.patch       | 27 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.4.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-prefer-vali=
d-entrypoints.patch

diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entry=
points.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-ent=
rypoints.patch
new file mode 100644
index 00000000000..1250dc9ff04
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.=
patch
@@ -0,0 +1,27 @@
+From ef33ac27e3ac1b9cb159d7eec0ad1af120cd9dc1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 17 Apr 2026 16:53:42 +0100
+Subject: [PATCH] prefer valid entrypoints
+
+When there are multiple distributions found and some of them are invalid=
, ensure that
+the entry_points() accessor puts valid dists first.
+
+Upstream-Status: Submitted [https://github.com/python/importlib_metadata=
/issues/534]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Lib/importlib/metadata/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata=
/__init__.py
+index 085378c..ff5cae4 100644
+--- a/Lib/importlib/metadata/__init__.py
++++ b/Lib/importlib/metadata/__init__.py
+@@ -1016,7 +1016,7 @@ def entry_points(**params) -> EntryPoints:
+     :return: EntryPoints for all installed packages.
+     """
+     eps =3D itertools.chain.from_iterable(
+-        dist.entry_points for dist in _unique(distributions())
++        dist.entry_points for dist in _unique(Distribution._prefer_vali=
d(distributions()))
+     )
+     return EntryPoints(eps).select(**params)
+=20
diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipe=
s-devtools/python/python3_3.14.4.bb
index f48dbc69963..ea10c4d0e04 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfig=
dat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.pat=
ch \
+           file://0001-prefer-valid-entrypoints.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
--=20
2.43.0


