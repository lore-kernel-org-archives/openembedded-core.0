Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5511.1792563744275085367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jTPz/4GK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VZxiq/lZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a15d2009d3-8744882a-fb45-4267-96fc-ab29c5d67fae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hoTHPh8i8U1w02lXA7+PgpdGH/FaWn7AffwOvsW5Fus=;
	b=jTPz/4GKYuF6NyJZHrTuJ+aVqgmZn9PJxsvROVOeHgo5FJswZfHqeD93vFdopDif
	XHFXzYQSk3lYoUPOP/HtxY7R6rHvguiN3D/eA819Cw+PH3qtsOTJMMPfG21+2xx10fb
	tZRsTIyjfY70gfFX6w11x2ahpFUncOxUMiIV+C7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hoTHPh8i8U1w02lXA7+PgpdGH/FaWn7AffwOvsW5Fus=;
	b=VZxiq/lZheZskknP0kWcicDgrM3aVHHS3w4iX5rhlqslnHQ+Xrb94UmAc31jawUW
	fatJ8ssSwWJwhn0H8uOxHkiNLVLBDbgVT/85mqM6rbRSz2anIZuaDhMMyrrpe2kgLbE
	padNB28KoPXPlAN0wcfEkxdh8Te8gua7LguD6+lg=
Content-Type: multipart/mixed; boundary="===============8173083203722294339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.10.0 SUCCEEDED
Message-ID: <010101a15d2009d3-8744882a-fb45-4267-96fc-ab29c5d67fae-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248353

--===============8173083203722294339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.09.0-2026.10.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 45a2d32a19feebea74dd96a40bc7fbaa7ee032c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 05:16:42 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.09.0 -> 2026.10.0

Release v2025.01.0
==================

Layerscape
----------

Support for the NXP-specific PPA Secure Monitor has been removed in
favor of ARM Trusted Firmware-A as the former has been long unmaintained.

I2C Adapter numbering
---------------------

``i2c0`` to ``i2c31`` are now reserved for I2C adapters with device tree
aliases. Do not rely on a fixed numbering for other non-aliased adapters.

OP-TEE for Rockchip
-------------------

The BL32 firmware images are now called ``firmware/rk3XXX-bl32.bin``
instead of ``firmware/rk3XXX-op-tee.bin``. Raw OP-TEE binaries without
a header now use the load address the vendor blobs are hardcoded to
run at instead of the previous ``0x200000``. To override, use an OP-TEE
image with a header specifying the correct load address.

TFTP
----

The default TFTP window size has been reverted to 1 as many network
drivers couldn't cope with the increased throughput.
This can be reverted by setting ``CONFIG_FS_TFTP_MAX_WINDOW_SIZE``
or at runtime via the
:ref:`global.tftp.windowsize <magicvar_global_tftp_windowsize>` variable.

Release v2025.02.0
==================

Environment Auto-Probe
----------------------

A new magic variable ``global.env.autoprobe``
now controls whether barebox
will automatically probe known block devices for a GPT barebox environment
partition if no environment was specified by other means.

The variable defaults to ``0`` (false) if ``CONFIG_INSECURE`` is disabled.

The most secure option remains disabling ``CONFIG_ENV_HANDLING`` completely
or, starting with v2025.10.0, using the security policy support for runtime
access control.

Zynq 7000
---------

The MMC controller numbering is now fixed: ``mmc0`` & ``mmc1`` for
``&sdhci0`` and ``&sdhci1`` respectively.

Release v2025.03.0
==================

OMAP console fixup
------------------

The option ``CONFIG_DRIVER_SERIAL_NS16550_OMAP_TTYS`` now controls whether
barebox fixes up ``ttyS`` or ``ttyO`` into the kernel command line
``console=`` option.

fixed-partitions on SD/MMC
--------------------------

Linux v6.13-rc1 added ``CONFIG_OF_PARTITION``, which interprets
``fixed-partitions`` nodes in SD/MMC nodes differently to the barebox
behavior: It ignores the GPT/MBR if fixed-partitions are specified,
instead of allowing them to co-exist like in barebox.

To accommodate both the existing barebox and the new kernel functionality,
users should replace ``fixed-partitions``-compatible device tree subnodes
of SD/eMMC with ``barebox,fixed-partitions``.

Similarly, the default for
:ref:`global.of_partition_binding <magicvar_global_of_partition_binding>`
has been changed to the new ``adaptive`` option, which fixes up
``barebox,fixed-partitions`` except for MTD.

Release v2025.05.0
==================

Configuration options
---------------------

  This can be customized via setting the
  :ref:`global.linux.rootwait <magicvar_global_linux_rootwait>`
  variable or by disabling the option.

Bootloader Specification
------------------------

  Previously only the first partition with the XBOOTLDR partition type
  was considered.

  If an XBOOTLDR partition exists, barebox will no longer walk
  all partitions to find further
  bootloader spec entries.

