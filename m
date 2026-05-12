Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9700ECD4F25
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:02:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80921.1778605353918831403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IbtX9X0c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B4DD4E42C00
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18A8A60646
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A7EF11AF8D57;
	Tue, 12 May 2026 19:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778605351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/F1six9UBAQi7TuKPbCP94iEf4zrxvASKncaayWJbc0=;
	b=IbtX9X0cc222Gh4IR9x6cXDXFNglVN9Tc2JXwXfB7YtqCcGL+O11uOMZwQZ2e9xOB3XFme
	Q1CxQoH2NySweYA7mV1grPGdvPxD6C6urfHj9zqcr675LGg03dGMRYNBrTCJAwOY8Eg+yL
	nOZedCqOCpytly/koAuTTTAszf2h5dNvaKTFqIHDBS5kz7I4QxG9m24PqMQsTz3krM7F4e
	czHspy0PPH6VMi7xWgMgWMACck0FDyHyx+1u4qG9PVkhPdjcw/c7iwb85aQEENTg3gz6qR
	zh9MZi0P7jXUDDw04tB8mtFwectbDFHh3oc0Lroo4CYgat3HDEZgpLIyW9ZcNg==
From: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric_=29?= <jeremie.dautheribes@bootlin.com>
Date: Tue, 12 May 2026 19:01:57 +0200
Subject: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
In-Reply-To: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric=29?= <jeremie.dautheribes@bootlin.com>, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 benjamin.robin@bootlin.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=jeremie.dautheribes@bootlin.com; h=from:subject:message-id;
 bh=MF/HT/Y8UK7IxXN/7lUI8cq11fEc2zuDT2xjjcfc6Rw=;
 b=owEBbQKS/ZANAwAKASsAXqAbWo8DAcsmYgBqA10exSMEjd2wsd3wOparc9uSHuJsqBQJntKZO
 Q8TRUyXKLCJAjMEAAEKAB0WIQT7FK2Qhtu4QpBIBAkrAF6gG1qPAwUCagNdHgAKCRArAF6gG1qP
 A1W+D/0ccAsy65lNvDP46Vw6b33R8mfkY3j8CSXORMvyVHMHyIoZOs+VsuccDPVLz+r6SybCyJr
 bdY/wruWMYGza3E2suSE48bHO+EYcXzi5iPmIZxnW0wI+gYT1EJzWc8W73sLiva+qhkK8GHUuEp
 Mpn1LlM0oFcenffpkKog4OpGh/PxxnfbZp31LOXLrAEjU+cGHwIRJK3YhuSNe/loq3EsU2yw6NX
 V/EOO+McgseDPREZiSsENImGRD2/bGk9RBwVsnlicBOrC6f6VtDi9w8ICDKdJCQ/U//+WlObefj
 nvnD6R+rdzQS5CrtGNBR1jcCQjUgXhz7fSg71dpXsWSu8ougP04+6nYoseE2HoJ3vrVM3A0BStv
 u4yOMTTBKoHkPTAtjfg9Qlcl4uxYDlnryfDdea2DQnHmFq0gPWlAhPrHuBjCZG3EX0N18JFpxbB
 7Uf6KqoQ1hcxDgcdqFdyxUNWILvZ25DZWVu/LWUCKRQkaadVAEzAC7AMd1m90+++LMCSJs0bAPL
 HvwNsxsl+H+Ob7Yet7P6RH3mYR4eBuodGRtzD3rQ9zjrliy7ztdUVuL7c4wsrB8gYQOKsiN8xfc
 KDWgzn9Nj85HPbhHXstGNSdRVnfMzkwwNEVZDPbuRqEx15CMrtYIRBeGe/5bJR5BSaUIIZrOrJj
 n6G0LvwxfJe10Mg==
X-Developer-Key: i=jeremie.dautheribes@bootlin.com; a=openpgp;
 fpr=FB14AD9086DBB842904804092B005EA01B5A8F03
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236897

Add support for optional zstd compression for all types of SBOMs,
including:
  - image SBOM
  - recipe SBOM
  - SDK SBOM

Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".

Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootl=
in.com>
Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
---
 meta/classes/create-spdx-3.0.bbclass |  3 ++-
 meta/lib/oe/sbom30.py                | 11 +++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 785edb9865..6cf8fa4688 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variabl=
e that describes how to \
             SPDX 3 spec. Optional but recommended"
=20
 SPDX_SBOM_EXT ??=3D ".spdx.json"
-SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
+SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
+    If it ends with '.zst', SBOMs are automatically compressed using Zst=
d."
=20
 # Agents
 #   Bitbake variables can be used to describe an SPDX Agent that may be =
used
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0f1f9281ad..2184c1a07f 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
         serializer =3D oe.spdx30.JSONLDInlineSerializer()
=20
     objset.objects.add(objset.doc)
-    with dest.open("wb") as f:
-        serializer.write(objset, f, force_at_graph=3DTrue)
+
+    if dest.name.endswith(".zst"):
+        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(dest, "w", num_threads=3Dnum_threads)=
 as f:
+            serializer.write(objset, f, force_at_graph=3DTrue)
+    else:
+        with dest.open("wb") as f:
+            serializer.write(objset, f, force_at_graph=3DTrue)
+
     objset.objects.remove(objset.doc)
=20
=20

--=20
2.54.0


