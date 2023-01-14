Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6ACC3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 15:49:33 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.118670.1673711370222439990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 07:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pWeyVEkd;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso29894648pjt.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 07:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekljcH8YolXhB+lmnyD75Na32Xqr4e91MAB+n4oXsrE=;
        b=pWeyVEkdKFgV6brFla1Rglpn+yH6UqMAdsX8+W7VzIVfz08AIxuAl77lp9yqN7IjAi
         0YO16TVwwKPP7oylAPZbJVx8CeegOfgqd7m0pWNgpslGFMAXhVjlyBM6KfFZMToVz8rP
         khmDbq6f4EnARKenja0WwoIBk6nAQ8ZAfYcCN2W0QFsDFufdUYR7fJ8y1LmQi37mrmXj
         grLviVR/UtTQrjLMIG0MIVyEqmx0iBTQeLqJ+W2Pb1wVUhD+ZuArHr/W3mZCnjZ9gEg6
         82QHVFl1h97tSl8BZsgHb2MkcSY8ZpQfJEPYN7HHjNtWZ2FQonxSJg+nXEjoIiRcKGXN
         ++QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekljcH8YolXhB+lmnyD75Na32Xqr4e91MAB+n4oXsrE=;
        b=e4aCHBe2U0SxVVGtw6YYjPpnPHpTp9Y/KRgj/MOvILVeYxttbtnu2u7IK7KhCB9C6v
         FFMCCprzOnqtAt+eidNJ+P8dePlIqmIogYNU4QxBVYcy29wKHEMPTBsgrt5Jy6ZPlRiE
         hVaSiYQPHacUDpxg1ecGIAiASJZCCJVHzoe57waIHxZFTnROpWNPFjVmJnT74jaekPNv
         x8u9p4l0p0PoL2uG0Aiha98t7lTD/HOkQT5kFoM2JT4U/fyxxIUg6mhk9ggORLTpeo6N
         HZ0cda4dZSYNINaivm9/6fXOHaXV87FOV66UwX8HPaUWQ+I3qWOJWbn0xg9jBROnyIlp
         AVmQ==
X-Gm-Message-State: AFqh2kp6Z9AA+/SDBgoSKqA1XqxR9ITpLL4KgXK2FP9gZM5OYv+h5Bo6
	pIwC3HyyKfCdZXmBpq0MWnygBvFqf1VC4w==
X-Google-Smtp-Source: AMrXdXtduBaHypRQ1S4ELprmwmPujmouCeUIf1HaP+hr7KJiPhQED3qfGW0W8eRoMWHlzmsQGQ99ZQ==
X-Received: by 2002:a17:90a:3804:b0:229:2470:165e with SMTP id w4-20020a17090a380400b002292470165emr6579459pjb.40.1673711369376;
        Sat, 14 Jan 2023 07:49:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id b7-20020a63eb47000000b00460ea630c1bsm13129200pgk.46.2023.01.14.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 07:49:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] unfs3: Fix implicit function declarations of fix_dir_times()
Date: Sat, 14 Jan 2023 07:49:20 -0800
Message-Id: <20230114154921.3757493-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114154921.3757493-1-raj.khem@gmail.com>
References: <20230114154921.3757493-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 15:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175853

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unfs3/0001-locate.c-Include-attr.h.patch  | 28 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h.patch b/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h.patch
new file mode 100644
index 0000000000..076e08fadc
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-locate.c-Include-attr.h.patch
@@ -0,0 +1,28 @@
+From 63e0785bb379a8f2c41f34f5cd938ca38555e605 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Jan 2023 23:41:01 -0800
+Subject: [PATCH] locate.c: Include attr.h
+
+Its needed for fix_dir_times() API declarations
+
+Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/32]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ locate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/locate.c b/locate.c
+index 6bbe71f..84e0fe5 100644
+--- a/locate.c
++++ b/locate.c
+@@ -27,6 +27,7 @@
+ #include "nfs.h"
+ #include "fh.h"
+ #include "daemon.h"
++#include "attr.h"
+ 
+ /*
+  * these are the brute-force file searching routines that are used
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index a4701bdb57..be3870b8a4 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch \
            file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch \
+           file://0001-locate.c-Include-attr.h.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


