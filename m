Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98FDC44535
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2860.1784568209396906807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=inP2rwce;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so45661065e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568207; x=1785173007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u+S/M6E9ZsSbNA5umVfH02NMG3UPG1WL/VtqSiCH8gc=;
        b=inP2rwceHE1VeZw+XqtcXyjoZdauBgfIO4k5VKVKOK8n8g1rH8JJiVgRQJtPWPa7Ey
         UQW3xAPd0PH/oYMSW0tkg5iQH2BWb0r3lmZOyNl+4Ien92wwU9Df03WXPjMc/PDjDGLc
         HI2HkPCam28esLday+HnUw6DdeBpP2YkhLx0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568207; x=1785173007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u+S/M6E9ZsSbNA5umVfH02NMG3UPG1WL/VtqSiCH8gc=;
        b=Xo+8v1P0W4tKnsmS7Kv0i8WTR481Jkpf0bb6iGgDlKMhHhQhcLEVY09ElGdVxrXEUe
         BpZkxdlPIIxov6SXKEgLFFRBmXmno0cr1o7u3N4NsEWLyliXNsFGqC60A4KfmIRyBWma
         igjySEOe4QrlouW8u3QYKEhUwXhWYi8juRFyx641rE8awwasn8TeFr21m057ii+f/bHt
         6tqn+by2fsTfZTnZ5z+mWZ2oXHasSSwOKtQQYWtIMk6qilJa6Ia8f4h51+rF7rSVfpb1
         toYdRfCAqHarI24GBsN9MQCLS2uQ/mtGF3/Iy7WjLNHo30pDDsZByOBS9kqraCz4oz3N
         LGWg==
X-Gm-Message-State: AOJu0Yz4HNd3zbhhbOBc/Orkj64fylHevFN98wXAMqY9/M66bYzMKLDR
	8I5pf2zNwls/TpoCwZANSk2cd2qyjtB7ABIlITRc9u5W8Hx6XeAeMX084s3tFONwZyVF5GmmmjE
	r8QEHM/8=
X-Gm-Gg: AfdE7ck9uO95U3/xynzfquiEn3m1gTm9cuUjsNDj8yqQkFHVwIiK9aZQIchjCOvwdAl
	nHNIgG4j430J96YQt+5znfWPvUx0idFhxct6jNpJfB2HIKF3ffDfFYLgz58+enuj30KybWhLHKt
	EbSjh4R2yTml2w96w0HP0YWQDWfsOB7guo2ndzKLIXYvq845FfdrYKDdWU7x+YqS8I6vYwfLIfL
	WEiywL1M6UJaoS1Qmnr72IjCYGW397pSawLJvXmri0srBO2iy1Rf94vrF9LUX7o+oILMZ4Hmi4p
	y/0bJ5ImrZPUDXBOJAZ3l7uhdCcVbTUKrXFfmlm11r7jb1YHrX9nmGbgqG4TA5uMUYUT1AiQXDW
	S+me0a1f863r4h0CB3DI4vWL6UMAlHzB4PAjDo3X8c2U/lRSQmeMUruJvGOpzQGx12hdCkGX7l0
	Zcx2Ia82QuvZ/z8Gyb3gmEHZg56TLpjumQCwv+CG/lgDyGeEEimUUomTuFkFDyJmvtRqVXF9NXB
	UOt8GrL
X-Received: by 2002:a05:600c:3112:b0:495:472c:208d with SMTP id 5b1f17b1804b1-4954a41307cmr153992175e9.38.1784568206912;
        Mon, 20 Jul 2026 10:23:26 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/33] create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
Date: Mon, 20 Jul 2026 19:22:34 +0200
Message-ID: <4acdac4caaed1179ff52c4ff3064f014d08a4664.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241435

From: Eric Meyers <eric.meyers15310@gmail.com>

The override was "task-create-image-sbom" but BitBake derives it as
"task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
SBOM in sstate, letting a stale spdx.json be restored via setscene. A
later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
"No such file or directory" on the missing timestamped SBOM. Correct the
key so the image SBOM is always regenerated, never restored from sstate.

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45302ff5cfaf91ece74d4065acf710507f27da15)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/nospdx.bbclass                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index e0f1766bb76..c516e954565 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
 }
 addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
-SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
+SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index b20e28218be..913b213a654 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
-deltask do_create_image_sbom
+deltask do_create_image_sbom_spdx

