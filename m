Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0E9CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:08:24 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43196.1781878096979728360
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 07:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XD+IdzHi;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so8961705ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781878096; x=1782482896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FBmjQCpas/uWLCBbFjnopZECnqNO4YFnMD0Wuu3nsI=;
        b=XD+IdzHi/qc0+V9JuBSPvUGsHK0OSLNqmyQsMgQd9IMV4gks98toimAQbQ11SdL6RH
         tsGYRzxkpV+ASrVnNmmMMmBjqFHY1VZ0oJTugF9dmS1vhEzWFnjUWvYrqgdl9Ygrcb8G
         L42Liu95+jwyJyMmvzCDkExAJzykrJE3B8Y4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878096; x=1782482896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FBmjQCpas/uWLCBbFjnopZECnqNO4YFnMD0Wuu3nsI=;
        b=Z8iqhSXEWI1KCAtMs9diBt+uw8I4aObchoBvOgaPSBlBeCT6ndAWuZoAPK0HSiA7W+
         V3C0Lh8LFa9Kpkoww8O4AYBiRzqzbSWmvnq1Aao5MFTyBic1Ov5nDtpTPHYf3w4Ds1Zr
         cuseoG0Pbrczyb3kwX7Ay1Xsn35k97evX+Ff23c6i2jk+Ld64nGleUWUkksDJE8EBIjW
         lJtt9Nc1pnN2es9tTXe62wqUo/dlTTllAilYBYN3bTS9MWA92aL/Jq+DhWlWrU23zrER
         Xqve0S9PRh7bDcv9nDlpir+VgpJD9uaMYOlgGpZRCsGxHAjucV4YRY1JtqyAgyHeDMMp
         TemQ==
X-Gm-Message-State: AOJu0YznlCEg8mj8fCWbnvOlt1tz1amoj7tAH3gE5FfAaowGV4Q0nREQ
	xwNJkfefilkBFGl3BDa8DtvNhmaTMCCbOyoEcGL7Cfjl3SCvtbE/uMvGfL4XAqWDzSgAmuD+S5t
	Bi56BX+8=
X-Gm-Gg: AfdE7cnUVHxn89sSrZb7XRsoE+Ta7D2If5YtIeueq1jk41vh1L2WkDuSQpDndcOed/l
	NqGCy0/Je6VFTOLhBOx51o84sjpEAzRgxwzpiURRs8LGTDKBEmiMPjke5eJQELEczq9WCGJr4VE
	1pNJ0+DObEeTaJnjuHbgaMFdTQDz/S6k+xIINNd9Riyn9KMba+nMa2wWa6J96SuSfM273I/na/W
	KPPK+WBn1ATLHbBILGEbMY9Irz7JR7pkwyI29YafHgXmfUyBPlOQMYaTo0V8FwEDVzeazqpkFJ+
	5DzLbMAxCH/qRzxFy2xl2jEOvNnqou7DJYoJIATUeoBS9HUDSdpnshTIHhOcBg8DGemurGEoqII
	n5128sNRkV5cOXEspObxSX37rxaAj6CFweZ8DuuuwjXFNZKKdPoSd2hslKOVWABo4k/EtYdD75P
	fGTvm8yEgZBhhdPVvBs0geYwbeSYJL
X-Received: by 2002:a17:902:fc46:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c718efa6ebmr45982055ad.3.1781878096217;
        Fri, 19 Jun 2026 07:08:16 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:42a9:d9f6:7cbc:746a:c8a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209e1c7esm25591835ad.57.2026.06.19.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:08:15 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 4/5] xwayland: Fix CVE-2026-34002
Date: Fri, 19 Jun 2026 19:37:49 +0530
Message-ID: <20260619140750.914225-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619140750.914225-1-vanusuri@mvista.com>
References: <20260619140750.914225-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239175

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2026-34002.patch    | 93 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
new file mode 100644
index 0000000000..131caefcd5
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 800d0a8f63..e7412e2011 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2026-33999.patch \
            file://CVE-2026-34000.patch \
            file://CVE-2026-34001.patch \
+           file://CVE-2026-34002.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


