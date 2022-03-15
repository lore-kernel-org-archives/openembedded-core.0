Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FFBC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:55:22 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.12589.1647359721556128914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cXOQdSvz;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id e13so16608108plh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezrN6PD9vThjdwpP3/6tLNabOsTCFv1X9b9kWh0hqgY=;
        b=cXOQdSvzOQu7G6ut3L/A/zMKUYikaqQobi05OzyqRNX1xvEuvY/+QazIGAWmuEJh92
         oMQ4+YneMo9x1dodUrtkZU/W81e/h516rXAcr986jDPUHvdBB1DXYdBH8C/gkFZCed9v
         hRgvPFjQRNtaPBTdlZPqMFiCUn971onbRFdL8N5hqubxKq7MYM6aXX7s3yA8LATfa87Q
         vm4d3ZIy4wWDdJpWU+CMVNmZdbtGbOs/gVaxRzA9AjOxwiIbKM1NT6Ddl3J14fsG9ShV
         fMwqcR1R+eZs8YX89HKuw9KKQ26JnZ+VkWsv4WLAvqdBhx66CPwgOdJXEE5GyqriRAOV
         kNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezrN6PD9vThjdwpP3/6tLNabOsTCFv1X9b9kWh0hqgY=;
        b=tClHPuNKkCb7zbV5+EiaGECXv9gqPdHIx63NbTw5T3aNFUtMyA0wWSS56pg5Pg2nrP
         6hUcGebFnTbXgZf4cJX63nRTapZkfHYbxdFCyiMqG+GndfN9tLrInWwLHCMslnF6FAcM
         1OVA4WzG9ypE9qY95e0hepphfxg0R7aDJ4Pxtn3sk0aH6N1OuQ9pPsnMMMpHuGXLmRdV
         oZrbE02lQNASq53LThSJT8g3csB/PO4741JcqpUnHYyk3xKFJ4+Zpr2BNVJai+w5/6tW
         I/bQ8U9Xv+3PLjm6LvDcADqKXbl4APJXbYsQQUaWGy4sBvuUSlfxUvM/qCjEauyJZObP
         Rlgg==
X-Gm-Message-State: AOAM530ME0hxuW7FPyHc6VNsLjpUovwK1uR6i59kTwznwSl2AwqIFBHH
	pZUsmUnjFfOhGBYkTGr0zRrTg3Y5fEcUTg==
X-Google-Smtp-Source: 
 ABdhPJxmpFVkmJ6pc6dLscVnGBtjjhpE5CGviTYqbnbVUYwndTc7kaEbL6BSFIpjYNcibby+kbzHMQ==
X-Received: by 2002:a17:902:7c89:b0:153:758e:cb with SMTP id
 y9-20020a1709027c8900b00153758e00cbmr10487684pll.27.1647359720442;
        Tue, 15 Mar 2022 08:55:20 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a648800b001bf2b437609sm3602838pjj.24.2022.03.15.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:55:19 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [honister][PATCH] gcc: sanitizer: Fix tsan against glibc 2.34
Date: Tue, 15 Mar 2022 21:25:07 +0530
Message-Id: <20220315155507.1410297-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:55:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163304

sanitizer: cherry pick 414482751452e54710f16bae58458c66298aaf69

The patch is needed in order to support recent glibc (2.34).

libsanitizer/ChangeLog:
	PR sanitizer/101749
        * sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent
	generation of dependency on _cxa_guard for static
	initialization.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
 .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 40d2b59354..47575dba40 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -77,6 +77,7 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+	   file://0042-Fix-thread-stack-size-init.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
new file mode 100644
index 0000000000..02ba2401bb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=90e46074e6b3561ae7d8ebd205127f286cc0c6b6]
+---
+--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-15 07:59:54.515325204 -0700
++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-15 08:01:45.919405931 -0700
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