Board support
-------------

  Users should migrate to FIP images with barebox as nontrusted firmware
  (BL33) and the barebox device tree as hardware config.

  Use of multiple device trees is not supported directly by the FIP format
  and can be substituted by a barebox image embedding multiple device trees
  and using the hardware config FIP slot only as dummy.
  See the lxa-tac board for an example.

Shell and magic variables
-------------------------

  This does not affect users setting ``nv boot.default``, but for
  others, barebox will look for bootloader spec on the bootsource
  medium first.

Build system
------------

Bisectability
-------------

Following regressions had a wider impact and could falsify git bisect results:

Release v2025.08.0
==================

W^X on ARM
----------

``CONFIG_ARM_MMU_PERMISSIONS=y`` is now the default and instructs barebox to map
its memory regions with more restricted permissions: Data is no longer
executable
and code as well as read-only data is no longer writable.

This can lead to breakage in code that had invalid assumptions beforehand,
e.g. code expecting on-chip SRAMs to be executable or bogus code casting away
const. Please report to upstream any issues that are resolved by disabling
``CONFIG_ARM_MMU_PERMISSIONS``, so they can be properly fixed.

Bootchooser
-----------

Bootchooser now interprets a top-level ``attempts_locked`` variable.
For more information, see :ref:`attempts lock feature
<bootchooser,attempts_lock>`.

Board support
-------------

The hardcoded Vexpress partition layout for barebox, its environment and state
has been changed. The first 5M of the NOR flash should now be reserved for
barebox use. barebox will, by default, fix up the new partition layout into
the kernel device tree.

Release v2025.09

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index d94798193b..3165bef42f 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.09.0"
+PV = "2026.10.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "491b504c8a79b5a4e30c419b824916b7329bad8abfe34987ba066bafa1fbcfc5"
+SRC_URI[sha256sum] = "4d6f3beb73417004ffb9b8584b54cca71141722e189fe5fd2c3188b1c2f4d5d3"
-- 
2.47.1


--===============8173083203722294339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 136656 to 136984 (+0%)
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.09.0" to "2026.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.09.0 [default] to 2026.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.09.0.tar.bz2" to "https://barebox.org/download/barebox-2026.10.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.09.0" to "2026.10.0"

--===============8173083203722294339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.09.0-2026.10.0.patch"

