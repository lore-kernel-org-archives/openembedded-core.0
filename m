Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF54C87FCC
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:00 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.5122.1753392957401175888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VbOoSqHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1350563b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392956; x=1753997756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dydt2fcc7HxFJdrBqrikSIq9mVuFmwi2cOm79sNhPuY=;
        b=VbOoSqHN7ug8FydCleGcnMXXgf83S2+/ljQcOPMDJ6LEkU+x1eJ72coJHGQ5zsm0wm
         1rygRaX7EmjyvFVyEgFn/ru/hKdmiof/4w/eRH7PkwQqQBEWCrh3InGAXnimSu99ido/
         jqZHK81UeORej8vITr7P6kmVlGUtKpePQdxThIq9Kx1ddc6g12+AcTtijvkK6MIR36pO
         E1yI62aiVJEPTWL/KH9EQZBqYVYhhIOWS+84eMFlX1I+9aoVYaQvVwTsnaqSpQRbZgTf
         jLhf1ajXWQ0+dELSpkh1NkLb5lSjhmjeQIn5cJ4c2Nd04MLH8k7tnFSiXEOsFdrpPyt4
         hgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392956; x=1753997756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dydt2fcc7HxFJdrBqrikSIq9mVuFmwi2cOm79sNhPuY=;
        b=TrA7wWl5LjWdWkQiiRWD5lcktx6AI10/ig+so5n/7yDhcSA79zys7VoWSph91VjAQE
         f2pQRD0fM7XoxJMO1OUj6jin7qCrtcPOLchgv3/7wWldxyoMbK3XKrih/8ljtUndLTON
         OEVyc7nJyWbRy9BRTWR0wZV+AIS2dRgigN0nC5JEAzLTyG9ak2aKurXzmUOQ9Do53sm5
         mHxc+MUpqHA2nKXPh6inm0G5xcYBhufFpsRMSys4sL3duT2o8mScz2wpLUAG7K4MuLrd
         mPL1g9zit3Z/BY/sCqV466BFQskPQMJAUq0SIQ/2oIhWjJmhtBsiKOEItEuyNqBxl2GG
         ji8g==
X-Gm-Message-State: AOJu0YyRfBdrHA0YHIWOsfK1i2XFCHL5QK7uIjAP1sTzQQ5Z0EA4xQ6f
	q8r9844j93wlbvDMB7t0qMxghzIf9O8MIZYm4k7MGLg6v/hYGRQCxCqNiDnNoCFtY+2XJfi1W48
	BD20a
X-Gm-Gg: ASbGncusuf8zNzRLjS7TclZ4wQRcZAagJKji/PsfOGOjtlJvh+PaPhE7YOmrUwF/0W1
	q0+QTusM1r2MGjTNF7Js2VGcaveE5ktw803ZT15n0m0yZhpo/98wqz0kNWiKMI5RzOjdJTCbOfs
	Zsl9Mpxlj3GCuggULIFWsIuNGc0KUl9cHQr45cuprznQ7kzG5b4bWsstl+saIACVQdx4Vpw2n76
	d7jRvaNhe3exm7tCP6pRt5VKxkReaguvaJTqIUw5y436PzU/cgNvU2L8+G2zLNTWXHVUHdfLh/W
	ujds5JsWSKZ0PV20K/zVvdNWQOm7H9ML5nRQqBCRVqW1e+NUSA85Zc7A50q2P2YPHwJR2YXoz3U
	mQgGlto6gFKDb
X-Google-Smtp-Source: AGHT+IER+R2Ok0uNR6LNd2puvmU9CO3oiAy3XoaH5L5svNXGJlDyZiNWxmfJE31MuFGRol8B4/xI8Q==
X-Received: by 2002:a05:6a20:cd91:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-23d49032907mr14669488637.13.1753392956531;
        Thu, 24 Jul 2025 14:35:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/16] glibc: stable 2.39 branch updates
Date: Thu, 24 Jul 2025 14:35:25 -0700
Message-ID: <779e3dccae95a6427317cbd7bc754f4d545efda6.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220882

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 06a70769fd0b2e1f2a3085ad50ab620282bd77b3..cff1042cceec3502269947e96cf7023451af22f3
cff1042cce Fix error reporting (false negatives) in SGID tests
1924d341c0 support: Pick group in support_capture_subprogram_self_sgid if UID == 0

Testing Results:
             Before   After    Diff
PASS          5074     5082     +8
XPASS         4        4         0
FAIL          121      116      -5
XFAIL         16       16        0
UNSUPPORTED   157      154      -3

cff1042cce Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates

UNSUPPORTED tests changes
-UNSUPPORTED: stdlib/tst-secure-getenv
-UNSUPPORTED: elf/tst-env-setuid-static
-UNSUPPORTED: elf/tst-env-setuid-tunables

FAILed tests changes
-FAIL: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
-FAIL: malloc/tst-aligned-alloc-random-thread-malloc-check
-FAIL: malloc/tst-dynarray
-FAIL: malloc/tst-dynarray-mem
-FAIL: resolv/tst-resolv-aliases

PASSed tests changes
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-env-setuid-static
+PASS: elf/tst-env-setuid-tunables
+PASS: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
+PASS: malloc/tst-aligned-alloc-random-thread-malloc-check
+PASS: malloc/tst-dynarray
+PASS: malloc/tst-dynarray-mem
+PASS: resolv/tst-resolv-aliases

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0130613936..6ee9fc7a0b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "06a70769fd0b2e1f2a3085ad50ab620282bd77b3"
+SRCREV_glibc ?= "cff1042cceec3502269947e96cf7023451af22f3"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


