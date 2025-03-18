Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B16BC28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.4308.1742272741446849738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJlyB23V;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2235189adaeso87914815ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272741; x=1742877541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=aJlyB23VWS8CzQMASHCgOYA69pskoBmf3fq6N7RxftY3VZ23kuXRUXt5Deg1B+A95E
         btsbOR6l96dwJkddWc22JamRzszrGnSk5SoEUZ7R5lKQ++VH9m0tECOLxaM2YLjqdkJY
         ojyMGAYtBUvvlzZYht7gHTHG7ahT8moelV/mVWTKcIb5w2297RfjOZKP0Jm0mgUmbtoY
         1sfraDnMfN4sdFO6YyRWW5wlxBWo5JTeNAA5RuIBOv3imzsDavAiC2iUCMzaMY3MGM5W
         u1XoElTE7+9M0T7nyjTwRQ9U9gNe/pWrI6/43SORI7oKvUjLVT7WCwof9i67PxShQxkk
         zN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272741; x=1742877541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=vc07qAA5FimXb0L8djt4hw4ZZUCE9Ot70mIBUrGnSFUSh0uplhCj86pL3Qw97c5+LP
         Yn1pneLitmRm5bwZ27QZvrBEX+3V0cVy255ni/lGJ98NJDHNpAt2V/gCzgVgD+riD64Q
         i4T6cg+DnNANECH94JGo8n3rZxrs8ZDt7FLVapwcHtP56O4I+yC1qrGR7h8DvdWstyj/
         f5RVsd6qkhfh2REPdqnzJEcTUFp1MqE4AM8PI1uymJJYgL8Wfd2U8UH9I8AG/OhIxvFW
         KvGkAhBWDTz2rnD5qfqacosa9mRnWXt1oK7mqr4HWJ11JSAkzS29KXvzRR5VlBglKG0t
         ZMOA==
X-Gm-Message-State: AOJu0YylppsVmQnDJJNe32x9tbxIXesKY8YPCWwExfAbHcwQudrwON/V
	KmkR5OGlIFZQxWOxaxgtnqHQk5EzN7cfzGosq3f3gQC84NFGezzyld6K2QQt
X-Gm-Gg: ASbGnct/qDv8lDy1TfATebX7Ju7jchnaFZSf67mac/S0/HZW8gyLGqHB/ncoxYE+0ug
	ePIIUkJIYi2tbq4SmsnwfrusukGD8tgJ7JeOu9jOSPglcStZu71Sf1rTMA7peo70TrxD9B9ebAQ
	HXm8s3diC8+fczxTPZms/DZkK606ptYM6lIxq4egANJuELeLTNT+WzAO+nUNFdgLJfb5cIVP4C3
	aXNkd48FANt3n5O/UbDNxi8UD/Q6omf1LFJUkzcRai1XvtKhOyCcCkxWekdWTy8aXBPLF6OYO9D
	9QiMUxbcqlvY5pXbR1qL+hN2a5v9UxY7WyEo
X-Google-Smtp-Source: AGHT+IG39KkWTbc+VBQLbwG8CBX8ZAqnIH8HvstW9Rc3nD1jyymC06mAxLSeYQ9nIFVwvOw4d8t3kA==
X-Received: by 2002:a17:902:f691:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-2262c97f660mr29074825ad.1.1742272740597;
        Mon, 17 Mar 2025 21:39:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 12/24] e2fsprogs: Fix build failure with gcc 15
Date: Mon, 17 Mar 2025 21:38:32 -0700
Message-ID: <20250318043846.2422141-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213146

Backport a needed fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.1.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..01ab9d5afb5
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
index bd6ac92cb14..022b016f123 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-libext2fs-fix-std-c23-build-failure.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \

