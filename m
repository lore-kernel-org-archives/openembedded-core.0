Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA99CDB471
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38125.1781857998222294118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GuArcBQR;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so1206909f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857996; x=1782462796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wo0EJ+mCf+acB9p/SHKmJwiM1W2NxYFJ7466AxwCTVk=;
        b=GuArcBQR+XBZyBwIJESeLwstZ3G4Sn2zLGJqZMMo+b7DLVz1PzJg9p2snsjBtKiTcv
         2kpihAxFHZpmPTUZ/cDJU56yrqgfvHQ+E1mdWHu72dQVB/M7d2zlvCz9rrHK/azTCdCD
         YEIpH3nKipRenduPc6XrmF3F/eaLc5xde8VChGjI7ECuZApCkLxHq1Tg2LYQPD3XCzhK
         eiKDn5cmHCNAbSzkMwFp0enW8pEA7kT668pOfjw0THJSNBWsuR2QkYaRSmCLuwW+96b1
         D8+50zh3WaVXaqoKIZoxsqxIeTHaHHIQgIdU3VUCRXISycnqV/lR8mtTgenp9j958qLM
         DAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857996; x=1782462796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wo0EJ+mCf+acB9p/SHKmJwiM1W2NxYFJ7466AxwCTVk=;
        b=X8Fwc6k4Fj47JgaWJ/Vr3zp5EgosGeGQvGACG0Wo7gAZOZSqFmVxH4ySul+Ow68qPj
         W1DraZSFEeZmInPUt1DeggDyGFShlP5D9GpkDbFsAWGO84NnvtBMzYqKnUGdDMgsfNCf
         KKPI2fHie4FWu6zFKOlWY8jIdZSWG9PgHsBSQLvsdKKH6rve7URRi6epkZ7ElrVy5jwX
         sQ479RUK5HG/0X/Q1GtmteSa5nF1c0W0ac1Y4NnBYKFEjCXHEhPpoFzc+TScwA42fjs3
         Z+wLiiaL7KwI8S8Cxg41yb8IIwTK+CqAd5nysSFlrJqraU7q32t4lVvH8dfbbGWbiTqE
         mBww==
X-Gm-Message-State: AOJu0YwDr3H0xD6dxTkvwMLh7RoM/6V1kjKtQZ3PUboeUMaNwcmsc81j
	YQfRMt9iJcsIxPUyjSu2bOONsER5jVbGNgnuwK9vGQ2U9X7/1FjWvpiZ2tajRIkY
X-Gm-Gg: AfdE7cmQ5gDJXLbai5VYAXx8XRA0YEp59dioz1xeV8cKA4oaK2v1iS4J1orJfJivDqj
	6KTIQLjganMLcoAxE459kPAuSS3bZbW0k/CmWGlXbphMMtWmJnV+b+HizGc8bqZL9s17OGUhl46
	wSgoh5XFEUzQeQH9+HpYAPGM37g4ZiKZHUBg3iGodNH4fNq7siwBhj/DeMfaxsou3Ol7vi/wHdS
	vXBNG3CzHYqu/FjV2ddPMw/CphKx+Infy4UGNTYgQKgA4rnQyAV0c7DLgjS9bN4dnd97X0DwbDQ
	veGGSfwwN7pjRSHFgfbQSRCQNvuLg7m3JHLHSjux7YJR1LnfZDbL7UpWjCclh6I7vmzLrcK6J/u
	XDSwlz3BGE7Poq4zT7zvdoB5eZP4fZXNPg5+DV/S7xz4tHNhx3rGllluT0C3K0EvaQprMBlZ3n4
	RpZDAjfAJLLPSj9XZPiDgktLt8uXaN463HeoVCSz6KgLlz2hq2
X-Received: by 2002:a5d:6f09:0:b0:465:fa66:be57 with SMTP id ffacd0b85a97d-465fa66bedcmr7206f8f.30.1781857996377;
        Fri, 19 Jun 2026 01:33:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/15] libsolv: upgrade 0.7.37 -> 0.7.39
Date: Fri, 19 Jun 2026 10:32:52 +0200
Message-ID: <20260619083305.3505156-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239145

From: Alexander Kanavin <alex@linutronix.de>

Drop a patch as upstream solved the issue separately by moving the
data to the heap.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-compress_buf-fix-musl-segfaults.patch | 41 -------------------
 .../{libsolv_0.7.37.bb => libsolv_0.7.39.bb}  |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.37.bb => libsolv_0.7.39.bb} (92%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
deleted file mode 100644
index c2734eb676..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 847fb663583fd01121313d1ec0e9ceab240c9143 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Thu, 26 Mar 2026 12:11:42 +0100
-Subject: [PATCH] compress_buf: fix musl segfaults
-
-By default, musl has a stack size of 128K, while the compress_buf
-method uses 256KB of stack space!
-
-The easiest course of action is to add `static thread_local`
-to htab and hnext.
-
-Upstream-Status: Submitted [https://github.com/openSUSE/libsolv/pull/612]
-
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- src/repopage.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/repopage.c b/src/repopage.c
-index 77c7fcc7..470e4f34 100644
---- a/src/repopage.c
-+++ b/src/repopage.c
-@@ -29,6 +29,7 @@
- #include <assert.h>
- #include <fcntl.h>
- #include <time.h>
-+#include <threads.h>
- 
- #ifdef _WIN32
-   #include <windows.h>
-@@ -100,8 +101,8 @@ compress_buf(const unsigned char *in, unsigned int in_len,
-   unsigned int oo = 0;		/* out-offset */
-   unsigned int io = 0;		/* in-offset */
- #define HS (65536)
--  Ref htab[HS];
--  Ref hnext[BLOCK_SIZE];
-+  static thread_local Ref htab[HS];
-+  static thread_local Ref hnext[BLOCK_SIZE];
-   unsigned int litofs = 0;
-   memset(htab, -1, sizeof (htab));
-   memset(hnext, -1, sizeof (hnext));
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.37.bb b/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
similarity index 92%
rename from meta/recipes-extended/libsolv/libsolv_0.7.37.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.39.bb
index 1a95d1d11d..48fa03eb70 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.37.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-compress_buf-fix-musl-segfaults.patch \
            file://run-ptest \
 "
 
-SRCREV = "806c0513cd0799a37802f483710cfbdcc6d16b5f"
+SRCREV = "2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


