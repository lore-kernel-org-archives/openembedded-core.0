Return-Path: <rmxpzlb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8054CD4F4F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 07:48:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18761.1763020075891715377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 23:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSMnTDuR;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: rmxpzlb@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ec8a6418so694735ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763020075; x=1763624875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmGY6mYYk9oTxi9sKe/YxmBkFrDSOr7GmbPqBaoZMjw=;
        b=VSMnTDuRwbfpmJAE7NQv5cy6eMIE03DiVAPR5RBbqPslY7s4t9zcgoKysVRuD7U52r
         SWK9NOG6GuIDevK1RpymVXGT+/meomPtcutZF/IAMymQkZGJubm0TyADLum/dz1cEm2n
         V8n/odE4gH/LVmznl5MeAZUyPx8mFrm1bYHOm3Kguv1U5/EZMaOGXcE/k8uVfUPuW7rz
         K9f4dgaxljzlxfudEGRtcDlxjXyMhqAYuL77haW0MAmIXPWwVnw2LBvu/DfprR4PhULo
         aKQv7hYiY0EKR044o4poDy+9kO4i2H+oqzvSb+76SYkiKh5z6/pz/OhF4aRtdQQSKu4z
         luWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763020075; x=1763624875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmGY6mYYk9oTxi9sKe/YxmBkFrDSOr7GmbPqBaoZMjw=;
        b=NM95zKlIonY6nXaf8Ao9YE3egAv+O7cuyY828j/jcKC4ont/M3k0y6ijz1g63zz63F
         8qpqlcNLDjgCYe169cqwlMrDLP05WpdBt3q1Ss7A9zQsVLpgtWSmVsqeQRtRcwvOQyCH
         f73262JgzRjKfRfzMpExYUbgvTtIIVumbGd/9q40RVm0rJ5nM0ZDLIUeH07mC1s5RGWE
         EokcE/FA7MLox4g7xPB9GJ8Z+J5qzyYg+RVZxT8Lif1o6CsCj6bK5PisUg8ExyZQTCQ1
         V/8AwQFkNrT4XXtWHhH0lN1TX01cAHz8/hy6GBBX7S2YkVhoMtUeuWvWpljjtdOnzcxz
         2YVA==
X-Gm-Message-State: AOJu0Yzky1YUIt3umjzyTmwpLY0ym48x7iv+R6GJMhBjB+664rojgacR
	ReqRkaAVe+o1uTQdTbtVZZvU0VHWgQBR87kJqNjdy33nLmN4WU7rn3AihN/2YGISMQwF7g==
X-Gm-Gg: ASbGncuyK3CiriIAC5KQNXBF5T3zgqD0TpxSsN1OOOpndj4uPSBtFk09mmcWDG3NGF3
	Rzkz2jsTWhkEIq9U7zovWQrD3HVUIwPIZYaJOZ3nZoq0LibwOGXRtiqjt8aPbY5DJjfHKqg29aM
	WW0w2e51RJ5X9+gDunLx3KS5gg33PBKUOfSqHEX6blhU5lANcoq0TO7xVKtvZizndpAGMCIcaW8
	a2vQIvuKYTjRVXGlu0s4cfP4ELI4EzyE87iqvClqjItcC3KqBFdDTAD/jIBZDoYCCyFiWCx9Ba+
	qz7jiyjGGQi2sWSwESVi/5L1OVBGbmLSS3CI1XhUqLPxOh8lCRTaFqqZ5FjNzUSXOqgBJG6cjuB
	/IlgXD440qYMCLnuRP3rJBzbdBRFYMgusFSlFAh0thua/pzMj1Ce1neC1pBEz2p9u5Ts4QPzSaW
	tAbeOMWLqYJaFzkmRcbatB
X-Google-Smtp-Source: AGHT+IEOzSTDgivYEXqJnLzoSDLPs0g298kOKDH9otYVEeE8plND58xEB0T9wkwOPLaftDAGdaJWFA==
X-Received: by 2002:a17:902:e5c7:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-2984ed7729amr41415535ad.4.1763020074724;
        Wed, 12 Nov 2025 23:47:54 -0800 (PST)
Received: from localhost.localdomain ([183.14.134.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf172sm15513755ad.83.2025.11.12.23.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 23:47:54 -0800 (PST)
From: Frank Zhang <rmxpzlb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frank Zhang <rmxpzlb@gmail.com>
Subject: [PATCH] armv8a: Set -mbranch-protection more specifically
Date: Thu, 13 Nov 2025 15:47:47 +0800
Message-ID: <20251113074747.6735-1-rmxpzlb@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226227

GCC-15 enable gcs in standard branch protection, which is support by armv9.
Openssl don't support this feature in assemble code, caused ld warning.
Moeover, other recipes will fail when link with openssl.
This patch set armv8a branch protection based on extension version.

Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 21 +++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 832d0000ac..938dee4798 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -41,4 +41,23 @@ TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}
 # Emit branch protection (PAC/BTI) instructions.  On hardware that doesn't
 # support these they're meaningless NOP instructions, so there's very little
 # reason not to.
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mbranch-protection=standard', '', d)}"
+def arm64_get_branch_protection(d):
+    import re
+    bp = "standard"
+    tunes = d.getVar('AVAILTUNES')
+    if "armv8a" in tunes.split():
+        bp = "none"
+        subver = 0
+        for tune in tunes.split():
+            arch = re.match('armv8-[1-9]a', tune)
+            if arch:
+                subver = int(tune[6:7])
+                break
+
+        if subver >= 5:
+            bp = "bti+pac-ret"
+        elif subver >= 3:
+            bp = "pac-ret"
+    return bp
+
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mbranch-protection=%s' % (arm64_get_branch_protection(d)), '', d)}"

