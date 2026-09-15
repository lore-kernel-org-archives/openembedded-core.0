Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E473AC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:26:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24391.1789482397664799818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=m48SP/WZ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CCFD1516
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:26:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82DFE3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789482396; bh=xMA4fxvKOQNwX7q5XcA9tafXY4Qzx2BzZdToSu9Kppg=;
	h=From:To:Subject:Date:From;
	b=m48SP/WZ2YWnAUm0hPyFLf3/PHuQZgnA1vBI80ovpAM2eaCjLNE6RvUgu1YpoMGcZ
	 Z+6JEhBQ012O48kTIpeO9GQeVlRe9cOe8mL3MfzoiT3ccvyBJf9FHagj/A9PigrL35
	 sSJVtANbmOn6ZqMzDCvjzVtnEq/8bC0z9DDz9vWM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0
Date: Tue, 15 Sep 2026 15:26:32 +0100
Message-ID: <20260915142632.589500-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245850

Lots of upstream changes, see the full release notes at
https://github.com/cython/cython/blob/master/CHANGES.rst

Disable parallel builds because there's a race which causes occasional
build failures. This has a non-trivial implication to build time (89.1s
to 243.1s on my machine), but it builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 4 ++--
 .../{python3-cython_3.2.9.bb =3D> python3-cython_3.3.0.bb}    | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb =3D> python=
3-cython_3.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not=
-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/p=
ython/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-=
hardc.patch
index 573a53ee561..01d019e554d 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predic=
table-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predic=
table-build-path-prefix-with-hardc.patch
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.=
py
-index 34f1b32..b09350b 100644
+index 6e0a3e5..ce35b25 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -888,7 +888,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/=
recipes-devtools/python/python3-cython_3.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.0.bb
index 3457a914901..ed8a680cf44 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.0.bb
@@ -7,7 +7,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
=20
-SRC_URI[sha256sum] =3D "d249c9022ab13286b17bd66f30609e800c5f95efeecb0616=
8990c7a66cecde6c"
+SRC_URI[sha256sum] =3D "eed0d93fbca7087f143b42c34b05a825849bdf17f101572c=
2105acfa49aa88b8"
=20
 inherit pypi setuptools3 cython
=20
@@ -44,3 +44,7 @@ RDEPENDS:${PN}:class-nativesdk +=3D "\
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# Disable parallel builds for now as there's a build race in 3.3.0:
+# https://github.com/cython/cython/issues/7997
+PARALLEL_MAKE =3D ""
--=20
2.43.0


