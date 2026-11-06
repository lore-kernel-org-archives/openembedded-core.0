Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4336.1793966125772408810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 03:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=ldOCyjJX;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1793966107;
	bh=dNkdmth+Kt1LMxf0LxhcxJ3dui/OBWbOTNeYAZDnorg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldOCyjJXoeCKmbiZHZhqqtqi11b15RyAHZyEe5o8r5egg/02hPDJR+KHaYa916UCN
	 OFDqcVcproitz6ubdr5+qoxBn8b2UhkXAt+3ohLbHif1n1uYeeNYluoBXt8P+3GebX
	 HQaMG5rVlaClB6bS1/HYtxdnCjMxOzOfNccc/oqhfZvEFnLuGJ/8D7HOu5fE+hz4Ry
	 u9vpE33n52T9Y/WgwjJ8IIvJLbvM7fgLnrj+vS7FW/mgeG2FUNdoJRb69vC7n+pUvy
	 iB/kBJZFPeDq3PHqgpjPB9iIm5lWvJi9wYLj7B0TgN3UDFBZp8yq79x1yQIUtRdof+
	 oJdRp/S6bOllQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 210DD5F8E9
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:55:07 +0100 (CET)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [DRAFT PATCH v3 2/2] spdx: link files to the meta-layer providing them
Date: Fri,  6 Nov 2026 12:54:55 +0100
Message-ID: <20261106115455.4141199-3-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106115455.4141199-1-dwagenknecht@emlix.com>
References: <20260915130509.2184318-1-dwagenknecht@emlix.com>
 <20261106115455.4141199-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at mx1.emlix.com
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249635
Content-Type: text/plain; charset="utf-8"

Many recipes ship files that originate from a meta-layer. Link each
file added via the `file` protocol to the spdx entry of the meta-layer
containing that file.

Some files might not originate from a meta-layer (`file` protocol
supports absolute paths), fail the build if SPDX_REQUIRE_LAYER_ASSERTION
is set to true.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 meta/lib/oe/spdx30_tasks.py | 44 +++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 31d964d8ce8..4bdbbcfab97 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -477,6 +477,7 @@ def add_download_files(d, objset):
             primary_purpose =3D oe.spdx30.software_SoftwarePurpose.sourc=
e
=20
         if fd.type =3D=3D "file":
+            (layer_path, layer_objset) =3D get_layer_info(d, fd.localpat=
h)
             if os.path.isdir(fd.localpath):
                 walk_idx =3D 1
                 for root, dirs, files in os.walk(fd.localpath, onerror=3D=
walk_error):
@@ -492,23 +493,36 @@ def add_download_files(d, objset):
                             objset.new_spdxid(
                                 "source", str(download_idx + 1), str(wal=
k_idx)
                             ),
-                            os.path.join(
-                                file_name, os.path.relpath(f_path, fd.lo=
calpath)
-                            ),
+                            os.path.relpath(f_path, layer_path),
                             f_path,
                             purposes=3D[primary_purpose],
                         )
=20
+                        if layer_objset is not None:
+                            objset.new_scoped_relationship(
+                                [oe.sbom30.get_element_link_id(layer_obj=
set)],
+                                oe.spdx30.RelationshipType.contains,
+                                oe.spdx30.LifecycleScopeType.build,
+                                [file],
+                            )
+
                         inputs.add(file)
                         walk_idx +=3D 1
=20
             else:
                 file =3D objset.new_file(
                     objset.new_spdxid("source", str(download_idx + 1)),
-                    file_name,
+                    os.path.relpath(fd.localpath, layer_path),
                     fd.localpath,
                     purposes=3D[primary_purpose],
                 )
+                if layer_objset is not None:
+                    objset.new_scoped_relationship(
+                        [oe.sbom30.get_element_link_id(layer_objset)],
+                        oe.spdx30.RelationshipType.contains,
+                        oe.spdx30.LifecycleScopeType.build,
+                        [file],
+                    )
                 inputs.add(file)
=20
         else:
@@ -801,6 +815,28 @@ def load_recipe_spdx(d):
         oe.spdx30.software_Package,
     )
=20
+def get_layer_info(d, path):
+    layer =3D None
+    path =3D Path(path)
+
+    layers =3D oe.buildcfg.get_layer_revisions(d)
+    for (l_path, l_name, l_branch, l_rev, l_ismodified) in layers:
+        l_path =3D Path(l_path)
+        if l_path in path.parents:
+            layer =3D l_name
+            break
+
+    if not l_path:
+        if oe.utils.vartrue("SPDX_REQUIRE_LAYER_ASSERTION", True, False,=
 d):
+          bb.fatal(f"Path {path} does not originate from a meta-layer!")
+        return ("/", None)
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    objset =3D oe.sbom30.load_jsonld(d, deploy_dir_spdx / "layers.spdx.j=
son", required=3DTrue)
+    spdx_obj =3D objset.find_root(oe.spdx30.software_Package, name=3Dl_n=
ame)
+
+    return (l_path, spdx_obj)
+
=20
 def create_spdx(d):
     def set_var_field(var, obj, name, package=3DNone):
--=20
2.54.0

