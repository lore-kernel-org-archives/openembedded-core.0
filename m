Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA5DC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:39:37 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8311.1789537172941309483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=P5Ab2A//;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=P5Ab2A//;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789537170;
	bh=u/jvFDI+EB3TS0vuCX0+fxabnuGW5luSgoKFmuG5bWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5Ab2A//Zq5jyxzni4vugI782zOEFdyVC3bZycAZ6tFmxYdGcr2T/QaYQd67RROyT
	 4A30iJk7gvlSpzN/5EZtM8lcjk/ZWuwU72rkKjJE0xH2LR5RBN16itkYm7H3oTX3tz
	 B6isj9fFTi/ETT/g5YMhJCGKrv/6QfFX4fkmaZF7idbLMegbTwn0Zn1sC4YUyYraO4
	 CBXsy1eNU/pbWLwGoFjIWrOVltOk4WwkzMhWZWYB9IqcOf7kvwzMuiY5aEw9tcTRoS
	 4YBQxSn8wvGWa9Sm5646OlZXmZTAroqlADUEk8QJG6szc/Pt274yATtA8dnzz73Gr6
	 BsWcyqVBkmbTg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 4F9235F8F9
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789537170;
	bh=u/jvFDI+EB3TS0vuCX0+fxabnuGW5luSgoKFmuG5bWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5Ab2A//Zq5jyxzni4vugI782zOEFdyVC3bZycAZ6tFmxYdGcr2T/QaYQd67RROyT
	 4A30iJk7gvlSpzN/5EZtM8lcjk/ZWuwU72rkKjJE0xH2LR5RBN16itkYm7H3oTX3tz
	 B6isj9fFTi/ETT/g5YMhJCGKrv/6QfFX4fkmaZF7idbLMegbTwn0Zn1sC4YUyYraO4
	 CBXsy1eNU/pbWLwGoFjIWrOVltOk4WwkzMhWZWYB9IqcOf7kvwzMuiY5aEw9tcTRoS
	 4YBQxSn8wvGWa9Sm5646OlZXmZTAroqlADUEk8QJG6szc/Pt274yATtA8dnzz73Gr6
	 BsWcyqVBkmbTg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 365EC5F749
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:39:30 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH v2 1/2] spdx: add entries for meta-layers
Date: Wed, 16 Sep 2026 07:39:07 +0200
Message-ID: <20260916053927.2198761-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
References: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245914

This adds support for determining the revision and downloadLocation of
meta-layers and adds them to the OE generated SPDX document.

This downloadLocation will result in a NOASSERTION entry if
- the meta-layer is not in a git repo
- the git repo is dirty
- the git remote does not have a valid URL
- the git remote does not contain the used revision as far as can be
  eluded from the local repo

Variables to configure the behavior:
- SPDX_LAYER_REMOTE (default: origin): select the name of the git remote
  to use for layers. Set to an empty string to always return NOASSERTION
- SPDX_LAYER_REMOTE_layername: override SPDX_LAYER_REMOTE for a specific
  layer
- SPDX_REQUIRE_LAYER_ASSERTION: set to true to fail a build if
  determining downloadLocation fails for any layer

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 meta/classes/create-spdx-3.0.bbclass |  1 +
 meta/classes/spdx-common.bbclass     |  3 ++
 meta/lib/oe/sbom30.py                | 12 +++++
 meta/lib/oe/spdx30_tasks.py          | 72 ++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 56fd01fd533..9e4f737f85d 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -286,6 +286,7 @@ python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d =3D e.data.createCopy()
     oe.spdx30_tasks.write_bitbake_spdx(d)
+    oe.spdx30_tasks.write_layers_spdx(d)
 }
=20
 addhandler spdx30_build_started_handler
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
index 40701730a69..b64537dfb48 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -89,6 +89,9 @@ SPDX_FILE_EXCLUDE_PATTERNS[doc] =3D "Space-separated li=
st of Python regular \
     (no filtering). Example: \
     SPDX_FILE_EXCLUDE_PATTERNS =3D '\\.patch$ \\.diff$ /test/ \\.pyc$ \\=
.o$'"
=20
+SPDX_REQUIRE_LAYER_ASSERTION ??=3D "0"
+SPDX_LAYER_REMOTE ??=3D "origin"
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e02382c3cc7..46dae429ffb 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -762,6 +762,16 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
=20
         return bb_objset
