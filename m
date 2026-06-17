Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5CFCD98FA
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10217.1781682336935811233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kQGU61f1;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-461a15cce0bso1121638f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682335; x=1782287135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQvmSOy+Y+vOlfkxQqDmRGC6hdAwmh8bxuO8lzwpqFs=;
        b=kQGU61f1u/p4/0eS5zoaMQYohhDAl/cU6VDO4kd2RHzy/9vaDfVMKsVX7cm1QLBvv6
         muGAnDCErp5xq6jNoYilaqu38YPcQA+wUX/rWVYU+l0zeK9J+yv/UxwPpw0n/xwsc5cp
         6IvtzwChCA1QwZLEUFPHoJQxsZ1Ut8vAUhSPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682335; x=1782287135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQvmSOy+Y+vOlfkxQqDmRGC6hdAwmh8bxuO8lzwpqFs=;
        b=qW0t2PfNvATaWYFDGAsQxq7IbYuTszRZ57Pc4vxvbprlYBxktGI/6qVandOfvJERW+
         DkWaBrv52LwR5QbhFYkizOxB+iWNzbfcn9FMwfrUp3dbn2fxZCxilZVIqgSW3fsf9rc3
         M+IaS8yfB3SF62WeSHkvdob932mOZa+LIgITq3OZHigxnMVE1H248JiwCok2pYPgR1LY
         hOM7VM08Ko71eBZuN5o+h+x8Au/1vFbCFB485RzoiTSpXTi1E99v3/oq5vb5tKpUN2Lh
         Xhc0BACuMjwS7M6AH74XXXEw+kJKVeWpZptOm970K4Qzegx53rfXZttbs+IclqPvo8de
         0JjA==
X-Gm-Message-State: AOJu0YxqFS3QjGWpofpTIaSWpl2tJbAHwaxDmjcjfINODG+bQKO9tGh3
	o8UUmY72syH6/qFG0wYOPsMSobow1poA9FYMiSbNamuvrU+ILS3l1iPL9J/rW3sRUqbWvklj278
	8Amp9
X-Gm-Gg: AfdE7ckM63xXBGG+F6ncFSZiyhBam6qD703uSmeqBDMxyNKxS14p9Fr8o5+NbLeJSPT
	7in3TIYxml6DDSzr/LqwYG23UTYBX4YkS2wUBsN/lK+LUCmBeBAizF5GcXGnLCgWMONaEZEcw9g
	DsMhHpQ4j3fFVLAwW40G0Q04IpkHU3YvK7u2RcamFNG3g1OvQOzrckcUqBOaFcaW6Nv750otQgS
	QfreeyLgIBDiveQlRstHxzA4u7dY3/eEbdpKI33GHZSYjq/O9APBJX6ebSKushxavxluE9bW37O
	CbxA0CtHqQ5OygREjMUQEgwEev/a8lNL02LznpAr/A2IUuEZnPfuPOGIMjVwwlbRi8QXq8tNh80
	ruDNonGucVFRZxLO6+qCihEaPFgJqVIFBODT9zI41uz6gvH0JFZnhr87TBx2PY4hRyeUZ53gq4m
	dz7GhJnQUAoNFffCwxIjZe9xj0f7Su3XtVBRSjQ43HVEP1TAG0zTTwsgFK7lDhEes6IudPMWIMe
	SKNmXi6mkx51Q400FRHuaYXP0On
X-Received: by 2002:a05:6000:2208:b0:463:167a:47f with SMTP id ffacd0b85a97d-463167a058fmr434405f8f.34.1781682335037;
        Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/30] xserver-xorg: Fix CVE-2026-34003
Date: Wed, 17 Jun 2026 09:44:49 +0200
Message-ID: <5faf37e3de47291cffed048ae20d91033d94d686.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238996

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xserver-xorg/CVE-2026-34003-1.patch       | 113 +++++++++
 .../xserver-xorg/CVE-2026-34003-2.patch       | 223 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |   2 +
 3 files changed, 338 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-1.patch
