Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CDFC10F05
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:41:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.83814.1701956465287664396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 05:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYv8oAtN;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so883377f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701956463; x=1702561263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCwFnVhPNgOGWD6hUJQPBXN4gEzQIJMLtm391gAWpqU=;
        b=YYv8oAtNc7lujzncsgtaHQPPf7vNJ5UG7o0xAKqi51jl24j1uamatH3YdDsGCdnKNX
         m2lIy/WdS3jBiNlwarouls88IvKDJMdVvQI7NAql7soHjFzfRGsEbOJKA6DH8Kdo8KhA
         +zTU3vabHZYfVQUdUrMAA+TjrbeZFyoNnGc/YUK5eGWNvJQoXumJnm29sXHwVmeQ35C4
         RP/XkuCGJE/tCzukhFNeIPW0pDPdmt84nY4+DdzxcCu9+lqCLxPpwymWfwelrDMoJtLH
         xynaiV2XltLAeo0MjHYUpi4ANIdlxWbdniz78fRuP/Pzd7hiK9vsUREih9ggeB5CBhdq
         0ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956463; x=1702561263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCwFnVhPNgOGWD6hUJQPBXN4gEzQIJMLtm391gAWpqU=;
        b=GvSvvHtwKBd55ykzAd7eGNA+OHhnP/5akqLvFs60ikZB+4AIIznATBlVLZ6A+zJGvi
         o++7PXuSWF7w0tWAubqNL2jDzXQKL5dozhIywDqceqLwGteLZ/BaUDXAQ7CIlXdElkWz
         MsCCLVi/TFvsR+Jx8Nk2rOeKSYEa1ClXDHHBilx49Qvpz6v+MPSpfZlFTc1o8BmsR5q4
         ZKfWVtitdurkKHw456dQueSg0WO6bR96bbAlAhk7Qfq/Ohw2PmCTsmIHFr2+zCmRUozE
         0Gv3mYoKIlLq0mKrM36ZgQcvOV2IoOgTwjmFtXd0cn8D3/6e4nEacHSb7R//R3rkj07L
         HkVw==
X-Gm-Message-State: AOJu0Yw7wN4NSnHepwXWwkR9sEM52dGiACEJLchMFkun7ZEq3KQ73zqa
	NP3d3dSMsc/F7u9FbXbWyHVbOwNWC6U=
X-Google-Smtp-Source: AGHT+IEYIGmOXtDe/bJYzIUXwEgRImVXYaPRoA8cFBGHmlZYEvj1eTtaI1dxmvj5Q1fT//ATsV1JHA==
X-Received: by 2002:adf:f306:0:b0:333:529b:e71 with SMTP id i6-20020adff306000000b00333529b0e71mr1503919wro.83.1701956462610;
        Thu, 07 Dec 2023 05:41:02 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d53c4000000b003333dd777a4sm1470312wrw.46.2023.12.07.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:41:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/3] cargo: Move CARGO_MANIFEST_PATH/CARGO_SRC_DIR to cargo_common
Date: Thu,  7 Dec 2023 13:39:12 +0000
Message-Id: <20231207133913.443-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231207133913.443-1-alex.kiernan@gmail.com>
References: <20231207133913.443-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 13:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191955

cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
CARGO_SRC_DIR), but their definition was in cargo.bbclass.

Match the other variables here and change to default values, rather
than weak defaults.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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
index bf298e96c745..c330c122a9d3 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?= "0"
 # Used by libstd-rs to point to the vendor dir included in rustc src
 CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
 
+# The directory of the Cargo.toml relative to the root directory, per default
+# assume there's a Cargo.toml directly in the root directory
+CARGO_SRC_DIR ?= ""
+
+# The actual path to the Cargo.toml
+CARGO_MANIFEST_PATH ?= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
+
 CARGO_RUST_TARGET_CCLD ?= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
-- 
2.39.0


