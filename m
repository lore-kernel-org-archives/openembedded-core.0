Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F19CCFA1E
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11105.1762521331937623878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=OU8KPHhE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80E96C0FAA2;
	Fri,  7 Nov 2025 13:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC066606A6;
	Fri,  7 Nov 2025 13:15:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 962CB118525B2;
	Fri,  7 Nov 2025 14:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521330; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qRBp7Gvv4IVkPnkeXJDk46Y6j9NPpTjX3sX82oXJ7Ck=;
	b=OU8KPHhE7+5aL2HyXXNBGs/G4zTQYdyOe3eo8N/AkV4Jtt4jR6/1hX4Xxx9hSNk3K3+iPc
	yIFKluci+1R1W1F6RtJG06tEqYFNWYF9+JlfKJbizy/mNOYMc1SPQuZkDrg/8iNA+fz4lo
	V+MqjiLn4XbY4eFxOOhEmI+GkQvfYOIfefYukcILXUJiw9uQKxdScIj8oKMdy30Xov8lC0
	SkQ/pPfZrkOi16Y7g+LZvgUmhU2zVGigkmwJwPpA/8WAVPuc8RbiLg3/7AoTIUbX2hHcX0
	rFyjQqcqy362PkwntURrcLJCD4PtvQHyxRMEVrlIQcl2WSjj1vzgOd5LKYUIMQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 17/17] classes/create-spdx-2.2: Handle empty packages
Date: Fri,  7 Nov 2025 14:14:51 +0100
Message-ID: <20251107131502.3857600-18-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226053

From: Joshua Watt <JPEWhacker@gmail.com>

When combining an SPDX document, the package list might be empty (e.g.
a baremetal image). Handle this case instead of erroring out

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 83 ++++++++++++++--------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index aee7fbac13..2351a3d5a1 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1044,52 +1044,53 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir=
, rootfs_spdxid, packages, spdx
=20
     doc.packages.append(image)
=20
-    for name in sorted(packages.keys()):
-        if name not in providers:
-            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+    if packages:
+        for name in sorted(packages.keys()):
+            if name not in providers:
+                bb.fatal("Unable to find SPDX provider for '%s'" % name)
=20
-        pkg_name, pkg_hashfn =3D providers[name]
+            pkg_name, pkg_hashfn =3D providers[name]
=20
-        pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, pa=
ckage_archs, pkg_name, pkg_hashfn)
-        if not pkg_spdx_path:
-            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name=
, pkg_hashfn))
+            pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, pkg_name, pkg_hashfn)
+            if not pkg_spdx_path:
+                bb.fatal("No SPDX file found for package %s, %s" % (pkg_=
name, pkg_hashfn))
=20
-        pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
+            pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
=20
-        for p in pkg_doc.packages:
-            if p.name =3D=3D name:
-                pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pkg_do=
c.name
-                pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
-                pkg_ref.checksum.algorithm =3D "SHA1"
-                pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
+            for p in pkg_doc.packages:
+                if p.name =3D=3D name:
+                    pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
+                    pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pk=
g_doc.name
+                    pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
+                    pkg_ref.checksum.algorithm =3D "SHA1"
+                    pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
=20
-                doc.externalDocumentRefs.append(pkg_ref)
-                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_r=
ef.externalDocumentId, p.SPDXID))
-                break
-        else:
-            bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
-
-        runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, "runtime-" + name, pkg_hashfn)
-        if not runtime_spdx_path:
-            bb.fatal("No runtime SPDX document found for %s, %s" % (name=
, pkg_hashfn))
-
-        runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spdx_=
path)
-
-        runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
-        runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtime_do=
c.name
-        runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
-        runtime_ref.checksum.algorithm =3D "SHA1"
-        runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
-
-        # "OTHER" isn't ideal here, but I can't find a relationship that=
 makes sense
-        doc.externalDocumentRefs.append(runtime_ref)
-        doc.add_relationship(
-            image,
-            "OTHER",
-            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXI=
D),
-            comment=3D"Runtime dependencies for %s" % name
-        )
+                    doc.externalDocumentRefs.append(pkg_ref)
+                    doc.add_relationship(image, "CONTAINS", "%s:%s" % (p=
kg_ref.externalDocumentId, p.SPDXID))
+                    break
+            else:
+                bb.fatal("Unable to find package with name '%s' in SPDX =
file %s" % (name, pkg_spdx_path))
+
+            runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_=
spdx, package_archs, "runtime-" + name, pkg_hashfn)
+            if not runtime_spdx_path:
+                bb.fatal("No runtime SPDX document found for %s, %s" % (=
name, pkg_hashfn))
+
+            runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_s=
pdx_path)
+
+            runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
+            runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtim=
e_doc.name
+            runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
+            runtime_ref.checksum.algorithm =3D "SHA1"
+            runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
+
+            # "OTHER" isn't ideal here, but I can't find a relationship =
that makes sense
+            doc.externalDocumentRefs.append(runtime_ref)
+            doc.add_relationship(
+                image,
+                "OTHER",
+                "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.S=
PDXID),
+                comment=3D"Runtime dependencies for %s" % name
+            )
     bb.utils.mkdirhier(spdx_workdir)
     image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
=20
--=20
2.43.0


