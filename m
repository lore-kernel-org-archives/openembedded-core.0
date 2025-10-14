Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5C4CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:12:58 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.4624.1760469173799275775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 12:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QOcKIdGC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20251014191246c6de0c0c5a00020746-qof0o8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251014191246c6de0c0c5a00020746
        for <openembedded-core@lists.openembedded.org>;
        Tue, 14 Oct 2025 21:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EucZL5VYP+5FciJLdoQW+1C1VYthT0l+M9P1XYut3xU=;
 b=QOcKIdGC8TaRCH4WsmO2XKnPRs4J+YsaU/mh0SCHSGTOUlbLbEkKl6gxSWY5gzJzISRP7m
 kMCmWAySx4fxkah3uE8m6CcDiZLF8eVPYpJQYyAqTu7j+ZbJI5Ac2Fz3mSCD3gjHjtFXxExb
 eQjN/VMbEQngk0QW0un9BKBaCMdss2rTMgjb2Gu6bHCNqe7Iz5ruonOpujIOOuLp6ZiyOqLb
 kfx89EwMUDo1EobEzVt4pVoVhZOPqbS5LAyf23miReNUWe4HJIcBR/KOn8OIQubNgl40BHy1
 oWkmbZVXuNc5cv8QhamZ6iasWlwmFNyVOA7Cqna3PbnMjxgl6yZyQGzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
Date: Tue, 14 Oct 2025 21:12:45 +0200
Message-Id: <20251014191245.581962-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 19:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224850

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2024-8354.
Drop patch included in (backported to) this release.

Reference:
* https://security-tracker.debian.org/tracker/CVE-2024-8354

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...native_10.0.2.bb => qemu-native_10.0.5.bb} |  0
 ...10.0.2.bb => qemu-system-native_10.0.5.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...move-deprecated-get_event_loop-calls.patch | 85 -------------------
 .../qemu/{qemu_10.0.2.bb => qemu_10.0.5.bb}   |  0
 5 files changed, 1 insertion(+), 87 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.2.bb => qemu-native_10.0.5.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.2.bb => qemu-system-native_10.0.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
 rename meta/recipes-devtools/qemu/{qemu_10.0.2.bb => qemu_10.0.5.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.5.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.5.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2ee76e9a7ce..7a2ad01cdeb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,7 +31,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
-           file://0012-Remove-deprecated-get_event_loop-calls.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -39,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "ef786f2398cb5184600f69aef4d5d691efd44576a3cff4126d38d4c6fec87759"
+SRC_URI[sha256sum] = "a98ae8f6d6190b0c8ae04f3d7af33d81ee90b04c97bad5235d48dfc4adf741ff"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
deleted file mode 100644
index 64816fe7d91..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
-From: John Snow <jsnow@redhat.com>
-Date: Tue, 13 Aug 2024 09:35:30 -0400
-Subject: [PATCH] Remove deprecated get_event_loop calls
-
-This method was deprecated in 3.12 because it ordinarily should not be
-used from coroutines; if there is not a currently running event loop,
-this automatically creates a new event loop - which is usually not what
-you want from code that would ever run in the bottom half.
-
-In our case, we do want this behavior in two places:
-
-(1) The synchronous shim, for convenience: this allows fully sync
-programs to use QEMUMonitorProtocol() without needing to set up an event
-loop beforehand. This is intentional to fully box in the async
-complexities into the legacy sync shim.
-
-(2) The qmp_tui shell; instead of relying on asyncio.run to create and
-run an asyncio program, we need to be able to pass the current asyncio
-loop to urwid setup functions. For convenience, again, we create one if
-one is not present to simplify the creation of the TUI appliance.
-
-The remaining user of get_event_loop() was in fact one of the erroneous
-users that should not have been using this function: if there's no
-running event loop inside of a coroutine, you're in big trouble :)
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/33]
-Signed-off-by: John Snow <jsnow@redhat.com>
----
- python/qemu/qmp/legacy.py  | 9 ++++++++-
- python/qemu/qmp/qmp_tui.py | 7 ++++++-
- python/tests/protocol.py   | 2 +-
- 3 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
-index 22a2b56..ea9b803 100644
---- a/python/qemu/qmp/legacy.py
-+++ b/python/qemu/qmp/legacy.py
-@@ -86,7 +86,14 @@ def __init__(self,
-                 "server argument should be False when passing a socket")
- 
-         self._qmp = QMPClient(nickname)
--        self._aloop = asyncio.get_event_loop()
-+
-+        try:
-+            self._aloop = asyncio.get_running_loop()
-+        except RuntimeError:
-+            # No running loop; since this is a sync shim likely to be
-+            # used in fully sync programs, create one if neccessary.
-+            self._aloop = asyncio.get_event_loop_policy().get_event_loop()
-+
-         self._address = address
-         self._timeout: Optional[float] = None
- 
-diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
-index 2d9ebbd..d11b9fc 100644
---- a/python/qemu/qmp/qmp_tui.py
-+++ b/python/qemu/qmp/qmp_tui.py
-@@ -377,7 +377,12 @@ def run(self, debug: bool = False) -> None:
-         screen = urwid.raw_display.Screen()
-         screen.set_terminal_properties(256)
- 
--        self.aloop = asyncio.get_event_loop()
-+        try:
-+            self.aloop = asyncio.get_running_loop()
-+        except RuntimeError:
-+            # No running asyncio event loop. Create one if necessary.
-+            self.aloop = asyncio.get_event_loop_policy().get_event_loop()
-+
-         self.aloop.set_debug(debug)
- 
-         # Gracefully handle SIGTERM and SIGINT signals
-diff --git a/python/tests/protocol.py b/python/tests/protocol.py
-index 56c4d44..8dcef57 100644
---- a/python/tests/protocol.py
-+++ b/python/tests/protocol.py
-@@ -228,7 +228,7 @@ def async_test(async_test_method):
-         Decorator; adds SetUp and TearDown to async tests.
-         """
-         async def _wrapper(self, *args, **kwargs):
--            loop = asyncio.get_event_loop()
-+            loop = asyncio.get_running_loop()
-             loop.set_debug(True)
- 
-             await self._asyncSetUp()
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.2.bb b/meta/recipes-devtools/qemu/qemu_10.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.5.bb