RnJvbSA0NWEyZDMyYTE5ZmVlYmVhNzRkZDk2YTQwYmM3ZmJhYTdlZTAzMmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDU6MTY6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDkuMCAtPiAyMDI2LjEwLjAKClJlbGVhc2UgdjIw
MjUuMDEuMAo9PT09PT09PT09PT09PT09PT0KCkxheWVyc2NhcGUKLS0tLS0tLS0tLQoKU3VwcG9y
dCBmb3IgdGhlIE5YUC1zcGVjaWZpYyBQUEEgU2VjdXJlIE1vbml0b3IgaGFzIGJlZW4gcmVtb3Zl
ZCBpbgpmYXZvciBvZiBBUk0gVHJ1c3RlZCBGaXJtd2FyZS1BIGFzIHRoZSBmb3JtZXIgaGFzIGJl
ZW4gbG9uZyB1bm1haW50YWluZWQuCgpJMkMgQWRhcHRlciBudW1iZXJpbmcKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCgpgYGkyYzBgYCB0byBgYGkyYzMxYGAgYXJlIG5vdyByZXNlcnZlZCBmb3IgSTJD
IGFkYXB0ZXJzIHdpdGggZGV2aWNlIHRyZWUKYWxpYXNlcy4gRG8gbm90IHJlbHkgb24gYSBmaXhl
ZCBudW1iZXJpbmcgZm9yIG90aGVyIG5vbi1hbGlhc2VkIGFkYXB0ZXJzLgoKT1AtVEVFIGZvciBS
b2NrY2hpcAotLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGUgQkwzMiBmaXJtd2FyZSBpbWFnZXMgYXJl
IG5vdyBjYWxsZWQgYGBmaXJtd2FyZS9yazNYWFgtYmwzMi5iaW5gYAppbnN0ZWFkIG9mIGBgZmly
bXdhcmUvcmszWFhYLW9wLXRlZS5iaW5gYC4gUmF3IE9QLVRFRSBiaW5hcmllcyB3aXRob3V0CmEg
aGVhZGVyIG5vdyB1c2UgdGhlIGxvYWQgYWRkcmVzcyB0aGUgdmVuZG9yIGJsb2JzIGFyZSBoYXJk
Y29kZWQgdG8KcnVuIGF0IGluc3RlYWQgb2YgdGhlIHByZXZpb3VzIGBgMHgyMDAwMDBgYC4gVG8g
b3ZlcnJpZGUsIHVzZSBhbiBPUC1URUUKaW1hZ2Ugd2l0aCBhIGhlYWRlciBzcGVjaWZ5aW5nIHRo
ZSBjb3JyZWN0IGxvYWQgYWRkcmVzcy4KClRGVFAKLS0tLQoKVGhlIGRlZmF1bHQgVEZUUCB3aW5k
b3cgc2l6ZSBoYXMgYmVlbiByZXZlcnRlZCB0byAxIGFzIG1hbnkgbmV0d29yawpkcml2ZXJzIGNv
dWxkbid0IGNvcGUgd2l0aCB0aGUgaW5jcmVhc2VkIHRocm91Z2hwdXQuClRoaXMgY2FuIGJlIHJl
dmVydGVkIGJ5IHNldHRpbmcgYGBDT05GSUdfRlNfVEZUUF9NQVhfV0lORE9XX1NJWkVgYApvciBh
dCBydW50aW1lIHZpYSB0aGUKOnJlZjpgZ2xvYmFsLnRmdHAud2luZG93c2l6ZSA8bWFnaWN2YXJf
Z2xvYmFsX3RmdHBfd2luZG93c2l6ZT5gIHZhcmlhYmxlLgoKUmVsZWFzZSB2MjAyNS4wMi4wCj09
PT09PT09PT09PT09PT09PQoKRW52aXJvbm1lbnQgQXV0by1Qcm9iZQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCgpBIG5ldyBtYWdpYyB2YXJpYWJsZSBgYGdsb2JhbC5lbnYuYXV0b3Byb2JlYGAKbm93
IGNvbnRyb2xzIHdoZXRoZXIgYmFyZWJveAp3aWxsIGF1dG9tYXRpY2FsbHkgcHJvYmUga25vd24g
YmxvY2sgZGV2aWNlcyBmb3IgYSBHUFQgYmFyZWJveCBlbnZpcm9ubWVudApwYXJ0aXRpb24gaWYg
bm8gZW52aXJvbm1lbnQgd2FzIHNwZWNpZmllZCBieSBvdGhlciBtZWFucy4KClRoZSB2YXJpYWJs
ZSBkZWZhdWx0cyB0byBgYDBgYCAoZmFsc2UpIGlmIGBgQ09ORklHX0lOU0VDVVJFYGAgaXMgZGlz
YWJsZWQuCgpUaGUgbW9zdCBzZWN1cmUgb3B0aW9uIHJlbWFpbnMgZGlzYWJsaW5nIGBgQ09ORklH
X0VOVl9IQU5ETElOR2BgIGNvbXBsZXRlbHkKb3IsIHN0YXJ0aW5nIHdpdGggdjIwMjUuMTAuMCwg
dXNpbmcgdGhlIHNlY3VyaXR5IHBvbGljeSBzdXBwb3J0IGZvciBydW50aW1lCmFjY2VzcyBjb250
cm9sLgoKWnlucSA3MDAwCi0tLS0tLS0tLQoKVGhlIE1NQyBjb250cm9sbGVyIG51bWJlcmluZyBp
cyBub3cgZml4ZWQ6IGBgbW1jMGBgICYgYGBtbWMxYGAgZm9yCmBgJnNkaGNpMGBgIGFuZCBgYCZz
ZGhjaTFgYCByZXNwZWN0aXZlbHkuCgpSZWxlYXNlIHYyMDI1LjAzLjAKPT09PT09PT09PT09PT09
PT09CgpPTUFQIGNvbnNvbGUgZml4dXAKLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGUgb3B0aW9uIGBg
Q09ORklHX0RSSVZFUl9TRVJJQUxfTlMxNjU1MF9PTUFQX1RUWVNgYCBub3cgY29udHJvbHMgd2hl
dGhlcgpiYXJlYm94IGZpeGVzIHVwIGBgdHR5U2BgIG9yIGBgdHR5T2BgIGludG8gdGhlIGtlcm5l
bCBjb21tYW5kIGxpbmUKYGBjb25zb2xlPWBgIG9wdGlvbi4KCmZpeGVkLXBhcnRpdGlvbnMgb24g
U0QvTU1DCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpMaW51eCB2Ni4xMy1yYzEgYWRkZWQg
YGBDT05GSUdfT0ZfUEFSVElUSU9OYGAsIHdoaWNoIGludGVycHJldHMKYGBmaXhlZC1wYXJ0aXRp
b25zYGAgbm9kZXMgaW4gU0QvTU1DIG5vZGVzIGRpZmZlcmVudGx5IHRvIHRoZSBiYXJlYm94CmJl
aGF2aW9yOiBJdCBpZ25vcmVzIHRoZSBHUFQvTUJSIGlmIGZpeGVkLXBhcnRpdGlvbnMgYXJlIHNw
ZWNpZmllZCwKaW5zdGVhZCBvZiBhbGxvd2luZyB0aGVtIHRvIGNvLWV4aXN0IGxpa2UgaW4gYmFy
ZWJveC4KClRvIGFjY29tbW9kYXRlIGJvdGggdGhlIGV4aXN0aW5nIGJhcmVib3ggYW5kIHRoZSBu
ZXcga2VybmVsIGZ1bmN0aW9uYWxpdHksCnVzZXJzIHNob3VsZCByZXBsYWNlIGBgZml4ZWQtcGFy
dGl0aW9uc2BgLWNvbXBhdGlibGUgZGV2aWNlIHRyZWUgc3Vibm9kZXMKb2YgU0QvZU1NQyB3aXRo
IGBgYmFyZWJveCxmaXhlZC1wYXJ0aXRpb25zYGAuCgpTaW1pbGFybHksIHRoZSBkZWZhdWx0IGZv
cgo6cmVmOmBnbG9iYWwub2ZfcGFydGl0aW9uX2JpbmRpbmcgPG1hZ2ljdmFyX2dsb2JhbF9vZl9w
YXJ0aXRpb25fYmluZGluZz5gCmhhcyBiZWVuIGNoYW5nZWQgdG8gdGhlIG5ldyBgYGFkYXB0aXZl
YGAgb3B0aW9uLCB3aGljaCBmaXhlcyB1cApgYGJhcmVib3gsZml4ZWQtcGFydGl0aW9uc2BgIGV4
Y2VwdCBmb3IgTVRELgoKUmVsZWFzZSB2MjAyNS4wNS4wCj09PT09PT09PT09PT09PT09PQoKQ29u
ZmlndXJhdGlvbiBvcHRpb25zCi0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKICBUaGlzIGNhbiBiZSBj
dXN0b21pemVkIHZpYSBzZXR0aW5nIHRoZQogIDpyZWY6YGdsb2JhbC5saW51eC5yb290d2FpdCA8
bWFnaWN2YXJfZ2xvYmFsX2xpbnV4X3Jvb3R3YWl0PmAKICB2YXJpYWJsZSBvciBieSBkaXNhYmxp
bmcgdGhlIG9wdGlvbi4KCkJvb3Rsb2FkZXIgU3BlY2lmaWNhdGlvbgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KCiAgUHJldmlvdXNseSBvbmx5IHRoZSBmaXJzdCBwYXJ0aXRpb24gd2l0aCB0aGUg
WEJPT1RMRFIgcGFydGl0aW9uIHR5cGUKICB3YXMgY29uc2lkZXJlZC4KCiAgSWYgYW4gWEJPT1RM
RFIgcGFydGl0aW9uIGV4aXN0cywgYmFyZWJveCB3aWxsIG5vIGxvbmdlciB3YWxrCiAgYWxsIHBh
cnRpdGlvbnMgdG8gZmluZCBmdXJ0aGVyCiAgYm9vdGxvYWRlciBzcGVjIGVudHJpZXMuCgpCb2Fy
ZCBzdXBwb3J0Ci0tLS0tLS0tLS0tLS0KCiAgVXNlcnMgc2hvdWxkIG1pZ3JhdGUgdG8gRklQIGlt
YWdlcyB3aXRoIGJhcmVib3ggYXMgbm9udHJ1c3RlZCBmaXJtd2FyZQogIChCTDMzKSBhbmQgdGhl
IGJhcmVib3ggZGV2aWNlIHRyZWUgYXMgaGFyZHdhcmUgY29uZmlnLgoKICBVc2Ugb2YgbXVsdGlw
bGUgZGV2aWNlIHRyZWVzIGlzIG5vdCBzdXBwb3J0ZWQgZGlyZWN0bHkgYnkgdGhlIEZJUCBmb3Jt
YXQKICBhbmQgY2FuIGJlIHN1YnN0aXR1dGVkIGJ5IGEgYmFyZWJveCBpbWFnZSBlbWJlZGRpbmcg
bXVsdGlwbGUgZGV2aWNlIHRyZWVzCiAgYW5kIHVzaW5nIHRoZSBoYXJkd2FyZSBjb25maWcgRklQ
IHNsb3Qgb25seSBhcyBkdW1teS4KICBTZWUgdGhlIGx4YS10YWMgYm9hcmQgZm9yIGFuIGV4YW1w
bGUuCgpTaGVsbCBhbmQgbWFnaWMgdmFyaWFibGVzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
CiAgVGhpcyBkb2VzIG5vdCBhZmZlY3QgdXNlcnMgc2V0dGluZyBgYG52IGJvb3QuZGVmYXVsdGBg
LCBidXQgZm9yCiAgb3RoZXJzLCBiYXJlYm94IHdpbGwgbG9vayBmb3IgYm9vdGxvYWRlciBzcGVj
IG9uIHRoZSBib290c291cmNlCiAgbWVkaXVtIGZpcnN0LgoKQnVpbGQgc3lzdGVtCi0tLS0tLS0t
LS0tLQoKQmlzZWN0YWJpbGl0eQotLS0tLS0tLS0tLS0tCgpGb2xsb3dpbmcgcmVncmVzc2lvbnMg
aGFkIGEgd2lkZXIgaW1wYWN0IGFuZCBjb3VsZCBmYWxzaWZ5IGdpdCBiaXNlY3QgcmVzdWx0czoK
ClJlbGVhc2UgdjIwMjUuMDguMAo9PT09PT09PT09PT09PT09PT0KCldeWCBvbiBBUk0KLS0tLS0t
LS0tLQoKYGBDT05GSUdfQVJNX01NVV9QRVJNSVNTSU9OUz15YGAgaXMgbm93IHRoZSBkZWZhdWx0
IGFuZCBpbnN0cnVjdHMgYmFyZWJveCB0byBtYXAKaXRzIG1lbW9yeSByZWdpb25zIHdpdGggbW9y
ZSByZXN0cmljdGVkIHBlcm1pc3Npb25zOiBEYXRhIGlzIG5vIGxvbmdlcgpleGVjdXRhYmxlCmFu
ZCBjb2RlIGFzIHdlbGwgYXMgcmVhZC1vbmx5IGRhdGEgaXMgbm8gbG9uZ2VyIHdyaXRhYmxlLgoK
VGhpcyBjYW4gbGVhZCB0byBicmVha2FnZSBpbiBjb2RlIHRoYXQgaGFkIGludmFsaWQgYXNzdW1w
dGlvbnMgYmVmb3JlaGFuZCwKZS5nLiBjb2RlIGV4cGVjdGluZyBvbi1jaGlwIFNSQU1zIHRvIGJl
IGV4ZWN1dGFibGUgb3IgYm9ndXMgY29kZSBjYXN0aW5nIGF3YXkKY29uc3QuIFBsZWFzZSByZXBv
cnQgdG8gdXBzdHJlYW0gYW55IGlzc3VlcyB0aGF0IGFyZSByZXNvbHZlZCBieSBkaXNhYmxpbmcK
YGBDT05GSUdfQVJNX01NVV9QRVJNSVNTSU9OU2BgLCBzbyB0aGV5IGNhbiBiZSBwcm9wZXJseSBm
aXhlZC4KCkJvb3RjaG9vc2VyCi0tLS0tLS0tLS0tCgpCb290Y2hvb3NlciBub3cgaW50ZXJwcmV0
cyBhIHRvcC1sZXZlbCBgYGF0dGVtcHRzX2xvY2tlZGBgIHZhcmlhYmxlLgpGb3IgbW9yZSBpbmZv
cm1hdGlvbiwgc2VlIDpyZWY6YGF0dGVtcHRzIGxvY2sgZmVhdHVyZQo8Ym9vdGNob29zZXIsYXR0
ZW1wdHNfbG9jaz5gLgoKQm9hcmQgc3VwcG9ydAotLS0tLS0tLS0tLS0tCgpUaGUgaGFyZGNvZGVk
IFZleHByZXNzIHBhcnRpdGlvbiBsYXlvdXQgZm9yIGJhcmVib3gsIGl0cyBlbnZpcm9ubWVudCBh
bmQgc3RhdGUKaGFzIGJlZW4gY2hhbmdlZC4gVGhlIGZpcnN0IDVNIG9mIHRoZSBOT1IgZmxhc2gg
c2hvdWxkIG5vdyBiZSByZXNlcnZlZCBmb3IKYmFyZWJveCB1c2UuIGJhcmVib3ggd2lsbCwgYnkg
ZGVmYXVsdCwgZml4IHVwIHRoZSBuZXcgcGFydGl0aW9uIGxheW91dCBpbnRvCnRoZSBrZXJuZWwg
ZGV2aWNlIHRyZWUuCgpSZWxlYXNlIHYyMDI1LjA5CgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBp
dCBleGNlZWRzIDUwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3Vu
ZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
YnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94
L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBkOTQ3OTgxOTNiLi4zMTY1YmVmNDJmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCisrKyBiL21l
dGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMsNiArMyw2IEBA
IFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1QViA9ICIyMDI2
LjA5LjAiCitQViA9ICIyMDI2LjEwLjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFyZWJveC5vcmcv
ZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5
MWI1MDRjOGE3OWI1YTRlMzBjNDE5YjgyNDkxNmI3MzI5YmFkOGFiZmUzNDk4N2JhMDY2YmFmYTFm
YmNmYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGQ2ZjNiZWI3MzQxNzAwNGZmYjliODU4NGI1
NGNjYTcxMTQxNzIyZTE4OWZlNWZkMmMzMTg4YjFjMmY0ZDVkMyIKLS0gCjIuNDcuMQoK

