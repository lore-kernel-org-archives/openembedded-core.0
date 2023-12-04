Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99050C46CA3
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 18:24:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77579.1701714263369588250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 10:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2114B1650;
	Mon,  4 Dec 2023 10:25:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 682383F5A1;
	Mon,  4 Dec 2023 10:24:22 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] oeqa/runtime/parselogs: migrate ignores
Date: Mon,  4 Dec 2023 18:24:18 +0000
Message-Id: <20231204182419.2455488-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204182419.2455488-1-ross.burton@arm.com>
References: <20231204182419.2455488-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 18:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191766

From: Ross Burton <ross.burton@arm.com>

Move the ignores from a huge dict in the parselogs.py module to .txt
files. This is just the common, tune, and qemu machine ignores; the
machine ignores that are not in oe-core will be added to the relevant
layers.

The list of ignores has not been reviewed in any meaningful way, this
should be done soon as I suspect a number of these are redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cases/parselogs-ignores-common.txt        |  59 ++++++
 .../cases/parselogs-ignores-mipsarch.txt      |   2 +
 .../cases/parselogs-ignores-qemuall.txt       |  27 +++
 .../cases/parselogs-ignores-qemuarm64.txt     |   6 +
 .../cases/parselogs-ignores-qemuarmv5.txt     |  15 ++
 .../cases/parselogs-ignores-qemuppc.txt       |   6 +
 .../cases/parselogs-ignores-qemuppc64.txt     |   4 +
 .../cases/parselogs-ignores-qemux86.txt       |   2 +
 .../runtime/cases/parselogs-ignores-x86.txt   |  10 +
 .../cases/parselogs-ignores-x86_64.txt        |   1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      | 180 ------------------
 11 files changed, 132 insertions(+), 180 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-common.=
txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarc=
h.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm=
64.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm=
v5.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc=
64.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemux86=
.txt
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-x86.txt
 create mode 120000 meta/lib/oeqa/runtime/cases/parselogs-ignores-x86_64.=
