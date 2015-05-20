Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 613F272440
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 19:12:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 20 May 2015 12:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,465,1427785200"; d="scan'208";a="729191468"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2015 12:11:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 22:11:07 +0300
Message-Id: <0e8588557edc10319678be694acdbc3fc7d2b080.1432147061.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b41f206dac24302bf08d49b30cd945763b83b5fa.1432147061.git.jussi.kukkonen@intel.com>
References: <b41f206dac24302bf08d49b30cd945763b83b5fa.1432147061.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1432147061.git.jussi.kukkonen@intel.com>
References: <cover.1432147061.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] xserver-xorg: Upgrade 1.16.3 -> 1.17.1 (OELAYOUT_ABI change)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 May 2015 19:12:04 -0000

* Increase OELAYOUT_ABI: this is required because the
  xf86-video-modesetting package moves from its own recipe to
  xserver-xorg and sanity check cannot handle that currently.
  The upgrade will delete old xf86-video-modesetting files from
  sysroots.
* Remove upstreamed xserver-xorg patches
* Remove xf86-video-modesetting recipe: the driver is now included in
  xserver-xorg recipe, which now produces the xf86-video-modesetting
  package. The package version changes from 0.9 to 1.17.1
* Update xserver-xorg license checksum: modesetting license
  info (another MIT one) has been added to the file

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-yocto/conf/distro/poky.conf                   |   2 +-
 meta/classes/sanity.bbclass                        |   6 +
 meta/conf/abi_version.conf                         |   2 +-
 .../xorg-driver/xf86-video-modesetting_0.9.0.bb    |   8 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   9 +-
 ...Check-strings-length-against-request-size.patch | 145 ---------------------
 ...wap-XkbSetGeometry-data-in-the-input-buff.patch | 109 ----------------
 .../Fix-subwindow-in-Xi-emulated-events.patch      |  41 ------
 .../xserver-xorg/xshmfence-option.patch            |  57 --------
 ...erver-xorg_1.16.3.bb => xserver-xorg_1.17.1.bb} |   8 +-
 10 files changed, 17 insertions(+), 370 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.9.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.16.3.bb => xserver-xorg_1.17.1.bb} (74%)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index 94de6e8..b47325d 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -91,7 +91,7 @@ BB_SIGNATURE_HANDLER ?= 'OEBasicHash'
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "10"
+OELAYOUT_ABI = "11"
 
 # add poky sanity bbclass
 INHERIT += "poky-sanity"
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 839f7ce..c46a073 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -536,6 +536,12 @@ def sanity_handle_abichanges(status, d):
                 sstate_clean_manifest(f, d)
             with open(abifile, "w") as f:
                 f.write(current_abi)
+        elif abi == "10" and current_abi == "11":
+            bb.note("Converting staging layout from version 10 to layout version 11")
+            # Files in xf86-video-modesetting moved to xserver-xorg and bitbake can't currently handle that:
+            subprocess.call(d.expand("rm ${TMPDIR}/sysroots/*/usr/lib/xorg/modules/drivers/modesetting_drv.so ${TMPDIR}/sysroots/*/pkgdata/runtime/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/runtime-reverse/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/shlibs2/xf86-video-modesetting*"), shell=True)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 2867850..a829687 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,4 +4,4 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "10"
+OELAYOUT_ABI = "11"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.9.0.bb
deleted file mode 100644
index b220787..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.9.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
-
-SUMMARY = "X.Org X server -- modesetting display driver"
-DESCRIPTION = "Provides a generic kernel modesetting display driver for the X.Org X server."
-
-SRC_URI[md5sum] = "da588d4f54111c2deae035998058ce10"
-SRC_URI[sha256sum] = "90cf085573203dfadd48ea69bd694c4d04ccbe088b6855e9c85c34bb8a95d75c"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index cc95da6..04289f8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=15b5bf9327341c81089137aec4830bfd"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -63,7 +63,11 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-exa \
              ${PN}-module-xaa \
              ${PN}-module-libxf1bpp \
-             ${PN}-module-libxf4bpp"
+             ${PN}-module-libxf4bpp \
+             xf86-video-modesetting"
+
+SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
+INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
@@ -99,6 +103,7 @@ FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
 FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
 FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
