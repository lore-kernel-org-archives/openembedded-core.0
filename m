Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4A5C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:00:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.64067.1643806814561940141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DBA0ED1
	for <openembedded-core@lists.openembedded.org>;
 Wed,  2 Feb 2022 05:00:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7483F718
	for <openembedded-core@lists.openembedded.org>;
 Wed,  2 Feb 2022 05:00:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: check for duplicate layers when finding
 layers
Date: Wed,  2 Feb 2022 13:00:11 +0000
Message-Id: <20220202130011.2949876-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161194

detect_layers() is very greedy and if it recurses into poky or bitbake
it will find the test suite layers, such as
bitbake/lib/layerindexlib/tests/testdata/layer4. This is a dummy layer
which claims to be openembedded-layer, so if the real openembedded-layer
is a dependency then layer4 may be used instead, which will cause
errors: initially because it's only compatible with Sumo, but later
because it doesn't contain any recipes.

Add a check that the set of layers we've found doesn't contain any
duplicate collection names with different patterns, and abort if that is
the case as the test will be non-deterministic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/checklayer/__init__.py | 21 +++++++++++++++++++++
 scripts/yocto-check-layer          |  6 +++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/=
__init__.py
index e69a10f4521..f91888ccbb6 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -156,6 +156,27 @@ def _find_layer(depend, layers):
                 return layer
     return None
=20
+def sanity_check_layers(layers, logger):
+    """
+    Check that we didn't find duplicate collection names, as the layer t=
hat will
+    be used is non-deterministic. The precise check is duplicate collect=
ions
+    with different patterns, as the same pattern being repeated won't ca=
use
+    problems.
+    """
+    import collections
+
+    passed =3D True
+    seen =3D collections.defaultdict(set)
+    for layer in layers:
+        for name, data in layer.get("collections", {}).items():
+            seen[name].add(data["pattern"])
+
+    for name, patterns in seen.items():
+        if len(patterns) > 1:
+            passed =3D False
+            logger.error("Collection %s found multiple times: %s" % (nam=
e, ", ".join(patterns)))
+    return passed
+
 def get_layer_dependencies(layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret =3D [])=
:
         logger.debug('Processing dependencies %s for layer %s.' % \
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index f3cf139d8a5..0e5b75b1f7d 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -24,7 +24,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
=20
-from checklayer import LayerType, detect_layers, add_layers, add_layer_d=
ependencies, get_layer_dependencies, get_signatures, check_bblayers
+from checklayer import LayerType, detect_layers, add_layers, add_layer_d=
ependencies, get_layer_dependencies, get_signatures, check_bblayers, sani=
ty_check_layers
 from oeqa.utils.commands import get_bb_vars
=20
 PROGNAME =3D 'yocto-check-layer'
@@ -119,6 +119,10 @@ def main():
     for l in dep_layers:
         dump_layer_debug(l)
=20
+    if not sanity_check_layers(additional_layers + dep_layers, logger):
+        logger.error("Failed layer validation")
+        return 1
+
     logger.info("Detected layers:")
     for layer in layers:
         if layer['type'] =3D=3D LayerType.ERROR_BSP_DISTRO:
--=20
2.25.1


