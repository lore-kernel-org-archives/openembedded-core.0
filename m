Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FD4CE79CB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.35326.1695207488203105516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSAl7C28;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c7912416bso6263883f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207486; x=1695812286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cmx+gzqeyRnH2qIDgW0UQlU11PSGx0Kn/CBhxX9sEKA=;
        b=fSAl7C28Y8Ro/1yEZcXulwHd7Wgh3/PsVdXpSC7f6/dY/rVAyzRlDOo0Su+0DxdEXI
         auStAAt9dsyY0ryVFU/9sAr+jRo3CVAd2nzXZe44gF/Mlfm6mszMAjBwjUqfZwf/2WJl
         PpK6ke2so5i7dE/cJ9THq1CY9Nv4wbld0mGwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207486; x=1695812286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cmx+gzqeyRnH2qIDgW0UQlU11PSGx0Kn/CBhxX9sEKA=;
        b=HDxcdPuu7LSYSxLWOAJmqj7ptvJDSV31BqpbyqVUkAa+eyNwXo1YH+R2t9POK/kNXi
         TRDGcJaXV0yU4RcB9rkvlO0tDu0Jq2l1XwlR+PO+s4FFVuosNCt37w49XyECM/Sd8aoT
         tT9MONBXZm1wUeMLUTJ+F6xUU6y2v3JS5OuKpVw+milVCv7mnZjAihpRiDWWyezAUxrP
         Y7yKmmPBHPABSmMarZAovyjbU+jzxjG2A1Vt53muWu0RtUd92e203j19yHTZ1uu2QTtr
         BY/D1Ii5lq1Jy3zwVczwpZtf4b4WWGkq2nGiTpHZZJsSVQ67RbEGVQjwTzpgJjniTaeO
         Tufw==
X-Gm-Message-State: AOJu0Yw1e8N/Q9D43CdB9THECYzI9fM06LjiIspfFS2/3nQXZ5N8gKcn
	Pb7qK4lD5X8aEHwdxrzgTuO8sdaDTB+UmuNJ+AI=
X-Google-Smtp-Source: AGHT+IH4+pHExUlGuroMgcJGdGdcKMkHySIR4Mnjrxup0iZ5Qjo+t0F1yG0jr6InQkOCJkj3q1Y/Dg==
X-Received: by 2002:adf:cd0f:0:b0:314:1416:3be3 with SMTP id w15-20020adfcd0f000000b0031414163be3mr1674883wrm.70.1695207486373;
        Wed, 20 Sep 2023 03:58:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6 v2] multilib: fix SSTATE_ARCHS for multilib usage
Date: Wed, 20 Sep 2023 11:58:01 +0100
Message-Id: <20230920105802.1008778-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187921

When building multilibs, we need to inject the multilib sstate pkgarch
into SSTATE_ARCHS so the list forms a complete search path. Add a tweak
to do this.

PACKAGE_ARCH defaults to TUNE_PKGARCH so this is equivalent and just
guards against recipes changing the value which may have other unwanted
side effects.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 3 ++-
 meta/classes-recipe/image.bbclass  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

v2 - rework patch as we need multilib arches in 'normal' builds

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 67070440a6c..2676f18e0a2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -83,6 +83,7 @@ SSTATE_HASHEQUIV_FILEMAP ?= " \
 
 BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
+SSTATE_ARCHS_TUNEPKG ??= "${TUNE_PKGARCH}"
 SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
@@ -90,7 +91,7 @@ SSTATE_ARCHS = " \
     ${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX} \
     allarch \
-    ${PACKAGE_ARCH} \
+    ${SSTATE_ARCHS_TUNEPKG} \
     ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE_ARCH}"
 SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 4f00162e789..7231fad940d 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -96,6 +96,7 @@ USE_DEPMOD ?= "1"
 PID = "${@os.getpid()}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+SSTATE_ARCHS_TUNEPKG = "${@all_multilib_tune_values(d, 'TUNE_PKGARCH')}"
 
 LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND:libc-musl = ""
-- 
2.39.2


