Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68622CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 09:02:03 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.7406.1760173321219690774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 02:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NiUl1MUq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025101109015437d073b7a70002072a-t0xuzw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025101109015437d073b7a70002072a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 11 Oct 2025 11:01:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LL0C1Moar/L5GhYgFWAWug1WkBp+ZoCXptWkBMjUyro=;
 b=NiUl1MUq8uvfAsV7ryc4s98YPQPkoPe2Ab6rx6KyrR0an1C+dt5c/Pqu9Xe7PIQMuqqdLz
 v035lwaYi7BxzpxrM54Qw1tEhTMxq+JzMfl7JpgIkCMUjPEvdLSoVc9+oyFisYzMsR+A1rbP
 kVeYBf5FaMofcdX1NzE8x03uz/wKBVKwNXi+r5po8N8IKja3eSsKuNe0VorGfrFY8voeFhGv
 F8nRBSrop4Lo28BHSGKtIZZoO2o0Axhj/AjXgaQBSTLAE+JzRV/NDSR4VjdP7Ppn5YHQZtt9
 g+sVfIgFgSqiWPMPX+qqiDpWtWUSaMf6dXo89DkaOmMyHSrWOBNndrcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.1.1
Date: Sat, 11 Oct 2025 11:01:52 +0200
Message-Id: <20251011090152.398298-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 09:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224713

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2024-8354.
Drop patch included in (backported to) this release.
Handle new file conflict between qemu-native and qemu-system-native.

References:
* https://www.qemu.org/2025/08/26/qemu-10-1-0/
* https://wiki.qemu.org/ChangeLog/10.1
* https://security-tracker.debian.org/tracker/CVE-2024-8354

License-Update: replace FSF postal address with licenses URL
* https://github.com/qemu/qemu/commit/4db50be038a839d8332790db4d2d63ac247efad3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...native_10.0.2.bb => qemu-native_10.1.1.bb} |  0
 ...10.0.2.bb => qemu-system-native_10.1.1.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc           | 10 +--
 ...mu-Do-not-include-file-if-not-exists.patch |  2 +-
 ...er-space-mmap-tweaks-to-address-musl.patch |  2 +-
 .../qemu/0006-qemu-Determinism-fixes.patch    |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  2 +-
 ...and-the-python-venv-aren-t-used-for-.patch |  2 +-
 ...move-deprecated-get_event_loop-calls.patch | 85 -------------------
 .../qemu/qemu/fix-strerrorname_np.patch       |  2 +-
 .../qemu/{qemu_10.0.2.bb => qemu_10.1.1.bb}   |  0
 11 files changed, 12 insertions(+), 96 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.2.bb => qemu-native_10.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.2.bb => qemu-system-native_10.1.1.bb} (97%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
 rename meta/recipes-devtools/qemu/{qemu_10.0.2.bb => qemu_10.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_10.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.1.1.bb
similarity index 97%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.1.1.bb
index 22462e2499e..2e4f7328ad1 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.1.1.bb
@@ -22,6 +22,7 @@ do_install:append() {
     # The following is also installed by qemu-native
     rm -f ${D}${datadir}/qemu/trace-events-all
     rm -rf ${D}${datadir}/qemu/keymaps
+    rm -rf ${D}${datadir}/qemu/dtb
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2ee76e9a7ce..7a4ccd4d153 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -15,8 +15,8 @@ require qemu-targets.inc
 # we need a full python3-native setup
 inherit pkgconfig ptest update-rc.d systemd python3native
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a3b50d8b88dcc0eb3d7d39b760b9e821 \
+                    file://COPYING.LIB;endline=24;md5=8a8178c06478747a771588adec965232"
 
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
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
+SRC_URI[sha256sum] = "e56b93d95953a9b6a64d1985dbcedfb07dc54d92c50b7912526693536c589923"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
@@ -49,8 +48,9 @@ CVE_STATUS[CVE-2018-18438] = "disputed: The issues identified by this CVE were d
 # As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
 CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 
-# NVD DB has this CVE as version-less (with "-")
+# NVD DB has these CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+CVE_STATUS[CVE-2024-8354] = "fixed-version: this CVE is fixed since 10.1.1"
 
 CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f5..45cdf0835c8 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -19,7 +19,7 @@ diff --git a/linux-user/syscall.c b/linux-user/syscall.c
 index 8bfe4912e..d04984f66 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -118,7 +118,9 @@
+@@ -119,7 +119,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 388d11d10d2..bd494204052 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -25,7 +25,7 @@ diff --git a/linux-user/mmap.c b/linux-user/mmap.c
 index d1f36e6f1..26ccf8f4d 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1108,12 +1108,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 4690d86315f..aa682ddaa94 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -19,7 +19,7 @@ diff --git a/scripts/decodetree.py b/scripts/decodetree.py
 index e8b72da3a..5cd86b142 100644
 --- a/scripts/decodetree.py
 +++ b/scripts/decodetree.py
-@@ -1558,7 +1558,7 @@ def main():
+@@ -1559,7 +1559,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd7..347ec872939 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -12,7 +12,7 @@ diff --git a/configure b/configure
 index 02f1dd231..2c5ecd346 100755
 --- a/configure
 +++ b/configure
-@@ -983,12 +983,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -995,12 +995,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index b06020d106a..a98ed574454 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -32,7 +32,7 @@ diff --git a/configure b/configure
 index 2c5ecd346..5315ede35 100755
 --- a/configure
 +++ b/configure
-@@ -969,14 +969,14 @@ python="$(command -v "$python")"
+@@ -981,14 +981,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
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
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 1cc973443e0..2ac84f17ca3 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -23,7 +23,7 @@ diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
 index 8001ca153..79fb43f92 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1968,8 +1968,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1993,8 +1993,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.2.bb b/meta/recipes-devtools/qemu/qemu_10.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_10.1.1.bb

