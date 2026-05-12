Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111CCD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:00:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71357.1778576401509922014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jJVjCgJV;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso1722364a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778576400; x=1779181200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG1e3ECRgf9IL1mT7QDwKtQZnyHC0P63ib1yPnH5gA4=;
        b=jJVjCgJV6E7vY4NYGthf0XKl63cejgHeFK67OBqwFZnWRGaIGZQwMyN/ywXgLxvl0T
         0NGMPLrBl6EpgsBJEWMh21urUcJUjU3CiuBSM09WGguH9GM7vKUexZrq38pYV0xNmZFO
         tMXoR3McIemUjmTtDF2usz/PtQCVAmVQ9nvsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576400; x=1779181200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WG1e3ECRgf9IL1mT7QDwKtQZnyHC0P63ib1yPnH5gA4=;
        b=PEtDKAu/ocVZVsUvz9iSZrius92Jw0BavPa2MLO9+59pFmPHVNe3MdtlmXldP0yzD0
         aUvll3xnDIGodD43mCah2vkpJmPF5795JUPxOQxy+uTFL82gv1ww0ZntcGFCt0WeEcXb
         3W7h+W/29ukAQvVE5vVL5lSIr5XmTC5ZelJtSz++/U3cS6GEzAgyuZFVqa5NuYSNJ8fi
         ShdMw6ctdLEad3rwZrRp8+UWZ28pDM73lK+Wq4cNzbw5GyxcT5WrDkIFTf/aNO4XfHIA
         GUGB+SqNMjw3X784T6q+1wcm0EXmveD/2pOpBjFdAoEJv7pTZyY5rNiwvSQgXImM3Zid
         Rx2A==
X-Gm-Message-State: AOJu0Yzit9rsgm6dT5pTGo1RSjQoIBm5Hlv98sjRcfAYsL2rKCvvtVuZ
	gBoeXcQDY6Y4CygJtHtNrdUqLSXBqiX2Q1g1yM6Fm1md4HS67ikcTdL3gIc+OgIv5H8cc2O4i8u
	DUObZ
X-Gm-Gg: Acq92OFdG1+QOV590iDTCFFGXzZwE7YJRoimdo/4Whx+k2B5lc7VchKiaPjmy0zGPUY
	/EfATBydqtXA/dssrg0/kYfoOEbMmTHQTDCEnr12FyP6FQoYcUevTh6xx7v+wPsvwxomRl/1+sH
	mAqOOSayWeCaCyYUcQgbnFTjxMubHYnIlv/Uy/L14y/DtUslbUtwHzJ1CesaNMNxLzMYDgOgJ91
	jfqJW1f36Anrj3epsKi8GzjURMQ3EePq2dIzPFprPupEQ8o/+C9r82lpGc8KGfWuwj9HurueG7+
	/tot73IxVavzGZG5V2e86tMXPQmXURl03ul+pMSPcChyYmCrGWhBmHtFHzrgGqJUI6bm3Qu+HuT
	pgeRjqIKvly2tOiT0sgFGMMwftdthXU3iXW7EhCOrlqWvycxXDVnYqDTFvnL4ixpP45OfoMNHPB
	jBP3TVO0wzw0iaXALF+ZbDBF6a9LM=
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr29827799a91.25.1778576400381;
        Tue, 12 May 2026 02:00:00 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc4:80a8:e6ce:e2c9:e8fb:6a6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fcfasm13591380a91.2.2026.05.12.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:59:59 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 4/5] xserver-xorg: Fix CVE-2026-34002
