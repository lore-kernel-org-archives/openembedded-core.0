Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C9CE69190
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 20:16:18 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.34215.1732306571044679068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 12:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8aHfLcP;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29645a83b1bso1532276fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732306569; x=1732911369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eMK9mXKY6Xvuc2Usm8Q8jKZA+I7VMuea/oVxsDsCTw=;
        b=J8aHfLcPT3pXV5a1baG1R3HzCVdrxzNI+8b9lmdV0jaCL5tXKYUDEyv7uOYRPXdJ/G
         yS3WpMraWx954nBWOdrLcGBMPLtojdIIGLXGBLol7btSbj9jbihkBPxriJ8GDPfI/Y9H
         qd6BfD7RGduvymDEUnMdp5xrq2OHjdTywsMSPEIK1Y70L5LiSwx/UXtq8DUfPJB9ZcSv
         LN7vGzvdOJR3Sajtibj7bJwq4WbDuDpctKj6Mde1EZo0ojaSn4D8LOT8+zbiQ8NYn20g
         sCvO3xete2oB4avfqWj31w26PkCIR0jQIFRV3BTQi3N9vqqazFzw4QO6Dm7Mh6Sdetrk
         Tl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732306569; x=1732911369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eMK9mXKY6Xvuc2Usm8Q8jKZA+I7VMuea/oVxsDsCTw=;
        b=Bfyoz5wXlNdizW2UPykheX8urbYWgqtQh73Iv4aLl2svWq6fyPPP0Y1jS98AP5RJqz
         01qsT5m31pcvvzE+Jl4kfKe2dmSeqsrnNGA/fMHOBE33F/xkfaCihu3MgDQjCECcKvm+
         hU8JxjO6jovWxBNcGfR6Lr6lcMzaL89UIilnQO1E++5kF4gwz7FMAjsT2X+6lw3Z7cxp
         yEvdg4XV6PESZp8ZJg/vAx4DqJDkIzYjryke+DCAJpHpTU48GVL1/8YIvOgSFGIz7kp8
         SCRXnUbe5X5MwBBYWs8GCp3CZK16JtTDfxsjBgXYSiuF1BRpUCYWVpOdOXi77wRFrz9S
         GEvw==
X-Gm-Message-State: AOJu0YzIDvVQRq/h0Kam93RQYdOz8IKe1elG3gYrq+Skr1tIgYqmefEA
	mtxkQGcnkRgdCr5KoEQ2istlAspEpXgF/YtGcA+XL5xqR/YFsZysVv1I6w==
X-Gm-Gg: ASbGncvWO4G2kkZDLa+hAXkqkT4aKUC49DvupA1sk7TCz7+ZfHJFjOqEq/NWRoDbAcs
	h6JCQlQiKxVTU7fGf7j/c+liLwznj4CR1FjrwgGrcxC5T33JGBni8htWhlQv4W3vZs8FbSXhr58
	RA2SrB3gcZHa3j6tXr4Wi3B2xgGqlMmTrsyMc6gxejTaauhw9+67XtXQyxGB8GX+4jtQjDoU5GY
	8BLann6qL08mYCF17anrDMYBiKDzaNPkdiUVHom3GRyHYr4
X-Google-Smtp-Source: AGHT+IGWjz/pyw3yWDRaRAPLzUkt9p8tQjGDTQKRE7o6+zq88eko7LP8uxgeUBZciya0hAQohWVYbA==
X-Received: by 2002:a05:6870:350d:b0:295:eb68:fad9 with SMTP id 586e51a60fabf-29720dd36b9mr5594965fac.26.1732306569598;
        Fri, 22 Nov 2024 12:16:09 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d5e5147sm795568fac.22.2024.11.22.12.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 12:16:07 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: sbom30: Prefix aliases with "http://spdx.org/spdxdocs/"
Date: Fri, 22 Nov 2024 13:15:57 -0700
Message-ID: <20241122201557.2247079-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 20:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207646

While the SPDX ID aliases are primarily intended for internal use by the
SPDX code, they are used in places where a valid SPDX ID is expected. In
order to make sure that they still conform to this, prefix them with
"http://spdx.org/spdxdocs/openembedded-alias"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 56cdd7ba4c6..7acb5234db2 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -344,7 +344,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 alias_ext = set_alias(
                     e,
                     e._id.replace(unihash, "UNIHASH").replace(
-                        namespace, self.d.getVar("PN")
+                        namespace,
+                        "http://spdx.org/spdxdocs/openembedded-alias/"
+                        + self.d.getVar("PN"),
                     ),
                 )
 
-- 
2.47.0


