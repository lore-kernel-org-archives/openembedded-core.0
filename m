Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9329C36004
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7378.1742420543420000646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H3eZYqoN;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225a28a511eso765155ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420543; x=1743025343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=H3eZYqoNeJHTyOPE29lE9MlK1xruRmlo3z6jhuc1Uesw5HOKZKfj0vgUgBb8Nrl0Vu
         s1sJxQWIOnEioI13MyhvitS/yxu/HrCFxCE4JGtVCcyXoTP/BHz/X0CdwdRSYVX43mpM
         33OXhOYoOJaCNtY3fvLQ9NvwAvfrFKSokz1sG28IwXQwVh7PVqqKosqSdrO54bXEL+rc
         VQvOjFyvsgIQcQPNtFazI15Zem9NrA4SHsQdPfDVloI/TG3D3HtZ8GY/wFvil8nxbwAV
         rYEHAPnD/di5B09cl4u0RuDOnoCS1ZHG4EFNetnQLcByIjvkNld+K+N0IW6bAql995jw
         oB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420543; x=1743025343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=NzZc5xX+Hgg6ejD+pWqgLOW/TLbl3OWqBQlAoKQ+nFx1a99a1JwJrHgqiz75tjUbWZ
         MHyZMdYY7tBASyvdEjuu46/kbjMhK2OVPm5v4nU/tCtalZLGWM3xWpZs7AWR3CORa6G+
         GwrsITDT/voxwhg/2L58iCIAdDvaQG51QgHrrhpdWau26cLF25YMSAPCHXEURJVQm1xM
         wxll0iMP4bbdXztHO7GRp2Lh+2D309yppVGxIPX/L6JFuA5XpBl3tgVp0OHY1H9f53Yb
         F4d+jZhhk+q3TyPRBYRd9OYCQmtlFCfpzFyHmB2LPjtMMYc1LzngNNCqQZw6XmdMAE5O
         t5/w==
X-Gm-Message-State: AOJu0Yz0iD3cAJn74bWSlnKkPLt7wUZz6z7saqjE5mUxOyxkLwhPUFLB
	Yh5kU+yicxQumiQNzEv1ghQXPoLDom5VG64cu39cqifxizPCOc56X+U7dsnQ
X-Gm-Gg: ASbGnctADKEIXZ3mFqubjqqkvFnakld99jvzZ3+eFE8E+tLb/DihAIQ4V3tw3qnW5iN
	TEGky4FP19HPrHIatpmAAA7gfjXpKoQ9N8Oj+gfEAikdAmfYYaav3gl1sNO0JSzNHBNYfVH87Wy
	kJEtc/s3VByDSaLfiDGaoKmxyCXqK6BTLWswmwVV/vS4KIU5aJezSKaqI1TRb4bYPdj7ANFsv1G
	x6K4nRB23qCkl6ySj+wBs8JIadMGEJ7lrvK9vYArROJZOm8Az624jORfzHHjVR+c3qn+whRVj9H
	SEwSktdWHOmltyvrUhqAy+qymCiWnFW7Y4hgQdSOjKGMi9A=
X-Google-Smtp-Source: AGHT+IH/hjOxAwTvkidveoWMo5/1J0MSntgO+3KDg+zd+OQ6JLoUfWJDMX/uKTuF/HMpFUy6+c9QdA==
X-Received: by 2002:a17:902:f08d:b0:224:a79:5fe4 with SMTP id d9443c01a7336-22649928466mr46270325ad.2.1742420542464;
        Wed, 19 Mar 2025 14:42:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 6/9] time: Fix build with musl
Date: Wed, 19 Mar 2025 14:42:09 -0700
Message-ID: <20250319214213.2505249-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213361

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-the-type-for-sighandler_t.patch  | 27 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch

diff --git a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
new file mode 100644
index 00000000000..0f8bf6e03e0
--- /dev/null
+++ b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
@@ -0,0 +1,27 @@
+From cfef684e2c2c93c4a871d6c2a7af8f4c1b7c6741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Mar 2025 09:29:58 -0700
+Subject: [PATCH] Fix the type for sighandler_t
+
+__sighandler_t is private interface in glibc so its
+better to not use it, as an aside fixes build with musl
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-03/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7ff29a4..82eb66a 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -728,7 +728,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  __sighandler_t interrupt_signal, quit_signal;
++  sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d9e2d06b32d..366a64d8e5d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -16,6 +16,7 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
            file://time-1.9-Fix-compiling-with-GCC15.patch \
+           file://0001-Fix-the-type-for-sighandler_t.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

