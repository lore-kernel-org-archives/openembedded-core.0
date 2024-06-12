Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C861C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 17:36:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.612.1718213767435929037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 10:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XVfVdv5N;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f7274a453bso1316375ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718213766; x=1718818566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LudhPMdWIeotDFvWN0ARvlsPoIyoFKzWz7d6fazUKBs=;
        b=XVfVdv5N4tRVMHc5FmvMAl+7dNr+Y1rFbclrh3r8dBXjnbHrM9K/98WDbaQhgLY/8c
         6059o7zsJEw0CY2KNwbogpA+8i3BXEm6MXhGtVAmZfmPJyDCg6lD7IgMty0H5taqzXHe
         EdzyPdrMFS10fYE3ueO1RgDLkK7cDUCWK45bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718213766; x=1718818566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LudhPMdWIeotDFvWN0ARvlsPoIyoFKzWz7d6fazUKBs=;
        b=fbiLk9lkBxp3MbUwXmK4yewmqzpKxXESAM3raZDxKrxwdYJs2g/jZsTnlg/Tv/g5au
         d8LxuB/8yzd/xM4p8j6fdr7+R56fGmvVata1dC4mmMtXtxXm1RKGTINW/Oukpu7zgo83
         jAKhWZpg1dorMXqj1ING6xBxDgi2dKZ4JR2a8ASXDaS+e7vssKz3gPURQj5BGs958snL
         2G/RAWX6kI5eEj2IN9NAX6hilJQMSfybR3HJIxxVAHGSnML+VUnOhHL5hGJGTu1hqYLw
         dQ3bYTNISNccy6rl0gT9TTaXyNmSQ/g/b6Km7nt0DqM72ZacBVFRAa7eufL/kBn6c5So
         2NuQ==
X-Gm-Message-State: AOJu0Yw7UQJoi/Q0SwCaq6thlmEBtcKytZBPESuTIp9qZ7KADNL2l2Bq
	99nYp6FxxTD5ax/raU+aV6mOFERwAz0nfR//JKn32kO1zlbhrxIPjwNAXzQ4LwalcGbYu9nMu0R
	YXis=
X-Google-Smtp-Source: AGHT+IEunFxE4UWO34Pc7uyZeWfC3sI8NXFCeJIzeOMhORG3f/1TX2yislQlzmmjhBmN7hnNxHM8/A==
X-Received: by 2002:a17:902:f68f:b0:1f7:2479:a514 with SMTP id d9443c01a7336-1f83b6ed44dmr27769845ad.46.1718213766102;
        Wed, 12 Jun 2024 10:36:06 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f73ffd3efesm27458525ad.176.2024.06.12.10.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:36:05 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 2/5] cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
Date: Wed, 12 Jun 2024 10:33:22 -0700
Message-ID: <20240612173321.3487735-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <850df47dfd1844e24a6013aa88c32c1b7911bb3c.1718120117.git.tim.orling@konsulko.com>
References: <850df47dfd1844e24a6013aa88c32c1b7911bb3c.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 17:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200579

From: Tim Orling <tim.orling@konsulko.com>

When we upgrade a recipe that inherits cargo-update-recipe-crates and
the upstream Cargo.toml/Cargo.lock have been changed, we need to run
the update_crates task or else the devtool upgrade (and therefore
AUH upgrade) will fail.

Add "do_update_crates" task to RECIPE_UPDATE_EXTRA_TASKS for all
recipes that inherit this class.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v3:
  * Address rburton review comment
  * Since the variable is recipe scoped (as is the class being tested),
    we do not need the :${PN} appended to RECIPE_UPDATE_EXTRA_TASKS

No Changes in v2

 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 8980137d02c..a19ce16b467 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -18,6 +18,8 @@ do_update_crates[depends] = "python3-native:do_populate_sysroot"
 do_update_crates[nostamp] = "1"
 do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${THISDIR}/${BPN}-crates.inc"
 
+RECIPE_UPDATE_EXTRA_TASKS += "do_update_crates"
+
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??= "${S}"
 
-- 
2.45.2


