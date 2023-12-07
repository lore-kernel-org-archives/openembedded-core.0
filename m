Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B36C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:41:06 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.83813.1701956464518655080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 05:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5Uc3tgj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33330a5617fso961146f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701956462; x=1702561262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZC2eKoUBtAnlycMMWQPdh+90/0JVJDvO9k3iMsMsbk=;
        b=D5Uc3tgj5rL+UZpNvJZXLjhUVknjbS4iGGBwM2Y8vN0hWKT1ck3YVllxGCogcWHmWv
         ATJuDjFwDaRNY7wkPkrRzVOrKeTdHK5V7vB2mEAomdzdpIcg5qfsqNN8G8eUKdbyOYZY
         MGKV7YTY58cVmIc8NkFbAWmH2b9r2SPVuxPzIoXgy+YZTwu07JzxeDB4u9snQoQs/b0y
         us0b1UhF0h18ESTqAQ4uV3NfL369nOHMJ3w8Q09wsU8LkhuOl52jW7qK9Txmid0hMu1h
         38pI2BusPb9l/AriXyU+VavPa86e34Ao2BUf6y590gJ5Pb6qOV9XqVeXjI9zmYdvXkss
         9NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956462; x=1702561262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZC2eKoUBtAnlycMMWQPdh+90/0JVJDvO9k3iMsMsbk=;
        b=PXImFExRhxhNpfSgNfK4phX9EO8pnIf0yDe1TfiHwcHW7xDvKqbJozZSZ0nEk9ji0P
         IVjs1bBOXSEASDUIRk4k0bCIs41Kc72s9hnifSctqljQAI9lRRKPv3ro/TdD76cRCLRn
         Xfw7SylX0hjTG/CL+C9Z9nzFaZaSJ4yHZeCPmhU2e3H+hjpgxEBQE8MR7uSQG9qeALcQ
         9oqinVhj5Ey/Iq+F/7QA8NzWJ3os+njvhk564RCQT8jWZXUApzBZ3Uei+7zCe3nymvJW
         sXC9iFFKMPPol5RYWX66q+dBsx8SiTuKZ9Cx4mYHs9IU5S844xxL2m2/veGLrSrpQxt6
         CcSQ==
X-Gm-Message-State: AOJu0Yx/doGvEPM/IvzdsIzMXERI2mqgtockWma4siAaskMjlI9nX+xu
	DczGJFLWX53CCItEpZQSLznG1WiUvH8=
X-Google-Smtp-Source: AGHT+IEh3lePWUDmcWPdixi1z3XGHpDAJeHM1VE1ZyKvXGyBmQCKAMOneeMtTL2oB3FWPXsQ0HzeqQ==
X-Received: by 2002:a05:6000:1012:b0:333:40ae:d71f with SMTP id a18-20020a056000101200b0033340aed71fmr1499672wrx.123.1701956462076;
        Thu, 07 Dec 2023 05:41:02 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d53c4000000b003333dd777a4sm1470312wrw.46.2023.12.07.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:41:01 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/3] cargo: Rename MANIFEST_PATH -> CARGO_MANIFEST_PATH
Date: Thu,  7 Dec 2023 13:39:11 +0000
Message-Id: <20231207133913.443-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191954

This variable is a piece of recipe configurable interface, scope it with
the class name to make that clear.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes-recipe/cargo.bbclass        | 4 ++--
 meta/classes-recipe/cargo_common.bbclass | 2 +-
 meta/classes-recipe/ptest-cargo.bbclass  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 8c0b92df8d33..96a74e2ef1ec 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -35,7 +35,7 @@ export RUST_BACKTRACE = "1"
 CARGO_SRC_DIR ??= ""
 
 # The actual path to the Cargo.toml
-MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
+CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
@@ -44,7 +44,7 @@ BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
 # and will require an up to date Cargo.lock file.
 # This force the package being built to already ship a Cargo.lock, in the end
 # this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index b732a1bd9538..bf298e96c745 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -161,7 +161,7 @@ python cargo_common_do_patch_paths() {
     # here is better than letting cargo tell (in case the file is missing)
     # "Cargo.lock should be modified but --frozen was given"
 
-    manifest_path = d.getVar("MANIFEST_PATH", True)
+    manifest_path = d.getVar("CARGO_MANIFEST_PATH", True)
     lockfile = os.path.join(os.path.dirname(manifest_path), "Cargo.lock")
     if not os.path.exists(lockfile):
         bb.fatal(f"{lockfile} file doesn't exist")
diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index ff57be852508..c46df362bfee 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -15,7 +15,7 @@ python do_compile_ptest_cargo() {
     cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO", True))
     cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS", True)
     rust_flags = d.getVar("RUSTFLAGS", True)
-    manifest_path = d.getVar("MANIFEST_PATH", True)
+    manifest_path = d.getVar("CARGO_MANIFEST_PATH", True)
     project_manifest_path = os.path.normpath(manifest_path)
     manifest_dir = os.path.dirname(manifest_path)
 
-- 
2.39.0


