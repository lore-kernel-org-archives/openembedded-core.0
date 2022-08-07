Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7A3C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.10840.1659845751907496253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZEU9Zd/;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so4861278pjm.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dAmxbp6uYl4IPpCK1qez5dmIV18UaLODJD5tfx7WN/0=;
        b=FZEU9Zd/QBrXezyXVyI1EB3LQwCo4UL/hBHzWSKINomzHqaIdbaG8kcBugDD+orB2l
         2/oDNMOSAv/ZfpJIbIPWOY1kN8JDvul2NQ9+7E37d5chrVKVmie9Fj3TUVcLV8GAbjxe
         iinCzzJA7pYVp8vdIpxLkZrIUzUeZB2BjBe4QWjL/wAhkE29KVg2y0Xd3NFGSNi3CMnh
         tZgFSAJC0M41MnqnLJ8OafssnoXmLuOJhG5nk7SKOysOV84vGXDSCKrBjmx5kyk38gJp
         K/c44nmO/SwPzsdEIccuSVCuv490MQR1ueUbVxLDKDAI/Lpb/pEGJSLtYVg5tbfo4a4M
         2C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dAmxbp6uYl4IPpCK1qez5dmIV18UaLODJD5tfx7WN/0=;
        b=HBV9rrxznyXk3apxxn2Z8hc7TTAvDJvwb7QEkry5jBv2xP9QEtM194sNjEedKWxoQ6
         0Nu00EUs6g8JrO5fyfBTPs7rl1QHnddzuwrHazooi2dHb+w3HDcY+oghlJamI7xJn5IJ
         8Nf45Cok3jNZchw96gQnnG3eVYWV+mO7q4HlGpXBGJL1uNXjB+6ulak+wXNBwrIEP+HA
         7PyHEDzyVKD9lwzrY2EEkOWfoUwhnBOuTWHFWsxaf43ZQxU7xFd7pSQ6ZkC+1/yM0W9d
         urWqg4F95XXxB/bZrtXbpSlcXlfVV2a0dg55uCY4TZ67uK0tKXKSHzZ/eWI1CbeFRNN1
         nywQ==
X-Gm-Message-State: ACgBeo0b0fQiYDu6J9zF5HEMDaQD7yaW1hk2QQWVeRd96HvFpGbHlali
	YPIfvpqPeqjevG0PbgZeNAfZqXb4LL4=
X-Google-Smtp-Source: 
 AA6agR6HH764+Q2wRXIfFuYMUiuVz6dM8M3npVb8F26mMOVNTmqB6yFdFPa0KSl4HBCZ+eq+gXyGwA==
X-Received: by 2002:a17:90a:fe07:b0:1f4:203d:d192 with SMTP id
 ck7-20020a17090afe0700b001f4203dd192mr15097020pjb.145.1659845750834;
        Sat, 06 Aug 2022 21:15:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/7] ltp: Fix sys/mount.h conflicts needed for glibc 2.36+
 compile
Date: Sat,  6 Aug 2022 21:15:40 -0700
Message-Id: <20220807041541.2665647-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168987

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-duplicate-include-of-sys-mount.h.patch | 30 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220527.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch
new file mode 100644
index 00000000000..fc7fea02f9b
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-duplicate-include-of-sys-mount.h.patch
@@ -0,0 +1,30 @@
+From 463f3f85e326253feb35015a022ab6d1e03fe1d5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 20:50:27 -0700
+Subject: [PATCH] Remove duplicate include of <sys/mount.h>
+
+<sys/mount.h> is already included by lapi/mount.h.
+
+This fixes build with glibc 2.36+
+
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/953]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/statx/statx09.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/statx/statx09.c b/testcases/kernel/syscalls/statx/statx09.c
+index aea329e086..34c5f41f87 100644
+--- a/testcases/kernel/syscalls/statx/statx09.c
++++ b/testcases/kernel/syscalls/statx/statx09.c
+@@ -18,7 +18,6 @@
+  */
+ 
+ #define _GNU_SOURCE
+-#include <sys/mount.h>
+ #include <stdlib.h>
+ #include "tst_test.h"
+ #include "lapi/fs.h"
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index b0f4ea6021e..6d812958cdd 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-netstress-Restore-runtime-to-5m.patch \
            file://0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch \
            file://0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch \
+           file://0001-Remove-duplicate-include-of-sys-mount.h.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.1


