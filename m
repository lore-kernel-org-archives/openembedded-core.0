Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA23DC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 23:15:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web09.1779.1667862937679762845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 15:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id A0065DD70
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Nov 2022 00:15:35 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1osBL4-2uSkzZ0; Tue, 8 Nov 2022 00:15:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libinput: upgrade 1.19.4 -> 1.21.0
Date: Tue,  8 Nov 2022 00:15:26 +0100
Message-Id: <20221107231526.397428-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1667862934-3AFEA81E-E98AE37C/0/0 CLEAN NORMAL
X-TOI-MSGID: eff4d3c7-86c9-42a6-8f19-cf00d99915c6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 23:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172938

libinput 1.21.0 is now available for download.
This version includes a new configuration option that, similarly to its t=
ouchpad counterpart, allows disabling the trackpoint while typing.
Compositors can take advantage of it thanks to four new APIs:
  libinput_device_config_dwtp_is_available, libinput_device_config_dwtp_s=
et_enabled, libinput_device_config_dwtp_get_enabled and libinput_device_c=
onfig_dwtp_get_default_enabled.
Those who use the flat acceleration profile on their touchpad are in luck=
, it has been improved in this version.
In addition to the changes already mentioned, new quirks have been added =
for multiple StarLabs laptops.
Last but not least, several bugs have been fixed, so make sure to update!
Thanks to everyone involved for making this new version possible =E2=9D=A4

Alexander Courtis (1):
      AttrLidSwitchReliability quirk default unreliable->reliable

Jos=C3=A9 Exp=C3=B3sito (7):
      evdev: check well-known keyboard keys on joystick/gamepad detection
      evdev: modernize variable declaration in evdev_device_is_joystick_o=
r_gamepad
      coding style: allow C99 variable declaration
      test: disable hold gestures when are not required
      Remove "device-" file
      wheel: fix Lenovo Scrollpoint quirk
      libinput 1.21.0

Peter Hutterer (26):
      gitlab CI: fail the sanity check stage if the fork is not public
      util: auto-declare the element variable in ARRAY_FOR_EACH
      meson: fix a meson warning
      meson: replace a meson.source_root() with the explicit directory
      doc/user: add a page to troubleshoot right-click Clickpads
      tools/record: fix the indentation of the system: section
      evdev: strip the device name of format directives
      tools: allow limiting the axes in libinput analyse recording
      tools: don't print a carriage return if we're not on a tty
      tools/record: fix indentation for libinput events
      tools/analyze-recording: add --print-state to always print values
      tools/analyze-recording: improve the repeated-events line printing
      tools: add a libinput test tool as entry point for our test suites
      test: install libinput-test-utils as part of install-tests
      quirks: move the canvas quirk enum to the right order
      quirks: remove an unused quirk
      tablet: remove an always-true part of an if condition
      test: rename a test function to make it easier to select
      tablet: use a helper variable to make the code more readable
      tablet: require a minimum pressure before we process pressure event=
s
      test: fix the lowres-only wheel event tests
      test: ensure we always have an axis event where we expect one
      test: use a ranged test instead of a duplicated one
      test: fix a typo
      meson.build: check gtk targets before building
      gitlab CI: bump to F35 and F36, as well as Ubuntu 21.10 and 22.04

Sean Rhodes (2):
      quirks: Add quirk for StarLite Mk IV
      Quirk all StarLabs trackpads

Tom Stellard (1):
      Update valgrind.h to a newer version

pudiva chip l=C3=ADquida (1):
      touchpad: new option dwtp (disable-while-trackpointing)

satrmb (1):
      filter-touchpad: normalize for dpi on the touchpad-specific flat pr=
ofile

libinput 1.20.1 is now available for download.
This release fixes CVE-2022-1215, see #752.

When a device is detected by libinput, libinput logs several messages thr=
ough log handlers set up by the callers.
These log handlers usually eventually result in a printf call. Logging ha=
ppens with the privileges of the caller,
in the case of Xorg this may be root.

The device name ends up as part of the format string and a kernel device =
with printf-style format string placeholders
in the device name can enable an attacker to run malicious code. An explo=
it is possible through any device where the
attacker controls the device name, e.g. /dev/uinput or Bluetooth devices.

Peter Hutterer (2):
      evdev: strip the device name of format directives
      libinput 1.20.1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wayland/{libinput_1.19.4.bb =3D> libinput_1.21.0.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.4.bb =3D> libinput_1=
.21.0.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.4.bb b/meta/reci=
pes-graphics/wayland/libinput_1.21.0.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/libinput_1.19.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.21.0.bb
index a7d0c4be69..cf59bd81c5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.21.0.bb
@@ -12,11 +12,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1=
c10bc0fb037dc76c46ef8a"
=20
 DEPENDS =3D "libevdev udev mtdev libcheck"
=20
-SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3Dmain \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] =3D "ff33a570b5a936c81e6c08389a8581c2665311d026ce3d22=
5c88d09c49f9b440"
+SRCREV =3D "bc363328a704b3c5e0ee2f0fcf088de67c708979"
+S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
--=20
2.34.1


