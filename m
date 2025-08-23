Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAB6CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:04:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3947.1755979450310811957
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W10tVGUn;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7704799d798so312723b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755979449; x=1756584249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9D4vk/fgp0XDMWiRHRj2bVfLOu76Njg+ikzEDbPtI4=;
        b=W10tVGUnJTVMX1UxnLLEocClIYB2nLNxKww72kTsS19Xi9j+29ZnRzghk+nTug82B/
         /MHdwd1L5rNed4VpIUTAbhaTW/deWTiFH2/GtN/RFhTYVTt6Ob8PdZ+mEx44uYMTYrBq
         aYO5TFYu4X5o6agbURB4PfgXBpN44Jj8ooCaJPH6SJqJ2XS5CK+JkmnJDtejaUZad8Ls
         Ki0I9+xdkEQjfFnLW7f48nAUuFzsodfO34pom6bO6NFKBLuSA/Oa9WLJ+IVnnmjPt1J0
         LDkJdE/LRDg5dvzMroCJL0g1aOYcapsN0MKPMrfZV11F+YGIu3v0l4EsJG39Y4mVD95a
         yTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755979449; x=1756584249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9D4vk/fgp0XDMWiRHRj2bVfLOu76Njg+ikzEDbPtI4=;
        b=R3sWsIbY9Kk7/SSEgoK0jHDJEuDtPIrkWipHclgLwJhTfSf7qHgCamMy0uHosgufkk
         epZrN5NfrIo3aFUFWe2RZZI04Pj+o2jdkNfjcri1D5aBiYxhmKCacPTLqLkzhLQ+4jXS
         2urwIpTT4dwz0zTSNm38fDmaraasH2/oLbgAaXogwQTziY2NTyUQ5lnWbCZPuhSzYAc0
         vVnsLmC9HM1wJRi8KqSC+wjZOo3iZNHCLODacugC9kkS/90rEOoDTKanfFhi/rxXIpUP
         UR/6la98QxM2dbBF8FHyJ9eymEZgef86u42P93xSP4drw0m2HW28Ny/rzrrf2cvp7C3b
         SmpA==
X-Gm-Message-State: AOJu0Yx7RaCDfdJS9Tvff+5q917WyRtwPiB4V43GVVCk19Wh2ue5PCNR
	T9CCzhuT2wAb9YvYY/m9Af33LLJ/N4dcf52iKnSlZRgpetUEfoaehWiGQk9O5gjb
X-Gm-Gg: ASbGnctUAFBCF77oYf/azvLAzI1QNCagalMLYhYKtAcJ/eO/QSlQ66uVmSioAxJG83y
	D79X7Zxxdhodiy86u18JauWcmIbIwIwZwceyzDwDTiGLiBch1fQ4CSeIJGIYSNKXTqHUb6lrqHK
	hS/SHJApIJLqZlcT+Mxj1epVvL0tkkg8Gjs2tCQXrvg2gDPnweLttuMxigX0AonSPVVMtcYGCpe
	dkTYPxErrsFjX6W0DZVmGLZtbkHeBh1CJt7KU+UeeYRCq2FziPCYdTqzSsQE8/5OdoRZcN+Kelo
	8BzbSGB4Twj+LLbKyV55eTsloTt9RALejQUDNPvJsWTZHJhELkFvtrllvY+j4gbwEBvSVnrZ4bd
	kVNLirNzx+ndm6UNtHCsp10l7GpKbHzBuPuGb6PGLEc5XUC3YokVS1iVVKDRVhdMUCX6qr/noIm
	kwCGw4ETkpJkCyxpTBKQr173EEZSXrIBB9GCj+kgo=
X-Google-Smtp-Source: AGHT+IHT+9f7uDP6i9RXLZkwPlsvuw/3rj3sdWmZor87uyF0yTJ3xTFzLJbykWfaMjwbDbJAoiFV/g==
X-Received: by 2002:a05:6a20:3949:b0:240:cd6:a922 with SMTP id adf61e73a8af0-24340d2d846mr11767842637.37.1755979449310;
        Sat, 23 Aug 2025 13:04:09 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214effsm3201153b3a.84.2025.08.23.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:04:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] lttng-tools: fix unix socket high FD count test
Date: Sat, 23 Aug 2025 13:04:05 -0700
Message-ID: <20250823200405.680409-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823200405.680409-1-raj.khem@gmail.com>
References: <20250823200405.680409-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222350

Fixes ptest failure on musl

                'ERROR: Exited from signal Killed (9)\n'
                'DURATION: 663\n'}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-tools/test.patch              | 22 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/test.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/test.patch b/meta/recipes-kernel/lttng/lttng-tools/test.patch
new file mode 100644
index 00000000000..99d99369637
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/test.patch
@@ -0,0 +1,22 @@
+tests: fix unix socket high FD count test off-by-one
+
+The HIGH_FD_COUNT macro in test_unix_socket.cpp was set equal to
+LTTCOMM_MAX_SEND_FDS, which could cause the test to exceed the
+maximum allowed number of file descriptors. Adjust it to
+LTTCOMM_MAX_SEND_FDS - 1 to avoid hitting the limit and ensure the
+test remains valid.
+
+Upstream-Status: Inappropriate [Musl-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/tests/unit/test_unix_socket.cpp
++++ b/tests/unit/test_unix_socket.cpp
+@@ -25,7 +25,7 @@
+ #include <tap/tap.h>
+ #include <unistd.h>
+ 
+-#define HIGH_FD_COUNT		LTTCOMM_MAX_SEND_FDS
++#define HIGH_FD_COUNT		LTTCOMM_MAX_SEND_FDS - 1
+ #define MESSAGE_COUNT		4
+ #define LARGE_PAYLOAD_SIZE	(4 * 1024)
+ #define LARGE_PAYLOAD_RECV_SIZE 100
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index 49575ef57cd..6f3fba1d735 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests2.patch \
            file://0001-liblttng-ctl-drop-index-allocator-symbols-from-versi.patch \
            file://libc++.patch \
+           file://test.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"

