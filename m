Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D78C88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 11:46:14 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18095.1789386365537524725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 04:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=ilCPLu3b;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=TS2QsJ1o;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789386357;
	bh=PfldjdEaRTOvQUp/wyacfHtpP1tsK3PXniJsQYSOR1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilCPLu3bEXBx/TQ7pBfLWFttc1DUV2NvwpRVnViOAW2B6M9jYA+6F1RZgFtINzxJR
	 q5Pst5huhriIuKSEplmvh/bY7NFynciQs4u7lQB/ACUNf+DY0juZrIswG7VWJ+b43q
	 /EfFYYcQyGwoA4XrWyzu7OQ/TpulhU1+MXpU3lJgQsDMjw3n0cicSCyA0cbqyxFQdC
	 7Lcgb7KMey9dKTfjkJ/rGjIINXD/WPKoN6066AJRpPyqr/4SEP64TdwAGkFnZZf1vx
	 a738q87r+S0qRXdMyili8WsxOK4Xi+LvkL8nYuZBj9RGzUn7xUEZ12HRIPOoh3jG3c
	 HwgfY9dulbdEw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id ED4365FBD2
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789386356;
	bh=PfldjdEaRTOvQUp/wyacfHtpP1tsK3PXniJsQYSOR1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TS2QsJ1ot6/w+i6cmKlHNSO5l0VOqz8UAvp4nztfdadfKW/R2VKtChbevdIl8pLbC
	 xqvzsYiCVuJ4q3hnU6sfsmBxTmOw4Vz5hTguR/t1fBwrl/81r+dKwpsMBCQ9YYe623
	 wWHOILFDsZb3rTx/aBtiTR2ArcNujsRkTU1dL0IWvsNmfkbNuUU2oF4NFkI5uQl3we
	 +hv7ym8lKac4eEiSJAoTxz6MNd9F+MtfFG5LUKUlXVTqzNgbKgTUhX3HoDIHYyU4Md
	 9yE58oF9MvJx20tLJbzNOkJy5jEwwM8LjzIAlAQnfnlkyYt1tL0AIVStwNzkkUoYuA
	 bhC8a2mk87k1w==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id D76A55F82B
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:45:56 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 1/2] spdx: add entries for meta-layers
Date: Mon, 14 Sep 2026 13:44:20 +0200
Message-ID: <20260914114526.2646773-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914114526.2646773-1-dwagenknecht@emlix.com>
References: <20260914114526.2646773-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 11:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245764

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
 meta/lib/oe/spdx30_tasks.py          | 74 ++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 56fd01fd533..1ef6b15ac22 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -285,6 +285,7 @@ addtask do_create_recipe_sbom_setscene
 python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d =3D e.data.createCopy()
+    oe.spdx30_tasks.write_layers_spdx(d)
     oe.spdx30_tasks.write_bitbake_spdx(d)
 }
=20
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
index 0f1f9281ad3..d2a3155b2b1 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -752,6 +752,16 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
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
@@ -793,6 +803,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 [build],
             )
=20
+        layers =3D self.import_layers_objset()
+
         if self.d.getVar("SPDX_INCLUDE_BUILD_VARIABLES") =3D=3D "1":
             for varname in sorted(self.d.keys()):
                 if varname.startswith("__"):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4a..0a8f4b0e1a0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1220,6 +1220,80 @@ def create_package_spdx(d):
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
+    # revision =3D d.getVar(f"SPDX_LAYER_CLAIM_REV_UNCHECKED_{l_name}")
+    # if not revision:
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


