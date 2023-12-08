Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236D5C46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:00:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.30490.1702036834346537450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWtZTSkU;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso26820925e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702036832; x=1702641632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE2RITKaOOxLrBTDHUU4w/PDS87Fvsf1Gn0Ov1FmkIo=;
        b=eWtZTSkU1VW1Y/moKkVvb7s2s9usF1F5DyY3SOTTY3Ouht11uduABAEkYOFiDhBrjC
         zK8mZZj3G42VkX5NBbHdUgtbTD66zAH7HLN3InF4QAWKIin4lojKRajFZSQD0rFdWfH3
         iw2/3OsWQuH2lEbSn19B18jrxFq4/SGu4ziZjr8hV7PwyRtoRTG8AjKlICyaJDwHTbai
         /EtEqmCMVVNyFMHGED4Mvau0Rf0kbKO9eTlKeIwfD5pPZ82Zb3XWWk6P4YvOxx1ICMkN
         Xv3ipzL35GyMJz/kiMLuct9P9IZ5f509QCwBGn2wm52YyXUhyqCpwRqDgdXFFbwiVZGs
         LAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702036832; x=1702641632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE2RITKaOOxLrBTDHUU4w/PDS87Fvsf1Gn0Ov1FmkIo=;
        b=EUC+Rx+TBl0SipgQQ6yoPywOeCUIm0/pTT1nGoPJ4oMAomj1+UWE3q5LjJcT6wkSA3
         JIc5jJMn5a/TVX1XneQxNj7Ftswhhpy7RWLoR+kt3FGM8yYUz14nFlbWnoZJ4t7td4/l
         IbacxxgY3lNsI6CnDBs3izhZPZdy5tnVnVfMUQmU/VmERqENfXhCaAfZx8Y7wR3sac17
         TAHPKxMv2Vvey6ZTWnZkKVbNjutR1OMlCQaTa2JyQjd2aZV2UPFY9uL/l97evI0cLCqL
         Ox/5EPiAkfmqK9nDmQ7/bAB3JdNWFSYg4ptYWx8FFxHznqxSOcDl4/kCM6grrv58azBZ
         U0HQ==
X-Gm-Message-State: AOJu0Yx6/dA/YNfnx3Ea786wfsDZl/IXYRxiERSrwekTPaFfM1W4CQuZ
	aRhcyRlrwtn/ZRc8e8Bv++B+sn7P8Oo=
X-Google-Smtp-Source: AGHT+IHcbdOJUzK/fNsRpyhOrp8paY94Vhh5TGElHkBbkYlnvxIPAesKn7RuLXL39mHMGGLhHsB65w==
X-Received: by 2002:a05:600c:32a9:b0:40b:5e59:ccac with SMTP id t41-20020a05600c32a900b0040b5e59ccacmr2602067wmp.141.1702036831610;
        Fri, 08 Dec 2023 04:00:31 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm2636353wmb.38.2023.12.08.04.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:00:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/4] cargo: Rename MANIFEST_PATH -> CARGO_MANIFEST_PATH
Date: Fri,  8 Dec 2023 12:00:25 +0000
Message-Id: <20231208120028.2953-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192047

This variable is a piece of recipe configurable interface, scope it with
the class name to make that clear.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

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


