Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01393D5AE45
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2854.1765619994111819964
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUG1OmrF;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29808a9a96aso27480875ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619993; x=1766224793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS3FHlVReZNbx8mabF4a1RigQn4ywd85/VkY+QMb2PM=;
        b=OUG1OmrF6CcILpYEKOg9s9Beiu4w+91OVkRLTAky0iqrJygy9OGTzODdB3l6xE05NW
         L+rGnpLZcfEbMAYP9ZUcWkHiEGTF/wlSSrixmZjtbrHI+U9MbdaCS7exdo2UxHM34KP6
         YDpRDBmwOOLNAacG4sxozp3O7KcGodYoshABK6zC83o/YjWshZga/5SPdelCrcvt0zmA
         DO0sAKV4rpDK0EyX4LPnabgDgK3jyx2oDxz3eRY7xf+IboYiL1hK9rW5aQdYRDYWkQRF
         8EYle57ceZ0amawQ5EWQneMFUxV3iFt8PrTQgjEbLspdmk29lkAfRBTby6z/za3dI5lS
         rPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619993; x=1766224793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sS3FHlVReZNbx8mabF4a1RigQn4ywd85/VkY+QMb2PM=;
        b=jwFk88WaJ/4K5/VCUyNFcbKVDmcnEsWXaQZZ/YYgr+Pek/o8r9q4n1G2Qp5lvGC4T8
         /7IkMVtm8DqTyiRZcYcAZdRO0qV1B2J1bXT8ys4AJqB3B9HbfgdueufKDgmmp01duQYt
         jqVR8O07qPcqRJA3ht9LLuknQqlz6p93Aakt1NLp0evniWrk9DORMPtAejcUvDmowgU0
         qmqbI1tY050zAawtqqZVXq7+BDXlonfmvg7whpHqT+Hj+jETqyhgLvYD5lmzZ7m3GJ4F
         UL6AwPveKWXD1mYzrRpILEY7IFTO5uUivnm9x01RTvkfsKTu5tSsfTSy0NfbXKqzsysD
         l78A==
X-Gm-Message-State: AOJu0Yy/euqaOeMTg3E/AolHpSU+jG1oURx/dFGPlu2bx7LwCWg1Y6nX
	J6QUTxfY+mfoiOhc8p6faP/w3f7m0dz95cRb+vWiNIhX2isjRwzBmkohwj9ZxA==
X-Gm-Gg: AY/fxX6UkToHoKK7I8A4dgHeCPenBN41zESr2GutjpUx4LKru6om3odf1NrlNCyeVN6
	EUiQe54CFUrHWJNIIkbXFfPITNfU4FS4+TC578/UoJMYfzRkxU57k2wOBajr3uE6AfRDUq8t3Mf
	WfKVKz25bdNzSgEi12NQqANrKE9TRf8i3QKY19DQyoM7Hb30Z3cgGXdDe2RXU5DmhlgWYHXc8LP
	4sTidojtV99tI90x182eCNwYC3lN+1JxAeCvDase292Cb3WyKpSiYY+/pfUfzUQjUFkCh/A6HPL
	VyWUcA0cHPRw5hJ94QeYqYgnVktImkEzst7zy0PajYc5UeZ1/Dt4Q7kBsLG8cq8OlDcymxqTLs4
	ejfDBOey+59duK9cRN/NFmSjzZPEI1VqURGfsmZ9FGhllPMG8t6L+ZeF3RWcNHYtVmb824gM+rf
	h2Q7kPyH4XJyVc07E5nnH1sayLiABVgZ30SLo=
X-Google-Smtp-Source: AGHT+IGKBtS5FKoPFwObYaSMtorPDzWLBl5LQrLZa9jYgEWF35ZJTEKPSjjRTpkv7m9OafMC/0Zk/w==
X-Received: by 2002:a17:902:f54c:b0:294:f310:5224 with SMTP id d9443c01a7336-29f241515c3mr50138815ad.29.1765619993273;
        Sat, 13 Dec 2025 01:59:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 06/67] scdoc: Upgrade 1.11.3 -> 1.11.4
Date: Sat, 13 Dec 2025 15:28:30 +0530
Message-ID: <20251213095931.2571498-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227624

From: Alex Kiernan <alex.kiernan@gmail.com>

Drop backport of 3667cce Makefile: drop -static

Changes from 1.11.3:

  Drew DeVault (4):
      Makefile: drop -static
      parse_preamble: remove useless branch
      utf8_size: fix bug with array length
      Update version to 1.11.4

  Jason Lenz (2):
      Fix unclosed indent at EOF
      Fix make check permissions mask

  Kirill Chibisov (1):
      Emit \(ti and \(ha instead of ~ and ^

  Nico Wagner (1):
      Makefile: remove unnecessary path separator

  Sertonix (1):
      gmtime: handle failure

  Viacheslav Kruglov (1):
      Fix logical error in comparison with ULONG_MAX

  elij (1):
      strip indentation after a hard line break `++`

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit d1a04bfb9506f00d658a58ac1671de57dfa487b8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../scdoc/0001-Makefile-drop-static.patch     | 23 -------------------
 .../{scdoc_1.11.3.bb => scdoc_1.11.4.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
 rename meta/recipes-extended/scdoc/{scdoc_1.11.3.bb => scdoc_1.11.4.bb} (82%)

diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
deleted file mode 100644
index 631d06375b..0000000000
--- a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 3667cced504bc40b176d4570d99a83fe67599f3a Mon Sep 17 00:00:00 2001
-From: Drew DeVault <sir@cmpwn.com>
-Date: Wed, 4 Sep 2024 10:07:46 +0200
-Subject: [PATCH] Makefile: drop -static
-
-Upstream-Status: Backport [https://git.sr.ht/~sircmpwn/scdoc/commit/3667cced504bc40b176d4570d99a83fe67599f3a]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 96ad48cd04a6..49f076aadd39 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,7 +1,6 @@
- VERSION=1.11.3
- CFLAGS?=-g
- MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
--LDFLAGS+=-static
- INCLUDE+=-Iinclude
- PREFIX?=/usr/local
- BINDIR?=$(PREFIX)/bin
diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
similarity index 82%
rename from meta/recipes-extended/scdoc/scdoc_1.11.3.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.4.bb
index 5f571c64dd..059150df46 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 
 DEPENDS = "scdoc-native"
 
-SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
-           file://0001-Makefile-drop-static.patch "
-SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
+SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install

