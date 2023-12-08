Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228D3C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:00:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.30491.1702036835108760987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcT/caHn;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c0a11a914so20982605e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702036832; x=1702641632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTSnYI+LYPztWeeBuscpFF6rhaFKXWoKHHm8ZebThgA=;
        b=HcT/caHnS1CDqpamLYZynjpKlbjOWE8pqUsCSJ3UMQXsxX6UsZU3rFEMtK2cOegAMw
         VnHC3wtgD41r+vtX8uQcF5wbNwOBNGFAWZkb/hwq2M+qqfEeLSaBaJo+BP1egCmKavIy
         xzrg1+dlNuP/G7swLnriJ074g0NT9CB+6G2Q6dWxxSgT8Vx/cMFAKA8NWTz6BvLYt4Ml
         R3u6k/943jwHcYQRtA6hlLXQ3y7F0+DvkaziRSz1k+74jAPImqzccgToDdPlDv4bwgWN
         0X/lsX8eYUc+hXpqqo/O8dyq+M8miNfEZ+BA0wsHD2WN8wjQV8M+Pj6qFE66lkviGJY4
         Z5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702036832; x=1702641632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTSnYI+LYPztWeeBuscpFF6rhaFKXWoKHHm8ZebThgA=;
        b=cZI8uykfoHEaJifNdjZjMIJhDKdQhMHMZBGlUjoLzuIPNhVD4uc8KmsqSY6tu2ewoq
         uJdEDK0rOQUJS0tz8+LYcZ2DXu67EMhxoLLjOdHg1DkmR/L+4T3gcXDQuKiepi+Y2jRh
         si42M8BX6rE8yYoqOJYDlLMDOHCDSlb06O3CUmKFiB5uPRA6FaRmasXOBEAKyOZ0p6fA
         5pdGfh+39YqE+BqGV5O/+446NZSEN6ZPRE8diQRK6+kkSTQ6f0IIQDGtwpVZ4wzRgMXT
         zRQxrAJrMafSdY+sbtSiE89TSwtGAGzeInvi9g1cKzOAwcTFl4AlZDVe91vsQUfp+Xhf
         5CvQ==
X-Gm-Message-State: AOJu0Yzxq6tOrQ/0Qb6NGB8/3tI0Cnj6YOOoTpGemBkk9zPU5Q+4ejm3
	IwhcNfQ3rCeLYZaVCwXDkhaKYH8eM7k=
X-Google-Smtp-Source: AGHT+IF+0bGiFdssiEc/jwdwoFpFbkhqpe5PoBkRRJ08otoNd0czasAMskVcl4Q7SdX40YPkONCYJQ==
X-Received: by 2002:a05:600c:290b:b0:40b:5e59:b7b6 with SMTP id i11-20020a05600c290b00b0040b5e59b7b6mr2368308wmd.147.1702036832231;
        Fri, 08 Dec 2023 04:00:32 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm2636353wmb.38.2023.12.08.04.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:00:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/4] cargo: Move CARGO_MANIFEST_PATH/CARGO_SRC_DIR to cargo_common
Date: Fri,  8 Dec 2023 12:00:26 +0000
Message-Id: <20231208120028.2953-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231208120028.2953-1-alex.kiernan@gmail.com>
References: <20231208120028.2953-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192048

cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
CARGO_SRC_DIR), but their definition was in cargo.bbclass.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Drop change from default to weak-defaults

 meta/classes-recipe/cargo.bbclass        | 7 -------
 meta/classes-recipe/cargo_common.bbclass | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 96a74e2ef1ec..0829a58dd90f 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -30,13 +30,6 @@ B = "${WORKDIR}/build"
 # where the issue occured
 export RUST_BACKTRACE = "1"
 
-# The directory of the Cargo.toml relative to the root directory, per default
-# assume there's a Cargo.toml directly in the root directory
-CARGO_SRC_DIR ??= ""
-
-# The actual path to the Cargo.toml
-CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
-
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
 # --frozen flag will prevent network access (which is required since only
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index bf298e96c745..509aa195c5fa 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?= "0"
 # Used by libstd-rs to point to the vendor dir included in rustc src
 CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
 
+# The directory of the Cargo.toml relative to the root directory, per default
+# assume there's a Cargo.toml directly in the root directory
+CARGO_SRC_DIR ??= ""
+
+# The actual path to the Cargo.toml
+CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
+
 CARGO_RUST_TARGET_CCLD ?= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
-- 
2.39.0


