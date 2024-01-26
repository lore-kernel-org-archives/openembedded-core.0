Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7810AC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:10:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.16876.1706278207843999393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D6L95f1L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33921b95dddso1138015f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706278206; x=1706883006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+ErhBY3faSuif9VL8wJQ52HZE5mh0LP1Kk59NPcN2M=;
        b=D6L95f1L/xcHmowuOPDEgeAm9uIqdrA7SYLAC0hByqQyQG/grTTKglY1W2njeDSjCC
         K3auIp2ScmAwOkFbvbUhc4A40aRfWvp2kEWd8MHHu3z49rora4RNs2ioxKzToimm7qn3
         mGyb8I6M+rhoNH3+hsjQvYDIItw1c4celNcsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278206; x=1706883006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+ErhBY3faSuif9VL8wJQ52HZE5mh0LP1Kk59NPcN2M=;
        b=wxY/4wREbCg3f7t+U6XDE6XTf8rYyiCMNzYC82ca2WzGNv/YSZaS3AFqHsfz5UmhKe
         qG1GiZIxop4HCbWkfYEYywtiV5ld6V0ZV0T/S6BFX8/Ac5mQG7JkYy1uScMdKp88Miyp
         ABftCMBpuYpvDole1isk23bfZ2ngFchIyQlPfQnLTafptGAnW1+02MqRzH1cqR8HSW6h
         m48Us8g2xUDohEGRo3IBokX/y4xWurFUZSdNdupbygNARyi+asOAzpKHt4axzDh7WfiX
         y9YVrrhZ96HBi5R+Dz+ZQ93jD72T6A64trxezKHiIxGhFRaHfZT0BDBP+qjMDf/qel6Q
         6vHQ==
X-Gm-Message-State: AOJu0YxD24PCHdFJzlOXLklTVWSYQ7wydTzbLgOqBFjqSV+Vkuv+V0nA
	KsfAZL7qYkn/0a0bnXw3K07QwKjmQM7BNkECZTxYl5Da5OyeBCH7dZBX/oEahXTvxZAACxxRX2C
	L
X-Google-Smtp-Source: AGHT+IEfbF44eqdeIn1T09QzHtFEmX/IW27r+SNGLLN763lWcj7z8vCRpZqAdsy5o8Mzn0nXj5ucDg==
X-Received: by 2002:a05:600c:1382:b0:40e:cca6:d82f with SMTP id u2-20020a05600c138200b0040ecca6d82fmr585829wmf.16.1706278205467;
        Fri, 26 Jan 2024 06:10:05 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:eef:5a49:b13d:a655])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040e527602c8sm5921112wmo.9.2024.01.26.06.10.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:10:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Fix segfaults in webkitgtk:do_compile on debian11
Date: Fri, 26 Jan 2024 14:10:04 +0000
Message-Id: <20240126141004.1095936-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194371

Add a work around for segfaults we're seeing with qemu 8.2.0 when
compiling webkitgtk on debian 11 autobuilder workers.

The issue has been reported upstream to work out an official fix.

[YOCTO #15367]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../recipes-devtools/qemu/qemu/fix_segv.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/fix_segv.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ccb28804029..bc1440249d9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fixedmeson.patch \
            file://0001-vfio-Include-libgen.h-for-basename-API.patch \
            file://no-pip.patch \
+           file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/fix_segv.patch b/meta/recipes-devtools/qemu/qemu/fix_segv.patch
new file mode 100644
index 00000000000..da5ae87e0c4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/fix_segv.patch
@@ -0,0 +1,47 @@
+With qemu 8.2.0 we started seeing SEGV errors when compiling webkitgtk from
+usermode qemu:
+
+qemu-x86_64: QEMU internal SIGSEGV {code=MAPERR, addr=0x20}
+Segmentation fault
+
+By bisection, this was tracked down to:
+
+commit 7b7a3366e142d3baeb3fd1d3660a50e7956c19eb
+Author: Richard Henderson <richard.henderson@linaro.org>
+Date:   Tue Aug 8 20:02:19 2023 -0700
+
+    linux-user: Use walk_memory_regions for open_self_maps
+    
+    Replace the by-hand method of region identification with
+    the official user-exec interface.  Cross-check the region
+    provided to the callback with the interval tree from
+    read_self_maps().
+    
+    Tested-by: Helge Deller <deller@gmx.de>
+    Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
+    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+
+and specifically to 'n' being NULL. For now, just skip in that case
+until a proper fix can be identified.
+
+Reported upstream: https://www.mail-archive.com/qemu-devel@nongnu.org/msg1018813.html
+
+YOCTO #15367
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index e384e14248..2577fb770d 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -8085,6 +8085,9 @@ static int open_self_maps_2(void *opaque, target_ulong guest_start,
+     while (1) {
+         IntervalTreeNode *n =
+             interval_tree_iter_first(d->host_maps, host_start, host_start);
++        if (!n) {
++            return 0;
++        }
+         MapInfo *mi = container_of(n, MapInfo, itree);
+         uintptr_t this_hlast = MIN(host_last, n->last);
+         target_ulong this_gend = h2g(this_hlast) + 1;
-- 
2.40.1


