Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823E2C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:30:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.85596.1701959436758320550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lQTP/tFQ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.54, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3316d09c645so1019198f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701959435; x=1702564235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGxJeQubf8mD5P3jHdF6RW9NzyluMVWcVyaUv43p72o=;
        b=lQTP/tFQxkJhPkfBEhxljEBFKt6Pvt84qKfd2XdptEeESfy6lFVYm12kzgPQO56ehI
         xPJVJzIBrN2vUP+1vuDiDdsNQr1h4RhN9wo9J2x1cwomSrskE0IBlMH7/V13i6/SlLIc
         KMjo6rgQy1VhNCTzZeif+QoB/KEi287OQLyVdLHBQUheUyoKb7wQ9Y9c5e2hDh/F3kxX
         OxYlzRtCENmuryFvZ9tJSTn0UsSCTaAHV2bz4iYeI0trs/GQ9JaJeyOaEW+FqnTsh61/
         D/VRIrUyvp9TKWDDFiHLfYIsLUkTt0kHGibxFXjKfa4z4Ax5jcim0aJjolMq/Js5STlM
         3ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959435; x=1702564235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGxJeQubf8mD5P3jHdF6RW9NzyluMVWcVyaUv43p72o=;
        b=OzX3y96caDkwfYz/OZwMiuFJtZw/bSJ3A44soy+DcYARfJ6RjK4QCKjHvVaayc3UO/
         WXh38R0S4UryZPe8AgjQaVGxLTEqeF99ppXwP1mOoKOoNFtLoPrhHOcfibRLfX8Q5vr/
         JB70Lr6ulOxukaYJIg9stLJUYrr20fYeSkrpxITxq63yU0jBsARPvv5UK+FXIGJJGUSf
         ZVP7cc8pMjZ6mr+1+PgtbigwxAQiHgvKm7nrZNkxKRZWGdhFS6fQUkudYw4zYquaHwI3
         +v9jLftdFAtA+tvGjlmDG6haD/1lPKUfckCGQ3MJMbokAVOH/NfYNi2w1TVdtdEIO0fU
         0Q7Q==
X-Gm-Message-State: AOJu0Yx97sLXwsDCwumkZeLjO6+13alP4WUevXqTWA1TqCjT4yMmCM3D
	VoYQtaNzkOm92i1w83FO1UFwxrhJqfBm6hRbLT+yfA==
X-Google-Smtp-Source: AGHT+IFbKYeC+JBWY2yU5D7DSbDhEhT546HQxVvHFUbWdTLp9aeVUUVH0A3Mp6memCKabdNomC6bLg==
X-Received: by 2002:a5d:69c9:0:b0:333:2fd2:4adf with SMTP id s9-20020a5d69c9000000b003332fd24adfmr1526416wrw.91.1701959434768;
        Thu, 07 Dec 2023 06:30:34 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d658c000000b003333298eb4bsm1559270wru.61.2023.12.07.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:30:34 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH] subports: Use _GNU_SOURCE
Date: Thu,  7 Dec 2023 14:30:31 +0000
Message-Id: <20231207143031.1790457-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191957

[YOCTO #15074]

The syncfs probe in ports/unix/subports was failing if the compiler does not 
support implicit function declarations. syncfs is protected and requires 
_GNU_SOURCE, so the answer here is to pull it in.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../pseudo/files/syncfs-probe.patch           | 44 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/syncfs-probe.patch

diff --git a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch b/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
new file mode 100644
index 00000000000..23f01673e3c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
@@ -0,0 +1,44 @@
+From e38b1fec2eb4a5dcefafdab7f1a240966f3632f1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?=
+ <pidge@baylibre.com>
+Date: Wed, 6 Dec 2023 13:00:29 +0000
+Subject: [PATCH] subports: Add _GNU_SOURCE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[YOCTO #15074]
+
+The syncfs probe in ports/unix/subports was failing if the compiler does not 
+support implicit function declarations. syncfs is protected and requires 
+_GNU_SOURCE, so the answer here is to pull it in.
+
+Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
+
+---
+Upstream-Status: Pending
+
+ ports/unix/subports | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ports/unix/subports b/ports/unix/subports
+index e41b036..bd5a2f6 100755
+--- a/ports/unix/subports
++++ b/ports/unix/subports
+@@ -1,11 +1,13 @@
+ #!/bin/sh
+ cat > dummy.c <<EOF
++#define _GNU_SOURCE
+ #include <unistd.h>
+ int main(void) {
+ 	syncfs(0);
+ 	return 0;
+ }
+ EOF
++
+ if ${CC} -o dummy dummy.c > /dev/null 2>&1; then
+ 	echo "unix/syncfs"
+ fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4a894ebdd0b..3ffbc311b74 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://syncfs-probe.patch \
            file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
-- 
2.34.1


