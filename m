Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F455C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 11:31:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.14963.1720179094482228743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 04:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IMFXYMlY;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42579b60af1so11065705e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720179092; x=1720783892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwpMs9XsQ3unXddGctTpXyGoQPDfzLwz0XgkOugSryo=;
        b=IMFXYMlYIr8Wr7/3CQVmZfWH8/2BBdkN5DkZLfPtLgx5sOLaQ7Svj3UMxd+6tSWPA5
         PK2sW5uc8LobaQWhC1+GyhjWjrmd6UXGpj4ZTo/jdqI9DJPtOF92EkqflnMdT9T5dEUZ
         6FFKjuqnejgT4aMbcsKiL2s8COR3Td2j3JwhIXOOcFbM/xbzEBA70nDeiVUz73Az0VXH
         32FeXXfhVHEguOVlBDsFRMukpn0gpPXE0nmToOI6wKq6uyKXWnC6NZiJ6ffFdqOr7Gbu
         Q8UfESjrj24+GR1QHxDQVVmKYDqHRNv+70Tywk6zaYg1KkZpC5efBCJFBuhvcX2Adm/Z
         anIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179092; x=1720783892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwpMs9XsQ3unXddGctTpXyGoQPDfzLwz0XgkOugSryo=;
        b=TUBEN5EL26pnYXKP1zqwmZLoeVHNmQ7dcGbauJWElljFTLmTAV25+0xWK2Pw9Hx4As
         6/Axs5X6WOhInZvWywxtarys37A8rQK2IvszAde4tvTF4KQBEKtaS9Eopo5xdvbUzwod
         fpMw382awiit5zsyy/mda89C0nKZ3A9L5ge4XZ+d3ce6W5wjwppGjk1gmdOostUiQrlo
         u/ttE+FKcSgx9auUttqUJFaGPun8USZrWnnKf/Rf8l1WkgYX1kBPmJe6pvntgP4fDO5d
         gp7Ak3tqgJdjIU/oZrugu+huu7PPK8R9a2w+/2PsMsMcZbmmnpx1fre2EkwnbjAGhmdC
         Z9GQ==
X-Gm-Message-State: AOJu0Yy05DFsG+Ax17V4RLZkuvb/04babL0OynlqcB9QPHK8kwCcv2+E
	DC+Hcm6vsirNKpzWBYfOsU83FmJ78UO7CTLmCxZYZ7QkIZa/Td2SO29ekPSgsQlpk5KldLZ498y
	D
X-Google-Smtp-Source: AGHT+IFlpLiGDkmWpzUnNwON4/6JcppowfNhZB9HyQKN9xn7YFsXkYyrV6N5PfZtSyIp0CnxElnJ7w==
X-Received: by 2002:a05:600c:888:b0:426:59ad:bbb3 with SMTP id 5b1f17b1804b1-42659adbbedmr6168195e9.32.1720179092491;
        Fri, 05 Jul 2024 04:31:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a283498sm57468095e9.41.2024.07.05.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:31:32 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] kernel: fix do_symlink_kernsrc function
Date: Fri,  5 Jul 2024 13:31:29 +0200
Message-ID: <20240705113129.1798725-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 11:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201601

According to the comment in do_symlink_kernsrc, this function exists
for compatibility with old style kernel recipes:

    # Old style kernels may set ${S} = ${WORKDIR}/git for example

For such recipes  S will always be different from STAGING_KERNEL_DIR.
This is fine for the first build or when unpack is rerun because new
sources are in S. However the following command breaks the build:

    bitbake -C do_symlink_kernsrc virtual/kernel

At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=
STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR
without removing the folder itself causing us to lose kernel sources.
Then we create a symlink from S to STAGING_KERNEL_DIR which results in the
following broken symlinks:

    ${WORKDIR}/git -> <...>/build/tmp/work-shared/<machine>/kernel-source
    kernel-source -> <...>/build/tmp/work-shared/<machine>/kernel-source

The build fails with the following error:

    ERROR: <linux_recipe> do_kernel_checkout: FileExistsError(17, 'File exists')
    ERROR: Task (<linux_recipe>:do_kernel_checkout)
    failed with exit code '1'

Attempting to access the kernel-source directory results in:

    ls: cannot access 'kernel-source': Too many levels of symbolic links

Fix this by checking if S is a symlink, and if so, verifying whether the symlink
points to STAGING_KERNEL_DIR to avoid losing sources

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/classes-recipe/kernel.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 89badd90f18..e328151cb59 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -184,7 +184,12 @@ do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDD
 python do_symlink_kernsrc () {
     s = d.getVar("S")
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
-    if s != kernsrc:
+    if os.path.islink(s):
+        _s = os.readlink(s)
+    else:
+        _s = s
+
+    if _s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
         if s[-1] == '/':
-- 
2.45.1


