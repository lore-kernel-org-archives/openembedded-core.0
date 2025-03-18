Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868B5C36004
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2886.1742323146053365436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAtx97NQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso7352177a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323145; x=1742927945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=NAtx97NQb6iSzWIASJheAbqwUciyHUVWDrxTl3GWfKMqkHGcVAHkQBRWN9gjSBjhZS
         JadI03ERDaXCoUgWrMIK18qNJvlXXgFswarg5cYwuhBPyiUtvvhOO0QGc5QDmRU8FI6b
         wKjhiJVs+FmIleW5IqGdS54z1sAEh40V8M0HoLz2XUN5lb3zvrCwgOXX44mH5BZKFtN+
         MR8eB0Yb/pi9+iet7prmXX159PV2q2DHLle77B5eLghg1mbTIMtbqWKEJRLw5XWQtnii
         B+zxzZ2M0lZ4A0JHWzBsM6PWAwpuTwPJktuDB8TuxXSU9JEhzWtY2+crJOv7oZpaRZa3
         x1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323145; x=1742927945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocz2n2UXaOZ6BnjXTcvm371VNByrrdlTG0TcWzLoIoA=;
        b=tBb9+/TnU7SFGT3G07hPWu2hRE7SVIfXnUJuLUkYV6BYYA5iErtb+zoEkmX/BFYLhv
         5bslDRBxhkaCaKN847vGx2DK4BINwxjtaPNOCBBo4xoKjRkRiQGCvzj2HJNAlzkhEbPZ
         qsJ0Sd9QgI5pS5WE1WYVGoS9Pl0pn7FS9Pmu5atMp5fLajQhambeQcD7z80HxYBB/TJL
         nGg3tNUJpza/mTqimG22dgVRHrsUcggF89fGDQsNos4mVmgz1y3kEcnlsTYQtcHpqZmu
         +ZZOOB3Nkvic5ZjoCzQFqpKE/hyC4Et6eHuTdY1DjhNhZd1CpMGofpqZb7mUWBTysAQC
         hjPA==
X-Gm-Message-State: AOJu0YwbL3oOfBmx2LZ9D4Mfcr8tPjSoat/ksrvTBvQNizjhb6zqQ9IA
	4Pgp+5TZalxifZUceF6s8lxlS05KNQc4WYT9nHLqMv2n+ENNeqnfgnWDn84G
X-Gm-Gg: ASbGncs/ZhB6iFADn/6VH0je2V4MPy3mvsDM9LG1TQ4geZ/cjzzhhMFcpQobxNaPE3b
	6stbmd+EeNu7CnVVqZ985rPIGihApdZ6fL6u3f83Calj9eBNc+dL45hCAYJhWBrBeJwvALKfHHv
	m9pddfbOJCB8TqXFGdhslnwPUB1pklnyRMZJWZUivwARD8CHdlqHSIIMKbRZGBuQZEXIifmqdm0
	hb8pmuVMorujNwYbfZcDlZaiP/MXPQfL4aHra7xjheMMhngr5PoDgHT45CSrXN1oiib4mNFtbR5
	U8j3ys6hKSdu8IZkov53rhPHgzIlHHtvpcgX
X-Google-Smtp-Source: AGHT+IEF4PHNg3+i6dDyNlHkuRXRJzDnqkFIz0V4dTte5I6irHRqFgB4w0ZUDinVKfk61BpM2NS8Ng==
X-Received: by 2002:a17:90a:e7c4:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-301a5b2cc87mr4980366a91.18.1742323145291;
        Tue, 18 Mar 2025 11:39:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 25/25] ncurses: Pin to C17 standard
Date: Tue, 18 Mar 2025 11:38:40 -0700
Message-ID: <20250318183842.2256284-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213251

Newer snapshots of ncurses have the fixes but they are many needed to get
C23 going. Until next release lets stick with C17 even while GCC 15 switches
to C23 defaults.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f93550cf99..1e9ec38ceac 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -28,6 +28,9 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is not detected automatically
 CPPFLAGS += "-D_GNU_SOURCE"
 
+# Check if we still need it when next release (6.6) happens
+CFLAGS += "-std=gnu17"
+
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
 

