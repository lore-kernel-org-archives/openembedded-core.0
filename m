Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFADACE7AB9
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:04:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.67973.1695665057179231650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBphaJwz;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so4666542b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665056; x=1696269856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2dWoTPdA3BBauOUCvxoBOxIEDjKvjvr6QPMZATvE+g=;
        b=fBphaJwzq9S1DmDr7tokH9lMUAUSWwQrjgytv5ytd8tj5YiOy5pd87a5fez96KKCDp
         XU3GV/CRfTevJEmGrXLvQUK+zOtE0AygTbr8uVui0i7zk0jkMaQzP4Bw/wsAuZg1BrCb
         +8WN00omZYS2/06+pQKrgsB1nU+CwDcr5dggvHJwc7PUQiBdhruhnnxflG3JNSL+hWva
         pMvXC4agyCim4/c9kIDDxWfWM+aWTQB3045Uc1OoQzWwTfyCYl/5nb/t0TC4NmoYX70k
         W3OQJ+fzvTpDyxMGbk7RTnqLwH3Lun8PSKT6fW6wlQxE2bP1pp8+f1qDgZdvj28/e7Om
         v1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665056; x=1696269856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2dWoTPdA3BBauOUCvxoBOxIEDjKvjvr6QPMZATvE+g=;
        b=rDgtDraCy/hAurTKHUmWAHSRBnW5VP+M8TK8fK4yVBiK9Gw6w/a6TYEYbzsL24Bue8
         m04Qi+SM6uNFrr9RzUVAH6O4XJVdcnujErLFvYmAArgJnRB9a3P4z8Bfqfl6SOmBZpkD
         XUVmH4pblduJLvPiMTlDEbvQl3nouEv+10cDkWlDj1nWX2gdXnly0fZ7NwLMF7xI7DPM
         K+S4xKG/uTrUfnicC4argLy3ZFVUynuczOXvKGc9BLXOxsPPWzJywMImLNzzs2LgyHY1
         EKFUJHDEOkwJWPh0FumBi/EsoJf90qMqfTCMeWztGuPq2EPx5tIt3wsc07LDaGQxmM56
         5F9g==
X-Gm-Message-State: AOJu0YwY+FrFgpxG/T5+SrKmaRM6lR+4/dS4xgpBZ6djGyaq53d8qF9E
	vkk2d84CQ+gTUCbmN9nXeIno3+vfaOJXlA==
X-Google-Smtp-Source: AGHT+IGrjWs7RBlc5LUgOycH/u6kkh+S6b7H+OGN3JbnICN8Tb3QVLXli3k2NbOCb04hLKZnsXvPyw==
X-Received: by 2002:a17:90a:f3c4:b0:268:d05c:2d7e with SMTP id ha4-20020a17090af3c400b00268d05c2d7emr6663668pjb.14.1695665056286;
        Mon, 25 Sep 2023 11:04:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u23-20020a17090abb1700b00267d9f4d340sm9993226pjr.44.2023.09.25.11.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:04:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] systemd: Drop two upstreamed musl patches
Date: Mon, 25 Sep 2023 11:04:11 -0700
Message-ID: <20230925180412.1765616-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925180412.1765616-1-raj.khem@gmail.com>
References: <20230925180412.1765616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188204

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0025-include-sys-file.h-for-LOCK_EX.patch | 29 ------
 ...-Include-sys-timex.h-for-struct-time.patch | 28 ------
 ...clude-missing-sys-file.h-for-LOCK_EX.patch | 98 -------------------
 meta/recipes-core/systemd/systemd_254.4.bb    |  3 -
 4 files changed, 158 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-for-LOCK_EX.patch

