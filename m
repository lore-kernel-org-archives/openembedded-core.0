Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F20CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:08:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43299.1781878086376012552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UyoYNmpt;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c40397e3caso21715405ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781878086; x=1782482886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uNBj2hiQyQEgje7DEH5z6S6Vj/GdIG1BAf+fivVOrs=;
        b=UyoYNmptzKnqr9t05exRQ+5J9A6e919xoqEzAbwdbNYEsv44QTSn5K0xAoxlEmGolk
         uisSKUvAyxJdYWpKp/Ck9nx09ditBOGO69zQyqYWf88c2VPj95lFzJ8ENEHS5KeHRO+6
         wc7vCY20v5hhFOIrMSV1kUZA3xExiE6UneL1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878086; x=1782482886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uNBj2hiQyQEgje7DEH5z6S6Vj/GdIG1BAf+fivVOrs=;
        b=oCwIWLZdnA7qnB0QwfR3fuWO00v1P2QQTMqHq8A5Sr+3LNnhvomlkxr/betUgFW+dH
         3aT7oiVbU2jHmCNEMbExNTkP4OFkykiUS9ie0yrmi0XBYPVh5mL7vhCuYAfhZ+Zar5U1
         MZ760TeF/d7ZPsyc7H+S5n+UGF7vc3dJPwnSZCGaeon5lV6zcZ6FzgjBQ8RLxsmwNYsv
         Q4U+gjbFy/KDu0tErBV2YxsLb4hj6SRlcLIuCqspbFTh40s2jkBEqMktZ7veKScNRbFQ
         LdKA6QHaRXWjI6MIEwpD7lwxKqVx6Kl6rpUg4u5UeHZk4Rrsr1pDQh4c11HU17f1maWL
         WQIg==
X-Gm-Message-State: AOJu0YwjVbHp4bf1k2zsYwCuYbohm96kzEb5dRs4crTimt1QAcErixx+
	7B4yD51bNESpfysTublqZ45oK22LfHB8FTAovWMATX/gxlGAjmINknfuabvVii677jqa3IDg/rp
	6tUO6ZmE=
X-Gm-Gg: AfdE7cmvwDNZPw9ttzN9MptakR1Sc+1mKVFVIzi/R1ZJYjzrhLpSNYseBQePo4SWzEf
	NmBB7npzvyvnCGDCD72erMPDxamXIeY6rUtDDP46Zbk5aDl0XfOusEE+j7A9E/Mh4L1FgmiMaV/
	rsvktvO8fcB7FBHNsn31tHyX/DPqWH9+k1rORexRy37lcDsRbmJGo14YK+yLG1hPxz4Kbo/QbuH
	jEfBJKB26YUUXvdWul5ikjwvb0lQAUbeujrF+8wYZilQBQV6ujF0eL6ZgYdIE9vG2F6qntp5bHe
	EsUNPR/I2l6yznZ4zWis0z0Jvz3t0C/JhK8tMO9pf6boDVIcoiTTE08eKoGQQA/u2nxs7Z9iG/q
	sbvEdaA/iZ82ZOidf5ejlUkDMVlgJ9j7iZC9U+15BMnS7+1mjruSBcjf87Zu0HUAsVDTYsK0gsf
	lUAqb1zHyVe/CX8RAQqasIw1NZV6/C
X-Received: by 2002:a17:902:e84a:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c725ba7171mr30612645ad.3.1781878085566;
        Fri, 19 Jun 2026 07:08:05 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:42a9:d9f6:7cbc:746a:c8a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209e1c7esm25591835ad.57.2026.06.19.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:08:05 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/5] xwayland: Fix CVE-2026-34000
Date: Fri, 19 Jun 2026 19:37:47 +0530
Message-ID: <20260619140750.914225-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619140750.914225-1-vanusuri@mvista.com>
References: <20260619140750.914225-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239173

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34000

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2026-34000.patch    | 72 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
new file mode 100644
index 0000000000..7ce7cfa80c
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 65f1ed2ae0..1a076ab552 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62230-0002.patch \
            file://CVE-2025-62231.patch \
            file://CVE-2026-33999.patch \
+           file://CVE-2026-34000.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