=20
+    def import_layers_objset(self):
+        deploy_dir_spdx =3D Path(self.d.getVar("DEPLOY_DIR_SPDX"))
+        layers_objset =3D load_jsonld(
+            self.d, deploy_dir_spdx / "layers.spdx.json", required=3DTru=
e
+        )
+        self.doc.import_.extend(layers_objset.doc.import_)
+        self.update(layers_objset.objects)
+
+        return layers_objset
+
     def import_bitbake_build(self):
         def find_bitbake_build(objset):
             return objset.find_filter(
@@ -803,6 +813,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 [build],
             )
=20
+        layers =3D self.import_layers_objset()
+
         if self.d.getVar("SPDX_INCLUDE_BUILD_VARIABLES") =3D=3D "1":
             for varname in sorted(self.d.keys()):
                 if varname.startswith("__"):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9978ae731ca..9094a6cbd64 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1205,6 +1205,78 @@ def create_package_spdx(d):
     oe.sbom30.write_recipe_jsonld_doc(d, common_objset, "common-package"=
, deploydir)
=20
=20
+def git_remote_has_rev(path, remote, rev):
+    try:
+        branchlist, _ =3D bb.process.run(f"git branch --remotes --list '=
{remote}/*' --contains {rev}", cwd=3Dpath)
+    except bb.process.ExecutionError:
+        return False
+    return len(branchlist) > 0
+
+def get_layer_downloadLocation(d, l_path, l_name, l_branch, l_rev, l_ism=
odified):
+    from urllib.parse import urlparse, urlunparse
+
+    repo =3D oe.buildcfg.get_metadata_git_toplevel(l_path)
+
+    if not repo or not l_name or l_ismodified:
+        return "NOASSERTION"
+
+    remoteName =3D d.getVar(f"SPDX_LAYER_REMOTE_{l_name}") or d.getVar(f=
"SPDX_LAYER_REMOTE")
+    if not remoteName:
+        return "NOASSERTION"
+
+    # parse and reconstruct the url to drop potentially present username=
 and password
+    remoteUrl =3D urlparse(oe.buildcfg.get_metadata_git_remote_url(repo,=
 remoteName))
+    if not remoteUrl or remoteUrl.scheme not in ["https", "http", "git",=
 "ssh"]:
+        return "NOASSERTION"
+    remoteUrl =3D urlunparse(remoteUrl)
+
+    revision =3D l_rev
+    if revision =3D=3D "<unknown>" or not git_remote_has_rev(repo, remot=
eName, revision):
+        return "NOASSERTION"
+
+    relpath =3D os.path.relpath(l_path, repo)
+
+    return f"git+{remoteUrl}@{revision}{'#' + relpath if relpath else ''=
}"
+
+
+def write_layers_spdx(d):
+    d.setVar("PN", "layers")
+    d.setVar("BB_TASKHASH", "layers")
+    oe.spdx_common.load_spdx_license_data(d)
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+
+    layer_objset =3D oe.sbom30.ObjectSet.new_objset(d, "layers")
+
+    layers =3D oe.buildcfg.get_layer_revisions(d)
+    for (l_path, l_name, l_branch, l_rev, l_ismodified) in layers:
+        downloadLocation =3D get_layer_downloadLocation(d, l_path, l_nam=
e, l_branch, l_rev, l_ismodified)
+
+
+        if oe.utils.vartrue("SPDX_REQUIRE_LAYER_ASSERTION", True, False,=
 d) and downloadLocation =3D=3D "NOASSERTION":
+            bb.fatal(f"Layer {l_name} does not have a valid downloadLoca=
tion")
+        layer =3D oe.spdx30.software_Package(
+            _id=3Dlayer_objset.new_spdxid("layer", l_name),
+            creationInfo=3Dlayer_objset.doc.creationInfo,
+            name=3Dl_name,
+            software_packageVersion=3Dl_rev,
+            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose=
.specification,
+            software_downloadLocation=3DdownloadLocation,
+            software_sourceInfo=3Djson.dumps(
+                {
+                    "branch": l_branch,
+                    "is-modified": (len(l_ismodified) > 0),
+                },
+                separators=3D(",", ":"),
+            ),
+        )
+
+        layer_objset.add_root(layer)
+        layer_objset.set_element_alias(layer)
+
+    oe.sbom30.write_jsonld_doc(d, layer_objset, deploy_dir_spdx / "layer=
s.spdx.json")
+
+
+
 def write_bitbake_spdx(d):
     # Set PN to "bitbake" so that SPDX IDs can be generated
     d.setVar("PN", "bitbake")
--=20
2.54.0