diff --git a/meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_EX.patch
deleted file mode 100644
index 7827cc1403c..00000000000
--- a/meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_EX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2023 10:33:48 -0700
-Subject: [PATCH] include sys/file.h for LOCK_EX
-
-Fixes
-| ../git/src/basic/user-util.c:708:30: error: use of undeclared identifier 'LOCK_EX'; did you mean 'LOCK_BSD'?
-|   708 |         r = unposix_lock(fd, LOCK_EX);
-|       |                              ^~~~~~~
-|       |                              LOCK_BSD
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28647]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/user-util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index fe61a09005..5c39847733 100644
---- a/src/basic/user-util.c
-+++ b/src/basic/user-util.c
-@@ -6,6 +6,7 @@
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/file.h>
- #include <sys/stat.h>
- #include <unistd.h>
- #include <utmp.h>
diff --git a/meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch b/meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch
deleted file mode 100644
index f2130c856f9..00000000000
--- a/meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2023 12:14:56 -0700
-Subject: [PATCH] test/test-sizeof: Include sys/timex.h for struct timex
-
-Fixes
-
-../git/src/test/test-sizeof.c:64:41: error: incomplete definition of type 'struct timex'
-   64 |         check(typeof(((struct timex *)0)->freq), SIZEOF_TIMEX_MEMBER);
-      |                      ~~~~~~~~~~~~~~~~~~~^
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
----
- src/test/test-sizeof.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 9d969cf8f1..b65c0bd370 100644
---- a/src/test/test-sizeof.c
-+++ b/src/test/test-sizeof.c
-@@ -4,6 +4,7 @@
- #include <string.h>
- #include <sys/resource.h>
- #include <sys/socket.h>
-+#include <sys/timex.h>
- #include <sys/types.h>
- 
- #define __STDC_WANT_IEC_60559_TYPES_EXT__
diff --git a/meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-for-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-for-LOCK_EX.patch
deleted file mode 100644
index 19014802e47..00000000000
--- a/meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-for-LOCK_EX.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2023 12:18:24 -0700
-Subject: [PATCH] include missing sys/file.h for LOCK_EX
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
----
- src/core/execute.c            | 1 +
- src/shared/btrfs-util.c       | 1 +
- src/shared/copy.c             | 1 +
- src/test/test-btrfs.c         | 1 +
- src/test/test-fs-util.c       | 1 +
- src/test/test-lock-util.c     | 1 +
- src/vconsole/vconsole-setup.c | 1 +
- 7 files changed, 7 insertions(+)
-
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 5b2ae861ff..2ebf19ffaa 100644
---- a/src/core/execute.c
-+++ b/src/core/execute.c
-@@ -4,6 +4,7 @@
- #include <fcntl.h>
- #include <poll.h>
- #include <sys/eventfd.h>
-+#include <sys/file.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
- #include <sys/mount.h>
-diff --git a/src/shared/btrfs-util.c b/src/shared/btrfs-util.c
-index 5128b308ab..3ded95ea82 100644
---- a/src/shared/btrfs-util.c
-+++ b/src/shared/btrfs-util.c
-@@ -10,6 +10,7 @@
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/file.h>
- #include <sys/ioctl.h>
- #include <sys/sysmacros.h>
- #include <unistd.h>
-diff --git a/src/shared/copy.c b/src/shared/copy.c
-index 241a2d112b..7e47dc002c 100644
---- a/src/shared/copy.c
-+++ b/src/shared/copy.c
-@@ -6,6 +6,7 @@
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/file.h>
- #include <sys/ioctl.h>
- #include <sys/sendfile.h>
- #include <sys/xattr.h>
-diff --git a/src/test/test-btrfs.c b/src/test/test-btrfs.c
-index 95b7ef25d8..ba09563058 100644
---- a/src/test/test-btrfs.c
-+++ b/src/test/test-btrfs.c
-@@ -1,6 +1,7 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <fcntl.h>
-+#include <sys/file.h>
- 
- #include "btrfs-util.h"
- #include "fd-util.h"
-diff --git a/src/test/test-fs-util.c b/src/test/test-fs-util.c
-index 1beba916a4..5de1eea0d4 100644
---- a/src/test/test-fs-util.c
-+++ b/src/test/test-fs-util.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <sys/file.h>
- #include <unistd.h>
- 
- #include "alloc-util.h"
-diff --git a/src/test/test-lock-util.c b/src/test/test-lock-util.c
-index a9a1b438ff..28fc54a5d6 100644
---- a/src/test/test-lock-util.c
-+++ b/src/test/test-lock-util.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <sys/file.h>
- #include <unistd.h>
- 
- #include "fd-util.h"
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index d57d8b4001..86348d08c1 100644
---- a/src/vconsole/vconsole-setup.c
-+++ b/src/vconsole/vconsole-setup.c
-@@ -11,6 +11,7 @@
- #include <linux/vt.h>
- #include <stdbool.h>
- #include <stdlib.h>
-+#include <sys/file.h>
- #include <sys/ioctl.h>
- #include <sysexits.h>
- #include <termios.h>
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 8d5cf130956..77724eb822f 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -54,9 +54,6 @@ SRC_URI_MUSL = "\
                file://0001-Adjust-for-musl-headers.patch \
                file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
                file://0003-errno-util-Make-STRERROR-portable-for-musl.patch \
-               file://0025-include-sys-file.h-for-LOCK_EX.patch \
-               file://0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch \
-               file://0027-include-missing-sys-file.h-for-LOCK_EX.patch \
                file://0028-sd-event-Make-malloc_trim-conditional-on-glibc.patch \
                file://0029-shared-Do-not-use-malloc_info-on-musl.patch \
                "
-- 
2.42.0


