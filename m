Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A10AC10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:00:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.30746.1702036837833936417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3N6RHaO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33338c47134so1816521f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702036835; x=1702641635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnHcQI+h8e7pT+nOa9/r+G0iCDKIFqiNHwrXdqJd9DI=;
        b=h3N6RHaOSDuwzqISj61/7dexeBpFYuJAXxRbg6M46+T1pk+NRUcBj5RJ5+9lm7gVRu
         fTOdvnzkz87ANlBzbrSDhDKTAFtvldSumkbapVtel5nPymWeSEhUX2UAlozxB43P0ikt
         JpWEAa+FhCmjePnFUXxcPa5RiM9TJJPhoAe765hmmb19gVIklNlJxWMonzK6BzqzT5lE
         IaGN4v5ry9RLr6Ugyd3/LeyG7uv95DJ1RfniLQSktHDmeaSiHiD5SA+8x5jm5K7s2iXb
         EDY2Itm5NdULAg1IJiGF0qYj4fJSGz4UUcOuRfSK3CqHH4ZXoXjiyYjp2L2gv2Gvob+U
         /stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702036835; x=1702641635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnHcQI+h8e7pT+nOa9/r+G0iCDKIFqiNHwrXdqJd9DI=;
        b=FyREvuvcFP1thuiw8FpWVIYW1CpqBR41UfZZnNAVYcV0D7FvDOitv1wi2HP0x1bdYd
         kk4xC5BnmRKet/GY8cVx8/robbcWWh56lqchlyu5vNDX3jwBU389+NJtyCYuDWhI7rxM
         SQR7UuT/FGkj8BjlCcSPTvQYnt4GB1R/HJXDWBHS+wPBYgvsnTMe1JWZVMofMhohMFc3
         QxcDQ/XVZLFwk5fYWUsB1qa/zWO5Yo437xnxmDFcnhu/+uDPwISCEWz8hJh72ACQzaEY
         +Pes7T4UJqpcXqe2F0Qjc/J5g30XIxhFUkltGqK96wqsrvhIlYeVinBFkaeBGLZAK42Z
         3Aaw==
X-Gm-Message-State: AOJu0YxjdGfZdBvW3oHMY2slclObni3vXq8NqdHYLJcB7JFNmb7zfu6u
	usyFzdrQaeuDLGstX9P3SUW/+wx160I=
X-Google-Smtp-Source: AGHT+IFGMvqbF1X/IBgOClhEQV+qFlWScK43FGMfGGbPnpM7eL9u5BvsWheBPEAkwmTDEtyyu9N2Iw==
X-Received: by 2002:a05:600c:4753:b0:40b:5e1c:5c21 with SMTP id w19-20020a05600c475300b0040b5e1c5c21mr2409798wmo.54.1702036835191;
        Fri, 08 Dec 2023 04:00:35 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm2636353wmb.38.2023.12.08.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:00:34 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 4/4] cargo: Add CARGO_LOCK_PATH for path to Cargo.lock
Date: Fri,  8 Dec 2023 12:00:28 +0000
Message-Id: <20231208120028.2953-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231208120028.2953-1-alex.kiernan@gmail.com>
References: <20231208120028.2953-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192050

When building a workspace enabled project, the Cargo.lock is found at
the root of the project, not alongside the Cargo.toml. Expose
CARGO_LOCK_PATH so it can be explicitly configured.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Change CARGO_LOCK_PATH to a weak-default

 meta/classes-recipe/cargo_common.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 48cdd69bca13..0fb443edbdde 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -40,6 +40,9 @@ CARGO_SRC_DIR ??= ""
 # The actual path to the Cargo.toml
 CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
+# Path to Cargo.lock
+CARGO_LOCK_PATH ??= "${@ os.path.join(os.path.dirname(d.getVar('CARGO_MANIFEST_PATH', True)), 'Cargo.lock')}"
+
 CARGO_RUST_TARGET_CCLD ??= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
@@ -168,8 +171,7 @@ python cargo_common_do_patch_paths() {
     # here is better than letting cargo tell (in case the file is missing)
     # "Cargo.lock should be modified but --frozen was given"
 
-    manifest_path = d.getVar("CARGO_MANIFEST_PATH", True)
-    lockfile = os.path.join(os.path.dirname(manifest_path), "Cargo.lock")
+    lockfile = d.getVar("CARGO_LOCK_PATH", True)
     if not os.path.exists(lockfile):
         bb.fatal(f"{lockfile} file doesn't exist")
 
-- 
2.39.0


