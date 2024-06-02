Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5D2C27C52
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 21:01:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.68293.1717362075642463154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 14:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=meRWFF4O;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f61f775738so26059375ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717362074; x=1717966874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7JauQSKL4JMkJcKFUnuwxI+BBMgH1COxkw1kT8D/xo=;
        b=meRWFF4OPHmJjNxMEbiaJvX8eQ1w9KIvv0I/tQuC873NcUIq/FMs+3Pg26Nvfu4fDF
         Jy0oHBfmI3phk0qmwd7OdimnIe+lq0DRVCJywkTPX20n/yLHFSQERcVVwD7pOucIA9eK
         64Q57gs5kfs1eN4NAdocl+IbIEUjRKBj3R/+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717362074; x=1717966874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7JauQSKL4JMkJcKFUnuwxI+BBMgH1COxkw1kT8D/xo=;
        b=WL3f1wy+qeZEjAv38ntgD6xdGbhbGWFOJdDdBhNep0/0mVnCkNDCz8xN7QDvIuXagG
         q+Jp1iZeam09e+uGi6uLWphY7lvvXVHRQmP2ZIj9AnKQ7A1SX286cRxEmLMMzzTEmCGg
         JCMn/hi+nhzXK2DYDneSAO80jNRSbNeC/N2yD7Ru2wsP0wXEQHj9EE5L26KeCEA3QUjI
         iOec5ohD22KmK7FRmhqaiILQjz46tzUi+JyzbYLIaZQirwbAP8x6pdlwQTEvWHMhWVLb
         UMzXk5a9H48KNV3bmq4UAJ1hTzNdNcxBkt2v7sD1qqbXkSEmJxvjTiaph0xFEs1qdqnU
         MqbQ==
X-Gm-Message-State: AOJu0YwuNwoJ/aheboXK0sAuWuv6H10mAZuG7qYL6Mq/eSY52UY8S40P
	ucfvt0jWiHkqvUQpsO/ivriRHOQ1rdu0+ACK9txPKnkJn9wXuUb+9C5IcQFFUH9lvA+WKAfARnM
	dy94=
X-Google-Smtp-Source: AGHT+IG1JMwr6NTLxC7NkjgUld8Z6qikTDnVdd7dT9v3kmJWtPylbnuWta+71ch11zk5Csa74VW2JQ==
X-Received: by 2002:a17:902:e805:b0:1f6:6f45:81f0 with SMTP id d9443c01a7336-1f66f4583e9mr26705565ad.57.1717362073861;
        Sun, 02 Jun 2024 14:01:13 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3fc2:5771:b380:483a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f673a9ef86sm10657635ad.56.2024.06.02.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:01:13 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Subject: [RFC PATCH 2/5] cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
Date: Sun,  2 Jun 2024 14:00:39 -0700
Message-ID: <be301a62ae9530898d96c6b73bd23161c1d17e16.1717361301.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1717361301.git.tim.orling@konsulko.com>
References: <cover.1717361301.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200218

From: Tim Orling <tim.orling@konsulko.com>

When we upgrade a recipe that inherits cargo-update-recipe-crates and
the upstream Cargo.toml/Cargo.lock have been changed, we need to run
the update_crates task or else the devtool upgrade (and therefore
AUH upgrade) will fail.

Add "do_update_crates" task to RECIPE_UPDATE_EXTRA_TASKS for all
recipes that inherit this class.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
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


