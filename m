Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BF8C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 10:59:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.36772.1751281179198159323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 03:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRYA+bW8;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso26755875e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751281177; x=1751885977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EBw0WSKNMqLwFq9myRtTLb+tfDgmCDk0DNwXsd03Zg=;
        b=BRYA+bW889nbN5UbXmy8ZAAJDBRPftj0Dj1YWoNfB/e5WL3AG5zlL/vnBevsqTHRy9
         5vXAxPS09aPpEZ0bA2WxVDEpTYi6ZcBaeSxfjqaApzAvpEgb2sCgZb7LfZ6KU80tDB2+
         ICJd0E28sZAZb3hygjeswHWGxX/vvPdk0jz0zAz46ivj19wNpVu5J4Yi5e8VeRPKMzYC
         izoyyciYidyLjTJx/BD+4ywUVUe3UL9y+ugdtAivQsNMe8HiW1vFtcjVrJEFpWx9JMxl
         1a685UpQtrli6tB+h2GnNohIxxOAoLlo3erlXbkdnRUdS3B3ATRLSWgHGVo+JUY5Y1xd
         9oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751281177; x=1751885977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EBw0WSKNMqLwFq9myRtTLb+tfDgmCDk0DNwXsd03Zg=;
        b=t8vIb29mYilFCHQQXrz9G07GDN2C4FJMCWheubxVEOBswJpnUTpxL89aCkQD/2QC3k
         9RiZqmbcWtOLO5LFJ1vf5RtvM122Uk0MEQY9bvDaFaKt8unW3nlbmTIxSDSOGgEj/nvv
         OXWVqkenHq1FlGWIQplDmhV7MtsTsfxe0FjRvadITPlA8cohkXqakTifeoUpPNleSnor
         2yr54ud0Kx93nFaxhApgsxPWhAC/MZwtEmntJoQnycefrP2f9SZMT+fbOlElPWuKPgow
         cKrZIw7yMvfsTCl3NWdJ5HbiAsD0ALGTiQs6MU97D//ePf7f/ERlQ51jch/GUnHVll5g
         smBA==
X-Gm-Message-State: AOJu0YzKtjsvwBkOfVDEWYgopz8cLwI+yjUZ5kPluOt9xqsXMjjxgsdM
	vwF4ZDUnDwlKyh60isHOdNRIWgFlyRXbDF0FnRHUjQnKblzpSWTXtPno0Xb84Q==
X-Gm-Gg: ASbGncsRP33rU4ai+DbxjwRcHVIxV200YGC06SwzBjXWhfPAYbdQBJ0JbYlJjPuFlPU
	UtlsxBVpiMh8rpDyqFIPB5B68dKkiY5rd+niTIpeSWPfD5rQoMn52VUTZhJxiD4rMBGfB/9ekgF
	0cpl+rvnH3PkwUGDH0OvnzBfLSnUqKxyTE0TJTHON0Dw2gHP0tAbLXSrG1jrm0C1Jk9iXHoNWOD
	eHhfdNwT5Ls13cqmMVl2Zh727NjtOCGzjtR4PEG8Iq2yMgxRb3g+InYTuICmnz/s0DlX1xv9ENb
	IKtZ1gkIRoyhPAr4e9FsfaliQHxBa32AnjzAwDF/h6aikA7YUUI+voIStYHkVtCx8+EM0NOcyrL
	JXRGTBmZCEtwuT94BCt+0Kag=
X-Google-Smtp-Source: AGHT+IERO9IOdct+SJBZVWgAigFnR6C0+XvlZ7AzW1NTSDop+Cgysn6cPtNpulk1TGgAujno5MBqmw==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr112415655e9.9.1751281177293;
        Mon, 30 Jun 2025 03:59:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm10088323f8f.77.2025.06.30.03.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:59:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libarchive: correct upstream version check
Date: Mon, 30 Jun 2025 12:59:34 +0200
Message-Id: <20250630105934.3119995-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 10:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219509

From: Alexander Kanavin <alex@linutronix.de>

The directory index is missing the latest release:
https://www.libarchive.org/downloads/

Ticket (which I do not believe will be quickly fixed, considering
other similar open tickets):
https://github.com/libarchive/libarchive/issues/2693

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/libarchive/libarchive_3.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.1.bb b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
index 472b5820f0a..69520b1bad1 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
 SRC_URI[sha256sum] = "bde832a5e3344dc723cfe9cc37f8e54bde04565bfe6f136bc1bd31ab352e9fab"
 
-- 
2.39.5


