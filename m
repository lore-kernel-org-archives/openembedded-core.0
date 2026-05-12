Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73416CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:59:53 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70958.1778576393096051298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jLltB3Mn;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36643b96b99so3328373a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778576392; x=1779181192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tNFJsLcFrpBjFF4nrRInMTGwZhz6OwxoqMDzd5RdFw=;
        b=jLltB3Mnvdl95H1p972s0UUrYwTfOv/wWDmFTAylRLM3es2HAcoMRX8/vGLyU+LVXF
         +bjRcHRtsUwRnkC/cfTsitHPk3a6drQ1xvy3q7ML5rNiIgboYGb1XIyBONw7kl16hiyr
         vHgZ0+1JeyNnXw/nN/qPSzq8/PtAbwbTxHei4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576392; x=1779181192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9tNFJsLcFrpBjFF4nrRInMTGwZhz6OwxoqMDzd5RdFw=;
        b=BXAwGbiFvipVsrayUPpoc/uspIlqfHqIyhdhHOG+NVQ70t+EqRJ8SlKDt8b5W/vPND
         hWUnwfkr4MAnzPibCiBPmuxh9Rlva8gacMzmF1d9k+dMMQ4/fsrCUSgJSjl/HdVruH58
         6XwpawqN+NMTW4k7RWLdQ05WIpTATET7j7jNlNzlgZJlC8w8ArVPTHVg5g8o0qR627iN
         pHG01tLbvrihEimC1lqOS1HfmtPNdIjWWLel3n/nKF9bSGpPZWQsf1wjmIV9EWkZIEIJ
         0jMHhWud0bK3eOR9EKvuImzhZPZEf4zQPtjISZmZWqjHtp9h61lRwVqNWxX1vFIidXmv
         dakA==
X-Gm-Message-State: AOJu0YyYqMUVmst+ii9oX/TygrV4qxy3TdK8OUQUNt/c8UzHFTuyoZry
	ciMkSypROjYYqXxNxLt1aDsKXyArBYhJG5uG/pxX414pUGP/1ZrHuogfMiO6Mor5IJiimsfr4Tp
	vGPTP
X-Gm-Gg: Acq92OG+4AUQSMxOupUgdtmqSZ8TvKnuu2AJcGebg1eKm38mjie9FrSBTu1s/dHqz/m
	1QVplEaTb2O2pfOHQABwpmzH0O2q4dEfnKArwm9g0JkG08WSb0sdfLrvpqwSyg2OlXG4DMmczHk
	HacHLR/lFL0DFWyOeOgZ+g2AU6U/jShym9AH9rCvLGWPNR5ME9JxT3e738jnT2SMLvgNLnToUcf
	v+2vKUaZojs8Alf62K9MLtk/RvpnnnCrY6iiborFHIicvSvtT5o918HpoklTLxZGXpYts7fuSgF
	z44R6LCoz9gnyUvu6VqzbBar0IAPsXJiPIm04vCKF0vVKK1znL8zsKxdTrjDuGytt+CobQjqkz1
	mWNcs83jhJ6t5UeECMvOd1DNc5fP3uJs7J5xwa4nsF4PjKqWP2S1VU/hAOmorBWfCtKVQQ2dVJY
	EQgmGuYhixOmNTa4U6k7kZSAFfUTg=
X-Received: by 2002:a17:90b:57eb:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-36601331e37mr24719508a91.10.1778576392095;
        Tue, 12 May 2026 01:59:52 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc4:80a8:e6ce:e2c9:e8fb:6a6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fcfasm13591380a91.2.2026.05.12.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:59:51 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/5] xserver-xorg: Fix CVE-2026-34000
Date: Tue, 12 May 2026 14:29:20 +0530
Message-ID: <20260512085923.820545-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512085923.820545-1-vanusuri@mvista.com>
References: <20260512085923.820545-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236864

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34000

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2026-34000.patch         | 72 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34000.patch
new file mode 100644
index 0000000000..7ce7cfa80c
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
index ef7f5c5bdb..658a608b5e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
             file://CVE-2026-33999.patch \
+            file://CVE-2026-34000.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
-- 
2.43.0


