Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DAE0377F7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:39:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7H7doQw009415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 00:39:51 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 17 Aug 2017 00:39:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 15:39:13 +0800
Message-ID: <20170817073913.18062-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: Fix CVE-2017-10971
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
X-List-Received-Date: Thu, 17 Aug 2017 07:39:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport 3 patches to fix CVE-2017-10971:

In the X.Org X server before 2017-06-19, a user authenticated to an X
Session could crash or execute code in the context of the X Server by
exploiting a stack overflow in the endianness conversion of X Events.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-10971

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../xserver-xorg/CVE-2017-10971-1.patch            | 76 ++++++++++++++++++++++
 .../xserver-xorg/CVE-2017-10971-2.patch            | 55 ++++++++++++++++
 .../xserver-xorg/CVE-2017-10971-3.patch            | 50 ++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.3.bb            |  3 +
 4 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
new file mode 100644
index 0000000000..23c8049896
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
@@ -0,0 +1,76 @@
+From 215f894965df5fb0bb45b107d84524e700d2073c Mon Sep 17 00:00:00 2001
+From: Michal Srb <msrb@suse.com>
+Date: Wed, 24 May 2017 15:54:40 +0300
+Subject: [PATCH] dix: Disallow GenericEvent in SendEvent request.
+
+The SendEvent request holds xEvent which is exactly 32 bytes long, no more,
+no less. Both ProcSendEvent and SProcSendEvent verify that the received data
+exactly match the request size. However nothing stops the client from passing
+in event with xEvent::type = GenericEvent and any value of
+xGenericEvent::length.
+
+In the case of ProcSendEvent, the event will be eventually passed to
+WriteEventsToClient which will see that it is Generic event and copy the
+arbitrary length from the receive buffer (and possibly past it) and send it to
+the other client. This allows clients to copy unitialized heap memory out of X
+server or to crash it.
+
+In case of SProcSendEvent, it will attempt to swap the incoming event by
+calling a swapping function from the EventSwapVector array. The swapped event
+is written to target buffer, which in this case is local xEvent variable. The
+xEvent variable is 32 bytes long, but the swapping functions for GenericEvents
+expect that the target buffer has size matching the size of the source
+GenericEvent. This allows clients to cause stack buffer overflows.
+
+Signed-off-by: Michal Srb <msrb@suse.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+CVE: CVE-2017-10971
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=215f894965df5fb0bb45b107d84524e700d2073c]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ dix/events.c  |    6 ++++++
+ dix/swapreq.c |    7 +++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/dix/events.c b/dix/events.c
+index 3e3a01e..d3a33ea 100644
+--- a/dix/events.c
++++ b/dix/events.c
+@@ -5366,6 +5366,12 @@ ProcSendEvent(ClientPtr client)
+         client->errorValue = stuff->event.u.u.type;
+         return BadValue;
+     }
++    /* Generic events can have variable size, but SendEvent request holds
++       exactly 32B of event data. */
++    if (stuff->event.u.u.type == GenericEvent) {
++        client->errorValue = stuff->event.u.u.type;
++        return BadValue;
++    }
+     if (stuff->event.u.u.type == ClientMessage &&
+         stuff->event.u.u.detail != 8 &&
+         stuff->event.u.u.detail != 16 && stuff->event.u.u.detail != 32) {
+diff --git a/dix/swapreq.c b/dix/swapreq.c
+index 719e9b8..6785059 100644
+--- a/dix/swapreq.c
++++ b/dix/swapreq.c
+@@ -292,6 +292,13 @@ SProcSendEvent(ClientPtr client)
+     swapl(&stuff->destination);
+     swapl(&stuff->eventMask);
+ 
++    /* Generic events can have variable size, but SendEvent request holds
++       exactly 32B of event data. */
++    if (stuff->event.u.u.type == GenericEvent) {
++        client->errorValue = stuff->event.u.u.type;
++        return BadValue;
++    }
++
+     /* Swap event */
+     proc = EventSwapVector[stuff->event.u.u.type & 0177];
+     if (!proc || proc == NotImplemented)        /* no swapping proc; invalid event type? */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
new file mode 100644
index 0000000000..5c9887afa1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
@@ -0,0 +1,55 @@
+From 8caed4df36b1f802b4992edcfd282cbeeec35d9d Mon Sep 17 00:00:00 2001
+From: Michal Srb <msrb@suse.com>
+Date: Wed, 24 May 2017 15:54:41 +0300
+Subject: [PATCH] Xi: Verify all events in ProcXSendExtensionEvent.
+
+The requirement is that events have type in range
+EXTENSION_EVENT_BASE..lastEvent, but it was tested
+only for first event of all.
+
+Signed-off-by: Michal Srb <msrb@suse.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+CVE: CVE-2017-10971
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=8caed4df36b1f802b4992edcfd282cbeeec35d9d]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Xi/sendexev.c |   12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/Xi/sendexev.c b/Xi/sendexev.c
+index 1cf118a..5e63bfc 100644
+--- a/Xi/sendexev.c
++++ b/Xi/sendexev.c
+@@ -117,7 +117,7 @@ SProcXSendExtensionEvent(ClientPtr client)
+ int
+ ProcXSendExtensionEvent(ClientPtr client)
+ {
+-    int ret;
++    int ret, i;
+     DeviceIntPtr dev;
+     xEvent *first;
+     XEventClass *list;
+@@ -141,10 +141,12 @@ ProcXSendExtensionEvent(ClientPtr client)
+     /* The client's event type must be one defined by an extension. */
+ 
+     first = ((xEvent *) &stuff[1]);
+-    if (!((EXTENSION_EVENT_BASE <= first->u.u.type) &&
+-          (first->u.u.type < lastEvent))) {
+-        client->errorValue = first->u.u.type;
+-        return BadValue;
++    for (i = 0; i < stuff->num_events; i++) {
++        if (!((EXTENSION_EVENT_BASE <= first[i].u.u.type) &&
++            (first[i].u.u.type < lastEvent))) {
++            client->errorValue = first[i].u.u.type;
++            return BadValue;
++        }
+     }
+ 
+     list = (XEventClass *) (first + stuff->num_events);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
new file mode 100644
index 0000000000..54ba481024
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
@@ -0,0 +1,50 @@
+From ba336b24052122b136486961c82deac76bbde455 Mon Sep 17 00:00:00 2001
+From: Michal Srb <msrb@suse.com>
+Date: Wed, 24 May 2017 15:54:42 +0300
+Subject: [PATCH] Xi: Do not try to swap GenericEvent.
+
+The SProcXSendExtensionEvent must not attempt to swap GenericEvent because
+it is assuming that the event has fixed size and gives the swapping function
+xEvent-sized buffer.
+
+A GenericEvent would be later rejected by ProcXSendExtensionEvent anyway.
+
+Signed-off-by: Michal Srb <msrb@suse.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+CVE: CVE-2017-10971
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=ba336b24052122b136486961c82deac76bbde455]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Xi/sendexev.c |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/sendexev.c b/Xi/sendexev.c
+index 5e63bfc..5c2e0fc 100644
+--- a/Xi/sendexev.c
++++ b/Xi/sendexev.c
+@@ -95,9 +95,17 @@ SProcXSendExtensionEvent(ClientPtr client)
+ 
+     eventP = (xEvent *) &stuff[1];
+     for (i = 0; i < stuff->num_events; i++, eventP++) {
++        if (eventP->u.u.type == GenericEvent) {
++            client->errorValue = eventP->u.u.type;
++            return BadValue;
++        }
++
+         proc = EventSwapVector[eventP->u.u.type & 0177];
+-        if (proc == NotImplemented)     /* no swapping proc; invalid event type? */
++        /* no swapping proc; invalid event type? */
++        if (proc == NotImplemented) {
++            client->errorValue = eventP->u.u.type;
+             return BadValue;
++        }
+         (*proc) (eventP, &eventT);
+         *eventP = eventT;
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
index 606367d1e9..65ef6c683b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
@@ -5,6 +5,9 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
+            file://CVE-2017-10971-1.patch \
+            file://CVE-2017-10971-2.patch \
+            file://CVE-2017-10971-3.patch \
             "
 SRC_URI[md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
 SRC_URI[sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
-- 
2.11.0


