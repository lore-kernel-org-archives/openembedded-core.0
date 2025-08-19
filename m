Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1779CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:17:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.10443.1755598640198129165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 03:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPmsEUxg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso5432081f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755598638; x=1756203438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwgpzjePNp0EUbZrZ6yATYm9oCo2NkRFUORtiAqiRhI=;
        b=fPmsEUxg+xaNc0f+kDfOoLJD+o6xpiziHZvWNSyYiR2G7ZuNoIvGy0VR6qmWgENelT
         umSwQ4ZYkXJC0y1zzMy+Oxw7cP/pm1HFogxGjgdNbBo7Sd02KqvA88NJfghKbQI9A2Qf
         AbtS+7g5qNDhwer7Nn3KdfXuNG5S2QrwpRgw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598638; x=1756203438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwgpzjePNp0EUbZrZ6yATYm9oCo2NkRFUORtiAqiRhI=;
        b=b47VfCLgJwVtZk3xyU+halR0wTJCGSjHAnURdrnUsormgaFI5sdn3k6tWiaJNfh6Fg
         tDb2ylEsiSrJaA6fawtzmblTLGAwPRhE+sZ45KdW96Sx/TqdUy3XrkVmxkXBnjDikpb9
         5EAQ0lNKFS05BdsQroZ4/F11lzxHUB8a/zuIHqUdmta0VXXueJLrzC/CHcJbVoUB1n8w
         TcyHLspcy1et1QttgMktBnOMW1Bhf9B7WiuctlxPqwlAG37LRoNx+cBwb3pNxA678pqR
         L9XMnHu3uXxQn6b7q7uLHg53AIYEayPpEenmVHOwKGWBJRkBP0/BYwajt2wk24iDKo6n
         pXWg==
X-Gm-Message-State: AOJu0YxtkSjjA4PEyTKrbKsY4f634yqPcaWhvo9aTvc/LeMZmDHhcE6z
	PYvkAuGuxMbdFG7H+ouWJJwwSkDIJXf4PnJhRisoaeidxjyWiXCT3+ARoB3pVsrUETc4cqCkQM/
	7La3n
X-Gm-Gg: ASbGncv+OHSMYcEwmEmQ4io3b6PpB4yHZk6vvcjDSr5S4LUlo77I2ex0aMXbsfkFPtm
	8sagb4qkPliv6nJxHCS+IqVOHYqmLh8f/m0hiqXWnvo5W2FfsODVXlcbl9ZQVuwNV6Wz+RuLc+k
	0XOay8ff08QuHX9hdKt0UoOs3GutE/MIy7KqekUdR3QuQjXDf9ZqdVarJSYX/rjhU86dAit8UiX
	Ltv6T4ksQ0GZzkN8Qt2dKXbh9qvU6DXdFOOzCBDp0xR+wKVTzWepMUBVDd/KT3+oy3zT6ZRnl8l
	UxQ1FqHShQsO4wQmE6sjT2o/rJipvM4PxR4AKi/lXqjwPhvXkczovCZuCJLdGtXNPx1w2Ky7Hko
	jf/hLzcXvG/MEtltlXy8gjx4l/8rYKHDHiBExjerxFlL/4Sp7jG1QhFjZUNf13w==
X-Google-Smtp-Source: AGHT+IGrUh6VlJfkmG9sUtlsa+QxfLfTii+vc8zsjLNrR8GWSd2InXaXLPaVKV8mgGfMSe8iC6aoeA==
X-Received: by 2002:a05:6000:2211:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3c0ea3cf100mr1421377f8f.12.1755598637788;
        Tue, 19 Aug 2025 03:17:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d5c:7b3b:65dd:ef80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3089359f8f.24.2025.08.19.03.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:17:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH v2 2/3] lttng-tools: Remove the scope resolution operator
Date: Tue, 19 Aug 2025 11:17:12 +0100
Message-ID: <20250819101714.3600601-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819101714.3600601-1-richard.purdie@linuxfoundation.org>
References: <20250819101714.3600601-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 10:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222096

From: Mingli Yu <mingli.yu@windriver.com>

Remove the scope resolution operator :: to fix the below build failure.
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
 |    18 |                 int flags = ::EFD_CLOEXEC;
 |       |                               ^~~~~~~~~~~
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
 |    21 |                         flags |= ::EFD_SEMAPHORE;
 |       |

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Remove-the-scope-resolution-operator.patch | 41 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
new file mode 100644
index 00000000000..02bd1d1db02
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
@@ -0,0 +1,41 @@
+From da83d31a8dd555c28eb27bd7a7d3c53b51d5f276 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 20 Jul 2025 16:37:57 +0800
+Subject: [PATCH] eventfd.cpp: Remove the scope resolution operator
+
+Remove the scope resolution operator :: to fix the below build failure
+with musl.
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
+ |    18 |                 int flags = ::EFD_CLOEXEC;
+ |       |                               ^~~~~~~~~~~
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
+ |    21 |                         flags |= ::EFD_SEMAPHORE;
+ |       |                                    ^~~~~~~~~~~~~
+
+Upstream-Status: Pending [The message to lttng-dev awaits moderator approval]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/common/eventfd.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
+index fe5b549..3379b0b 100644
+--- a/src/common/eventfd.cpp
++++ b/src/common/eventfd.cpp
+@@ -15,10 +15,10 @@
+ 
+ lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
+ 	file_descriptor([use_semaphore_semantics, initial_value]() {
+-		int flags = ::EFD_CLOEXEC;
++		int flags = EFD_CLOEXEC;
+ 
+ 		if (use_semaphore_semantics) {
+-			flags |= ::EFD_SEMAPHORE;
++			flags |= EFD_SEMAPHORE;
+ 		}
+ 
+ 		const auto raw_fd = ::eventfd(initial_value, flags);
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index 66fec08ff32..262bea07488 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
+           file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

