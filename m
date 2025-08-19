Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBCCA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:17:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.10654.1755598641382753460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 03:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eJ+TzvHW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so35962345e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755598639; x=1756203439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dQdXyuP0rg0y7gbV9M190NjU7ODVyLGJ+nsp3sTpGU=;
        b=eJ+TzvHWCgp+jWbu4xkcOqsoR/yIU3gMDqvLV5sVt2xMjy90jXfM7ZqICwwPnA6m/0
         wfD5/xEsykjCgW1X4EfWnfhk+u2eYWvOuSaz91VZLEDfafE/7sGb8NKp1Uf4KStnkY4m
         qxRCq4U01RtoxLVkGbALCvA7QZNa4o4lRKPUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598639; x=1756203439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dQdXyuP0rg0y7gbV9M190NjU7ODVyLGJ+nsp3sTpGU=;
        b=XOzfiJCGG+rO/PwyeeL8OsUkbLgDyWC7DbzVmaFychuvdLP8fu+LC+CeWl9CP5Ebja
         vVaoUgRf1HNARc4Lca49UqL7d51QBi/p2Ujduk9T3enmgWA1FZoSRASm3SofVyvTklJe
         UamWV/B8eM7ZypP4fFIdhq7BUfhSxBnzSWPk+MnIw8Yddl7Fwvgz6Rb44Fraq9djMgWm
         bzT3PNwB+jP0jonPlEajPAc+AV6TMvIA7gef/adpKMe2iJ48DaAflxB42RxJu4+zS1GL
         +BD/JcnPlqfImQaNI3UqVXskAa+mW0Mk0vFscqzKr8ngFvxyCez4v1UT13yiiXMm/nmP
         MTrA==
X-Gm-Message-State: AOJu0Yyj12gICl5iIGHS2DzpJcGoZ/7iwBrFkstGbpsJU/Wjqyf6qhRs
	TmN/mRbt12WTtKhUz2J7x2KJ6lsbyK8HMvBMhkpNxDUcfzRtjrXPlnRldaXA8qUjZdOAG3otkTy
	/Tr9m
X-Gm-Gg: ASbGnctszF5V3R0YpZAWeht1XzNWLb/gZZ+vS9v+k+1DxoLv905mAghlsv8a8AiAgqs
	4gh7v6LXG61u+S0H5B7QXQ9RDiMYhemG1wh7hvf4ZXJLzyCdwJOLVC6CyT5oREXkfQKH6MPykN9
	bRHbenR8SfHT88xIEokcI/neRs+Cpu8C9a0az0n8hK5G5hU+hZIQAB1NcTXfHzFfoorxCR83qFV
	ngUssWmaKmSkL0Fs9oi/V1vILmUi0H+C8T8dY6t9SHH6NcxVswiBST9IOawUspfd3RZa4gJ8HeR
	N/e1BPAeMC/S22ublUikIfgOFNqVDI/Es8ZxgS79VxWWb8AzOfm+m/fwaBG4opaoLF05D58LK6B
	Fm7Bo1olsXgPBSsBcfYkkgKk+Hnjtkw9OqZh0zR/LysPs02TFBwjLwec4i9yorw==
X-Google-Smtp-Source: AGHT+IFVXEUk4RW2V0c0SKY35iLRpzlCeHzIvvfyFPRwS9vsH+4WZjHUNwFyc+BvJJNQ79Go7j4QFQ==
X-Received: by 2002:a05:600c:630c:b0:459:e06b:afbd with SMTP id 5b1f17b1804b1-45b43e11dcemr17612655e9.29.1755598639286;
        Tue, 19 Aug 2025 03:17:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d5c:7b3b:65dd:ef80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3089359f8f.24.2025.08.19.03.17.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:17:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] lttng-tools: Disable slow tests to fix ptest runs
Date: Tue, 19 Aug 2025 11:17:13 +0100
Message-ID: <20250819101714.3600601-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819101714.3600601-1-richard.purdie@linuxfoundation.org>
References: <20250819101714.3600601-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 10:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222098

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/lttng-tools/disable-tests2.patch    | 28 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
new file mode 100644
index 00000000000..5b9a07fcb81
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
@@ -0,0 +1,28 @@
+These tests take too long to run for our default output timeout in ptest-runner (450s).
+We could change that to 900s but it is a global setting so skip these tests for
+now. Ideally tests.serial would have occasional output when running to show activity.
+
+Upstream-Status: Inappropriate [workaround for slow tests]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: lttng-tools-2.14.0/tests/regression/Makefile.am
+===================================================================
+--- lttng-tools-2.14.0.orig/tests/regression/Makefile.am
++++ lttng-tools-2.14.0/tests/regression/Makefile.am
+@@ -26,7 +26,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+ 	tools/tracefile-limits/test_tracefile_count \
+ 	tools/tracefile-limits/test_tracefile_size \
+ 	tools/exclusion/test_exclusion \
+-	tools/snapshots/test_kernel \
+ 	tools/snapshots/test_ust_fast \
+ 	tools/snapshots/test_ust_streaming \
+ 	tools/snapshots/test_kernel_streaming \
+@@ -47,8 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+ 	tools/rotation/test_schedule_api \
+ 	tools/metadata/test_kernel \
+ 	tools/working-directory/test_relayd_working_directory \
+-	tools/clear/test_ust \
+-	tools/clear/test_kernel \
+ 	tools/clear/test_live_hang.py \
+ 	tools/tracker/test_event_tracker \
+ 	tools/trigger/start-stop/test_start_stop \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index 262bea07488..a3faf1e758c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
            file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
+           file://disable-tests2.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

