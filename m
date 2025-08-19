Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CFCCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3356.1755634092157162093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i6/Xd57b;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so293945b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634091; x=1756238891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYJ2etamn+7y10WEnhuEcIRgovN0e/9EEzsVg4BXyO4=;
        b=i6/Xd57b2DdILLWQXcSDBEX9lbzYhR5tNuKK6UUZ/FWb/PiC+JS8ls5/swTwu8xqQy
         qdCllaRGs/ThC1J7vLSOf9oZPb6RG4PfkGajBTEXcB5YPb8327yXR9KG8SezRLMVYbEO
         gOt1KAAfMkmXN1j97spPL0ccIpYVwvFE+xZzkZczfxF1JHPa30YpbtCzpqiB3ItiCH54
         fqWWQ7i6XD/PLyesnOx/2nSzYzfDiCS7HYJjpPRvQNgReDsslxc89tWRShv5eNoInbfC
         q+U+lPCwkssyiPBzjWPX66RshP4oQQ02GMT/ZmvLwq9bcd1OdqbzLLA2TEBdCsymPRPW
         wT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634091; x=1756238891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYJ2etamn+7y10WEnhuEcIRgovN0e/9EEzsVg4BXyO4=;
        b=j8MyapFQmCVQZhaFdyLTrkHx5o7N0dHO5mnolORL3Cr+vGe50APawRZPfGUyFt6uTh
         /v02rhwyi9kuR1FH0ZYlIx63MmNGywL5d0s2M2F0R+b4G4MgD49Fws2P1+GEYEDV1Saz
         Al2UqK08X8kLCF4zo0QSivG+FJVDjj2fahpM3xdq8zopk5GYNDsHCKksNGPXFgI/7HAP
         w/IJ4y/ztMD94KcRlJB227TJdnJRf8JXWOiKdlRpBjoqdx6nlsE+L+0Xz4o3Vi21y+Rz
         0KN58z54q4/otum8haRbhvkeh4jbqA39IAhTnTMd9SR+hrXDLDLemk3l4cPDAeA7C7S2
         BK7Q==
X-Gm-Message-State: AOJu0YzT+UpuQlZGm7dTKPy6yQwD/NTSgIUNNGxgUi6NrRYWo735MBJ6
	4dUuu1Zt/7UZ3CPtlMEy/iLonR1WUdhMvRBntsz0ak0Und31cqKsw1kkVQdZWvMTmuao3V66Gc6
	Hb6uH
X-Gm-Gg: ASbGncu4SzLXvlAmn7WfV9rXlWgO5X/cHrLmjF+ZIhjOu50mL4zcnxocvkDR3JTI6+C
	iZvk19vXx7kdtqXKHH2LBmSQn11YcqO6dLQAI7iie5BP0f4voHXmXSN093T8B6esVObSCvtkvI/
	seCkv1b/HxyGvL68uUf/5WpM0dknuo9nvjkSJnLBjIhajALjGmM9Fk4mSRMobWgZ1/K0MKzhrPk
	WLI+HgCJy7jqb7uxrrRZLFWv2fOUBgaVUXX0HOdWX4rStdFFtJ8QH3vTpbb+DkUxox7zHH/th5w
	5AJDTzgth6CC1QpJviK3zugS8tvnoLoRFtlIyFwa6G/3uOx7DHyNj+RZoKPZsLFQo5uy7kDP4Kg
	3O6844jE2KsWCmQ==
X-Google-Smtp-Source: AGHT+IHIRwFGm9kt0wr2AhuT5YR2OSrqferFjhxBj+grTJXiq+ef1qL3jwW2lZkZvc9mw1Yj8yAlNQ==
X-Received: by 2002:a05:6a00:81c6:b0:76e:352a:a640 with SMTP id d2e1a72fcca58-76e81432d93mr2976421b3a.6.1755634091394;
        Tue, 19 Aug 2025 13:08:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] e2fsprogs: Fix build failure with gcc 15
Date: Tue, 19 Aug 2025 13:07:49 -0700
Message-ID: <f5a7d9aa471e05d7cdb3127eaec3dba1b15bf72d.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222133

From: Khem Raj <raj.khem@gmail.com>

Backport a needed fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.0.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
new file mode 100644
index 0000000000..01ab9d5afb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
@@ -0,0 +1,42 @@
+From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 22 Nov 2024 12:36:32 +0000
+Subject: [PATCH] libext2fs: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `e2fsprogs` fails the build so only typedef int bool
+for __STDC_VERSION__ <= 201710L (C17)
+
+    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
+    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
+      113 | typedef int bool;
+          | ^~~~~~~
+
+https://github.com/tytso/e2fsprogs/issues/202
+
+Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ext2fs/tdb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
+index b07b2917..98dc95d8 100644
+--- a/lib/ext2fs/tdb.c
++++ b/lib/ext2fs/tdb.c
+@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
+ #endif
+ #endif
+ 
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int bool;
++#endif
+ 
+ #include "tdb.h"
+ 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 940b47c155..0288854527 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-libext2fs-fix-std-c23-build-failure.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.43.0


