Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B388DC87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 22:31:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.50483.1753569114409522471
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jul 2025 15:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GqFBlL6n;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23fd3fe0d81so6113615ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 15:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753569113; x=1754173913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n28hO/cd8uqE9tioi+iCfpFhlHrwOKZ9/NRXFeSAxOU=;
        b=GqFBlL6nwN+cWVW9SJcMPI138IYWxm9MZMNAK2s1pjjWefOIannbAtL855EK00FneV
         n+RWmxkqhlHAH+vvqxvXZ6ZeU+c83F0rKvUbdViGqrkKJOwfBTNyzMVOe6iLHAVHTqtU
         unE/fIjUurDguyUnjIoy8V1oK64y605Avg7+a6AWzeB2KNzoDoJWrUx/R+iSa0Ys2ZUn
         rza/hDgTCkAgz39EAaMeBC5OzKtFduIlKwg+Ri/SOdxrTMlzqZJ+tVS8KMNDV1b53vJu
         ZqP/tkvBr7RmOte5HGOW5tCw5mJ8DEuo98sZ3IDnh/4KOLB+nMDb71r3GKbAhfDR+jsf
         BX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753569113; x=1754173913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n28hO/cd8uqE9tioi+iCfpFhlHrwOKZ9/NRXFeSAxOU=;
        b=pUBhs3cFcShO5RdXBLVGriwskDN75SdfmmI1iWv5oyVhW0E8w9NRbpF7MYFyU6azwS
         CKONJ9HLihSZHtKeqvPz8NknuyZpR78l+h7RSLVYVGn80jwuxZ6LQ8oto56N9v8NifDl
         RlOR85bnZ4aGNSH9ZNcJumLp9E/ywsE3gx7tY9nKjr4YLlHx1trS4Gilin/cALlkoWrw
         Ku1u/P0pEpH1OuaAWRqB9MV6ulr6wufbuZK6mcz6vxuyBtgKSpwKIv+WUVAO/deuAUQ2
         sFV0PVdvUOui6iZMUHF+Y39MGJW1fbm9qDEySKsawm0t9uoGnkMRiYuuxhS/BlBc105y
         Nm2g==
X-Gm-Message-State: AOJu0Yz/KGyDXfuR4cSEhlG+R3oX8VzBO+hF4FKo33tgLT4jQxNPbvec
	gnNM3FI4Evn25cbdFHDUQPBQu32Ri/40X+Nc7U650ZVK9FPDRKFmK6autBqSKO8d/Xk=
X-Gm-Gg: ASbGncs/X6fV2ySnKHR0iUnFn5nc861qS6m0I9/1qJ0DkOF0uKKJ1JzNqg2FtC2T4nU
	7/v8caT70IVmSBOXS78PLj6juuwAX/LCxcW9ULeC20KZeAgNxV5DequvkNkW07ygPYcTYD8xPrU
	M9i0ncOlswspMGia4MvzN8qQsIRnk0bZ7OlKCSFJBd4Ceow4ojb27aCntOr8F4bbg54/ITgiQ71
	o0J/qNX8E4kz5KV/G94xdVIoQa3YrnqFnK4JTKWkpVHoMwsMx5WA6Ckq72GjGgMOZKfgyduWaVH
	E/9geZ7QQq7NyLReJc/8g9bOqPF7tJAj5pQY/BXcvTOGBZbWD8ewI/H1rpuc62bdcKM0V3J6/vb
	JXVPH76MuTfuVJA==
X-Google-Smtp-Source: AGHT+IEHUc3Wyo624Gi+ln8de0JWJULLVNA+owdKBCJ28EsRoIjy0Bbx65j0T8/kWoRS5ZuLc1a91A==
X-Received: by 2002:a17:903:1b44:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-23fb30f2f32mr96469755ad.46.1753569113416;
        Sat, 26 Jul 2025 15:31:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30ff79sm23606405ad.9.2025.07.26.15.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 15:31:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Remove deprecated asyncio calls in qmp python module
Date: Sat, 26 Jul 2025 15:31:50 -0700
Message-ID: <20250726223150.728753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 22:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220942

