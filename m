Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB244C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 03:57:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.90692.1709524651662602001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 19:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqT4aCBM;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6277f72d8so111522b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 19:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709524651; x=1710129451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frjuyUWiOkk2A8NPzU9dFqzK0xG8ZmqJ+SKNUvcmHhI=;
        b=OqT4aCBMLXQNH30H5IsnUQ3IhKq0rH+p+gRhy0Hf2vPVetvSg4GHTokH9XJu29c47i
         9ekshtr5WQ7xlWj4vxzpcyVWRFUIh89jU/CHk9PHOoIXIl/yRcHJUrU5cFur2gtj/lyM
         A+Hnc+GzWCZdLzaYVwk0yUNeP4vuYM4AUZ0tIt9Ji85dDadl6Qh1Q96WniibrZCs2Wiz
         MvElA5WrZgVuLyrvfJJ0SgpPYx6zUcfsaNGFiOP7rgCRueT32Bu4cgJO4uE6F97/7hcK
         20SpDTvYWSXaRzAEzgWS0Gv51BLgdbzpBZb4fI05W24HMB+BjUCg8o9YvMvgBVsxCc+e
         3wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709524651; x=1710129451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frjuyUWiOkk2A8NPzU9dFqzK0xG8ZmqJ+SKNUvcmHhI=;
        b=uYliBS3MG8wc9tFj0Rt5ddQMna7TvQFi4mQCKD6G6ZKPxUWTduAeMEQFYUGhBLCSLT
         kqn6MPd9tNIF5sIlwOVZfKi54taQbrENxxNasujVFlGWIaKtUx1lQ+2AXjGAeRY8FhJG
         mUfXC8t1N8RV1O128x1LG3RlaOF0cpn7+nQzjT/5h35xY3ydQ0TIx/CkXNUtDtGooDAy
         uP9F4pi4LoLqo33JB1/ZBcQFBP8Mr4Evxd/TwA0TEeO443y73SiVK83n880Xx1xoH/wi
         60H03B0BzrgGNph/oKwl4HtebqavAZo2+ioQQoAfNUMURn2pSF4/4gafaciNmChSLu+n
         3PqA==
X-Gm-Message-State: AOJu0YzRlhz/gfcaVb/WW2hHmn8fyFuuHejn3YZYcaLasG5qFTppxepH
	GDYDg1rcEa4kde9hQUzGEjzAnKO0OQaKfrDJM2CyVpTGW6Cn+CpIUnutVO2P
X-Google-Smtp-Source: AGHT+IFAIR42lcy1vlElI6mWiy1A/pNFE5wL4wcLVyIKAji+B5zB8cyD12hxckwVbQLmKwAi2+THYA==
X-Received: by 2002:a05:6a00:c85:b0:6e4:e4cf:8944 with SMTP id a5-20020a056a000c8500b006e4e4cf8944mr8936741pfv.12.1709524650611;
        Sun, 03 Mar 2024 19:57:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7])
        by smtp.gmail.com with ESMTPSA id q5-20020a056a00084500b006e535914f9bsm6445383pfk.97.2024.03.03.19.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 19:57:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Upgrade 14.1 -> 14.2
Date: Sun,  3 Mar 2024 19:57:27 -0800
Message-ID: <20240304035727.600047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 03:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196584

BugFix release

This is a minor corrective release over GDB 14.1, fixing the following issues:

PR symtab/31112 (DLL export forwarding is broken)
PR c++/31128 (gdb crashes when trying to print a global variable stub without a running inferior)
PR tdep/31254 ([gdb/tdep, arm] FAIL: gdb.threads/staticthreads.exp: up 10)
PR gdb/31256 (Crash with basic 'list .')
PR python/31366 (Frame.static_link() segfaults)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gdb-cross-canadian_14.1.bb => gdb-cross-canadian_14.2.bb}  | 0
 .../gdb/{gdb-cross_14.1.bb => gdb-cross_14.2.bb}                | 0
 meta/recipes-devtools/gdb/gdb.inc                               | 2 +-
 meta/recipes-devtools/gdb/{gdb_14.1.bb => gdb_14.2.bb}          | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_14.1.bb => gdb-cross-canadian_14.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_14.1.bb => gdb-cross_14.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_14.1.bb => gdb_14.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_14.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_14.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_14.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_14.1.bb b/meta/recipes-devtools/gdb/gdb-cross_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_14.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_14.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index eb480f3c658..81ac441462a 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,4 +14,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
-SRC_URI[sha256sum] = "d66df51276143451fcbff464cc8723d68f1e9df45a6a2d5635a54e71643edb80"
+SRC_URI[sha256sum] = "2d4dd8061d8ded12b6c63f55e45344881e8226105f4d2a9b234040efa5ce7772"
diff --git a/meta/recipes-devtools/gdb/gdb_14.1.bb b/meta/recipes-devtools/gdb/gdb_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_14.1.bb
rename to meta/recipes-devtools/gdb/gdb_14.2.bb
-- 
2.44.0


