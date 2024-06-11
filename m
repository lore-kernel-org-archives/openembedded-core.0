Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F1C27C7B
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:55:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.215.1718121327742547310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CkNoK6b7;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f717b3f2d8so15160535ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718121327; x=1718726127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URI2HWKDXVC7Q+delfc/VmZ9Ggf0cwsDikJ9QJGGwJc=;
        b=CkNoK6b7KF9Jc/UrJI0V9czK4ercYaMRsSVAZPULZ4fiFxRTTV/4pWK35TKUEOcLnV
         FHcQJGczpuBSaKQpV8VBluRX6Vzriac7iDvfMh4rbuJI9OnKbmnIxd/8M9JzaqjzPSWC
         ehr/VEdfV8DcmoKHroFF6Aj2BPUwu4xLEdVVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121327; x=1718726127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URI2HWKDXVC7Q+delfc/VmZ9Ggf0cwsDikJ9QJGGwJc=;
        b=JsteKjEUGNl37y2SP3Bs91ySA7BZXhkcUuZqG78PlAw/hgHKHMByUt2z39AUCxAKLi
         AInIdRvdBwh9RbEZSfV5EfFUfEWC4iwZ3dCqbDUQgT/+a7x65+3wsyDM0zO4uwxSy/ZO
         Dl9Izrdk+z6DpAZVDnbJV2VcVHhvKYmkncxzqJ7HSsRi8aOEHX+OFv2Yhvi2sakSo8zm
         rQHmj4OxfdMEZ6bbuZjI1L5ZucYoP65+VPQAPfVxDB8HQpy8XBnv1oWbs7zS0y2U+oc6
         xPee/yVdxGwGRDZqBtnn3WHSjMKZEanJK43E/iTDokkg7FTA0PHAh2ogItCXbYnHNKX2
         23SA==
X-Gm-Message-State: AOJu0Yw59QisLEwv5YZX6H6Zry9fwvB5LpJR4XeND2rz9PUkNiKQJV/T
	mfg22nbii6/LJ3i5dDfXnRZSeH06pUKODZu+zdPlf75GtMv6TPjV8HTKAGHq0tOTsQkVGGe1fSp
	aTp0=
X-Google-Smtp-Source: AGHT+IE1981uw98qmkXU5WWT6SM4qobkPHWku4OMv/lOcgcBlb0qHHw+WtfNlj7WsMroGzakZP/pWg==
X-Received: by 2002:a17:902:c94e:b0:1f7:126:5bb7 with SMTP id d9443c01a7336-1f7288fce06mr43163285ad.21.1718121326752;
        Tue, 11 Jun 2024 08:55:26 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76cf1dsm104418055ad.82.2024.06.11.08.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:55:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
Date: Tue, 11 Jun 2024 08:55:12 -0700
Message-ID: <850df47dfd1844e24a6013aa88c32c1b7911bb3c.1718120117.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718120117.git.tim.orling@konsulko.com>
References: <cover.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 15:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200540

From: Tim Orling <tim.orling@konsulko.com>

When we upgrade a recipe that inherits cargo-update-recipe-crates and
the upstream Cargo.toml/Cargo.lock have been changed, we need to run
the update_crates task or else the devtool upgrade (and therefore
AUH upgrade) will fail.

Add "do_update_crates" task to RECIPE_UPDATE_EXTRA_TASKS for all
recipes that inherit this class.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
No changes in v2

 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 8980137d02c..a405951f4b5 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -18,6 +18,8 @@ do_update_crates[depends] = "python3-native:do_populate_sysroot"
 do_update_crates[nostamp] = "1"
 do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${THISDIR}/${BPN}-crates.inc"
 
+RECIPE_UPDATE_EXTRA_TASKS:${PN} += "do_update_crates"
+
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??= "${S}"
 
-- 
2.45.2