Date: Tue, 12 May 2026 14:29:22 +0530
Message-ID: <20260512085923.820545-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512085923.820545-1-vanusuri@mvista.com>
References: <20260512085923.820545-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236866

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2026-34002.patch         | 93 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch
new file mode 100644
index 0000000000..131caefcd5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch
@@ -0,0 +1,93 @@
+From f056ce1cc96ed9261052c31524162c78e458f98c Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Feb 2026 17:02:09 +0100
+Subject: [PATCH] xkb: Fix out-of-bounds read in CheckModifierMap()
+
+As reported by valgrind:
+
+  == Conditional jump or move depends on uninitialised value(s)
+  ==    at 0x547E5B: CheckModifierMap (xkb.c:1972)
+  ==    by 0x54A086: _XkbSetMapChecks (xkb.c:2574)
+  ==    by 0x54A845: ProcXkbSetMap (xkb.c:2741)
+  ==    by 0x556EF4: ProcXkbDispatch (xkb.c:7048)
+  ==    by 0x454A8C: Dispatch (dispatch.c:553)
+  ==    by 0x462CEB: dix_main (main.c:274)
+  ==    by 0x405EA7: main (stubmain.c:34)
+  ==  Uninitialised value was created by a heap allocation
+  ==    at 0x4840B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x592D5A: AllocateInputBuffer (io.c:981)
+  ==    by 0x591F77: InsertFakeRequest (io.c:516)
+  ==    by 0x45CA27: NextAvailableClient (dispatch.c:3629)
+  ==    by 0x58FA81: AllocNewConnection (connection.c:628)
+  ==    by 0x58FC70: EstablishNewConnections (connection.c:692)
+  ==    by 0x58FFAA: HandleNotifyFd (connection.c:809)
+  ==    by 0x593F42: ospoll_wait (ospoll.c:660)
+  ==    by 0x58B9B6: WaitForSomething (WaitFor.c:208)
+  ==    by 0x4548AC: Dispatch (dispatch.c:493)
+  ==    by 0x462CEB: dix_main (main.c:274)
+  ==    by 0x405EA7: main (stubmain.c:34)
+
+The issue is that the loop in CheckModifierMap() reads from wire without
+verifying that the data is within the request bounds.
+
+The req->totalModMapKeys value could exceed the actual data provided,
+causing reads of uninitialized memory.
+
+To fix that issue, we add a bounds check using _XkbCheckRequestBounds,
+but for that, we need to also pass a ClientPtr parameter, which is not
+a problem since CheckModifierMap() is a private, static function.
+
+CVE-2026-34002, ZDI-CAN-28737
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/f056ce1cc96ed9261052c31524162c78e458f98c]
+CVE: CVE-2026-34002
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 1ba638b..3fcc6c4 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1940,8 +1940,8 @@ CheckKeyExplicit(XkbDescPtr xkb,
+ }
+ 
+ static int
+-CheckModifierMap(XkbDescPtr xkb, xkbSetMapReq * req, CARD8 **wireRtrn,
+-                 int *errRtrn)
++CheckModifierMap(ClientPtr client, XkbDescPtr xkb, xkbSetMapReq * req,
++                 CARD8 **wireRtrn, int *errRtrn)
+ {
+     register CARD8 *wire = *wireRtrn;
+     CARD8 *start;
+@@ -1965,6 +1965,10 @@ CheckModifierMap(XkbDescPtr xkb, xkbSetMapReq * req, CARD8 **wireRtrn,
+     }
+     start = wire;
+     for (i = 0; i < req->totalModMapKeys; i++, wire += 2) {
++	if (!_XkbCheckRequestBounds(client, req, wire, wire + 2)) {
++	    *errRtrn = _XkbErrCode3(0x64, req->totalModMapKeys, i);
++	    return 0;
++	}
+         if ((wire[0] < first) || (wire[0] > last)) {
+             *errRtrn = _XkbErrCode4(0x63, first, last, wire[0]);
+             return 0;
+@@ -2568,7 +2572,7 @@ _XkbSetMapChecks(ClientPtr client, DeviceIntPtr dev, xkbSetMapReq * req,
+         return BadValue;
+     }
+     if ((req->present & XkbModifierMapMask) &&
+-        (!CheckModifierMap(xkb, req, (CARD8 **) &values, &error))) {
++        (!CheckModifierMap(client, xkb, req, (CARD8 **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index dfed2c2437..2f7edd16a1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://CVE-2026-33999.patch \
             file://CVE-2026-34000.patch \
             file://CVE-2026-34001.patch \
+            file://CVE-2026-34002.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
-- 
2.43.0


