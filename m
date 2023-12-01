Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7652C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.442.1701455675229108121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BOZxyy9x;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4079ed65582so23320005e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455673; x=1702060473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oG7i8Ft/XusmWn9rDNphoZQnuEWUVT9Ltxn6eZjC3Yw=;
        b=BOZxyy9xrivww/TzVP8kDjLJE+ee34GDgbvGzjrK33+VzRkC90hPbI6NNCuvBqapP+
         lK3gvJfpzD7a0u4PJ9OvX/+gaXQ17mXRMnhMAQ7a379nF/SjN3lWxHakgZv30kIl39mP
         +YVcYZeC40BeTI0dm+xto08lC1+DMtMc2lN8hG35/vsufFjoQQbui2QUrXRmxdv2Oaxq
         HLmhRkuPJ+puq8RA7o+JYgT30jHDbfMwEEOlnfI67/FzJcoK/7SWCuy1d6+pwEm98TW7
         nQDqeOVHwWqOaG2iN6SgieLsQdeA4QceBqCQFurk4h6c/9JhrAWnuP2aG6yR+EjSIZim
         rSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455673; x=1702060473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oG7i8Ft/XusmWn9rDNphoZQnuEWUVT9Ltxn6eZjC3Yw=;
        b=S5Mtxfs2U/VX3A3qgPpAMvTBGyqN2/Od+h7CMs7zlRIFj4YwPJjM/AcFkLBydR7fUO
         jie9rBFYiUgBDumPuwUN99JDHHL4+kQZJWMsx+gB7ZrAeWZz9+8i3d407ikKDfu+sjhu
         XfOfFPLr1aHuq4s3sojGg+qryEj4Vr9wzKi/IpTLuEAidGbxGvSk1Cs7Q6NbBj/o6Aes
         cIOoFxcsobo3PzjtlTFA6WBVv7tsvnWiO4tKBXZwz3T5LYvKMF20H9Gusm/80CU3EwxL
         rNhj1c9vD3RSYbyhKHTsuIA9XCS0c8ZhcHBRUdbB+BILN4lQAnedGsqJHzdoSteyLgd2
         Z9mA==
X-Gm-Message-State: AOJu0Yz52k90Ywqf5EVIiQ2de8oP7MefNJ0ABGTE2ycehQ4dar98FvMs
	qt1dZKOObw9xW4mXh5cmj9uyH68/crY=
X-Google-Smtp-Source: AGHT+IGmpnQF/manRMn7d7sgJQ/ZDljYPt8Hl++jYRIaR+Y9FITnys/8zPPXevk9NQSeUOPwKjPfew==
X-Received: by 2002:a5d:404e:0:b0:333:265e:8bb9 with SMTP id w14-20020a5d404e000000b00333265e8bb9mr1046116wrp.30.1701455672796;
        Fri, 01 Dec 2023 10:34:32 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:2050:5414:adff:4362])
        by smtp.gmail.com with ESMTPSA id dl17-20020a0560000b9100b003316debbde4sm4857229wrb.48.2023.12.01.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Drop targets and hosts override magic
Date: Fri,  1 Dec 2023 18:34:19 +0000
Message-Id: <20231201183418.4188-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191683

`targets` and `hosts` could be overridden prior to 0a01b5ab973e
("rust-cross-canadian: Simplify and fix"), that commit deleted this
usage, remove the remnant of it from here.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust_1.70.0.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 6a28dc926ed2..3d176e54c15c 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -154,13 +154,9 @@ python do_configure() {
 
     config.set("build", "vendor", e(True))
 
-    if not "targets" in locals():
-        targets = [d.getVar("RUST_TARGET_SYS")]
-    config.set("build", "target", e(targets))
+    config.set("build", "target", e([d.getVar("RUST_TARGET_SYS")]))
 
-    if not "hosts" in locals():
-        hosts = [d.getVar("RUST_HOST_SYS")]
-    config.set("build", "host", e(hosts))
+    config.set("build", "host", e([d.getVar("RUST_HOST_SYS")]))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
     # nothing about when trying to build some stage0 tools (like fabricate)
-- 
2.39.0