Fixes deprecation warning seen with python 3.13

DEBUG: QMP Initializing to /mnt/b/yoe/master/build/tmp/.sv4_k_q4

recipe-sysroot-native/usr/lib/qemu-python/qmp/legacy.py:89: DeprecationWarning: There is no current event loop
  self._aloop = asyncio.get_event_loop()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...move-deprecated-get_event_loop-calls.patch | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7893df0df24..2ee76e9a7ce 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
+           file://0012-Remove-deprecated-get_event_loop-calls.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
new file mode 100644
index 00000000000..64816fe7d91
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -0,0 +1,85 @@
+From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From: John Snow <jsnow@redhat.com>
+Date: Tue, 13 Aug 2024 09:35:30 -0400
+Subject: [PATCH] Remove deprecated get_event_loop calls
+
+This method was deprecated in 3.12 because it ordinarily should not be
+used from coroutines; if there is not a currently running event loop,
+this automatically creates a new event loop - which is usually not what
+you want from code that would ever run in the bottom half.
+
+In our case, we do want this behavior in two places:
+
+(1) The synchronous shim, for convenience: this allows fully sync
+programs to use QEMUMonitorProtocol() without needing to set up an event
+loop beforehand. This is intentional to fully box in the async
+complexities into the legacy sync shim.
+
+(2) The qmp_tui shell; instead of relying on asyncio.run to create and
+run an asyncio program, we need to be able to pass the current asyncio
+loop to urwid setup functions. For convenience, again, we create one if
+one is not present to simplify the creation of the TUI appliance.
+
+The remaining user of get_event_loop() was in fact one of the erroneous
+users that should not have been using this function: if there's no
+running event loop inside of a coroutine, you're in big trouble :)
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/33]
+Signed-off-by: John Snow <jsnow@redhat.com>
+---
+ python/qemu/qmp/legacy.py  | 9 ++++++++-
+ python/qemu/qmp/qmp_tui.py | 7 ++++++-
+ python/tests/protocol.py   | 2 +-
+ 3 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
+index 22a2b56..ea9b803 100644
+--- a/python/qemu/qmp/legacy.py
++++ b/python/qemu/qmp/legacy.py
+@@ -86,7 +86,14 @@ def __init__(self,
+                 "server argument should be False when passing a socket")
+ 
+         self._qmp = QMPClient(nickname)
+-        self._aloop = asyncio.get_event_loop()
++
++        try:
++            self._aloop = asyncio.get_running_loop()
++        except RuntimeError:
++            # No running loop; since this is a sync shim likely to be
++            # used in fully sync programs, create one if neccessary.
++            self._aloop = asyncio.get_event_loop_policy().get_event_loop()
++
+         self._address = address
+         self._timeout: Optional[float] = None
+ 
+diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
+index 2d9ebbd..d11b9fc 100644
+--- a/python/qemu/qmp/qmp_tui.py
++++ b/python/qemu/qmp/qmp_tui.py
+@@ -377,7 +377,12 @@ def run(self, debug: bool = False) -> None:
+         screen = urwid.raw_display.Screen()
+         screen.set_terminal_properties(256)
+ 
+-        self.aloop = asyncio.get_event_loop()
++        try:
++            self.aloop = asyncio.get_running_loop()
++        except RuntimeError:
++            # No running asyncio event loop. Create one if necessary.
++            self.aloop = asyncio.get_event_loop_policy().get_event_loop()
++
+         self.aloop.set_debug(debug)
+ 
+         # Gracefully handle SIGTERM and SIGINT signals
+diff --git a/python/tests/protocol.py b/python/tests/protocol.py
+index 56c4d44..8dcef57 100644
+--- a/python/tests/protocol.py
++++ b/python/tests/protocol.py
+@@ -228,7 +228,7 @@ def async_test(async_test_method):
+         Decorator; adds SetUp and TearDown to async tests.
+         """
+         async def _wrapper(self, *args, **kwargs):
+-            loop = asyncio.get_event_loop()
++            loop = asyncio.get_running_loop()
+             loop.set_debug(True)
+ 
+             await self._asyncSetUp()

