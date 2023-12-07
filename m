Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E26C46CA3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:41:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.83815.1701956466057460762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 05:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fnp1DGyZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33340c50af9so943030f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701956464; x=1702561264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bluCtzrG6MPVdmkKsmp5U75Q81u66Uhs7WGpJldlmc=;
        b=Fnp1DGyZbnlHNXMBC0+aeBLRxhp9QJB8bTznolgFff/tUycFoknaCyVLVPHRYoYNH1
         i9MApUF7C3kOlmiofIzFV39SqQznH4Nz9q5IhdZgp1tzMdPq51pU10cG/jSVy0otsbe9
         IL649Kz1KaLJaVUTUmNCY2nHKCGx0kNTliEIVM+7jPf/0v1hyJOMyp1eHT52i7Gup8zK
         Z7f8ejcneY4M5dqlD51tvqAtkMFMHpzYWOoJ/DlE4LzwEUmULkcKBcVNj5BAEpbn1oQf
         mVxQLokVZe5ExMK8krcnvZlKKx//KzTUKXETIjL7ThfD1rO9033tF1ED/qIiNzdtSZkn
         BazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956464; x=1702561264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bluCtzrG6MPVdmkKsmp5U75Q81u66Uhs7WGpJldlmc=;
        b=XJwyqoCM7WKpoQJ1YJQQqP2c8Q9Q3pIAjH07KObnaCuyRGA+kqYjFhTd0m0I2Wc2lb
         uWTsGOs4qOkA/SeXpi5qlgkdhQcD4xqxUQ71r4x/0GSCQ0gilJ0K9CQVjfzw+zvPhNKB
         2JodxuqAfliX0raNJ6dfjZs4ENGdNiXJB/f6QXap0KP+8cHvSQlgs/D/RYBEAFuD6HOh
         X+4s+pI+SJVRjSJdpO3sdnBcg37JIbfueeuRN+LLiIMvDR0uOkMs6Yv2IbSrWYXZeKwp
         puo6QltTAUaBwhS9tH6u1gEYarFudsVkK90Bv+5Se6lI5nuHVaFsQ+dC9SeWpHjF9yR+
         WoYA==
X-Gm-Message-State: AOJu0YwFq/8i3n4H/8Mf4bcp/n63ZUJdJ4uVWb9cOU5wWswJDer29a3s
	B8Z0GlJ+6pjEeXh9o1wBv9DHLkRG/NM=
X-Google-Smtp-Source: AGHT+IH/Hhec2OeAoIcWQ8SY7WAGqhYBzTRWN0S3pkt5pTEn+CnLRjN7XmYOtrM2bv1Rsk+s4+GOSA==
X-Received: by 2002:a5d:5689:0:b0:333:1adc:a381 with SMTP id f9-20020a5d5689000000b003331adca381mr938383wrv.31.1701956464282;
        Thu, 07 Dec 2023 05:41:04 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d53c4000000b003333dd777a4sm1470312wrw.46.2023.12.07.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:41:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/3] cargo: Add CARGO_LOCK_PATH for path to Cargo.lock
Date: Thu,  7 Dec 2023 13:39:13 +0000
Message-Id: <20231207133913.443-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231207133913.443-1-alex.kiernan@gmail.com>
References: <20231207133913.443-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191956

When building a workspace enabled project, the Cargo.lock is found at
the root of the project, not alongside the Cargo.toml. Expose
CARGO_LOCK_PATH so it can be explicitly configured.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes-recipe/cargo_common.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c330c122a9d3..a236628664c8 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -40,6 +40,9 @@ CARGO_SRC_DIR ?= ""
 # The actual path to the Cargo.toml
 CARGO_MANIFEST_PATH ?= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
+# Path to Cargo.lock
+CARGO_LOCK_PATH ?= "${@ os.path.join(os.path.dirname(d.getVar('CARGO_MANIFEST_PATH', True)), 'Cargo.lock')}"
+
 CARGO_RUST_TARGET_CCLD ?= "${RUST_TARGET_CCLD}"
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


