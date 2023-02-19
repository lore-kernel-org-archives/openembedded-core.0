Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6ABC61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3936.1676835088884641596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fBZYafCQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id c3so884117wrb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6of4Vlv1A2IEeAYTk+zaFQlCxtb72h63RrBigzY8j4=;
        b=fBZYafCQUHwWWZ0oQVDIA1KWrLtUpWUSeOi7TQZD1NElK9W3M4bwOeJwkCxQUawwSb
         xPcinI0DDVBPKXzQE8pN1+fmVLQI6qjqXq0v4xHiudWeXI97CGqwLRjPt2Jnc9F2su7+
         Du/Ph4y96anJ21ZEU/WBFlVT2PIp5qDl2ecPLssHF1+8aOjPimfmcsNj14u9cMM7VBsf
         UeXPHCOCTU/acHfD4ekGTd+wr+tE6WTdjKJz6Dn8Qx094dJnjba88mJTY6S/gfl/5IUA
         9dba9+hBMLXhnhI2rzaizMwYQQvj09B1oP+P33tqg/hCrplzZqKWnM9YqgnL9lBfWe2K
         PZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6of4Vlv1A2IEeAYTk+zaFQlCxtb72h63RrBigzY8j4=;
        b=wb/rJhIWZLOs3QHCd1vmsFw8aFOC5F9fBQ5KoP2biE44Qf7ZUE4LrzHjDpnGKbDpFA
         qC/eXDplxaew0cOthPMKKxX5m+mVZfozVxWswdZgdjWh54B5aO2W7ZQ+ovn35JqKs4ws
         IblJf8zuCAf/Xbs6piMZyB0kDkBDgqkskztuLhE82piWJ9cCoLxn28InU+sX3yfwzxXC
         +ZAcjxwpsfA34+4yZV2k20sWTjmvSfmRYI7mF999GYQlgKHjp9IiTN2xq0MbAWzkhWYS
         WkD4mj2TWvg4yRrvdphll+4DN6nqUeTlBIASE+UT0b4B1kMwBkQZSJ13F0cw4XELZM7U
         IP/A==
X-Gm-Message-State: AO0yUKU94797zo602ZTgYRT458JPs4Tagli9YPkiEtznSgZ2sxvQeh94
	EH5S92Q0MZ7gKXv20G/bloQ4sBjBUIo=
X-Google-Smtp-Source: AK7set++bNS/aACc6ZxTlf9sOlxCg1c7oYDL+EvBC+afnml4tXmOK9TNSNwEw2jaMm/L5038rPzG8Q==
X-Received: by 2002:adf:e7c1:0:b0:2c5:9e2e:28c1 with SMTP id e1-20020adfe7c1000000b002c59e2e28c1mr215476wrn.8.1676835087460;
        Sun, 19 Feb 2023 11:31:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/39] wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
Date: Sun, 19 Feb 2023 20:30:56 +0100
Message-Id: <20230219193101.338397-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177378

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
index 357e79d7e1..ce60154f1e 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
+SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
 
 inherit bin_package allarch
 
-- 
2.30.2


