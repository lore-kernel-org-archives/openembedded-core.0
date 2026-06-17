Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F173CCD98F6
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10392.1781682334850208578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AfjWAugX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso52046805e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682333; x=1782287133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeGMP12SsTQ5ZOHYh0rPh2GCgSpyKREoyOFffcvW+HI=;
        b=AfjWAugX5KdbYIDknGLEesOPOP65U+PUigbUdLQFRxldB3TPyZJ0mx/ZEOFqZa9eP2
         2K+F7kUz6LxSsQmz56qLSNlHxQu37+5XJYHl3DrvBkwysORfXVKwDz1D2Ff2TfTvu6fJ
         NMb49Y4faLBzCv02jkdnZVITZYdFippbz4OLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682333; x=1782287133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeGMP12SsTQ5ZOHYh0rPh2GCgSpyKREoyOFffcvW+HI=;
        b=GT6c5QgpUqtapUgqMgwGUmSI/GW1V2SDC7mbPWYNE74Zh+LB4524nQroTLlPYrPth1
         n4g+1idI88ACRc74HDoFGODJ4ORYeYhwgnMPErdC4krseLNjrei4ps60CAHCStnTWYpz
         uzhy3BC+zHzVJocDOGLtDv9w6jXW249quooud7jw4u6C6cbpktNfhDJDleku3zAemsFY
         OXI51lXSiP93nXGQQfJqczz5v02Fuc5lIh0uxdfNqVYQ/4u1lBL8KlmDORWrIkR5kFXy
         Yk7p8xoJJXZIgxcEMNo7i1ZpkwjYgxDzG0O1hqITfV6LaqjHFSnZxVka/bU6PzJODM35
         kAew==
X-Gm-Message-State: AOJu0YxASM6+QJSLszdgnIHhiDTSmqp9AzfePqP2nwzSqMhxSmg8gx+5
	8QUGVmD/FnJIei9WDmOP3PLShH+zlKC1jXQ3+b36DaLSEJkd6D0SACoADbRKnFp+YzBRMzbj8wu
	pidgE
X-Gm-Gg: Acq92OExr4hh801ti0Yu3zP6nWPiYMpwi5JkXFnJMYldr/vb3HYJXtY8Ra2a8uNyiAu
	0kVjXZYvYmsG+JNiw48/M3WoUcYSHYOer07s+FdtaEJO0cFaoA+7iLL+f7RAUAk+Xu7LLvC368i
	t98H/j6XF6vul3Q0Cw6IC/lvClZm9TQTuGwGEcfAjZAwT+lNHgkx1UgTlQ25cz6ZMQXgjARFPf+
	smQr3YP+kDdW6wXEWPjCWN0+APJp+4VBZhtFaowZsWNExsUdGyXqG5BOJWMaZmT/f20kCkRdkp8
	atiPd2XSk3lYY8BT4e//q/Hos++yc2LAOAgALQdwWS7xuGR4C3dvUk049sz+eQV6KlHa7wM4x4s
	0BOcjwwkfoM/+ykQNlWg6+80hlz0yA4bZrCPa+U+RNgF88BPbMyziPrhEROQUJINvggswsjd1P8
	GkINCQq+thDujBDifl4ZjYYl7yTd4KexyrBq3Iv4UIqOcvQ9rdDRJgHsqDhNc0jwP48gzMDsAKI
	Wg44pOwunTwaDdUkQ==
X-Received: by 2002:a05:600c:1d16:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-492333c9f38mr40357165e9.24.1781682332909;
        Wed, 17 Jun 2026 00:45:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/30] xserver-xorg: Fix CVE-2026-34000
Date: Wed, 17 Jun 2026 09:44:46 +0200
Message-ID: <3611b45c3c0144172c032964bf0d601dba649b49.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238993

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34000

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xserver-xorg/CVE-2026-34000.patch         | 72 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch
new file mode 100644
index 00000000000..7ce7cfa80c0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch
@@ -0,0 +1,72 @@
+From 81b6a34f90b28c32ad499a78a4f391b7c06daea2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Feb 2026 16:03:11 +0100
+Subject: [PATCH] xkb: Fix bounds check in _CheckSetGeom()
+
+As reported by valgrind:
+
+  == Conditional jump or move depends on uninitialised value(s)
+  ==    at 0x5CBE66: SrvXkbAddGeomKeyAlias (XKBGAlloc.c:585)
+  ==    by 0x5AC7D5: _CheckSetGeom (xkb.c:5607)
+  ==    by 0x5AC952: _XkbSetGeometry (xkb.c:5643)
+  ==    by 0x5ACB58: ProcXkbSetGeometry (xkb.c:5684)
+  ==    by 0x5B0DAC: ProcXkbDispatch (xkb.c:7070)
+  ==    by 0x4A28C5: Dispatch (dispatch.c:553)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+  ==  Uninitialised value was created by a heap allocation
+  ==    at 0x4840B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x5E13B0: AllocateInputBuffer (io.c:981)
+  ==    by 0x5E05CD: InsertFakeRequest (io.c:516)
+  ==    by 0x4AA860: NextAvailableClient (dispatch.c:3629)
+  ==    by 0x5DE0D7: AllocNewConnection (connection.c:628)
+  ==    by 0x5DE2C6: EstablishNewConnections (connection.c:692)
+  ==    by 0x5DE600: HandleNotifyFd (connection.c:809)
+  ==    by 0x5E2598: ospoll_wait (ospoll.c:660)
+  ==    by 0x5DA00C: WaitForSomething (WaitFor.c:208)
+  ==    by 0x4A26E5: Dispatch (dispatch.c:493)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+
+Each key alias entry contains two key names (the alias and the real key
+name), each of size XkbKeyNameLength.
+
+The current bounds check only validates the first name, allowing
+XkbAddGeomKeyAlias to potentially read uninitialized memory when
+accessing the second name at &wire[XkbKeyNameLength].
+
+To fix this, change the value to check to use 2 * XkbKeyNameLength to
+validate the bounds.
+
+CVE-2026-34000, ZDI-CAN-28679
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/81b6a34f90b28c32ad499a78a4f391b7c06daea2]
+CVE: CVE-2026-34000
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 2b9004a..1ba638b 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5603,7 +5603,7 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
+     }
+ 
+     for (i = 0; i < req->nKeyAliases; i++) {
+-        if (!_XkbCheckRequestBounds(client, req, wire, wire + XkbKeyNameLength))
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 2 * XkbKeyNameLength))
+                 return BadLength;
+ 
+         if (XkbAddGeomKeyAlias(geom, &wire[XkbKeyNameLength], wire) == NULL)
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index ef7f5c5bdb9..658a608b5ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
             file://CVE-2026-33999.patch \
+            file://CVE-2026-34000.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 