txt

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt b/m=
eta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
new file mode 100644
index 00000000000..14f8c0d4949
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
@@ -0,0 +1,59 @@
+# Xserver explains what the short codes mean
+(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
+
+# Xserver warns if compiled with ACPI but no acpid running
+Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
+
+# Some machines (eg qemux86) don't enable PAE (they probably should thou=
gh)
+NX (Execute Disable) protection cannot be enabled: non-PAE kernel!
+
+# Connman's pacrunner warns if external connectivity isn't available
+Failed to find URL:http://ipv4.connman.net/online/status.html
+Failed to find URL:http://ipv6.connman.net/online/status.html
+
+# These should be reviewed to see if they are still needed
+dma timeout
+can\'t add hid device:
+usbhid: probe of
+_OSC failed (AE_ERROR)
+_OSC failed (AE_SUPPORT)
+AE_ALREADY_EXISTS
+ACPI _OSC request failed (AE_SUPPORT)
+can\'t disable ASPM
+Failed to load module "vesa"
+Failed to load module "modesetting"
+Failed to load module "glx"
+Failed to load module "fbdev"
+Failed to load module "ati"
+[drm] Cannot find any crtc or sizes
+_OSC failed (AE_NOT_FOUND); disabling ASPM
+hd.: possibly failed opcode
+NETLINK INITIALIZATION FAILED
+kernel: Cannot find map file
+omap_hwmod: debugss: _wait_target_disable failed
+VGA arbiter: cannot open kernel arbiter, no multi-card support
+Online check failed for
+netlink init failed
+Fast TSC calibration
+controller can't do DEVSLP, turning off
+stmmac_dvr_probe: warning: cannot get CSR clock
+error: couldn\'t mount because of unsupported optional features
+GPT: Use GNU Parted to correct GPT errors
+Cannot set xattr user.Librepo.DownloadInProgress
+Failed to read /var/lib/nfs/statd/state: Success
+error retry time-out =3D
+logind: cannot setup systemd-logind helper (-61), using legacy fallback
+Failed to rename network interface
+Failed to process device, ignoring: Device or resource busy
+Cannot find a map file
+[rdrand]: Initialization Failed
+[rndr  ]: Initialization Failed
+[pulseaudio] authkey.c: Failed to open cookie file
+[pulseaudio] authkey.c: Failed to load authentication key
+was skipped because of a failed condition check
+was skipped because all trigger condition checks failed
+xf86OpenConsole: Switching VT failed
+Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Operation =
not supported
+Failed to read LoaderEntryOneShot variable, ignoring: Operation not supp=
orted
+Direct firmware load for regulatory.db
+failed to load regulatory.db
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt b=
/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
new file mode 100644
index 00000000000..2c0bd9a2477
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
@@ -0,0 +1,2 @@
+# These should be reviewed to see if they are still needed
+cacheinfo: Failed to find cpu0 device node
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/=
meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
new file mode 100644
index 00000000000..b0c0fc9ddf4
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
@@ -0,0 +1,27 @@
+# psplash
+FBIOPUT_VSCREENINFO failed, double buffering disabled
+
+# PCI host bridge to bus 0000:00
+# pci_bus 0000:00: root bus resource [mem 0x10000000-0x17ffffff]
+# pci_bus 0000:00: root bus resource [io  0x1000-0x1fffff]
+# pci_bus 0000:00: No busn resource found for root bus, will use [bus 00=
-ff]
+# pci 0000:00:00.0: [2046:ab11] type 00 class 0x100000
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
+# pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
+invalid BAR (can't size)
+
+# These should be reviewed to see if they are still needed
+wrong ELF class
+fail to add MMCONFIG information, can't access extended PCI configuratio=
n space under this bridge
+can't claim BAR
+amd_nb: Cannot enumerate AMD northbridges
+tsc: HPET/PMTIMER calibration failed
+modeset(0): Failed to initialize the DRI2 extension
+glamor initialization failed
+blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)
+floppy: error
+failed to IDENTIFY (I/O error, err_mask=3D0x4)
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
new file mode 100644
index 00000000000..260cdde6207
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64.txt
@@ -0,0 +1,6 @@
+# These should be reviewed to see if they are still needed
+Fatal server error:
+(EE) Server terminated with error (1). Closing log file.
+dmi: Firmware registration failed.
+irq: type mismatch, failed to map hwirq-27 for /intc
+logind: failed to get session seat
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt
new file mode 100644
index 00000000000..e5d526be21d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt
@@ -0,0 +1,15 @@
+# These should be reviewed to see if they are still needed
+mmci-pl18x: probe of fpga:05 failed with error -22
+mmci-pl18x: probe of fpga:0b failed with error -22
+OF: amba_device_add() failed (-19) for /amba/smc@10100000
+OF: amba_device_add() failed (-19) for /amba/mpmc@10110000
+OF: amba_device_add() failed (-19) for /amba/sctl@101e0000
+OF: amba_device_add() failed (-19) for /amba/watchdog@101e1000
+OF: amba_device_add() failed (-19) for /amba/sci@101f0000
+OF: amba_device_add() failed (-19) for /amba/spi@101f4000
+OF: amba_device_add() failed (-19) for /amba/ssp@101f4000
+OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000
+Failed to initialize '/amba/timer@101e3000': -22
+jitterentropy: Initialization failed with host not compliant with requir=
ements: 2
+clcd-pl11x: probe of 10120000.display failed with error -2
+arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc.txt b/=
meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc.txt
new file mode 100644
index 00000000000..d9b58b58f19
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc.txt
@@ -0,0 +1,6 @@
+# These should be reviewed to see if they are still needed
+PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
+host side 80-wire cable detection failed, limiting max speed
+mode "640x480" test failed
+can't handle BAR above 4GB
+Cannot reserve Legacy IO
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc64.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc64.txt
new file mode 100644
index 00000000000..b736a2aeb7a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuppc64.txt
@@ -0,0 +1,4 @@
+# These should be reviewed to see if they are still needed
+vio vio: uevent: failed to send synthetic uevent
+synth uevent: /devices/vio: failed to send uevent
+PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemux86.txt b/=
meta/lib/oeqa/runtime/cases/parselogs-ignores-qemux86.txt
new file mode 100644
index 00000000000..ebb76f12211
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemux86.txt
@@ -0,0 +1,2 @@
+# These should be reviewed to see if they are still needed
+Failed to access perfctr msr (MSR
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-x86.txt b/meta=
/lib/oeqa/runtime/cases/parselogs-ignores-x86.txt
new file mode 100644
index 00000000000..5985247daf8
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-x86.txt
@@ -0,0 +1,10 @@
+# These should be reviewed to see if they are still needed
+[drm:psb_do_init] *ERROR* Debug is
+wrong ELF class
+Could not enable PowerButton event
+probe of LNXPWRBN:00 failed with error -22
+pmd_set_huge: Cannot satisfy
+failed to setup card detect gpio
+amd_nb: Cannot enumerate AMD northbridges
+failed to retrieve link info, disabling eDP
+Direct firmware load for iwlwifi
diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-x86_64.txt b/m=
eta/lib/oeqa/runtime/cases/parselogs-ignores-x86_64.txt
new file mode 120000
index 00000000000..404e384c32c
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-x86_64.txt
@@ -0,0 +1 @@
+parselogs-ignores-x86.txt
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index 5527ebd271c..6966923c94d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -12,186 +12,6 @@ from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
=20
-common_errors =3D [
-    "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
-    "dma timeout",
-    "can\'t add hid device:",
-    "usbhid: probe of ",
-    "_OSC failed (AE_ERROR)",
-    "_OSC failed (AE_SUPPORT)",
-    "AE_ALREADY_EXISTS",
-    "ACPI _OSC request failed (AE_SUPPORT)",
-    "can\'t disable ASPM",
-    "Failed to load module \"vesa\"",
-    "Failed to load module vesa",
-    "Failed to load module \"modesetting\"",
-    "Failed to load module modesetting",
-    "Failed to load module \"glx\"",
-    "Failed to load module \"fbdev\"",
-    "Failed to load module fbdev",
-    "Failed to load module glx",
-    "[drm] Cannot find any crtc or sizes",
-    "_OSC failed (AE_NOT_FOUND); disabling ASPM",
-    "Open ACPI failed (/var/run/acpid.socket) (No such file or directory=
)",
-    "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!"=
,
-    "hd.: possibly failed opcode",
-    'NETLINK INITIALIZATION FAILED',
-    'kernel: Cannot find map file',
-    'omap_hwmod: debugss: _wait_target_disable failed',
-    'VGA arbiter: cannot open kernel arbiter, no multi-card support',
-    'Failed to find URL:http://ipv4.connman.net/online/status.html',
-    'Online check failed for',
-    'netlink init failed',
-    'Fast TSC calibration',
-    "BAR 0-9",
-    "Failed to load module \"ati\"",
-    "controller can't do DEVSLP, turning off",
-    "stmmac_dvr_probe: warning: cannot get CSR clock",
-    "error: couldn\'t mount because of unsupported optional features",
-    "GPT: Use GNU Parted to correct GPT errors",
-    "Cannot set xattr user.Librepo.DownloadInProgress",
-    "Failed to read /var/lib/nfs/statd/state: Success",
-    "error retry time-out =3D",
-    "logind: cannot setup systemd-logind helper (-61), using legacy fall=
back",
-    "Failed to rename network interface",
-    "Failed to process device, ignoring: Device or resource busy",
-    "Cannot find a map file",
-    "[rdrand]: Initialization Failed",
-    "[rndr  ]: Initialization Failed",
-    "[pulseaudio] authkey.c: Failed to open cookie file",
-    "[pulseaudio] authkey.c: Failed to load authentication key",
-    "was skipped because of a failed condition check",
-    "was skipped because all trigger condition checks failed",
-    "xf86OpenConsole: Switching VT failed",
-    "Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Opera=
tion not supported",
-    "Failed to read LoaderEntryOneShot variable, ignoring: Operation not=
 supported",
-    "invalid BAR (can't size)",
-    ]
-
-x86_common =3D [
-    '[drm:psb_do_init] *ERROR* Debug is',
-    'wrong ELF class',
-    'Could not enable PowerButton event',
-    'probe of LNXPWRBN:00 failed with error -22',
-    'pmd_set_huge: Cannot satisfy',
-    'failed to setup card detect gpio',
-    'amd_nb: Cannot enumerate AMD northbridges',
-    'failed to retrieve link info, disabling eDP',
-    'Direct firmware load for iwlwifi',
-    'Direct firmware load for regulatory.db',
-    'failed to load regulatory.db',
-] + common_errors
-
-qemux86_common =3D [
-    'wrong ELF class',
-    "fail to add MMCONFIG information, can't access extended PCI configu=
ration space under this bridge.",
-    "can't claim BAR ",
-    'amd_nb: Cannot enumerate AMD northbridges',
-    'tsc: HPET/PMTIMER calibration failed',
-    "modeset(0): Failed to initialize the DRI2 extension",
-    "glamor initialization failed",
-    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
-    "floppy: error",
-    'failed to IDENTIFY (I/O error, err_mask=3D0x4)',
-] + common_errors
-
-ignore_errors =3D {
-    'default' : common_errors,
-    'qemux86' : [
-        'Failed to access perfctr msr (MSR',
-        ] + qemux86_common,
-    'qemux86-64' : qemux86_common,
-    'qemumips' : [
-        'Failed to load module "glx"',
-        'cacheinfo: Failed to find cpu0 device node',
-        ] + common_errors,
-    'qemumips64' : [
-        'cacheinfo: Failed to find cpu0 device node',
-         ] + common_errors,
-    'qemuppc' : [
-        'PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]',
-        'host side 80-wire cable detection failed, limiting max speed',
-        'mode "640x480" test failed',
-        'Failed to load module "glx"',
-        'can\'t handle BAR above 4GB',
-        'Cannot reserve Legacy IO',
-        ] + common_errors,
-    'qemuppc64' : [
-        'vio vio: uevent: failed to send synthetic uevent',
-        'synth uevent: /devices/vio: failed to send uevent',
-        'PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]',
-        ] + common_errors,
-    'qemuarmv5' : [
-        'mmci-pl18x: probe of fpga:05 failed with error -22',
-        'mmci-pl18x: probe of fpga:0b failed with error -22',
-        'Failed to load module "glx"',
-        'OF: amba_device_add() failed (-19) for /amba/smc@10100000',
-        'OF: amba_device_add() failed (-19) for /amba/mpmc@10110000',
-        'OF: amba_device_add() failed (-19) for /amba/sctl@101e0000',
-        'OF: amba_device_add() failed (-19) for /amba/watchdog@101e1000'=
,
-        'OF: amba_device_add() failed (-19) for /amba/sci@101f0000',
-        'OF: amba_device_add() failed (-19) for /amba/spi@101f4000',
-        'OF: amba_device_add() failed (-19) for /amba/ssp@101f4000',
-        'OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000',
-        'Failed to initialize \'/amba/timer@101e3000\': -22',
-        'jitterentropy: Initialization failed with host not compliant wi=
th requirements: 2',
-        'clcd-pl11x: probe of 10120000.display failed with error -2',
-        'arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found'
-        ] + common_errors,
-    'qemuarm64' : [
-        'Fatal server error:',
-        '(EE) Server terminated with error (1). Closing log file.',
-        'dmi: Firmware registration failed.',
-        'irq: type mismatch, failed to map hwirq-27 for /intc',
-        'logind: failed to get session seat',
-        ] + common_errors,
-    'intel-core2-32' : [
-        'ACPI: No _BQC method, cannot determine initial brightness',
-        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial =
brightness',
-        '(EE) Failed to load module "psb"',
-        '(EE) Failed to load module psb',
-        '(EE) Failed to load module "psbdrv"',
-        '(EE) Failed to load module psbdrv',
-        '(EE) open /dev/fb0: No such file or directory',
-        '(EE) AIGLX: reverting to software rendering',
-        'dmi: Firmware registration failed.',
-        'ioremap error for 0x78',
-        ] + x86_common,
-    'intel-corei7-64' : [
-        'can\'t set Max Payload Size to 256',
-        'intel_punit_ipc: can\'t request region for resource',
-        '[drm] parse error at position 4 in video mode \'efifb\'',
-        'ACPI Error: Could not enable RealTimeClock event',
-        'ACPI Warning: Could not enable fixed event - RealTimeClock',
-        'hci_intel INT33E1:00: Unable to retrieve gpio',
-        'hci_intel: probe of INT33E1:00 failed',
-        'can\'t derive routing for PCI INT A',
-        'failed to read out thermal zone',
-        'Bluetooth: hci0: Setting Intel event mask failed',
-        'ttyS2 - failed to request DMA',
-        'Bluetooth: hci0: Failed to send firmware data (-38)',
-        'atkbd serio0: Failed to enable keyboard on isa0060/serio0',
-        ] + x86_common,
-    'genericx86' : x86_common,
-    'genericx86-64' : [
-        'Direct firmware load for i915',
-        'Failed to load firmware i915',
-        'Failed to fetch GuC',
-        'Failed to initialize GuC',
-        'Failed to load DMC firmware',
-        'The driver is built-in, so to load the firmware you need to',
-        ] + x86_common,
-    'beaglebone-yocto' : [
-        'Direct firmware load for regulatory.db',
-        'failed to load regulatory.db',
-        'l4_wkup_cm',
-        'Failed to load module "glx"',
-        'Failed to make EGL context current',
-        'glamor initialization failed',
-        ] + common_errors,
-}
-
-
 # importlib.resources.open_text in Python <3.10 doesn't search all direc=
tories
 # when a package is split across multiple directories. Until we can rely=
 on
 # 3.10+, reimplement the searching logic.
--=20
2.34.1


