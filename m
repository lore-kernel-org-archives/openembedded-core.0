Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B4ECA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:51:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.60609.1755463893973182584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZvHAbqdL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so27240305e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755463892; x=1756068692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFoULW731xF3xpPNQpheK/AcTAKNrdInEbwLOrlPmZw=;
        b=ZvHAbqdL+dCYwpTGb1XpoK0i9Iw/noxZj42xlXpPDVcBawzSQZRkpDVfUr1MIvGc2V
         Z3UPaz8Jtz57sZs3rTGhj5N2L6d09Bv/SUQws2Qoy+cePrK+gN/0R6gmua3SPv54VKHa
         4X4vidjrjNJKFmPK9K2pwUv8UL77o8criSN0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463892; x=1756068692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFoULW731xF3xpPNQpheK/AcTAKNrdInEbwLOrlPmZw=;
        b=ZiAqrQBPbY895YkLLK+nhOrp6aARB+EhEaw1sBLlNEQat69QxIN7CwvmZdF9duNoGJ
         OOMN/WekgeF6dbFmrZG1DaDC01IQEocH6KoS4tavGjbjov0LMIBlWSXNfZNNpd9vHjJw
         6MIqBa6kZffm0yoDJvPauHyFxOHSwIevB76GRdOiZNFdMUto6/O4b+jDNPNnlZg0phjz
         2x754Bevl6sW0bFtUTBaWKWEvwuLMbxVhVC7kbW6eYhTGyc29uwJ1qvD177ggbTuEoUf
         FDnaRRY75AFhX0sawW1IpZZjm4BbszPV9T0TKh2mlJP8O0ssZ1yPwoVCbk2GaIgXjip1
         3zrA==
X-Gm-Message-State: AOJu0Yz/A5DtMYkZ2Bg8u1/OPcMEUvPyW6VvEfC6Ael65UvPJMzAj0v7
	liNI1/yvr9XbXKdrgEOUmZLaf9587+tepMsNCeKkWPQ6czdpqbpSK/omeBwr2ep3NdytvlwpF12
	JF6gC
X-Gm-Gg: ASbGnct/GSeTBttWp149brfT6rulgpO150ATngEuMUEDxfdFc/vCdknrzxbij7WosuF
	s0gtMiAlzT31igO4l2gVoJsmnjY6NJS40h1nzpfKAKkYRI74pASmAzPv7uWP07/RoXuPf9lcc6/
	/I8DgHizapADR9h36aql00SmIja8ui5ggLCRpGZEJBO8hJ1CMT2cVrK/Sa6TC95UUwvceiamXBA
	c675KZWMLaYQq5Bw+Z3oj7GqW3zlegItXleibxgYYXBh7yA0xqFUgiHeTuNMmQZd7SHu2tT4cUf
	by5ID2cqpAe6L2r+KPXH3pYKZkIGWHoUUcKG9O/RieWVgY0fQ4hqo+C4UJ5jHIIoSPxDOQjLB30
	7+Vlj0vdrJSR6de+OeIo7GnPYx9ui/rF6KHTPqIGcitAalJOupBquRk9a9Dkmfw==
X-Google-Smtp-Source: AGHT+IHeyh1lvWcqxkeg0IrKUGgdjBKXdzzjsbY8CZhpVpIHOuef53ApWWnYv/4hkEQtJCbBkroz2g==
X-Received: by 2002:a05:600c:6610:b0:456:1d4e:c127 with SMTP id 5b1f17b1804b1-45a252817f0mr47734355e9.8.1755463891996;
        Sun, 17 Aug 2025 13:51:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:128f:f0b2:1625:2f99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6ce764sm143284475e9.10.2025.08.17.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:51:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH 5/5] lttng-tools: Remove the scope resolution operator
Date: Sun, 17 Aug 2025 21:51:19 +0100
Message-ID: <20250817205124.3384337-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
References: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222025

From: Mingli Yu <mingli.yu@windriver.com>

Remove the scope resolution operator :: to fix the below build failure.
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
 |    18 |                 int flags = ::EFD_CLOEXEC;
 |       |                               ^~~~~~~~~~~
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
 |    21 |                         flags |= ::EFD_SEMAPHORE;
 |       |

(From OE-Core rev: db98c8943dde49bad30f24a58dcb5441ecf7e709)

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
index b746d3b6ca2..03266db462e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
+           file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

