Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE959C5DF9C
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14946.1771650628478981507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtjAirop;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-436e8758b91so1985412f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650626; x=1772255426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErF0FGXw7Ob7bITL9ZkjIA+NSWoaAIBDMxpnykvriMM=;
        b=CtjAiropg2tf03M2KwtPTnVy5sTDztczu42OR3Qy/FFiHx5GTt0Eve+xlMAR+ebyeJ
         +9Jq86035fgMzaYuB6QXz8vlGvXvx9WvS78qckdIKbbuCOcOrmYDQOXJ8lYPNeYHHA0f
         DFUsVPtI9yD9cUbiEpcM2foB1ok499bioolu9eWN1EhrbInWb1VWGfa3HpeY5CO4+Jg/
         jIwFKugWqyhpfRvSWI1zDwqg8BM0UsLcGBhHjIoXKdTnVEXAJcpfLC2vUJk6jCqTPPSa
         btt999Q760qwk3EsC9vZkPDUERQC0+FJD8b0zZM7vrZHCuBc9rAiefw5qNHYWceyFyuN
         4lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650626; x=1772255426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErF0FGXw7Ob7bITL9ZkjIA+NSWoaAIBDMxpnykvriMM=;
        b=SPRM7jIaFkV6Pb2JnemH8qE2ETOc25TrXwSldVAKPlWiUDnrwPlbOPdgu4+kdXBMIm
         a3Rqm9bTCjZIyAueUOY50COGS1E5cn4RptfuxWHyNLT2xdOiSBEgxRQvBHxM9KZ1iBK4
         pvpB7stwo4fDa6KcPq9rb9dmFFyFgFp2Kf9OCpQgvqk64s0O6rP49ExZd41AWZuUjFhR
         YQYSBsokk2BpR9Jnl2Ivyg7o9NPLjq/+kSSM8e3bhGyEVuSo2AK8Kk6958aqBVzAbth7
         OnBX1olNiwEmjKhGVqnLkefk+FiHVN4HMGWVLnixoJx+Ot8hmAJ+Me10bhZtn7p0oubt
         UOLw==
X-Gm-Message-State: AOJu0Yzjz47aoDyQDIBtho5nguPSnU6Dy1nWk3qrauKqscCKIaDoizYZ
	bIh4iuB1KV+bo5QRPJeHWdiDeNMoepXpP3dxY13TFH58qd++ZQ0ptHWA6yokIg==
X-Gm-Gg: AZuq6aI2aUm1u0T+3I0hWfvDoikIQDfUOgKELcCkcW7KUkLpwTPnAn+dswg56X2mV7x
	Pcrjba6sfqg3zwyy+liKW8NTU8u7kqRuYFEC5/JN7CDojlu2Yz1Y8D3Nk7NbJNDLix6PzULhmt2
	Z+FvPG7rffyLqPIJWuGTGqieIYqrRbEdVVJH4uF/Uiq9MJ/il8mAPJ7SOhw7dHHmUWNtCBGFZjQ
	B48/YZbD4nelol1L3VGWMWy+kW9jEugZN5LrjcEUXeNKJacxra18ILGLTpnWoMYBofNAUhqgEfI
	AdLQB/D2dAE7eQCC6nDV/QNKzunAQ2YjM8E2diAf205iQ5joUP9As74H0dqXaC6wr3VdIQLavfi
	gYsdWobzgflVfg5KOD+q9Mt8sZthrALQMSUKpkxsnqnhGOMiVsAFJbspA9kupZlY1JCrbciCq2k
	rw5E+lTdHwKKAGzmqEeD0PSleO9+D9R42Tn48=
X-Received: by 2002:a05:6000:430b:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4396f188c2amr4054961f8f.51.1771650626391;
        Fri, 20 Feb 2026 21:10:26 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:25 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 09/18] spdx30: Add image root metadata package with describes relationship
Date: Sat, 21 Feb 2026 06:09:57 +0100
Message-ID: <20260221051006.335141-10-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231589

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


