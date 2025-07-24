Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD23C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:29 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2558.1753385722305918771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zKAhR74s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso1641994a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385721; x=1753990521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9S3QOEmKZI2rtXOAfsdBB+cbOD+yrlcF63hGrC0+ag=;
        b=zKAhR74sdZ6BXDwLT8Cb5pfXVbGvkLxQDbt0l3zoU07DKxlsgmuBwLHg+dchKdc0xZ
         jp8xoH/PzCkStE2qWdNZdPotHYi2eRLZ0Vad0/48R9lJzioudnbF1qtiumE5PUdDZ63S
         V7x3nNdVlTwT7REaCSJPO7XfCPenb2A/Bag+JVfhW7a/2v18pqFslN30ixwfxVmkGiMO
         yYPTwLylKQsgsAem28Ud9avKuWmDRvq27uZRo6VqCudPtB+jF85P3Irj3uup5fJOtxQl
         J64OovlhE8svY1+25FESeViLpoKo+t3cc4AtB+uGpFCs5A9KOcy2XQx3pU+osyJu94nH
         FGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385721; x=1753990521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9S3QOEmKZI2rtXOAfsdBB+cbOD+yrlcF63hGrC0+ag=;
        b=uf0Folo/KuF6z/AnkbPSJIr/t+zIvUXvgVVcTpO0DuPuFgfzUAQTG9z/ofpDGHHUGH
         fVLLjeG35iTCqOLYZB+aKZ0/k/iD1oYdSXHGK8t/GuKOtxjxBdKzQpJ5Jw6XCNovKm0G
         4oEIKE+D+8c3dnEEuaufVbosXL8hDrUgSh1YAzF0LgXt8UQmBmZT08Dmso2xR+RsmLad
         CGjnTuQ+ejn3B2L68rwccBk2wEiiYuRLXsxUj1TPBYKk9Fwg0x2jY90zTLnuvAToKoJx
         2MoXjD5OA46pzNgrgR+kX8xjSjzWNQy4xW8Mj39dSFEACB/ewVXd0F74Zd8LyCvgYvN4
         FgKQ==
X-Gm-Message-State: AOJu0Yw0z3x3aa9SVQ41ntMWUw1CMYf9I8SPSvvGJvb5nxRBfFo+dbR2
	G8OqN13asrid+8LByIIoU/dhkrGbxtMoJ1j0nAqSaADyn6A4XYfAhfJ5oHVz+WColHxN9z7RVNq
	WsulN
X-Gm-Gg: ASbGncv9ZLE0a4pEJVELgnrkqKKa9s+24U4JF4aD2IZlOWv8hjvBVAmgF8HoyzuhLEw
	BaW53pgnan1AekGvOD7orQQZFfHJSHGn1YE6C8tI9d+/LDjvGPs4Ivq4L1rVqwLSwdylvhZbakI
	LrlaADKRTT1clQcpFbC35Xc9Xu7Ty6nZA44ek9eFqRGfMEVITYo6WCocwnoZGMUWv7af8l/FJrk
	VrViwcKuHGyUIEAaETAvu6VDGEkJ/ZuO6aXA2jPoMYAniLc2l2QbfNoouvQx/CC6+6Ut2FVkAOV
	pYM8eegVowv7g/C9HiPTYeI3oz8zrWP/mUGBWM+8yo4CRjgT7SxNBeK1lUnuK8eLGIxBaisdW9/
	NKAbIm77aBUFG
X-Google-Smtp-Source: AGHT+IFFXg93/ZoaRNx2kx1wPrLDz7hN3QmDQC7vQll96femvCae5T/iFA0ro+lWRISzBQLWve0fPQ==
X-Received: by 2002:a17:90b:574f:b0:313:279d:665c with SMTP id 98e67ed59e1d1-31e5078f2ccmr11790760a91.7.1753385721378;
        Thu, 24 Jul 2025 12:35:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/6] orc: set CVE_PRODUCT
Date: Thu, 24 Jul 2025 12:35:05 -0700
Message-ID: <4367e4cc527278b7e9edc08752014e71566e0068.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753385563.git.steve@sakoman.com>
References: <cover.1753385563.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220860

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/orc_0.4.41.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devtools/orc/orc_0.4.41.bb
index 491ff71067..60677577b0 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.41.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"
-- 
2.43.0


