Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74D9C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 11:28:55 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.7978.1720092527507231985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 04:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id 6F77C1856B
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jul 2024 13:28:45 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.32]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sPKdo-2R036H0; Thu, 4 Jul 2024 13:28:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libinput: update 1.25.0 -> 1.26.1
Date: Thu,  4 Jul 2024 13:29:48 +0200
Message-ID: <20240704112948.4618-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1720092524-46FFAC95-6F0D6D9D/0/0 CLEAN NORMAL
X-TOI-MSGID: d13aa978-0e4e-41a2-afa0-4d6574afc079
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201538

Release notes
libinput 1.26.1 is now available. A few semi-exciting things, the rest th=
e usual bugfixes you'd expect for a point release.

Touchpads now special-case Shift for disable-while-typing, so typing keys=
 with shift down will trigger DWT.

Tablets can now be calibrated if libwacom says the tablet is a display ta=
blet. The hid-uclogic kernel driver doesn't
set INPUT_PROP_DIRECT so any device handled by that driver didn't have ca=
libration available. Fixed now, provided
your tablet is recognised by libwacom.

The direction of the first tablet pad relative dial was fixed, it was ups=
ide-down.

Our debugging tools now support --set-pressure-range for the new tablet t=
ool pressure range configuration added in
1.26 and --set-calibration for the calibration matrix that's been around =
for a while. The libinput debug-tablet tool
now also supports all commandline options that debug-events and debug-gui=
 support.

And of course a varied assortment of device specific quirks and fixes.

Release notes
libinput 1.26.0 is now available. It's been a while since the last releas=
e but we have a few notable changes in here:

Touchpads can now configure a clickfinger button map, so you can change w=
hether two- or three-finger click means a
right or middle click. See libinput_device_config_click_set_clickfinger_b=
utton_map

Tablet pads now have an API for relative dials. These are typically wheel=
-like (e.g. Huion Inspiroy 2) or ring-like
(e.g. Huion Inspiroy Dial 2) physical devices that send REL_WHEEL and REL=
_HWHEEL. libinput now provides these via
libinput_event_tablet_pad_get_dial_delta_v120() in much the same manner a=
s the v120-based scroll wheel API.

A new configuration option for tablet tools allow reducing the available =
logical range. This is useful for users that
want the tool to register only when some physical pressure value is reach=
ed, or to reduce the maximum amount of pressure
needed to reach the logical maximum pressure. See libinput_tablet_tool_co=
nfig_pressure_range_set() and friends.

Tablet tools can now use BTN_STYLUS3 too and tablet pad strip support sho=
uld now work for non-Wacom devices, where the
kernel driver implements it.

Huion tablets (well, and all vendors that use the 256C vendor id) now hav=
e a fallback resolution set. This is going to
be wrong on most devices but at least it will make those tablets work out=
 of the box, instead of failing with the "missing
tablet capabilities: resolution" log message.

And of course a varied assortment of device specific quirks and fixes.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wayland/{libinput_1.25.0.bb =3D> libinput_1.26.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.25.0.bb =3D> libinput_1=
.26.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/reci=
pes-graphics/wayland/libinput_1.26.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.25.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.26.1.bb
index 894858e361..487270505a 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.26.1.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "libevdev udev mtdev"
 SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3Dmain \
            file://run-ptest \
            "
-SRCREV =3D "3fd38d89276b679ac3565efd7c2150fd047902cb"
+SRCREV =3D "124431a5d3186e1c3c3aa144a0634b84b3089486"
 S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.45.1


