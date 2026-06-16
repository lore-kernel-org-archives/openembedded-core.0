Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9CCCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5787.1781637406215486941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qt8s56yv;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b7866869so50286005e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637404; x=1782242204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70HPCPIoMIdZ3t3MIse27JWvXjD4oEu/xj5AThHrtDs=;
        b=Qt8s56yvM5hbsFpU+2x1XPtXrMrFdtRDTCRzD6sTuSQa/uiED3JXaaTx6mHHwvle6R
         CTLaHYOUtLAD4f9T7vRrOvBjOB1NgbrFs4aslsV+ZrJqGBPZQHDz+OvHk3N9cl0n6stE
         Zlx+edS5B2XP9l9SD3XZyRvScfoqBNDYnMqBRPacA2LimFbWkCATUOyUtdpgo0pH4Unm
         NB7qnBI0jfXs3Vw71+47/PoNuLxFDxi43WdZ/ybKvnzyK7zFUELT+gMv163QXqWCyx6I
         mTP67wGfZqJCtwJcYycjnjnLSxxAKdOJXAciUU4sEzGWcMU6D5zNz7xG1lRl96QkEi/T
         t6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637404; x=1782242204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70HPCPIoMIdZ3t3MIse27JWvXjD4oEu/xj5AThHrtDs=;
        b=GhjZGk9t5O2g47M4tKWIzfAPyxXC0fLs5RogwU1i/VVVF5m+74sD9dboS8SXHCiQOr
         4kr4U21BpV0ilpo5JRvxuwuLeziU0sXYHJWjLGWG4JJ1/WQtBNLE+KpSnhwaEs0MDRRD
         Q6h8DvfOtV60siSBKKWcZl9MjRWg6EsNNmlmtPRYaNpL9g6jnObNzW/E5m1wlw6JZqVM
         6dP5UhFl/6Yy4kcNv0nlKOp8XisbFzVbkE38mmR+W9SDHtwxbPnVUtXg2rtA6Cz1uYJS
         ERgSYC59xasRy7OkQoy6zj8LBHTfcIZaK7V6picCJEk/So/MoiAvdit/Tl7mi2VasV6j
         NkHw==
X-Gm-Message-State: AOJu0Yzoo03NJMh42usxiwpPGx8mU9knFs5Waj9hnQyuVJ0e+N455Ybf
	Gk3Geth500tiWPUMdMQAsjQxlh9mmhFkzJYBC200dqQn+TK2ZZRp65bnoZqbTZqe
X-Gm-Gg: Acq92OFxnzkeWmwfdAfB70gY3IF24LJbV8x1g4VJe3KDETD7CZrLqf25EQ6SryIxw9u
	aOIHklGKbEoXuDix5/3d169v2BPjmY/O50MPB5gKY45A7XChlXVaY8wMXsXldbRwTVaCrotNfy8
	0V79d4NFlmf0nNpNkxum1kJUxNwmKAci5Kw8SAZkSIsCZGjOCvRTk5CsYptEff/qdT3q9k4mZZL
	MPxUgDvMAzHIqndmDurn1BZUVHjAWSMpzLpSCHx/GQMHbmbMyF9MfOhV9N7ak0btXdYCss9fk3/
	mRUgeRWaTJkFopisWTu5LibjGmYpw7Xu4BZW2OwARPSEJOa4/bPRRqxsyQ3Ck/WfZWb6ZXVVtQx
	kL2sP3pQJouqgUVoYgbQfDmWxNCER3e/pWUSqzw7hp71dkf/USI7x0rXovRQ2Lf7gCeea4trsic
	/g6ZlpRZg9+WM5CJzl7SdPIDU6aKWtTAUP8ZrwfR0wJWzxVqzppOC+RRX+6rM=
X-Received: by 2002:a05:600c:5487:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-492333ded0fmr12954245e9.34.1781637404428;
        Tue, 16 Jun 2026 12:16:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/30] libxkbcommon: upgrade 1.13.1 -> 1.13.2
Date: Tue, 16 Jun 2026 21:16:08 +0200
Message-ID: <20260616191628.2014553-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238937

From: Alexander Kanavin <alex@linutronix.de>

Backport a patch to address no-x11 failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-tools-Fix-info-on-macOS.patch        | 40 +++++++++++++++++++
 ...ommon_1.13.1.bb => libxkbcommon_1.13.2.bb} |  6 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon/0001-tools-Fix-info-on-macOS.patch
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.13.1.bb => libxkbcommon_1.13.2.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon/0001-tools-Fix-info-on-macOS.patch b/meta/recipes-graphics/xorg-lib/libxkbcommon/0001-tools-Fix-info-on-macOS.patch
new file mode 100644
index 0000000000..f63a5c7364
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon/0001-tools-Fix-info-on-macOS.patch
@@ -0,0 +1,40 @@
+From c34f1edf1a22b584a8d554117a9b64985ddc04b0 Mon Sep 17 00:00:00 2001
+From: Pierre Le Marre <dev@wismill.eu>
+Date: Thu, 12 Mar 2026 13:01:16 +0100
+Subject: [PATCH] tools: Fix info on macOS
+
+Alex: this also fixes failures on no-x11 builds.
+
+Upstream-Status: Backport [https://github.com/xkbcommon/libxkbcommon/commit/75b7da3f8698b3482ba6b11f3835561a3efb6a29]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tools/info.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/tools/info.c b/tools/info.c
+index faf0cf75..4c4f0aaa 100644
+--- a/tools/info.c
++++ b/tools/info.c
+@@ -86,8 +86,20 @@ main(int argc, char **argv)
+         { "XKB_CONFIG_ROOT", DFLT_XKB_CONFIG_ROOT },
+         { "XKB_CONFIG_LEGACY_ROOT", DFLT_XKB_LEGACY_ROOT },
+         { "XKB_CONFIG_EXTRA_PATH", DFLT_XKB_CONFIG_EXTRA_PATH },
+-        { "XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH", DFLT_XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH },
+-        { "XKB_CONFIG_VERSIONED_EXTENSIONS_PATH", DFLT_XKB_CONFIG_VERSIONED_EXTENSIONS_PATH },
++        { "XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH",
++#ifdef DFLT_XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH
++          DFLT_XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH
++#else
++          ""
++#endif
++        },
++        { "XKB_CONFIG_VERSIONED_EXTENSIONS_PATH",
++#ifdef DFLT_XKB_CONFIG_UNVERSIONED_EXTENSIONS_PATH
++          DFLT_XKB_CONFIG_VERSIONED_EXTENSIONS_PATH
++#else
++          ""
++#endif
++        },
+         { "XKB_DEFAULT_RULES", DEFAULT_XKB_RULES },
+         { "XKB_DEFAULT_MODEL", DEFAULT_XKB_MODEL },
+         { "XKB_DEFAULT_LAYOUT", DEFAULT_XKB_LAYOUT },
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
index 42e6458090..ac02ad87c8 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
@@ -7,9 +7,11 @@ LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-${PV}"
+SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-${PV} \
+           file://0001-tools-Fix-info-on-macOS.patch \
+           "
 
-SRCREV = "6f76d19db72b5d450e927b41e1e96cbe3252aba8"
+SRCREV = "d1442aaa6b635551182e83c3b55037f4c118c962"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.47.3


