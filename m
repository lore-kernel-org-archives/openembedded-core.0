Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A367C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 22:55:49 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.61097.1674687341510271363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 14:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BDjjoaz4;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674687342;
  x=1706223342;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R+J9Bbz+KTkW84aai88iju/kD9iAM2we+HbNI0ghHW4=;
  b=BDjjoaz4csJHGE4XrYMj5FN7DGbP1Tl1T+ZFdTsyAn5n8tzmVkfgmfGP
   I0um0f2t1KC8DU/dWTFE+9rKNoPR0O1px4b5ft15uGbNieRczwZPWyKpU
   jaRtm9q0iWgBvEQcDVTPwjzg60Wid19wIWZ7ozaaIryXvp+kAc2o3j+T/
   h89ggbInpdZu938atTa7Q6G5JMP/VqAwU+WqXeetUk4lhA1qBCp1lz0uP
   G6YM2jBHUx2VO11tw1thrq7N/uPkvYR8XujOcf8H9NNGIGqbCO2+/Z4nt
   6H+yz2VsVzJHfQ0WXuOLqhBSAT8k1hK6ajx+Ctz8vDxxIOoJ0PsckhC8b
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cargo-update-recipe-crates.bbclass: Mark the update_crates task as nostamp
Date: Wed, 25 Jan 2023 23:55:32 +0100
Message-ID: <20230125225532.1944291-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 22:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176381

If having devtool modified a recipe and then updated the crate versions,
e.g., by doing a git bisect, running the update_crates task needs to
always update the .inc file even if the bitbake metadata has not
changed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 3a12ba247d..697460d215 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -15,6 +15,7 @@
 
 addtask do_update_crates after do_patch
 do_update_crates[depends] = "python3-native:do_populate_sysroot"
+do_update_crates[nostamp] = "1"
 
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??= "${S}"

