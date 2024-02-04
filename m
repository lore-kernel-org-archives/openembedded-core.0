Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225ACC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 21:18:31 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.48346.1707081502001921613
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 13:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kt5sNwin;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3773347a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 13:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707081501; x=1707686301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4x0gmm/vdD+SA39kymleoevUPsKFuJQbnN1SXw2NKs=;
        b=Kt5sNwinUJRf1EWGMPFxyhmXNkBO8JFcfeY4dQRyNyurMmF2Fj2460ZPyBp8Bc0I5f
         YBFlLJbRwggB6KKLqoVepA4AQjsP4QJTMyobSJJCc3qSUHH/LGiMZhep4Urzbz8i/EyM
         9nxXWTNDAzHdC3GD2NE7BTggb8tqcbEYDTkjNNZKnIl6XnSsVQmLRrbRHLh25EGYF0fK
         itXIF/JyXXlkeQgLYeJHE+EEJQTDyo1r/mVnD/I9i+vbFjoXooW34ByQQWqToJXJM9jU
         b023dBw8QSNo7JGJTiSrc9LkLy2o1NtaUnC/1aS8anyESAdOp9rsRUWO07+C7dvBwfzZ
         SwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707081501; x=1707686301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4x0gmm/vdD+SA39kymleoevUPsKFuJQbnN1SXw2NKs=;
        b=PrBJ6OpZfpVtBtAG6vl5Epdz7acjdHtiXzcBzDTvDOtX0jWH6KcZQk9OtI+Gz95Tj9
         yd9Q3bRwOOh1+apFFE6PonrOQScgDegqTyR07vj7DTsBmK6HjYLmmxhafKth2l51xHXq
         BRuorWt+gl10bZQnZfooCI2wnnOZMMUWbjH5FT7FmHCfABagUSkvU6ppZKzlmpmmD3gJ
         i9ccyax+ZNfn1S7iNEn6QXaXdPiljb3BSKRaa2CDuR6FXawXpV49toYwW+duJvHgOwDl
         HfIsn6BG+TfQPxG/DzpQgiTzIpa/k8xlN8XlnoJmmO9cHTrYqYvh1ovlUXu92hZZpGcy
         XiWQ==
X-Gm-Message-State: AOJu0YyZyQy2kCrUhhNGxuA5d7FpxU9tze0o7d8BddLm8jpJZhwQpAYl
	1uoeAjzQfdze9d4Fh9kOooI3ReQWp3JjjoBNLMze9beZFQRaR2JRDPI/uBJE0B4=
X-Google-Smtp-Source: AGHT+IF31zI7aXxjw0s8ome0WXOz5BZp45FGpK0YpTD64Ahk7zCcU7Czjx+GfGXqroo31nB6QirOIA==
X-Received: by 2002:a05:6a20:e106:b0:19c:b3ea:27b8 with SMTP id kr6-20020a056a20e10600b0019cb3ea27b8mr17367683pzb.29.1707081501037;
        Sun, 04 Feb 2024 13:18:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e39c])
        by smtp.gmail.com with ESMTPSA id g1-20020aa79f01000000b006dd810cdd91sm5181467pfr.88.2024.02.04.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 13:18:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Upgrade to 6.7
Date: Sun,  4 Feb 2024 13:18:18 -0800
Message-ID: <20240204211818.2580465-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 21:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194914

License-Update: Update copyright years [1]
Implements new syscalls from kernel 6.7+ for complete changelog see [2]

[1] https://github.com/strace/strace/commit/d74413095a3c4c063902d043cc25d422d9edac07
[2] https://github.com/strace/strace/releases/tag/v6.7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/{strace_6.6.bb => strace_6.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.6.bb => strace_6.7.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-devtools/strace/strace_6.7.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.6.bb
rename to meta/recipes-devtools/strace/strace_6.7.bb
index ed3033c8673..f365477ccd8 100644
--- a/meta/recipes-devtools/strace/strace_6.6.bb
+++ b/meta/recipes-devtools/strace/strace_6.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=63c8c3eb5c71b4362edac1397f40bdc7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2433d82e1432a76dc3eadd9002bfe304"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c"
+SRC_URI[sha256sum] = "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7"
 
 inherit autotools ptest
 
-- 
2.43.0


