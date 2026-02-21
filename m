Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0B2C5DF8D
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14439.1771647875112479964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8tQBSPf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so24112925e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647873; x=1772252673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErF0FGXw7Ob7bITL9ZkjIA+NSWoaAIBDMxpnykvriMM=;
        b=X8tQBSPfC+ZU07a2ac+rVGB72I7lgR24BpEtASM26Issk6wtaZ8QAoLmwYMqcHMpHq
         F13lprDEzG/E7AmN1aOXgRNKhpIISA3MMIYFxdThpYoV0UJS+D0hWlq5uWbR14XXeeHh
         eJL773+SzuhyrxoJPVsEo7zeWgtaFvQmE2gBOqCEFaMjUNaQh+WUXWP9pRfDYGFopGns
         8+YkPnfAZarV1/o34WJb4z8PpXLHdhDORy3iKbnT3EXi9SvgtDlkEvp2QxTDTyqlEF9Z
         u5IuIryMv03fXzl/wQdQ7LjVPA/3w3cImFYeF00q/oM0rKtWD9CpfwMKJsIgNX6uD8qZ
         VFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647873; x=1772252673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErF0FGXw7Ob7bITL9ZkjIA+NSWoaAIBDMxpnykvriMM=;
        b=prhEznm9EhOlj/T+TQAAk5I5kLU+aun7t/swKFov5YKNwtYDvFeaRmfuXWpGx0j6aT
         NvA9QTsYffC6P6u0+eBNhIe+5ohGjPiX3iLmpRBPuU18N18yWjNQwcgAspp75HeyTtUJ
         KnY921+/114+NMatascRS6vpLDpJpwUEeVSuped76mTiqOqquMBh4xp4F+kYFQQFq37r
         g4HApSkHyRC//zIr4ZurHNHUx1hocsc0/1wj8FvR6V83iS7NLSB+0ML0igvT7zQyei77
         XmboTwFH2jp46rrX/FuXYTmxwkCCLefMaZN5s61hdK+kwMCM4wmjcAgN/Pri5wQiEEXz
         AvDw==
X-Gm-Message-State: AOJu0YzDyYwJDHvqElSI+lxGL0/UAIs6t5fnpYCrwtz9I29sqjxXATGZ
	xLkqy4dK5QY57Wv9CxdaTRFDd4+dkFC4xoZGCeCy7tDMMBcY8xHisihlcdfU7Q==
X-Gm-Gg: AZuq6aIvXT4RBpAcjbrtR+zglQ+iqJ3D2rm3mY6SEc5YR2afN780wIMurwqVdaFRi/F
	TNooI9k38gFdOwttALBZhQIPPaA16T0qLoDckejXs0YjCUfWs8nd1JwWB2IkI/44usCmZHYmaFS
	NTX44pmzKbu1nDNwZCJdcXMLvrrxKIQ1gQ0r5tIIbaDNMagU795hyqZ4LEztWtKjudDq7EabhBq
	F97aUkJuG67hwP++jstErb9cw8Axhz/agX1+1EiP1zbltq/PxZ0P3vK0kviP0uOxl54XRwl/cKC
	H3ao93iDs4lWx6Jafg/GgEKO4uxZ5YNmpsgtWLusCtbbvyZ90Wf2xMtOAdx7d8gJYiCtIQSXUoA
	TMk51NsLy1ABqtEbrk2mu+4TrZ/dsB2q5bToIkTKutoRXOtb7Wh9kOcA8KTaXi+ZVkmAo8doiYP
	W2z7RgGYC7gbdugyJS8NE9anCddtHy+2jEfpA=
X-Received: by 2002:a05:600c:8218:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-483a95e20f5mr31801825e9.18.1771647873117;
        Fri, 20 Feb 2026 20:24:33 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:31 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 09/14] spdx30: Add image root metadata package with describes relationship
Date: Sat, 21 Feb 2026 05:24:13 +0100
Message-ID: <20260221042418.317535-10-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231565

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Create a root metadata software_Package for the image that describes
what the SBOM represents:

- Package name: {image_basename}-{machine}
- Version from BUILDNAME (with '1.0' fallback)
- Primary purpose: container
- Description from IMAGE_DESCRIPTION (with generated fallback)
- Supplier from SPDX_SUPPLIER if available

Add structural relationships:
- Document 'describes' the image package
- Image package 'contains' each recipe's artifacts

This fixes sbom-lint warnings about missing root elements and
provides proper SBOM structure for compliance tools.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ef47bd4205..0d62de61a3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1498,6 +1498,31 @@ def create_image_spdx(d):
         d, "%s-%s-image" % (image_basename, machine)
     )
 
+    # Create root metadata package for the image
+    # This describes what the SBOM represents and fixes sbom-lint warning
+    image_package = objset.add_root(
+        oe.spdx30.software_Package(
+            _id=objset.new_spdxid("image", "root"),
+            creationInfo=objset.doc.creationInfo,
+            name=f"{image_basename}-{machine}",
+            software_packageVersion=d.getVar("BUILDNAME") or "1.0",
+            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.container,
+            description=d.getVar("IMAGE_DESCRIPTION") or f"{image_basename} image for {machine}",
+        )
+    )
+
+    # Set supplier if available
+    supplier = d.getVar("SPDX_SUPPLIER")
+    if supplier:
+        image_package.suppliedBy = supplier
+
+    # Create describes relationship from document to image
+    objset.new_relationship(
+        [objset.doc],
+        oe.spdx30.RelationshipType.describes,
+        [image_package],
+    )
+
     with manifest_path.open("r") as f:
         manifest = json.load(f)
 
@@ -1565,6 +1590,13 @@ def create_image_spdx(d):
                 artifacts,
             )
 
+            # Link artifacts to the image package
+            objset.new_relationship(
+                [image_package],
+                oe.spdx30.RelationshipType.contains,
+                artifacts,
+            )
+
     if builds:
         rootfs_image, _ = oe.sbom30.find_root_obj_in_jsonld(
             d,
-- 
2.53.0


