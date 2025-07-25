Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA2C87FD3
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.26645.1753469092510188834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fVC0Wl5b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2363616a1a6so20580595ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469092; x=1754073892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dydt2fcc7HxFJdrBqrikSIq9mVuFmwi2cOm79sNhPuY=;
        b=fVC0Wl5bRNXtcZ5Yq90rJyuK0mN9WBPgpFQgJPYHFqHPLU3vsUJVyT4pnhWsJMyjVX
         qtE/dq65sYK2aGkuFihUL7nrMvO4j1wyhQKD3/z4ZCDgr433bGwAMO9csR1vMhovCaG+
         GmwrVbqqfzyJ8esPx7DK1VGXM8Z+M5rXCYRYWbdZSPngmuvmSA7/pCryLMcfUNiAbeAV
         7BBl8bT+wVuKNxtBdvfwmLTbeCNPtnuRc+7sZQ8JG8LnMk51985Pi/yxKU2pNALQ/Fvj
         HA9yQrrPyW1pX1V+ODU0uFk8QO21zO1GyGPOormJVUJEX2TcCKR4ljqXZHhfNMXz1frC
         1ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469092; x=1754073892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dydt2fcc7HxFJdrBqrikSIq9mVuFmwi2cOm79sNhPuY=;
        b=LQDC/PH41DgbJit3XcZK6EfO/1mA3vlfwOMUzWh4U3rC5oST4L4M9SsGho6gdAoHTX
         S+k63ZgNrzxT9uYWGtDNnfno9lcVnJKQI+mfcL/jFv+uumtwkssqFfp4bI3HlDlv6wgh
         e2b/YHHlvCjfmShOYmpzwTI08X8lj+y6x0bp2qCffmuPC5CqIiZQjoZxES1a+tMs+8Av
         AOSxuws0uYC7L792oFALKTkZxhQeGIPl13eXrOeyXN9dhwNvvdRPKyV7mNNoWXcP2SOx
         IbNjL4ym4IwYnPvf7d0KAE7QXtPhDyVYKrrGTsqurjkj80GvmXWaO3rPYtGkjRF0mftY
         Ckkw==
X-Gm-Message-State: AOJu0Yw4fqGreHgdelGZgDVibLgN3cXbO7u/ZD2IxEY/9BreRlnxzTcT
	Vl7p+tJZ+MiDv+pG4CIGp7FBQ7/bJbjyAxPiWDFnTYJu2xPfkc8UCAPfpR1X4UeFzJlhnUfGbbW
	kItCI
X-Gm-Gg: ASbGncs7CUym40BtGgSyIWv9BTc4zNnefxBPXyc3MF9eQ0Msy5jUiQOSdmWU+kpLv2Y
	L6RkP9kWiFUgztzhXZqurF9UPxZcwWzpqAYHZiDdSA8abK2B3HfZFpE0tCuDjTOzhBODrFqhdjA
	n0cbc3sFqlpxDRR8zho00DiLJbhYuFOe+fZP8ovldgn6Ck54a0kMoM+1SsrLkn8F3T1Hqkuxcdj
	88WZnDLOWnu5TmfHRT4HBvvqLb60OYVPqXpo1303Bf6QbA4GJAVWS075xpkqlz9pFpN8tFd2bXm
	XqGS43RRHddsASHUjy992DLK0oGwt7AZnYLXRJQLaYDhgho+BPL5lf4lUr6zA2ik+jklhs1Ev9q
	4VYAhQ+DLAP+ykD9l+aXSY7jl
X-Google-Smtp-Source: AGHT+IHQC7jrLXibK4taDxe9OYOU7fn2LDF0m/IuyHbDaCBg7zk6BagN9524WycSAl63CnQ9rQh9bQ==
X-Received: by 2002:a17:903:3508:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23fb3084948mr39348465ad.18.1753469091607;
        Fri, 25 Jul 2025 11:44:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 09/16] glibc: stable 2.39 branch updates
Date: Fri, 25 Jul 2025 11:44:23 -0700
Message-ID: <c40b9c33061c4019ed7790ccb799bb3491998b3d.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220924

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


