Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBE0C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 09:05:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.3556.1646989549460435970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 01:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hx7chETI;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id h2so3366874pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 01:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yF/OF5XFsNCGmBrOYU4q4Z0jdHwo9gOzTeEdJTTwZoI=;
        b=Hx7chETIKdQSNdl5C89xCGIZP25dbSV9ER0GEr7ON0fAfVeD8Gtgr45i97x4NgrMla
         rTm55hL4JJTTS+xs/1uvCI0C/krdePIS4P+FuQojdU9ERaEI8atjuZ22A/4Qn7odzZte
         q01mr+pnxnGt6RMHGQBmsW9Kc2D91nd2lu+GePgTh+851hSjVf7gLmOkoN2kAt7sTQrX
         GaIcjA/UounUypqi0s1OQRut7zhRUgMfjuy+yDdxBP/C7GMvGAmSgVlwCsP05OdAUdDq
         PdFclQovTUWAKNHRHttpWH4CViCobAaATkeKW2UxcWYckSr1+vo3ibadOLLDWhSmJrVK
         wuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yF/OF5XFsNCGmBrOYU4q4Z0jdHwo9gOzTeEdJTTwZoI=;
        b=k3F0IonejcImp6+uXR7YAns8RedmcF8u6+Rxbpc4dxQ+kGwlkRrAAri5FjfErmtuUk
         E8M87PX1drfbzguFlBQq0YvqyVUj1F/hfDIZDw6nxeJJ8rYlYxKAOMWYP4Fq0LcAHpe5
         FFh6NnDDzkpvn5VE04h3KUlJu7kpZG1/n++Um2uLOy4IHgPrQQIo1q/TUZRyln/RhhfP
         +8OiqdZEWyhOfvJvWQ+t8UeTv9CrgWoHCBBeoaUO6qyVXuC959mcRqRvKiDCq9ZX/HQ5
         HgldTwNL83OUq7z+lm3JOccHLQMpgDaMDdcgMrK+AwVvz6ud5o/ECFYNVm/K7/BPIAyT
         /wBA==
X-Gm-Message-State: AOAM532QU8M5B1ynmetp+CbiIlA3/ffTsEkyCrCiEuRI3Tan3rhKwVB0
	rIElgii4T77DY7a4AwIu489N5p1ak1hTGs0h
X-Google-Smtp-Source: 
 ABdhPJxDdXSQ+4sOL9sRSGXLfnueSROoY43Gr1PChAK5alnZ0myN0SletnQlNjGppR63jTHMPyMVrA==
X-Received: by 2002:a65:6246:0:b0:363:396a:a00f with SMTP id
 q6-20020a656246000000b00363396aa00fmr7434603pgv.28.1646989548468;
        Fri, 11 Mar 2022 01:05:48 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm10259494pfv.50.2022.03.11.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 01:05:47 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [master][PATCH] PR sanitizer/101749 -
 sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent generation of
 dependency on _cxa_guard for static initialization.
Date: Fri, 11 Mar 2022 14:35:34 +0530
Message-Id: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 09:05:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163047

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
 .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 2394c86e29..0c6c54888c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+	   file://0042-Fix-thread-stack-size-init.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
new file mode 100644
index 0000000000..ab463f252a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=90e46074e6b3561ae7d8ebd205127f286cc0c6b6]
+---
+--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-08 03:04:25.871012986 -0800
++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-10 23:28:20.131064433 -0800
+@@ -166,9 +166,10 @@
+ #if !SANITIZER_GO
+ // TODO(glider): different tools may require different altstack size.
+ static uptr GetAltStackSize() {
+-  // SIGSTKSZ is not enough.
+-  static const uptr kAltStackSize = SIGSTKSZ * 4;
+-  return kAltStackSize;
++  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this may be
++  // more costly that you think. However GetAltStackSize is only call 2-3 times
++  // per thread so don't cache the evaluation.
++  return SIGSTKSZ * 4;
+ }
+ 
+ void SetAlternateSignalStack() {
-- 
2.25.1