--===============8173083203722294339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="barebox-tools-changelog.txt"

Release v2025.01.0
==================

Layerscape
----------

Support for the NXP-specific PPA Secure Monitor has been removed in
favor of ARM Trusted Firmware-A as the former has been long unmaintained.

I2C Adapter numbering
---------------------

``i2c0`` to ``i2c31`` are now reserved for I2C adapters with device tree
aliases. Do not rely on a fixed numbering for other non-aliased adapters.

OP-TEE for Rockchip
-------------------

The BL32 firmware images are now called ``firmware/rk3XXX-bl32.bin``
instead of ``firmware/rk3XXX-op-tee.bin``. Raw OP-TEE binaries without
a header now use the load address the vendor blobs are hardcoded to
run at instead of the previous ``0x200000``. To override, use an OP-TEE
image with a header specifying the correct load address.

TFTP
----

The default TFTP window size has been reverted to 1 as many network
drivers couldn't cope with the increased throughput.
This can be reverted by setting ``CONFIG_FS_TFTP_MAX_WINDOW_SIZE``
or at runtime via the
:ref:`global.tftp.windowsize <magicvar_global_tftp_windowsize>` variable.

Release v2025.02.0
==================

Environment Auto-Probe
----------------------

A new magic variable ``global.env.autoprobe``
now controls whether barebox
will automatically probe known block devices for a GPT barebox environment
partition if no environment was specified by other means.

