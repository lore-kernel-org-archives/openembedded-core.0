Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B18C369A7
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.42757.1744018853122265236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QO/0B+EU;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c2688619bso2434142f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018851; x=1744623651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjgKBohST2Ilt7P1cjKR8HEMcK+CscuRGjhftvpnbqc=;
        b=QO/0B+EUR0br5r1apOQB7bxi3tFZOGD3jYmVIpFyRW0FpiVvXLTsygD0psz3sJsM58
         7PfAgzf1aiZ6OpmmwY0az1CV/jYKcPoevE289mB+p3qeOH3EtnbAxnOUd/9xiGgU5Sb2
         OtcRm+tjNwr2MjlTK3tyhrHWmEwjGgL89kh0AFfMbLZfFNHhXw4K4dBoqQJaJHRbakrE
         E+13sMJXHFOd8ciE5PXb1W5wSk5wLZGTb2kYnK/9/9hhFoAbHiAZih3Xvo26/xXsAYdm
         MNccotoqcvtN+nexWdQL+aXUJC5gipx0nDwCZA3XWPShqTN77AGP6d29NXLr0REhqABs
         f/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018851; x=1744623651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjgKBohST2Ilt7P1cjKR8HEMcK+CscuRGjhftvpnbqc=;
        b=kBcDMcRpM1nZTaQKpphNNUaidP7Up55vYxllwvAiIA8Oce6MnvHCIgEaMISv+col/L
         WEHJAbJN6F//GN3C5DXYBavdPplmIAfNmhDg20iACZhJI+kQfOCQtAGw4W7lJ5j11YhM
         XGne5QfZuNSc9RmjG+zzqzvZAseCVGRknjpgp+olg7AuBtZJvEy+D5+MDEckmI0TKMaS
         4SwVo+XvDU20P/wyk7QC0sp+/0/RiRyM4/Gw9y8RVE1L7OHzvhWtImXCC4qLDmN6Igyb
         c0T31LXQbw4bMR+5l7V7pFMYjk2ze2spcuwzrYxe3tnLWo8vA64s7skjAzYlxsdFXfsB
         NWBA==
X-Gm-Message-State: AOJu0YzUwfbKQ9QIxfYMgxbjT3PSw9E6jdSNQRGfktlnY8mJAa7XMRcM
	xGcXAa6W5Y7dh//9jtx9OQOtSo3GWeVBnh0TKrP4fntZNbLnrVf4PzuB7Q==
X-Gm-Gg: ASbGncua0tstRczKc8IhUXUJYcaBlujjBKF+0n3m2o4T1Z+KyEs08zdDIYsr1xBPPIt
	b46HgGyVOl7SqvvR2Oy9njOAdFj2rr6Vd5rG3+e05UOQi43b/7jq/EKkCYqKftFBaPxy6MQsm/f
	EbnVX6mNv2EXw5nAgJZqyOdfXV8henBef5+fMOxEysQrqYeDQgoAMaUbUyJpsbAIKq6qtxnKTIy
	FzA2fH7mX3y+K3SwUsBtc8237DVQJOefaQ+bb0jdxsUUJqep1gwhXfMr43akwp23s5C0ezaZvCV
	XPrHNDdCGf/fvariMy/Xv7Ox70bLMg30T1xBt5ijIecsSIw1sXqR5Km11RiqzCSPRYFM6TuvRPq
	AJJprPjkwEodKo1K0
X-Google-Smtp-Source: AGHT+IHkZ4la4onTlr6z67fWipSEI3LGd39HV8kJNivM0oiACm68cIOFvvRXDBmESi+F+8Lf/60fng==
X-Received: by 2002:a5d:6dac:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39cba975b4dmr9708504f8f.43.1744018851165;
        Mon, 07 Apr 2025 02:40:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/18] tcl8: mark pending patches as inappropriate
Date: Mon,  7 Apr 2025 11:40:30 +0200
Message-Id: <20250407094045.753021-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214412

From: Alexander Kanavin <alex@linutronix.de>

Upstream submission should be done for tcl 9.x patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk8/tcl8/interp.patch                  | 2 +-
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch          | 2 +-
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index a4fb0c5a9d4..aeebb038e3e 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] tcl: fix race in interp.test
 The interp-36.7 patch has race conditions and is missing cleanup.  This patch by
 a Tcl maintainer should improve matters.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [tcl 8.x is obsolete; upstream submission should be for 9.x patches]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  tests/interp.test | 7 ++++---
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 88faf8ac730..898e8241fc4 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -3,7 +3,7 @@ From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [tcl 8.x is obsolete; upstream submission should be for 9.x patches]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  unix/Makefile.in | 5 ++++-
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 0a0c1173a22..f2a37add7d9 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -7,7 +7,7 @@ Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir}.
 
 [YOCTO #2876]
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [tcl 8.x is obsolete; upstream submission should be for 9.x patches]
 
 Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-- 
2.39.5


