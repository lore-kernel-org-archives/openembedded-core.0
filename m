Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE7C72A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 07:50:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t377oPUC021115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 00:50:25 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 7 Apr 2015 00:50:25 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 15:49:56 +0800
Message-ID: <1428392996-5698-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] xorg-server: Security Advisory - xorg-server - CVE-2015-0255
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
X-List-Received-Date: Tue, 07 Apr 2015 07:50:25 -0000
Content-Type: text/plain

Updated x11-server packages fix security vulnerability:

Olivier Fourdan from Red Hat has discovered a protocol handling issue in
the way the X server code base handles the XkbSetGeometry request, where
the server trusts the client to send valid string lengths. A malicious
client with string lengths exceeding the request length can cause the server
to copy adjacent memory data into the XKB structs. This data is then
available to the client via the XkbGetGeometry request. This can lead to
information disclosure issues, as well as possibly a denial of service if a
similar request can cause the server to crash (CVE-2015-0255).

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...Check-strings-length-against-request-size.patch |  145 ++++++++++++++++++++
 ...wap-XkbSetGeometry-data-in-the-input-buff.patch |  109 +++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |    2 +
 3 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
new file mode 100644
index 0000000..b0e2bca
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Check-strings-length-against-request-size.patch
@@ -0,0 +1,145 @@
+From 20079c36cf7d377938ca5478447d8b9045cb7d43 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 16 Jan 2015 08:44:45 +0100
+Subject: [PATCH] xkb: Check strings length against request size
+
+Ensure that the given strings length in an XkbSetGeometry request remain
+within the limits of the size of the request.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ xkb/xkb.c |   65 +++++++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 40 insertions(+), 25 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index b9a3ac4..f3988f9 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -4957,25 +4957,29 @@ ProcXkbGetGeometry(ClientPtr client)
+ 
+ /***====================================================================***/
+ 
+-static char *
+-_GetCountedString(char **wire_inout, Bool swap)
++static Status
++_GetCountedString(char **wire_inout, ClientPtr client, char **str)
+ {
+-    char *wire, *str;
++    char *wire, *next;
+     CARD16 len;
+ 
+     wire = *wire_inout;
+     len = *(CARD16 *) wire;
+-    if (swap) {
++    if (client->swapped) {
+         swaps(&len);
+     }
+-    str = malloc(len + 1);
+-    if (str) {
+-        memcpy(str, &wire[2], len);
+-        str[len] = '\0';
+-    }
+-    wire += XkbPaddedSize(len + 2);
+-    *wire_inout = wire;
+-    return str;
++    next = wire + XkbPaddedSize(len + 2);
++    /* Check we're still within the size of the request */
++    if (client->req_len <
++        bytes_to_int32(next - (char *) client->requestBuffer))
++        return BadValue;
++    *str = malloc(len + 1);
++    if (!*str)
++        return BadAlloc;
++    memcpy(*str, &wire[2], len);
++    *(*str + len) = '\0';
++    *wire_inout = next;
++    return Success;
+ }
+ 
+ static Status
+@@ -4987,6 +4991,7 @@ _CheckSetDoodad(char **wire_inout,
+     xkbAnyDoodadWireDesc any;
+     xkbTextDoodadWireDesc text;
+     XkbDoodadPtr doodad;
++    Status status;
+ 
+     dWire = (xkbDoodadWireDesc *) (*wire_inout);
+     any = dWire->any;
+@@ -5036,8 +5041,14 @@ _CheckSetDoodad(char **wire_inout,
+         doodad->text.width = text.width;
+         doodad->text.height = text.height;
+         doodad->text.color_ndx = dWire->text.colorNdx;
+-        doodad->text.text = _GetCountedString(&wire, client->swapped);
+-        doodad->text.font = _GetCountedString(&wire, client->swapped);
++        status = _GetCountedString(&wire, client, &doodad->text.text);
++        if (status != Success)
++            return status;
++        status = _GetCountedString(&wire, client, &doodad->text.font);
++        if (status != Success) {
++            free (doodad->text.text);
++            return status;
++        }
+         break;
+     case XkbIndicatorDoodad:
+         if (dWire->indicator.onColorNdx >= geom->num_colors) {
+@@ -5072,7 +5083,9 @@ _CheckSetDoodad(char **wire_inout,
+         }
+         doodad->logo.color_ndx = dWire->logo.colorNdx;
+         doodad->logo.shape_ndx = dWire->logo.shapeNdx;
+-        doodad->logo.logo_name = _GetCountedString(&wire, client->swapped);
++        status = _GetCountedString(&wire, client, &doodad->logo.logo_name);
++        if (status != Success)
++            return status;
+         break;
+     default:
+         client->errorValue = _XkbErrCode2(0x4F, dWire->any.type);
+@@ -5304,18 +5317,20 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
+     char *wire;
+ 
+     wire = (char *) &req[1];
+-    geom->label_font = _GetCountedString(&wire, client->swapped);
++    status = _GetCountedString(&wire, client, &geom->label_font);
++    if (status != Success)
++        return status;
+ 
+     for (i = 0; i < req->nProperties; i++) {
+         char *name, *val;
+ 
+-        name = _GetCountedString(&wire, client->swapped);
+-        if (!name)
+-            return BadAlloc;
+-        val = _GetCountedString(&wire, client->swapped);
+-        if (!val) {
++        status = _GetCountedString(&wire, client, &name);
++        if (status != Success)
++            return status;
++        status = _GetCountedString(&wire, client, &val);
++        if (status != Success) {
+             free(name);
+-            return BadAlloc;
++            return status;
+         }
+         if (XkbAddGeomProperty(geom, name, val) == NULL) {
+             free(name);
+@@ -5349,9 +5364,9 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
+     for (i = 0; i < req->nColors; i++) {
+         char *name;
+ 
+-        name = _GetCountedString(&wire, client->swapped);
+-        if (!name)
+-            return BadAlloc;
++        status = _GetCountedString(&wire, client, &name);
++        if (status != Success)
++            return status;
+         if (!XkbAddGeomColor(geom, name, geom->num_colors)) {
+             free(name);
+             return BadAlloc;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
new file mode 100644
index 0000000..c841dbe
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch
@@ -0,0 +1,109 @@
+From 81c90dc8f0aae3b65730409b1b615b5fa7280ebd Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 16 Jan 2015 20:08:59 +0100
+Subject: [PATCH] xkb: Don't swap XkbSetGeometry data in the input buffer
+
+The XkbSetGeometry request embeds data which needs to be swapped when the
+server and the client have different endianess.
+
+_XkbSetGeometry() invokes functions that swap these data directly in the
+input buffer.
+
+However, ProcXkbSetGeometry() may call _XkbSetGeometry() more than once
+(if there is more than one keyboard), thus causing on swapped clients the
+same data to be swapped twice in memory, further causing a server crash
+because the strings lengths on the second time are way off bounds.
+
+To allow _XkbSetGeometry() to run reliably more than once with swapped
+clients, do not swap the data in the buffer, use variables instead.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ xkb/xkb.c |   35 +++++++++++++++++++----------------
+ 1 file changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 15c7f34..b9a3ac4 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -4961,14 +4961,13 @@ static char *
+ _GetCountedString(char **wire_inout, Bool swap)
+ {
+     char *wire, *str;
+-    CARD16 len, *plen;
++    CARD16 len;
+ 
+     wire = *wire_inout;
+-    plen = (CARD16 *) wire;
++    len = *(CARD16 *) wire;
+     if (swap) {
+-        swaps(plen);
++        swaps(&len);
+     }
+-    len = *plen;
+     str = malloc(len + 1);
+     if (str) {
+         memcpy(str, &wire[2], len);
+@@ -4985,25 +4984,28 @@ _CheckSetDoodad(char **wire_inout,
+ {
+     char *wire;
+     xkbDoodadWireDesc *dWire;
++    xkbAnyDoodadWireDesc any;
++    xkbTextDoodadWireDesc text;
+     XkbDoodadPtr doodad;
+ 
+     dWire = (xkbDoodadWireDesc *) (*wire_inout);
++    any = dWire->any;
+     wire = (char *) &dWire[1];
+     if (client->swapped) {
+-        swapl(&dWire->any.name);
+-        swaps(&dWire->any.top);
+-        swaps(&dWire->any.left);
+-        swaps(&dWire->any.angle);
++        swapl(&any.name);
++        swaps(&any.top);
++        swaps(&any.left);
++        swaps(&any.angle);
+     }
+     CHK_ATOM_ONLY(dWire->any.name);
+-    doodad = XkbAddGeomDoodad(geom, section, dWire->any.name);
++    doodad = XkbAddGeomDoodad(geom, section, any.name);
+     if (!doodad)
+         return BadAlloc;
+     doodad->any.type = dWire->any.type;
+     doodad->any.priority = dWire->any.priority;
+-    doodad->any.top = dWire->any.top;
+-    doodad->any.left = dWire->any.left;
+-    doodad->any.angle = dWire->any.angle;
++    doodad->any.top = any.top;
++    doodad->any.left = any.left;
++    doodad->any.angle = any.angle;
+     switch (doodad->any.type) {
+     case XkbOutlineDoodad:
+     case XkbSolidDoodad:
+@@ -5026,12 +5028,13 @@ _CheckSetDoodad(char **wire_inout,
+                                               dWire->text.colorNdx);
+             return BadMatch;
+         }
++        text = dWire->text;
+         if (client->swapped) {
+-            swaps(&dWire->text.width);
+-            swaps(&dWire->text.height);
++            swaps(&text.width);
++            swaps(&text.height);
+         }
+-        doodad->text.width = dWire->text.width;
+-        doodad->text.height = dWire->text.height;
++        doodad->text.width = text.width;
++        doodad->text.height = text.height;
+         doodad->text.color_ndx = dWire->text.colorNdx;
+         doodad->text.text = _GetCountedString(&wire, client->swapped);
+         doodad->text.font = _GetCountedString(&wire, client->swapped);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index 9d9ede2..cfbc491 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xshmfence-option.patch \
             file://Fix-subwindow-in-Xi-emulated-events.patch \
             file://xtrans.patch \
+            file://0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch \
+            file://0001-xkb-Check-strings-length-against-request-size.patch \
            "
 
 SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
-- 
1.7.9.5