The variable defaults to ``0`` (false) if ``CONFIG_INSECURE`` is disabled.

The most secure option remains disabling ``CONFIG_ENV_HANDLING`` completely
or, starting with v2025.10.0, using the security policy support for runtime
access control.

Zynq 7000
---------

The MMC controller numbering is now fixed: ``mmc0`` & ``mmc1`` for
``&sdhci0`` and ``&sdhci1`` respectively.

Release v2025.03.0
==================

OMAP console fixup
------------------

The option ``CONFIG_DRIVER_SERIAL_NS16550_OMAP_TTYS`` now controls whether
barebox fixes up ``ttyS`` or ``ttyO`` into the kernel command line
``console=`` option.

fixed-partitions on SD/MMC
--------------------------

Linux v6.13-rc1 added ``CONFIG_OF_PARTITION``, which interprets
``fixed-partitions`` nodes in SD/MMC nodes differently to the barebox
behavior: It ignores the GPT/MBR if fixed-partitions are specified,
instead of allowing them to co-exist like in barebox.

To accommodate both the existing barebox and the new kernel functionality,
users should replace ``fixed-partitions``-compatible device tree subnodes
of SD/eMMC with ``barebox,fixed-partitions``.

Similarly, the default for
:ref:`global.of_partition_binding <magicvar_global_of_partition_binding>`
has been changed to the new ``adaptive`` option, which fixes up
``barebox,fixed-partitions`` except for MTD.

