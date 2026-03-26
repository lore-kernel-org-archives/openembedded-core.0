Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C6F10A1E68
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:55:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44668.1774522503580990907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DsstmLP0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso409517b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774522503; x=1775127303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvW3+OCNObIb2icJjLPxPo003ZFpTD101ipuwyO5DKc=;
        b=DsstmLP09SkP2gJqobC40508AnDR9jqtRr074MgAapzJJLQXZMSJoTQpZQ4mbbjEBE
         BwA8Uj1RRVPC/Qtgop0sOrxMKEnGwV13YQ05qePKPmJC8GJeKsU+JlJ9Ky6b8lo6k7oL
         Ghl71Me7PlDs/3oQiqcgKvhXX+X3ebeLmg0c2W/7stN4e6bM3iGV/T8ibRPhvaYarOD1
         Q67p3fHk/5povRtJhzjGl4yp+VwvbYqHQtV5aStVy3ZE5GmaS2/rL9Fsq9XTMMKv/npY
         oj7LUw7IbWCLro4teewdeGGpwZCyT2lDzUFGk3YHZ08PMx+XcirygScuAvom8Tgt9EnB
         T0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522503; x=1775127303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvW3+OCNObIb2icJjLPxPo003ZFpTD101ipuwyO5DKc=;
        b=iUyQemUwGWVLEkrKkww9Y3Xy6tIASuUeqCgYwsRyVmQvCFkkhvyOC3El3y/KUyB2Sd
         rY9DKaRwxlixRDT8qHFvioTovvkQ9vIh3DQqqm1c/HGMTSV8ixWMmNaiyqFHFpOwuHV2
         TUgUJFvoD46PjpeM4jZho1qCN/Uj77c3HT697bG/bReu5y1R4ZDEpN3Z/ghEEPyu7yp5
         BT/huiRzMvc0uSgtFgoQyFjTOpSxh8BHXOPskp1hBiBbwopoOTnUOFA2YYTF6QhnMmCY
         xGhBciLxMEPqqkhWsFRklSYZgkL6gmnT/2m6bSyQgZsjX6Owl4ExI4uDERaufL0/f3By
         AVhA==
X-Gm-Message-State: AOJu0YwFgSta3vs4G+/UnrC3wNGjcTPvPSaaTsL93AmtWYT/HhEOGuAW
	fUGiPWgnznQBeqpJ7D28FBqRijhwxvxybbRDH4UNAilsGRtOiBB1sYWWh9/c3teG
X-Gm-Gg: ATEYQzyyhp1cNbpIJUJXqH6NqgoRNbsfQc/NJmR02kFEKNd0P/f3RyE/z0oLPotL9nT
	EODzxNvRDlmScrL8ukETtTdh5TEF0NTUVXf6Y/MjqUhB5QUG07c7NFkd04eYg6Vos4evZW2RB9H
	HaxRqji7akva/2FPqFnjYOd7FcjznoldOVaFQXfDRutSfXuJQpj5qdgV/z1m9H5udfm2fP/tu5T
	FaIXwDn30z6/UyZzW7S2I8Rivu2UQSQmBSRPDUxZqFR5KYXTmslSQFnSTvaJZriIc/UIvK+vYfC
	Lf958oy+qEOcluUvRlgPlIaxnmd04jmxNN4Sv3kW1mJ/mEg0xsP5JsjiXpqH80eB4L/oqUleOvx
	YyP/kUxS9ia7OQeAwN+Ww6fl6zhLTY/KR8XmBEDMA7JOOtm410SQnH5StcVBZ+8wtK/ezz7wc2f
	n4IEMdM3+Ad2vBulnXPz1ot2Z646Sy0qJQDdE=
X-Received: by 2002:a05:6a00:909c:b0:824:b181:f492 with SMTP id d2e1a72fcca58-82c6e136005mr6497874b3a.45.1774522502595;
        Thu, 26 Mar 2026 03:55:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e1960sm2269542b3a.3.2026.03.26.03.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:55:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH] vte: upgrade 0.82.2 -> 0.84.0
Date: Thu, 26 Mar 2026 23:54:53 +1300
Message-ID: <20260326105453.1799455-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233970

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch which is now merged in simdutf[1] v7.7.1 used by vte[2]

[1] https://github.com/simdutf/simdutf/commit/c6f8e887ef51bb80dd978180042b9b9f4f46800f
[1] https://gitlab.gnome.org/GNOME/vte/-/blob/0.84.0/subprojects/simdutf.wrap?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/vte/{vte_0.82.2.bb => vte_0.84.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.82.2.bb => vte_0.84.0.bb} (93%)

diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.84.0.bb
similarity index 93%
rename from meta/recipes-support/vte/vte_0.82.2.bb
rename to meta/recipes-support/vte/vte_0.84.0.bb
index d5dced4ce6..2a31c9998c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.84.0.bb
@@ -18,10 +18,9 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
 "
 
-SRC_URI[archive.sha256sum] = "e1295aafc4682b3b550f1235dc2679baa0f71570d8ed543c001c1283d530be91"
+SRC_URI[archive.sha256sum] = "0414e31583836aeb7878da25f67c515f7e8879917ecc37c92e26b83e8d8fc3e3"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