new file mode 100644
index 00000000000..3a1a9db8cb3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-1.patch
@@ -0,0 +1,113 @@
+From b85b00dd7b9eee05e3c12e7ad1fce4fc6671507b Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 23 Feb 2026 15:52:49 +0100
+Subject: [PATCH] xkb: Add additional bound checking in CheckKeyTypes()
+
+The function CheckKeyTypes() will loop over the client's request but
+won't perform any additional bound checking to ensure that the data
+read remains within the request bounds.
+
+As a result, a specifically crafted request may cause CheckKeyTypes() to
+read past the request data, as reported by valgrind:
+
+  == Invalid read of size 2
+  ==    at 0x5A3D1D: CheckKeyTypes (xkb.c:1694)
+  ==    by 0x5A6A9C: _XkbSetMapChecks (xkb.c:2515)
+  ==    by 0x5A759E: ProcXkbSetMap (xkb.c:2736)
+  ==    by 0x5BF832: SProcXkbSetMap (xkbSwap.c:245)
+  ==    by 0x5C05ED: SProcXkbDispatch (xkbSwap.c:501)
+  ==    by 0x4A20DF: Dispatch (dispatch.c:551)
+  ==    by 0x4B03B4: dix_main (main.c:277)
+  ==    by 0x428941: main (stubmain.c:34)
+  ==  Address is 30 bytes after a block of size 28,672 in arena "client"
+  ==
+  == Invalid read of size 2
+  ==    at 0x5A3AB6: CheckKeyTypes (xkb.c:1669)
+  ==    by 0x5A6A9C: _XkbSetMapChecks (xkb.c:2515)
+  ==    by 0x5A759E: ProcXkbSetMap (xkb.c:2736)
+  ==    by 0x5BF832: SProcXkbSetMap (xkbSwap.c:245)
+  ==    by 0x5C05ED: SProcXkbDispatch (xkbSwap.c:501)
+  ==    by 0x4A20DF: Dispatch (dispatch.c:551)
+  ==    by 0x4B03B4: dix_main (main.c:277)
+  ==    by 0x428941: main (stubmain.c:34)
+  ==  Address is 2 bytes after a block of size 28,672 alloc'd
+  ==    at 0x4848897: realloc (vg_replace_malloc.c:1804)
+  ==    by 0x5E357A: ReadRequestFromClient (io.c:336)
+  ==    by 0x4A1FAB: Dispatch (dispatch.c:519)
+  ==    by 0x4B03B4: dix_main (main.c:277)
+  ==    by 0x428941: main (stubmain.c:34)
+  ==
+  == Invalid write of size 2
+  ==    at 0x5A3AD7: CheckKeyTypes (xkb.c:1669)
+  ==    by 0x5A6A9C: _XkbSetMapChecks (xkb.c:2515)
+  ==    by 0x5A759E: ProcXkbSetMap (xkb.c:2736)
+  ==    by 0x5BF832: SProcXkbSetMap (xkbSwap.c:245)
+  ==    by 0x5C05ED: SProcXkbDispatch (xkbSwap.c:501)
+  ==    by 0x4A20DF: Dispatch (dispatch.c:551)
+  ==    by 0x4B03B4: dix_main (main.c:277)
+  ==    by 0x428941: main (stubmain.c:34)
+  ==  Address is 2 bytes after a block of size 28,672 alloc'd
+  ==    at 0x4848897: realloc (vg_replace_malloc.c:1804)
+  ==    by 0x5E357A: ReadRequestFromClient (io.c:336)
+  ==    by 0x4A1FAB: Dispatch (dispatch.c:519)
+  ==    by 0x4B03B4: dix_main (main.c:277)
+  ==    by 0x428941: main (stubmain.c:34)
+  ==
+
+To avoid that issue, add additional bounds checking within the loops by
+calling _XkbCheckRequestBounds() and report an error if we are to read
+past the client's request.
+
+CVE-2026-34003, ZDI-CAN-28736
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b85b00dd7b9eee05e3c12e7ad1fce4fc6671507b]
+CVE: CVE-2026-34003
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 3fcc6c4..0ef634b 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1639,6 +1639,10 @@ CheckKeyTypes(ClientPtr client,
+     for (i = 0; i < req->nTypes; i++) {
+         unsigned width;
+ 
++	if (!_XkbCheckRequestBounds(client, req, wire, wire + 1)) {
++	    *nMapsRtrn = _XkbErrCode3(0x0b, req->nTypes, i);
++	    return 0;
++	}
+         if (client->swapped && doswap) {
+             swaps(&wire->virtualMods);
+         }
+@@ -1664,7 +1668,18 @@ CheckKeyTypes(ClientPtr client,
+             xkbModsWireDesc *preWire;
+ 
+             mapWire = (xkbKTSetMapEntryWireDesc *) &wire[1];
++	    if (!_XkbCheckRequestBounds(client, req, mapWire,
++				        &mapWire[wire->nMapEntries])) {
++		*nMapsRtrn = _XkbErrCode3(0x0c, i, wire->nMapEntries);
++		return 0;
++	    }
+             preWire = (xkbModsWireDesc *) &mapWire[wire->nMapEntries];
++	    if (wire->preserve &&
++		!_XkbCheckRequestBounds(client, req, preWire,
++			                &preWire[wire->nMapEntries])) {
++		*nMapsRtrn = _XkbErrCode3(0x0d, i, wire->nMapEntries);
++		return 0;
++	    }
+             for (n = 0; n < wire->nMapEntries; n++) {
+                 if (client->swapped && doswap) {
+                     swaps(&mapWire[n].virtualMods);
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-2.patch
new file mode 100644
index 00000000000..15b2b946d50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34003-2.patch
@@ -0,0 +1,223 @@
+From d38c563fab5c4a554e0939da39e4d1dadef7cbae Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 2 Mar 2026 14:09:57 +0100
+Subject: [PATCH] xkb: Add more _XkbCheckRequestBounds()
+
+Similar to the recent fixes, add more _XkbCheckRequestBounds() to the
+functions that loop over the request data, i.e.:
+
+ * CheckKeySyms()
+ * CheckKeyActions()
+ * CheckKeyBehaviors()
+ * CheckVirtualMods()
+ * CheckKeyExplicit()
+ * CheckVirtualModMap()
+ * _XkbSetMapChecks()
+
+All these are static functions so we can add the client to the parameters
+without breaking any API.
+
+See also:
+CVE-2026-34003, ZDI-CAN-28736, CVE-2026-34002, ZDI-CAN-28737
+
+v2: Check for "nSyms != 0" in CheckKeySyms() to avoid false positives.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d38c563fab5c4a554e0939da39e4d1dadef7cbae]
+CVE: CVE-2026-34003
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 69 ++++++++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 55 insertions(+), 14 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 0ef634b..6320914 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1752,6 +1752,11 @@ CheckKeySyms(ClientPtr client,
+         KeySym *pSyms;
+         register unsigned nG;
+ 
++        /* Check we received enough data to read the next xkbSymMapWireDesc */
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 1)) {
++            *errorRtrn = _XkbErrCode3(0x18, i + req->firstKeySym, i);
++            return 0;
++        }
+         if (client->swapped && doswap) {
+             swaps(&wire->nSyms);
+         }
+@@ -1790,6 +1795,12 @@ CheckKeySyms(ClientPtr client,
+             return 0;
+         }
+         pSyms = (KeySym *) &wire[1];
++        if (wire->nSyms != 0) {
++            if (!_XkbCheckRequestBounds(client, req, pSyms, &pSyms[wire->nSyms])) {
++                *errorRtrn = _XkbErrCode3(0x19, i + req->firstKeySym, wire->nSyms);
++                return 0;
++            }
++        }
+         wire = (xkbSymMapWireDesc *) &pSyms[wire->nSyms];
+     }
+ 
+@@ -1813,11 +1824,12 @@ CheckKeySyms(ClientPtr client,
+ }
+ 
+ static int
+-CheckKeyActions(XkbDescPtr xkb,
+-                xkbSetMapReq * req,
+-                int nTypes,
+-                CARD8 *mapWidths,
+-                CARD16 *symsPerKey, CARD8 **wireRtrn, int *nActsRtrn)
++CheckKeyActions(ClientPtr client,
++               XkbDescPtr xkb,
++               xkbSetMapReq * req,
++               int nTypes,
++               CARD8 *mapWidths,
++               CARD16 *symsPerKey, CARD8 **wireRtrn, int *nActsRtrn)
+ {
+     int nActs;
+     CARD8 *wire = *wireRtrn;
+@@ -1828,6 +1840,11 @@ CheckKeyActions(XkbDescPtr xkb,
+     CHK_REQ_KEY_RANGE2(0x21, req->firstKeyAct, req->nKeyActs, req, (*nActsRtrn),
+                        0);
+     for (nActs = i = 0; i < req->nKeyActs; i++) {
++        /* Check we received enough data to read the next byte on the wire */
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 1)) {
++            *nActsRtrn = _XkbErrCode3(0x24, i + req->firstKeyAct, i);
++            return 0;
++        }
+         if (wire[0] != 0) {
+             if (wire[0] == symsPerKey[i + req->firstKeyAct])
+                 nActs += wire[0];
+@@ -1846,7 +1863,8 @@ CheckKeyActions(XkbDescPtr xkb,
+ }
+ 
+ static int
+-CheckKeyBehaviors(XkbDescPtr xkb,
++CheckKeyBehaviors(ClientPtr client,
++                  XkbDescPtr xkb,
+                   xkbSetMapReq * req,
+                   xkbBehaviorWireDesc ** wireRtrn, int *errorRtrn)
+ {
+@@ -1872,6 +1890,11 @@ CheckKeyBehaviors(XkbDescPtr xkb,
+     }
+ 
+     for (i = 0; i < req->totalKeyBehaviors; i++, wire++) {
++        /* Check we received enough data to read the next behavior */
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 1)) {
++            *errorRtrn = _XkbErrCode3(0x36, first, i);
++            return 0;
++        }
+         if ((wire->key < first) || (wire->key > last)) {
+             *errorRtrn = _XkbErrCode4(0x33, first, last, wire->key);
+             return 0;
+@@ -1897,7 +1920,8 @@ CheckKeyBehaviors(XkbDescPtr xkb,
+ }
+ 
+ static int
+-CheckVirtualMods(XkbDescRec * xkb,
++CheckVirtualMods(ClientPtr client,
++                 XkbDescRec * xkb,
+                  xkbSetMapReq * req, CARD8 **wireRtrn, int *errorRtrn)
+ {
+     register CARD8 *wire = *wireRtrn;
+@@ -1909,12 +1933,18 @@ CheckVirtualMods(XkbDescRec * xkb,
+         if (req->virtualMods & bit)
+             nMods++;
+     }
++    /* Check we received enough data for the number of virtual mods expected */
++    if (!_XkbCheckRequestBounds(client, req, wire, wire + XkbPaddedSize(nMods))) {
++        *errorRtrn = _XkbErrCode3(0x37, nMods, i);
++        return 0;
++    }
+     *wireRtrn = (wire + XkbPaddedSize(nMods));
+     return 1;
+ }
+ 
+ static int
+-CheckKeyExplicit(XkbDescPtr xkb,
++CheckKeyExplicit(ClientPtr client,
++                 XkbDescPtr xkb,
+                  xkbSetMapReq * req, CARD8 **wireRtrn, int *errorRtrn)
+ {
+     register CARD8 *wire = *wireRtrn;
+@@ -1940,6 +1970,11 @@ CheckKeyExplicit(XkbDescPtr xkb,
+     }
+     start = wire;
+     for (i = 0; i < req->totalKeyExplicit; i++, wire += 2) {
++        /* Check we received enough data to read the next two bytes */
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 2)) {
++            *errorRtrn = _XkbErrCode4(0x54, first, last, i);
++            return 0;
++        }
+         if ((wire[0] < first) || (wire[0] > last)) {
+             *errorRtrn = _XkbErrCode4(0x53, first, last, wire[0]);
+             return 0;
+@@ -1995,7 +2030,8 @@ CheckModifierMap(ClientPtr client, XkbDescPtr xkb, xkbSetMapReq * req,
+ }
+ 
+ static int
+-CheckVirtualModMap(XkbDescPtr xkb,
++CheckVirtualModMap(ClientPtr client,
++                   XkbDescPtr xkb,
+                    xkbSetMapReq * req,
+                    xkbVModMapWireDesc ** wireRtrn, int *errRtrn)
+ {
+@@ -2019,6 +2055,11 @@ CheckVirtualModMap(XkbDescPtr xkb,
+         return 0;
+     }
+     for (i = 0; i < req->totalVModMapKeys; i++, wire++) {
++        /* Check we received enough data to read the next virtual mod map key */
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 1)) {
++            *errRtrn = _XkbErrCode3(0x74, first, i);
++            return 0;
++        }
+         if ((wire->key < first) || (wire->key > last)) {
+             *errRtrn = _XkbErrCode4(0x73, first, last, wire->key);
+             return 0;
+@@ -2563,7 +2604,7 @@ _XkbSetMapChecks(ClientPtr client, DeviceIntPtr dev, xkbSetMapReq * req,
+     }
+ 
+     if ((req->present & XkbKeyActionsMask) &&
+-        (!CheckKeyActions(xkb, req, nTypes, mapWidths, symsPerKey,
++        (!CheckKeyActions(client, xkb, req, nTypes, mapWidths, symsPerKey,
+                           (CARD8 **) &values, &nActions))) {
+         client->errorValue = nActions;
+         return BadValue;
+@@ -2571,18 +2612,18 @@ _XkbSetMapChecks(ClientPtr client, DeviceIntPtr dev, xkbSetMapReq * req,
+ 
+     if ((req->present & XkbKeyBehaviorsMask) &&
+         (!CheckKeyBehaviors
+-         (xkb, req, (xkbBehaviorWireDesc **) &values, &error))) {
++         (client, xkb, req, (xkbBehaviorWireDesc **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+ 
+     if ((req->present & XkbVirtualModsMask) &&
+-        (!CheckVirtualMods(xkb, req, (CARD8 **) &values, &error))) {
++        (!CheckVirtualMods(client, xkb, req, (CARD8 **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+     if ((req->present & XkbExplicitComponentsMask) &&
+-        (!CheckKeyExplicit(xkb, req, (CARD8 **) &values, &error))) {
++        (!CheckKeyExplicit(client, xkb, req, (CARD8 **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+@@ -2593,7 +2634,7 @@ _XkbSetMapChecks(ClientPtr client, DeviceIntPtr dev, xkbSetMapReq * req,
+     }
+     if ((req->present & XkbVirtualModMapMask) &&
+         (!CheckVirtualModMap
+-         (xkb, req, (xkbVModMapWireDesc **) &values, &error))) {
++         (client, xkb, req, (xkbVModMapWireDesc **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 2f7edd16a19..110b3bbbdf0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -9,6 +9,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://CVE-2026-34000.patch \
             file://CVE-2026-34001.patch \
             file://CVE-2026-34002.patch \
+            file://CVE-2026-34003-1.patch \
+            file://CVE-2026-34003-2.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 