Release v2025.05.0
==================

Configuration options
---------------------

  This can be customized via setting the
  :ref:`global.linux.rootwait <magicvar_global_linux_rootwait>`
  variable or by disabling the option.

Bootloader Specification
------------------------

  Previously only the first partition with the XBOOTLDR partition type
  was considered.

  If an XBOOTLDR partition exists, barebox will no longer walk
  all partitions to find further
  bootloader spec entries.

Board support
-------------

  Users should migrate to FIP images with barebox as nontrusted firmware
  (BL33) and the barebox device tree as hardware config.

  Use of multiple device trees is not supported directly by the FIP format
  and can be substituted by a barebox image embedding multiple device trees
  and using the hardware config FIP slot only as dummy.
  See the lxa-tac board for an example.

Shell and magic variables
-------------------------

  This does not affect users setting ``nv boot.default``, but for
  others, barebox will look for bootloader spec on the bootsource
  medium first.

Build system
------------

Bisectability
-------------

Following regressions had a wider impact and could falsify git bisect results:

Release v2025.08.0
==================

W^X on ARM
----------

``CONFIG_ARM_MMU_PERMISSIONS=y`` is now the default and instructs barebox to map
its memory regions with more restricted permissions: Data is no longer
executable
and code as well as read-only data is no longer writable.

This can lead to breakage in code that had invalid assumptions beforehand,
e.g. code expecting on-chip SRAMs to be executable or bogus code casting away
const. Please report to upstream any issues that are resolved by disabling
``CONFIG_ARM_MMU_PERMISSIONS``, so they can be properly fixed.

Bootchooser
-----------

Bootchooser now interprets a top-level ``attempts_locked`` variable.
For more information, see :ref:`attempts lock feature
<bootchooser,attempts_lock>`.

Board support
-------------

The hardcoded Vexpress partition layout for barebox, its environment and state
has been changed. The first 5M of the NOR flash should now be reserved for
barebox use. barebox will, by default, fix up the new partition layout into
the kernel device tree.

Release v2025.09.0
==================

Removal of CONFIG_BOOTM_FITIMAGE_PUBKEY
---------------------------------------

The legacy way of adding FIT keys to the barebox build was having mkimage
generate a device tree snippet and including it in the barebox board device
tree::

  #ifdef CONFIG_BOOTM_FITIMAGE_PUBKEY
  #include CONFIG_BOOTM_FITIMAGE_PUBKEY
  #endif

This has now been removed in favor of ``CONFIG_CRYPTO_PUBLIC_KEYS``.
This option doesn't consume device tree snippets, but file paths to
the PEM or PKCS#11 URIs and thus will require a build-time OpenSSL dependency.

Build dependencies
------------------

Rename in /dev
--------------

EEPROMs that are pointed at by a device tree alias no longer have
an extra 0 at the end, e.g., ``/dev/eeprom00`` has become ``/dev/eeprom0``.

Release v2025.09.3
==================

FIT Images
----------

The fix for `CVE-2026-33243 <https://nvd.nist.gov/vuln/detail/CVE-2026-33243>`_
has the side effect that barebox after v2025.09.3 will not boot a signed
configuration that excludes some images from the signature.

Previously, it was possible to generate readily exploitable FIT images
by omitting them from ``sign-images`` in the ITS.

