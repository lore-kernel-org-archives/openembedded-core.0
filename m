Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC51C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.47958.1680240404355254336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vs9riKDo;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id l12so21166121wrm.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHAa95euUO4edbcJ4a99nUNuSq5kc3lZHNLYZJEI318=;
        b=Vs9riKDovEmYtcXr0bZ4VAq0f/rw3rK7pYLS1zAlI3pAb2wSLutAGDZTEbBLqBBMZS
         0/yrSs1SX5ngdCXM6HoGSY1Si5nB6pfpfXHTSRNG51gFK8/E/r7c3C5nrNIKHJUQoEy6
         8ZJBAXjo8ujxNq1roNLwoWOA7xHbosCPgUYjlyEYy7wd+CvftheycqJpu6ntKz5nBreF
         4Ox1wRjsfsBnpVNXYex7hu3aCmZq98RwpLezq7x05c4GV54aGVwV0Lqz7pIhwMEUt6z+
         3EjjfmpLayPglHg/ItbuhR9Okv8oWXTBNriqCR7TDCe5U1GSRv4uS3ZBL8gCcejRmOa0
         wGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHAa95euUO4edbcJ4a99nUNuSq5kc3lZHNLYZJEI318=;
        b=LGuZeSGemvmwZouGhRuj+ibulQOeSNjWyCb8LCunTisN88KCZitcNhfePq1CmucBa2
         ne6pTJUL20LEdiaXHxisI9UT/Y75wnwq97jF5E9V+KEuH5t1Eqapqkr+Ggga/7hWb7WS
         3VYDXLEhWRB/1emRfjb+g1ZdClMcbSChab7oRpC9W80Rs8jqRZff3EtAHFTSLNx04Mpi
         JUUWkYlie8JFK0n5MMj8Ar9KjFaDOBG1cEywqnGd55OhZauNOeL0Tmoqfu81Q8E5lxOi
         TXmnpaUh4Cduy8cb76zd4SZFHZ8QCo83AMQThFr1MwVLrsg7If0sANTydIWAQceqJ0gm
         eVOg==
X-Gm-Message-State: AAQBX9cXYE879hRIcEjf+wfEzHq/mwm7Bid16qa16YHDceZviAkETdQY
	GhxmgMda8s+MV6w8cVZqGfSko0xc/q8=
X-Google-Smtp-Source: AKy350Yi+jIYTdDNcB+vBAGDiB07dgvES7R6DjhpKXhQFU7usSpBJO4ASTTmWs2kcFx7/KrNmlJAQw==
X-Received: by 2002:a05:6000:1206:b0:2d6:4733:c36f with SMTP id e6-20020a056000120600b002d64733c36fmr20582537wrx.23.1680240402698;
        Thu, 30 Mar 2023 22:26:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] rust: do not run separate build/install steps
Date: Fri, 31 Mar 2023 07:26:31 +0200
Message-Id: <20230331052636.978578-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179385

Upstream does not actually use or test it this way; if the goal
is to install items, then install target should be executed directly.

In particular, in latest rust release building stage 2 items has regressed
altogether (incorrect dependencies between rust-analyze tool and the
libs it needs) and no one noticed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.67.1.bb | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.67.1.bb b/meta/recipes-devtools/rust/rust_1.67.1.bb
index f4c6d9511db..eecb05ae026 100644
--- a/meta/recipes-devtools/rust/rust_1.67.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.67.1.bb
@@ -221,17 +221,6 @@ FILES:${PN} += "${libdir}/*.so"
 FILES:${PN}-dev = ""
 
 do_compile () {
-    rust_runx build --stage 2
-}
-
-do_compile:append:class-target () {
-    rust_runx build --stage 2 src/tools/clippy
-    rust_runx build --stage 2 src/tools/rustfmt
-}
-
-do_compile:append:class-nativesdk () {
-    rust_runx build --stage 2 src/tools/clippy
-    rust_runx build --stage 2 src/tools/rustfmt
 }
 
 ALLOW_EMPTY:${PN} = "1"
@@ -256,6 +245,8 @@ rust_do_install() {
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
+    rust_runx install clippy
+    rust_runx install rustfmt
     unset PSEUDO_UNLOAD
 
     install -d ${D}${bindir}
@@ -274,6 +265,8 @@ EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
     rust_runx install
+    rust_runx install clippy
+    rust_runx install rustfmt
     unset PSEUDO_UNLOAD
 
     install -d ${D}${bindir}
-- 
2.30.2


