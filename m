Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928BBCD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38119.1781857991158043938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZV61J+fA;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so6889205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857989; x=1782462789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4/1+wI12Uy7vJmmYbttQCbU8Arkg/4X3A77B6ejeXA=;
        b=ZV61J+fAr1HFpoSt8K5qyQFp+9ZN2fcXgXbFpRgnxTKYUBckq+gF1lQXzQVnJteJfL
         IiXMcJZ9rWpkC+KJU4r6K/A8WNMKPZ0Cyz0fCaP1SMUIms+0DumqP2NnEogNzqSEaJwV
         0DH9HbRMxloyvox/mmvrfxWI4wXuY/9eQeMXeldybEPcmZS121yv8f76Swog2PcKZypJ
         ERCVrFpZf5Jqn/+S1kopzPhZYhMOVZWguDJBkR2YIUyiJYVnyknWBHHrdp2nlj0x+Hal
         0aOUyYxUAenpEFo//LQS+PAa09yEOPunaD5y7gn9dKPG64bpUA0yWEZti8QVeZrWa99i
         0u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857989; x=1782462789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4/1+wI12Uy7vJmmYbttQCbU8Arkg/4X3A77B6ejeXA=;
        b=EhlULn5tZq98IZzHyy0E7wYmbKsrGH8YB0n2ftwY9LJYa9SSSEj/XCkGdnVlp/OV+T
         BbTsgZZx8egZWzRcOM232hmPRoR6AyQv98XqTBAhLI/q3DL7uislPlEHj65oXcd7K9Mz
         2LMFw1UGSmRvKwST7I8RQouNNeaWXvXfhoOJxV//rUR0Nxs9ho/KK9LguoESREeHM1UN
         EgFs1izR3HvxqQ89fHhRewerCzXrbV6gATR9afIOa8V5Ww7j3LTCpzMdM1JdHF8NFxWb
         kSPBnWcBNH6yxAK1Luf/YDgooltwrHGD9RsvwcYQlxYjqooD4zwFyVqlBVZ7VXnVkGM+
         hP+g==
X-Gm-Message-State: AOJu0YxR9/yff5dvYwgPgNUlQp+GjsPp7jRmwlFLNQ6xrjgdOI/WtbQ/
	MntshcbR+fRVMQsrriLMIuie3o2/1FW8DP4ppaR8qXvYsBsfvJEZAHgEcNy9/pPC
X-Gm-Gg: AfdE7cleTAyph2AijWvVzmEbSLGOrWPgrxFS4f2tOl79oZR4KHb9KntF6gcBna3hVsn
	UVoi4is4piLQWZFxMA+G2plGzOPQ1qmbTLf4P01x3+843ZRpEABJ6l+hfrbX3DJc40cLJw4ZRg+
	BVYEQk+Ch1izABxy6YnEwIRER/FApA+hscyrEe+XthRt22CFyp6EPNhaZdFD+ePISdBNUhUADVh
	CaHySgIOip8Du8M5UnTVYtgPYJRMXa5k9nOWGvjjTPWOTDfgCVkxzlm5jUqXqLLQs2UvPWGeOAp
	NUNgKxNZcganwCaXjB31dl9fZq4+0W0gaGPF1YcYNwodSe8GnlaeyAvRWKpsu1VrLT45fmqZdmM
	9v2+H9AbdJAieoF5VWJIXXmS0Ael4kEtuSMO7AY9Sdf/4sIth684M0SYkWTup8WtmCegQh37sKj
	CYmzEcDkW4qSglMEmcBcFaHUZOnze/D3hQx1rh19woXlT8WSYt
X-Received: by 2002:a05:600c:154b:b0:492:328f:8623 with SMTP id 5b1f17b1804b1-49242592630mr23284685e9.31.1781857989101;
        Fri, 19 Jun 2026 01:33:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/15] gn: upgrade to latest revision
Date: Fri, 19 Jun 2026 10:32:43 +0200
Message-ID: <20260619083305.3505156-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239136

From: Alexander Kanavin <alex@linutronix.de>

Remove patch as issue is fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 -------------------
 meta/recipes-devtools/gn/gn_git.bb            |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
deleted file mode 100644
index e933c17d8a..0000000000
--- a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
-From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-Date: Mon, 11 May 2026 02:43:10 -0700
-Subject: [PATCH] gn: fix build with GCC 16 on musl
-
-Add missing <cstdint> include in src/gn/pool.h for int64_t.
-
-Fixes:
-| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type
-
-Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
----
- src/gn/pool.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/gn/pool.h b/src/gn/pool.h
-index e03113608..247cb6425 100644
---- a/src/gn/pool.h
-+++ b/src/gn/pool.h
-@@ -6,6 +6,7 @@
- #define TOOLS_GN_POOL_H_
- 
- #include <string>
-+#include <cstdint>
- 
- #include "gn/item.h"
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 6047ab5e2b..c5ba7761b4 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,9 +7,8 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
-           file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
 "
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "bac66cfc3254aabcd8640c8ebbeb6d62a198d454"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.3