If a FIT fails to boot with **v2025.09.3**, when it successfully booted
v2025.09.2 or earlier, it's likely that it was vulnerable even without
knowledge of CVE-2026-33243.

Recommendation is to not write FIT ITS manually, but to use higher level
tooling that generates the ITS and feeds it to ``mkimage(1)``.

For more details, refer to the `security advisory
<https://github.com/barebox/barebox/security/advisories/GHSA-3fvj-q26p-j6h4>`_.

Release v2025.10.0
==================

Rename in /dev
--------------

The i.MX SNVS device file is now simply called ``snvs`` instead of the
previous unwieldy name derived from device tree,
e.g., ``/dev/30370000.snvs@30370000:snvs-lpgpr.of0``.

EEPROMs that are pointed at by a device tree alias no longer have
an extra 0 at the end, e.g., ``/dev/eeprom00`` has become ``/dev/eeprom0``.

AM62L DT Bindings
-----------------

The SCMI clock IDs for the AM62L have changed in ARM Trusted Firmware,
because the old assignment was not conforming to spec.

barebox now requires TF-A to contain commit
("PENDING: feat(ti): add missing scmi pds").

Release v2025.12.0
==================

Shell
-----

Configuration options
---------------------

Release v2026.01.0
==================

<config.h> removal for PowerPC
------------------------------

PowerPC was the last remaining user of per-board ``<config.h>`` files.
The alternative for out-of-tree boards is now to patch
``arch/powerpc/include/asm/config.h`` to include the board's config.h,
like the in-tree boards are already doing.

Filesystems
-----------

The ``linux.bootargs`` file system device parameter (e.g.
``ext40.linux.bootargs``)
has been replaced by the two variables ``${fsdev}.linux.bootargs.root`` and
``${fsdev}.linux.bootargs.rootopts``, splitting the previous bootargs
into three parts. For example, the previous::

    ext40.linux.bootargs="root=/dev/nfs nfsroot=192.168.1.1:/rootfs"
becomes::

    ext40.linux.bootargs.root="/dev/nfs"
    ext40.linux.bootargs.rootopts="nfsroot=192.168.1.1:/rootfs"

Scripts that access these parameters will need to be adapted to replace
``{linux.bootargs}`` with ``root={linux.bootargs.root}
{linux.bootargs.rootopts}``.

:ref:`global.linux.bootargs.* <magicvar_global_linux_bootargs_*>` is unaffected
by this change.

Boards
------

ARM i.MX6 RIoTboard
^^^^^^^^^^^^^^^^^^^

The barebox update handler has been changed to write barebox to the
eMMC boot partitions rather than the user data area.

Release v2026.03.0
==================

ARM NXP i.MX8MP
---------------

On NXP i.MX8MP the SoC UID was read out wrong. It really is 128bit from which
barebox only read 64bit. barebox now does it correctly, but rolled out devices
might depend on the SoC UID being constant. In that case
CONFIG_ARCH_IMX8MP_KEEP_COMPATIBLE_SOC_UID should be enabled.

FIT Images
----------

The fix for `CVE-2026-33243 <https://nvd.nist.gov/vuln/detail/CVE-2026-33243>`_
has the side effect that barebox after v2026.03.0 will not boot a signed
configuration that excludes some images from the signature.

Previously, it was possible to generate readily exploitable FIT images
by omitting them from ``sign-images`` in the ITS.

If a FIT fails to boot with **v2026.03.1**, when it successfully booted
v2026.02.0 or earlier, it's likely that it was vulnerable even without
knowledge of CVE-2026-33243.

Recommendation is to not write FIT ITS manually, but to use higher level
tooling that generates the ITS and feeds it to ``mkimage(1)``.

For more details, refer to the `security advisory
<https://github.com/barebox/barebox/security/advisories/GHSA-3fvj-q26p-j6h4>`_.

Release v2026.05.0
==================

Removal of global.env.autoprobe
-------------------------------

The global.env.autoprobe variable introduced with v2025.02.0 is removed and
now replaced with CONFIG_ENV_HANDLING_AUTOPROBE. It has never worked. If you
want to load a barebox environment based on its partition UUID enable
CONFIG_ENV_HANDLING_AUTOPROBE.

CONFIG_CRYPTO_PUBLIC_KEYS
-------------------------

The syntax of keytoc keyspecs when fully provided via an environment variable
was slightly changed to allow any number of keyspecs to be provided via an
environment variable. Such environment variables are now split at spaces to be
interpreted as multiple keyspecs. Any literal spaces and backslashes contained
in such keyspecs need to be escaped with a backslash.

This only applies to the form::
  CONFIG_CRYPTO_PUBLIC_KEYS="__ENV__A"

While the interpretation of environment variables specifying hint or URI remains
unchanged::

  CONFIG_CRYPTO_PUBLIC_KEYS="keyring=kr:__ENV__B"

Fit hints can no longer be specified by environment variables using the __ENV__
syntax. This functionality was broken since the last change to the keyspec
syntax in 2025.12.

