Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A21CA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 09:42:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11624.1791452518187872714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 02:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GuljLmRR;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ECD01477
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Oct 2026 02:41:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 032803F959
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791452517; bh=QqF0X0qAUEKoo4CZjGl8f/elQ1r/z0F98JOHam+3D+A=;
	h=From:To:Subject:Date:From;
	b=GuljLmRRav5Pi8/TKRiernT8rjLshxgL1+zFSBios7/NjsnhoqLM+bdB1OBFEqqUl
	 avA83YWPpLqbwhornNaLKKE3Y/hO4v8iOUWbvzCuKjxf6rs1uh4DHjPcG4Miffh9B0
	 v+EzEZxfTvPn3h2wGa0m6ndUeWZq0Tw8RO31xSwk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.0
Date: Thu,  8 Oct 2026 10:41:48 +0100
Message-ID: <20261008094148.752601-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 09:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247423

Lots of upstream changes, see the full release notes at
https://github.com/cython/cython/blob/master/CHANGES.rst

Backport a commit to fix non-reproducible code generation. The type
inference is still non-deterministic if there's ambiguity[1], but this
fix ensures there's no ambiguity in cython itself.

Disable parallel builds because there's a race which causes occasional
build failures[2]. This has a non-trivial implication to build time
(89.1s to 243.1s on my machine), but it builds.

[1] https://github.com/cython/cython/issues/8002
[2] https://github.com/cython/cython/issues/7997

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ictable-build-path-prefix-with-hardc.patch |  4 ++--
 .../python3-cython/ambiguous-type.patch       | 24 +++++++++++++++++++
 ...ython_3.2.9.bb =3D> python3-cython_3.3.0.bb} |  7 +++++-
 3 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cython/ambiguous=
-type.patch
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb =3D> python=
3-cython_3.3.0.bb} (83%)

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
diff --git a/meta/recipes-devtools/python/python3-cython/ambiguous-type.p=
atch b/meta/recipes-devtools/python/python3-cython/ambiguous-type.patch
new file mode 100644
index 00000000000..003fb8fc366
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/ambiguous-type.patch
@@ -0,0 +1,24 @@
+From 0a948c7d65f91690674db4c855dadce501a3181d Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Tue, 6 Oct 2026 10:51:39 +0200
+Subject: [PATCH] Avoid ambiguity due to type inference.
+
+Upstream-Status: Backport [https://github.com/cython/cython/commit/0a948=
c7d65f91690674db4c855dadce501a3181d]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Cython/Compiler/FlowControl.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Cython/Compiler/FlowControl.py b/Cython/Compiler/FlowContro=
l.py
+index 4c751b329d1..c5d3af1ec59 100644
+--- a/Cython/Compiler/FlowControl.py
++++ b/Cython/Compiler/FlowControl.py
+@@ -575,6 +575,8 @@ def check_definitions(flow: ControlFlow, compiler_di=
rectives: dict):
+=20
+     block: ControlBlock
+     assmt: NameAssignment
++    i_state: cython.py_int
++
+     for block in flow.blocks:
+         i_state =3D block.i_input
+         for stat in block.stats:
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/=
recipes-devtools/python/python3-cython_3.3.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.0.bb
index 3457a914901..f5bf7fd81e7 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.0.bb
@@ -7,11 +7,12 @@ SECTION =3D "devel/python"
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
 SRC_URI +=3D "file://0001-Replace-not-predictable-build-path-prefix-with=
-hardc.patch"
+SRC_URI +=3D "file://ambiguous-type.patch"
=20
 # No need to depend on self
 DEPENDS:remove =3D "python3-cython-native"
@@ -44,3 +45,7 @@ RDEPENDS:${PN}:class-nativesdk +=3D "\
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# Disable parallel builds for now as there's a build race in 3.3.0:
+# https://github.com/cython/cython/issues/7997
+PARALLEL_MAKE =3D ""
--=20
2.43.0