+FILES_xf86-video-modesetting = "${libdir}/xorg/modules/drivers/modesetting_drv.so"
 
 EXTRA_OECONF += "--with-fop=no \
                  --with-pic \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
deleted file mode 100644
index b0e2bca..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 20079c36cf7d377938ca5478447d8b9045cb7d43 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Fri, 16 Jan 2015 08:44:45 +0100
-Subject: [PATCH] xkb: Check strings length against request size
-
-Ensure that the given strings length in an XkbSetGeometry request remain
-within the limits of the size of the request.
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- xkb/xkb.c |   65 +++++++++++++++++++++++++++++++++++++------------------------
- 1 file changed, 40 insertions(+), 25 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index b9a3ac4..f3988f9 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -4957,25 +4957,29 @@ ProcXkbGetGeometry(ClientPtr client)
- 
- /***====================================================================***/
- 
--static char *
--_GetCountedString(char **wire_inout, Bool swap)
-+static Status
-+_GetCountedString(char **wire_inout, ClientPtr client, char **str)
- {
--    char *wire, *str;
-+    char *wire, *next;
-     CARD16 len;
- 
-     wire = *wire_inout;
-     len = *(CARD16 *) wire;
--    if (swap) {
-+    if (client->swapped) {
-         swaps(&len);
-     }
--    str = malloc(len + 1);
--    if (str) {
--        memcpy(str, &wire[2], len);
--        str[len] = '\0';
--    }
--    wire += XkbPaddedSize(len + 2);
--    *wire_inout = wire;
--    return str;
-+    next = wire + XkbPaddedSize(len + 2);
-+    /* Check we're still within the size of the request */
-+    if (client->req_len <
-+        bytes_to_int32(next - (char *) client->requestBuffer))
-+        return BadValue;
-+    *str = malloc(len + 1);
-+    if (!*str)
-+        return BadAlloc;
-+    memcpy(*str, &wire[2], len);
-+    *(*str + len) = '\0';
-+    *wire_inout = next;
-+    return Success;
- }
- 
- static Status
-@@ -4987,6 +4991,7 @@ _CheckSetDoodad(char **wire_inout,
-     xkbAnyDoodadWireDesc any;
-     xkbTextDoodadWireDesc text;
-     XkbDoodadPtr doodad;
-+    Status status;
- 
-     dWire = (xkbDoodadWireDesc *) (*wire_inout);
-     any = dWire->any;
-@@ -5036,8 +5041,14 @@ _CheckSetDoodad(char **wire_inout,
-         doodad->text.width = text.width;
-         doodad->text.height = text.height;
-         doodad->text.color_ndx = dWire->text.colorNdx;
--        doodad->text.text = _GetCountedString(&wire, client->swapped);
--        doodad->text.font = _GetCountedString(&wire, client->swapped);
-+        status = _GetCountedString(&wire, client, &doodad->text.text);
-+        if (status != Success)
-+            return status;
-+        status = _GetCountedString(&wire, client, &doodad->text.font);
-+        if (status != Success) {
-+            free (doodad->text.text);
-+            return status;
-+        }
-         break;
-     case XkbIndicatorDoodad:
-         if (dWire->indicator.onColorNdx >= geom->num_colors) {
-@@ -5072,7 +5083,9 @@ _CheckSetDoodad(char **wire_inout,
-         }
-         doodad->logo.color_ndx = dWire->logo.colorNdx;
-         doodad->logo.shape_ndx = dWire->logo.shapeNdx;
--        doodad->logo.logo_name = _GetCountedString(&wire, client->swapped);
-+        status = _GetCountedString(&wire, client, &doodad->logo.logo_name);
-+        if (status != Success)
-+            return status;
-         break;
-     default:
-         client->errorValue = _XkbErrCode2(0x4F, dWire->any.type);
-@@ -5304,18 +5317,20 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
-     char *wire;
- 
-     wire = (char *) &req[1];
--    geom->label_font = _GetCountedString(&wire, client->swapped);
-+    status = _GetCountedString(&wire, client, &geom->label_font);
-+    if (status != Success)
-+        return status;
- 
-     for (i = 0; i < req->nProperties; i++) {
-         char *name, *val;
- 
--        name = _GetCountedString(&wire, client->swapped);
--        if (!name)
--            return BadAlloc;
--        val = _GetCountedString(&wire, client->swapped);
--        if (!val) {
-+        status = _GetCountedString(&wire, client, &name);
-+        if (status != Success)
-+            return status;
-+        status = _GetCountedString(&wire, client, &val);
-+        if (status != Success) {
-             free(name);
--            return BadAlloc;
-+            return status;
-         }
-         if (XkbAddGeomProperty(geom, name, val) == NULL) {
-             free(name);
-@@ -5349,9 +5364,9 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
-     for (i = 0; i < req->nColors; i++) {
-         char *name;
- 
--        name = _GetCountedString(&wire, client->swapped);
--        if (!name)
--            return BadAlloc;
-+        status = _GetCountedString(&wire, client, &name);
-+        if (status != Success)
-+            return status;
-         if (!XkbAddGeomColor(geom, name, geom->num_colors)) {
-             free(name);
-             return BadAlloc;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
deleted file mode 100644
index c841dbe..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 81c90dc8f0aae3b65730409b1b615b5fa7280ebd Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Fri, 16 Jan 2015 20:08:59 +0100
-Subject: [PATCH] xkb: Don't swap XkbSetGeometry data in the input buffer
-
-The XkbSetGeometry request embeds data which needs to be swapped when the
-server and the client have different endianess.
-
-_XkbSetGeometry() invokes functions that swap these data directly in the
-input buffer.
-
-However, ProcXkbSetGeometry() may call _XkbSetGeometry() more than once
-(if there is more than one keyboard), thus causing on swapped clients the
-same data to be swapped twice in memory, further causing a server crash
-because the strings lengths on the second time are way off bounds.
-
-To allow _XkbSetGeometry() to run reliably more than once with swapped
-clients, do not swap the data in the buffer, use variables instead.
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- xkb/xkb.c |   35 +++++++++++++++++++----------------
- 1 file changed, 19 insertions(+), 16 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 15c7f34..b9a3ac4 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -4961,14 +4961,13 @@ static char *
- _GetCountedString(char **wire_inout, Bool swap)
- {
-     char *wire, *str;
--    CARD16 len, *plen;
-+    CARD16 len;
- 
-     wire = *wire_inout;
--    plen = (CARD16 *) wire;
-+    len = *(CARD16 *) wire;
-     if (swap) {
--        swaps(plen);
-+        swaps(&len);
-     }
--    len = *plen;
-     str = malloc(len + 1);
-     if (str) {
-         memcpy(str, &wire[2], len);
-@@ -4985,25 +4984,28 @@ _CheckSetDoodad(char **wire_inout,
- {
-     char *wire;
-     xkbDoodadWireDesc *dWire;
-+    xkbAnyDoodadWireDesc any;
-+    xkbTextDoodadWireDesc text;
-     XkbDoodadPtr doodad;
- 
-     dWire = (xkbDoodadWireDesc *) (*wire_inout);
-+    any = dWire->any;
-     wire = (char *) &dWire[1];
-     if (client->swapped) {
--        swapl(&dWire->any.name);
--        swaps(&dWire->any.top);
--        swaps(&dWire->any.left);
--        swaps(&dWire->any.angle);
-+        swapl(&any.name);
-+        swaps(&any.top);
-+        swaps(&any.left);
-+        swaps(&any.angle);
-     }
-     CHK_ATOM_ONLY(dWire->any.name);
--    doodad = XkbAddGeomDoodad(geom, section, dWire->any.name);
-+    doodad = XkbAddGeomDoodad(geom, section, any.name);
-     if (!doodad)
-         return BadAlloc;
-     doodad->any.type = dWire->any.type;
-     doodad->any.priority = dWire->any.priority;
--    doodad->any.top = dWire->any.top;
--    doodad->any.left = dWire->any.left;
--    doodad->any.angle = dWire->any.angle;
-+    doodad->any.top = any.top;
-+    doodad->any.left = any.left;
-+    doodad->any.angle = any.angle;
-     switch (doodad->any.type) {
-     case XkbOutlineDoodad:
-     case XkbSolidDoodad:
-@@ -5026,12 +5028,13 @@ _CheckSetDoodad(char **wire_inout,
-                                               dWire->text.colorNdx);
-             return BadMatch;
-         }
-+        text = dWire->text;
-         if (client->swapped) {
--            swaps(&dWire->text.width);
--            swaps(&dWire->text.height);
-+            swaps(&text.width);
-+            swaps(&text.height);
-         }
--        doodad->text.width = dWire->text.width;
--        doodad->text.height = dWire->text.height;
-+        doodad->text.width = text.width;
-+        doodad->text.height = text.height;
-         doodad->text.color_ndx = dWire->text.colorNdx;
-         doodad->text.text = _GetCountedString(&wire, client->swapped);
-         doodad->text.font = _GetCountedString(&wire, client->swapped);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
deleted file mode 100644
index 604d23a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From db424318d0bb29cbcdf3a07fcc2e023586f1219f Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <fourdan@xfce.org>
-Date: Fri, 2 Jan 2015 18:50:17 +0100
-Subject: [PATCH] Fix subwindow in Xi emulated events
-
-Bug: 70790
-Upstream status: Submitted 
-                 https://bugs.freedesktop.org/show_bug.cgi?id=70790
-
-Signed-off-by: Olivier Fourdan <fourdan@xfce.org>
----
- Xi/exevents.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Xi/exevents.c b/Xi/exevents.c
-index b0bc47e..0857bce 100644
---- a/Xi/exevents.c
-+++ b/Xi/exevents.c
-@@ -1403,7 +1403,7 @@ DeliverTouchEmulatedEvent(DeviceIntPtr dev, TouchPointInfoPtr ti,
- 
-             if (grab->ownerEvents) {
-                 WindowPtr focus = NullWindow;
--                WindowPtr sprite_win = dev->spriteInfo->sprite->win;
-+                WindowPtr sprite_win = DeepestSpriteWin(dev->spriteInfo->sprite);
- 
-                 deliveries = DeliverDeviceEvents(sprite_win, ptrev, grab, focus, dev);
-             }
-@@ -1429,8 +1429,9 @@ DeliverTouchEmulatedEvent(DeviceIntPtr dev, TouchPointInfoPtr ti,
-     }
-     else {
-         GrabPtr devgrab = dev->deviceGrab.grab;
-+        WindowPtr sprite_win = DeepestSpriteWin(dev->spriteInfo->sprite);
- 
--        DeliverDeviceEvents(win, ptrev, grab, win, dev);
-+        DeliverDeviceEvents(sprite_win, ptrev, grab, win, dev);
-         /* FIXME: bad hack
-          * Implicit passive grab activated in response to this event. Store
-          * the event.
--- 
-2.1.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
deleted file mode 100644
index 682ddf7..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-commit ca29a9f3e689f3840426897f58aaa3974932ae78
-Author: Ross Burton <ross.burton@intel.com>
-Date:   Mon Jul 7 12:53:35 2014 +0100
-
-    configure.ac: add option for xshmfence
-    
-    xshmfence is usable outside of DRI3, and is currently autodetected which isn't
-    good for distributions where deterministic builds are aspired to.
-    
-    Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index c214638..a1ca9ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -648,6 +648,7 @@ AC_ARG_ENABLE(kdrive-kbd,     AS_HELP_STRING([--enable-kdrive-kbd], [Build kbd d
- AC_ARG_ENABLE(kdrive-mouse,   AS_HELP_STRING([--enable-kdrive-mouse], [Build mouse driver for kdrive (default: auto)]), [KDRIVE_MOUSE=$enableval], [KDRIVE_MOUSE=auto])
- AC_ARG_ENABLE(kdrive-evdev,   AS_HELP_STRING([--enable-kdrive-evdev], [Build evdev driver for kdrive (default: auto)]), [KDRIVE_EVDEV=$enableval], [KDRIVE_EVDEV=auto])
- AC_ARG_ENABLE(libunwind,      AS_HELP_STRING([--enable-libunwind], [Use libunwind for backtracing (default: auto)]), [LIBUNWIND="$enableval"], [LIBUNWIND="auto"])
-+AC_ARG_ENABLE(xshmfence,      AS_HELP_STRING([--disable-xshmfence], [Disable xshmfence (default: auto)]), [WANT_XSHMFENCE="$enableval"], [WANT_XSHMFENCE="auto"])
- 
- 
- dnl chown/chmod to be setuid root as part of build
-@@ -1235,18 +1236,21 @@ esac
- 
- AM_CONDITIONAL(BUSFAULT, test x"$BUSFAULT" = xyes)
- 
--PKG_CHECK_MODULES([XSHMFENCE], $XSHMFENCE,
--		  [HAVE_XSHMFENCE=yes], [HAVE_XSHMFENCE=no])
- 
--AM_CONDITIONAL(XSHMFENCE, test "x$HAVE_XSHMFENCE" = xyes)
-+PKG_CHECK_MODULES([XSHMFENCE], $XSHMFENCE, [HAVE_XSHMFENCE=yes], [HAVE_XSHMFENCE=no])
-+if test "x$WANT_XSHMFENCE" = "xauto"; then
-+    WANT_XSHMFENCE="$HAVE_XSHMFENCE"
-+fi
- 
--case x"$HAVE_XSHMFENCE" in
--	xyes)
--		AC_DEFINE(HAVE_XSHMFENCE, 1, [Have X Shared Memory Fence library])
--		REQUIRED_LIBS="$REQUIRED_LIBS xshmfence"
--		;;
--esac
-+if test "x$WANT_XSHMFENCE" = "xyes"; then
-+    if test "x$HAVE_XSHMFENCE" != "xyes"; then
-+        AC_MSG_ERROR([xshmfence requested but not installed.])
-+    fi
-+    AC_DEFINE(HAVE_XSHMFENCE, 1, [Have xshmfence support])
-+    REQUIRED_LIBS="$REQUIRED_LIBS xshmfence"
-+fi
- 
-+AM_CONDITIONAL(XSHMFENCE, [test "x$WANT_XSHMFENCE" = xyes])
- 
- case "$DRI3,$HAVE_XSHMFENCE" in
- 	yes,yes | auto,yes)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
index 780ece0..82051b3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
@@ -3,17 +3,13 @@ require xserver-xorg.inc
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xorg-CVE-2013-6424.patch \
-            file://xshmfence-option.patch \
-            file://Fix-subwindow-in-Xi-emulated-events.patch \
             file://xtrans.patch \
-            file://0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch \
-            file://0001-xkb-Check-strings-length-against-request-size.patch \
             file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
 	    file://0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch \
            "
 
-SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
-SRC_URI[sha256sum] = "5e0f443238af1078b48f6eea98a382861b59187da221c2cf714d31c1d560b0fb"
+SRC_URI[md5sum] = "5986510d59e394a50126a8e2833e79d3"
+SRC_URI[sha256sum] = "2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