register_simplefb parameter
---------------------------

The ``register_simplefb`` parameter on framebuffer devices has changed from
boolean to an enum with values ``disabled``, ``enabled``, and ``stdout-path``.

Scripts that **read** the parameter will now receive ``"disabled"`` or
``"enabled"`` instead of ``"0"`` or ``"1"``.

Scripts that **write** ``"0"`` or ``"1"`` continue to work.

global.linux.bootargs.* appending order
---------------------------------------

If barebox was configured to automatically generate any of the ``root``,
``rootwait``, ``earlycon``, ``systemd.machine_id``, ``systemd.hostname``
or ``barebox.security.policy`` kernel command line options, they will be
appended onto the final kernel command line
:ref:`**after** all other options <bootargs_concat_order>`.

Release v2026.06.0
==================

global.linux.bootargs.* appending order
---------------------------------------

If barebox was configured to automatically generate any of the ``root``,
``rootwait``, ``earlycon``, ``systemd.machine_id``, ``systemd.hostname``
or ``barebox.security.policy`` kernel command line options, they will be
appended onto the final kernel command line
:ref:`after all other options <bootargs_concat_order>`.

Removal of global.env.autoprobe
-------------------------------

The global.env.autoprobe variable introduced with v2025.02.0 is removed and
now replaced with CONFIG_ENV_HANDLING_AUTOPROBE. It has never worked. If you
want to load a barebox environment based on its partition UUID enable
CONFIG_ENV_HANDLING_AUTOPROBE.

Release v2026.08.0
==================

global.partitions.first_usable_lba removed
------------------------------------------

The ``global.partitions.first_usable_lba`` variable has been removed.
Use :ref:`global.partitions.first_partition_offset
<magicvar_global_partitions_first_partition_offset>`
instead.

The new variable is a byte offset used by free-space searches for new
partitions, for example ``parted mkpart_size``. The default is
``8388608`` bytes (8 MiB). To keep an old configuration, multiply the
old ``first_usable_lba`` value by 512.

ARCH=arm64
----------

Use of ``ARCH=arm`` for 64-bit ARM builds is deprecated and now emits
a warning. Users should change build scripts to use ``ARCH=arm64``
instead when targetting ARMv8.

Release v2026.09.0
==================

Removal of deprecated CONFIG_BOOTM_OPTEE
----------------------------------------

The support for late loading of OP-TEE had been deprecated and ultimately
removed as it greatly increased the attack surface and was only supported
on 32-bit ARM systems.

OP-TEE loading is now only supported
:ref:`in the prebootloader <optee_early_loading>`.

For i.MX6 boards, this can be enabled by enabling
``CONFIG_FIRMWARE_IMX6_OPTEE``.

sha1 no longer accepted for secure boot
---------------------------------------

FIT images using sha1 are no longer accepted as secure boot images. sha1 has
been proven insecure in 2017.

Release v2026.10.0
==================

Removal of bootm -c/-s options
------------------------------

The :ref:`command_bootm` options ``-c`` and ``-s`` used to selectively
enable checksum/hash and signature verification, respectively.

They have been removed in favor of the global toggle
:ref:`global.bootm.verify <magicvar_global_bootm_verify>`.
This can be restricted at build-time via setting
``CONFIG_BOOTM_FORCE_SIGNED_IMAGES``
or loosened :ref:`at runtime <use_security-policies>`
via setting ``SCONFIG_BOOT_UNSIGNED_IMAGES``.

The removal is motivated by making it easier to reason about what the active
verification level is, especially as there are now other uses for verified
images like when :ref:`global.of.overlay.path <magicvar_global_of_overlay_path>`
points at a FIT.

Existing users, if any, will fail-secure: The command will now exit with a
failure::

  bootm: invalid option -- s

Default environment overlay order
---------------------------------

Releases since v2026.01.0 applied board specific default environment overlays
added with ``defaultenv_append_directory()`` after the environment given
with ``CONFIG_DEFAULT_ENVIRONMENT_PATH`` and thus overwrote its files.

The documented order has been restored: ``CONFIG_DEFAULT_ENVIRONMENT_PATH``
is applied after the board specific overlays again and can overwrite their
files. Overlays only available at runtime, like an environment passed via
QEMU fw_cfg, are still applied last.

BSPs that started to rely on the board specific overlay taking precedence
need to remove the conflicting files from their external environment.

EFI payload reported inverted Secure Boot state
-----------------------------------------------

As EFI payload, barebox reported the inverse of the firmware's Secure Boot
state in :ref:`efi.secure_boot <magicvar_efi_secure_boot>` and a wrong
:ref:`efi.secure_mode <magicvar_efi_secure_mode>` derived from it. Both are
now ``1`` if Secure Boot is enabled, ``efi.secure_mode`` only if the firmware
is additionally not in Setup Mode.

In general, this should have no security implications: barebox doesn't
evaluate the parameters itself, the firmware enforces Secure Boot according
to its enrolled keys and the parameters were undocumented so far. It may
however invalidate assumptions made by scripts.

--===============8173083203722294339==--
