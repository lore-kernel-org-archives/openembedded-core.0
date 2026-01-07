Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE3FCF6BF4
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1461.1767773370743009144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zMeQeLNV;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so14646435e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773369; x=1768378169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/q6sUbU8uHMOPjj11flh+L+IeCLfhsF0vvcsJXYY78=;
        b=zMeQeLNVrQC/wrDOocyiEfYhZ/gv4DHCfOydHC20wT8z+ggqh5NUlNBY+59bsTXIzo
         UUb8uggr6jqZcRJiVy7SqhVruBdwdRGMXYdglop9fimwdFJPVNnRIHXJaxMlAr9GSORX
         5LXsOh626OxyzGUbhKXo50HtuYKswC2BkxxUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773369; x=1768378169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/q6sUbU8uHMOPjj11flh+L+IeCLfhsF0vvcsJXYY78=;
        b=U4q4JfXjyH4fRNgFeR8g2cyhKINQBeUkgW5l7ofvXFz9x/VGVD2IRHUUtwobS65lJa
         mF/hqD+gX7o04bW2GDT3oddE4QD+NkOo4PReyXOMvjDSpEXoHdebnIBt8WtlxMygvSub
         z1uJpQgmxAfTrkWk60yAplnwzpLGsfijMjD0k+GfAegfQiAN9lK4Qft45dhnaenQa8+D
         UBkvbYTfhZDILJ4Ld3lDim1XM1hD+Tl8I55ayen9sHgEVS9mmDupYrjy9y2zLnH9bJS8
         VcW6qcPQGJqY8WYF+LG4uhcTQ80akBKzCRL6vtpOfAvxMQxzQ6jyC94q1EO7VrZCbBeo
         hpfA==
X-Gm-Message-State: AOJu0Yzkq4RSrbQSvIKBLoKOYiq/5QAol9h34fLmhtjztuvdQv5b3WvF
	OCLfhv0T4ISYZQdzjTgT1/In2Yt0UqvCdRLs4P97s/N5A9huKKNf+C4UtUWJpsJShdLytUjrYTs
	yvqbc
X-Gm-Gg: AY/fxX7HAjUTIuXaUfWz/tztzWBgO2hwJrZ/XXybeU6lN1cB13EYA3Hj1n9livKs8dS
	yoIWKT/qWvrl5XWgBrmrUeLuCKNr+B1ML4AcBX7Xi6LowWCa6mFAY/EZy4kZDNG85tF8HmAUwDM
	Tj15te9+GgsHwy2CQchcx2j82TKEFUp99EWGrUzgSE3Ok/heHQa0JnLECoClU5veSL/7kAkbrK8
	xad6FIaP7bCbjXl27HbVjNCCkyWZA2h6nmDuMmgpkv72Xbja42DGy1UKV9quviRYBlDhCFgBGhB
	sGLFI/i/G0xWqNzKz037tKmW9Wc4dKJII2rrF1jECDJmlxp2fegkkneW7KyxaNP2GS6j1n1Q6yP
	vswSZozAuPhQdsgClgrB9JECOeG2VWwsExk3yT9+jWgpeI4BRzuUOySZhw1z4lN5urgjD6QEpwb
	FWMS9atnnCqSuvJ7xeHXCeBZa0jBJFzzjysFGXO3B3Ae4nFAm/915qLQ2HXJvmDTrrynKFT5jK2
	AU2Iik91v2w98M=
X-Google-Smtp-Source: AGHT+IGwWUnnq8gRCloDozdw/is5mKQh7o1eVh4kqUanwRo7tQY12gGd1t99AlRS+pHelWSv1s1pFQ==
X-Received: by 2002:a05:600c:4703:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-47d84b49e27mr16203855e9.34.1767773368773;
        Wed, 07 Jan 2026 00:09:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/11] Revert "create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK installation"
Date: Wed,  7 Jan 2026 09:09:00 +0100
Message-ID: <b822b0f2f6122838625f38a29eea56371dd33580.1767772758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228958

From: Yoann Congal <yoann.congal@smile.fr>

This reverts commit 3f57280caa7918f10e4e9685ad87a3128d4e9f0f.
This commit was not in master before landing in whinlatter.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index f070b7e697..636ab14eb0 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"

