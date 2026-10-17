Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE45CCF2C4
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 23:27:56 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6108.1792279667611475803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 16:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GZeeUA8x;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1563805eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792279667; x=1792884467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqUY1082KCk/SxQC94GdLgFwcOxo+Ek/gO1NbtUDku8=;
        b=GZeeUA8xg4JwKyt15IrecTAOnI0vctocYeUe2ML/8CYUq77I6b1PYHr+mNndvtv0Rn
         OGqCtc2+VimjTaK52GKU+JuoXolyV7fUQlfGP7IsTkR0D+OuJXASUjG9mPiwfCgyFnaa
         SLQn2Gi6RJjPGLXxUky/nqH/oUH5W0bkc72GLJCJpHK88uHuYU0BdnBLSs3y9/AZEEuf
         CpwFkovR8vHVPupuzia8eK+Qq19zHpEKEIqkmthhmcg/LYTvBqdv2UTaj2oadUK51obc
         yOIvqo8g5A5tlMV1oVcRXpPoVZi5rnrwm4uKfVLBv5fIhWMYAqH5VwWguFrttdCtWQu1
         okyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792279667; x=1792884467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqUY1082KCk/SxQC94GdLgFwcOxo+Ek/gO1NbtUDku8=;
        b=cupLIxvzZ7+nbCYGrAORHciuhxGYlHp24DrGBherBU9ZtjO8ZZGUPNt1d8n7yUxtN0
         jBxXgr488iXNNNLQmUbNnbkuynDJXt0Krt8t38sWEtmSXNhmGyC5kaLBGqKM0cEqRdlq
         f781JEvh+mlX1i1wR0+0rITqMkSkEH4N1NwzieztLzx2wW+Cwebk5QDaXhWq2fqhe/ES
         EjJ+UuG7QiU4+Np4Rl1+51pon3mzRgmFkV7ldoeoNzHESBBU8K+6y+APgKx/OBP9em/t
         ccq1xJOzjsY+s6sIL8nM8KgqW2Q7xUZ0xZHkudb6shzW95w1tTFwH7uIUvPnBVP6Vfty
         99PA==
X-Gm-Message-State: AFq9FYLLYLNAw/kbxRwxpyd0lZp+1ZCH932XcyNlHab41O1nx4lw4a4m
	rXRSw3MzGLbxxipRJbhGfFy/Ax9jnM5UDLc9uZrp3EqefdKqhAVegRJ9QNnyzsQDMmc=
X-Gm-Gg: AYBFou0V5NbIFpitqy1HR85pCCFXEZKMmDQrMXBqlUWsFTPgexGpLcCKdX/tMnmPAh4
	GJb7Ook/w+SAM4Xbso1MIieCRap30BeDrFsiftbjoI+UDD9u1winC6y8PqX5laiaWvcwvYkUwVh
	ebzPE9Nf22XUqymYPyxO1byLBY/vHWSqv3dHBV89zdO0GVMkpMFqX4Vxa9XLvAIhBbnAMVZc+hS
	E8yMordgVHekRsIRf4FV4JCualu7u9p0QKxmsyiVXbQI4D22s8TEzEWobmaxPHSbIsilrq603EA
	mK5AcuzWQNKmZJc5cSnPPoo2mweWj+lMQEVd3zaQdvaPCmG2OAmVmIqlaLIXVLaumQMRpRieLGH
	h+nKSOIJGLfr4MacQS25PKngG1PibBDRbWi+L4sr92+XR7QNvsO7gRpEpA0Oc8+z8YcxUFXOTov
	Rd8f8p2HHzSDwD1MKnrk4xRLD1ll3VnB7LFp/IVKkNYEAm29zMCMu4YhebGkWrnvJLc9oAQTP3/
	YNPY0js7npIsB5RtFdqafQtfLs3q4Hf7rP9lXMeZG2Gao+FBz6aNe0OwSWb4J77i6NH7NFzFjHW
	OP0qurYxHlP4sKZZJRG8MLXseAStbhJAghMsTyXkt4Aqa/ajwj5apdwLuVO3kkW38MXT1hKawSk
	DP5Z+UK8bfi0fW/AKMWCLtGinpb3+TJcJs65edvlQRMHYzC+Amj1oi+Q+Im79rvtQ7e7iGvnRFJ
	gD8quyCPUEGq+EbyTI5QtSN6lKcYbhvGDv5vZWsB9IlGA3tscLl4vuCLET
X-Received: by 2002:a05:7301:1522:b0:35b:244b:ca8c with SMTP id 5a478bee46e88-361a23515eemr5686731eec.33.1792279666686;
        Sat, 17 Oct 2026 16:27:46 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm19587693eec.4.2026.10.17.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:27:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libfyaml: Link with libatomic on targets lacking 64-bit atomics
Date: Sat, 17 Oct 2026 16:27:43 -0700
Message-ID: <20261017232743.1871823-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 23:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248101

libfyaml uses 64-bit atomic operations, which need libatomic on 32-bit
targets such as riscv32, otherwise linking fails with

  error: undefined reference: __atomic_load_8
  error: undefined reference: __atomic_compare_exchange_8

Match on the relevant TUNE_FEATURES (32 for riscv32, armv5, o32 for
mips and m32 for ppc/x86) to add -latomic.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/libfyaml/libfyaml_0.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 4c3fe42891..012ff7052d 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -13,5 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libfyaml-${PV}.tar.gz \
 SRC_URI[sha256sum] = "a59cc3331e2eb903ec36933ad52a45888041cac31e44f553a00511131242c483"

 inherit autotools pkgconfig github-releases
+# Specify linking with -latomic on architectures missing 64bit atomics.
+LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', '32 armv5 o32 m32', '-latomic', '', d)}"

 BBCLASSEXTEND = "native"

