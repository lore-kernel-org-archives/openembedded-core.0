Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C05BE6B243
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88336.1766436305124040928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gxSvbWHT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7697e8b01aso826217266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436303; x=1767041103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckjEeu5u2z2VqVrevttv8Hhh1a1i78trZxASSVWqb5M=;
        b=gxSvbWHTZ0IvbbYgwkOQXbCZ1PZ/znZqlxXSPRsZS+/4m/I1HtRNz+LTmk9vBvxLkB
         bWuxNDK4v0grg4ThulI0e9DKeadcL9KXSrSBZvTcgnLHh7YMJ0JUegOtKa/Ljmdj/bsA
         zTvgC21RjET4vC+at7JJ2GhtTWAnX/u8OyfTja1gvXA+kgGO0yXuReln0ebVo822kTuQ
         X3Dg34kdvRvETzJieDAeGcubfL0DsEsB+rVkcTgsFKgpYdO4RBjK9tscdRDjJoPUBNc1
         n+h7NhYehOsqKJ5SgR2pgqkahhdA1WrMnQNawZFa3OaNS/Y5uLYke2PudIjfHKxyKCNr
         x5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436303; x=1767041103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckjEeu5u2z2VqVrevttv8Hhh1a1i78trZxASSVWqb5M=;
        b=MmssGfWrs3G82JQAtqrdHFiVu5An/jpz1Ki4xRS85T88GPv3Rg+cHJFpbCbK9j+8u/
         R6gQwDqQ9bkJofpegSXKx3PJKnrA3LNmdYXHEeJC0mFz23exgrMmB4LvYyKCxkQLuzrv
         MCLVS/+xva0TP3EZ1fy/2ADV1KAIg8BtxVxVRxIAREESu9m0OYzmfz+OEQgqxDHa7d3X
         oto2dqBlT05e0RS/hCgztyWOkzDEMKBDk/RSGaeCr8jX6q/REqRJohpnabIsIeWcycLR
         fnyhAZ7BoWt+uaXLQKQaC5oJZaFJJmFXEP58JdDVuK4Ud0cnbM3mXatadaW8I8A2bxzb
         cR+A==
X-Gm-Message-State: AOJu0YzUGIl8M1QxJDbOjg6eIm+KX3AkRL11dhKia+QevLF7/FIdVUOY
	PScy/ZfIumY1q0nFyXrAPJyWazkpZ+ZVoDOR4/pA/M53xAQLCcqmyllmgGmP5g==
X-Gm-Gg: AY/fxX7ekVeitz9jK/R8OTDZR1IHB/75i/OwhVULuHgANqwtQ7PBTPSgO8GzKN8t6t3
	cBqNlzXMERYuE0uMSFoRy2AHApDBoPSbHZHGYOYxhFI+oB1Ndm9ZGNZ66XqODuP5eD29B7yQZCA
	OUnFnyU/dAkM4VGHX8Mf0hngddZsg5gV/5UtKbRHeODCvmc3Zf3yEGSCD1jlg0GvHqkoSZiyPYa
	i53I2xfHSiM179DkqSAsouhfslr/N0rpdQUsftNWQ3s1wlHu+vlIjU90TH67isSbpJQEHrBqdlk
	gN9A8p+EtV+USEZVMv1IxeomI11UFa2W16K8l5aDJ35mZzytLsKBSNjeJMX6bXR4Ik07KSyqktr
	bKMyhBYDHqFURvFmeBZ9zBmOfUY1iJ59N9Dt1kcjJnfpP2nmgsdKorTgOO4ARDbGXJrNAu0VL8H
	HXLXk51hBOUjhqZMQGSJNVmHZ10URMzFFseTcO1oOKFJXQPSU=
X-Google-Smtp-Source: AGHT+IFd6onwwq9v5xuRwzo2UuuFcxlDLtJPEqnjv1Geqshhdxdhi8HszKimGzpoQBOMGIYNzwtMLw==
X-Received: by 2002:a17:907:9622:b0:b70:af3d:e97b with SMTP id a640c23a62f3a-b8036f0f18emr1260234166b.17.1766436303296;
        Mon, 22 Dec 2025 12:45:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/15] wayland-utils: upgrade 1.2.0 -> 1.3.0
Date: Mon, 22 Dec 2025 21:44:26 +0100
Message-ID: <20251222204455.2284529-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228433

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{wayland-utils_1.2.0.bb => wayland-utils_1.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-utils_1.2.0.bb => wayland-utils_1.3.0.bb} (90%)

diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
rename to meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
index 59d414a0a6..9a1828ccb0 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI[sha256sum] = "a39d0e65617c6ae186d768c223f57060a3a435f6f9f02d03074f945313bfcf0d"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.3


