Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACFEC79FB6
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 11:45:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5082.1789213500839950710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 04:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BbmcnnNG;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd4b3c752fso8089295ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789213500; x=1789818300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mwRbOG4QfQ6ffFbg3rxgn/ypSlSKdmtay4w52zhy0c=;
        b=BbmcnnNGMt5Hso3gtgHOBncLiOk+ETrsDngT2vninouhnkF6VMFRqSyPKK9U/mSkDF
         Jjx7DwP/6tVGNYTj69xwe00XBFDUhJ/T2Rl99Hvm5WHHtfpVfLbWsR/prtnGgxT/wB8m
         IBaZZcwXGS3KIL5mca32Oyl2RqKR4JQBA8ZIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789213500; x=1789818300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mwRbOG4QfQ6ffFbg3rxgn/ypSlSKdmtay4w52zhy0c=;
        b=HlXhku4HCsaKNuFGPpEcXmOIzBjQI3VZp5pQ+41n4yRgCzdJaeeL72Eg4dKBSeN+r0
         LqB4RWk+yXWU71BBnBi/7RGz7noQoNefoG/m/tmkf70xON++xwMA3eVpXn8B7UvbzqG7
         5y0crlZXBIf2oFDh4+OLUEiHBhCXnfuKHMyrHciIJjcf56ISCyPH/cs1mh/AAAXuv8TU
         ZRGS4f5eIfOKZF3Gn5UgMf9Zm1LSPM2+QIf3GMBhwzr45wvnyRZvpVmqucuiIUGrMWGH
         sp5nRhVNPAsukjxQCAz9rlPbA9L0Fd++7Sog9Q0Fox5IjTwUn0S4bRws6PwVN20peUKt
         3kxw==
X-Gm-Message-State: AFuF++mR08zJouMA5OhA0jTCTCEnad3BwrcSdisaZpE1AjosYfmIWrLX
	sCKGnlu+7OuDaaPWIUec8JnsIG1SEu4siw6BdQCn1oVbMILukclP43WS5XOHMElPuwip8yg7eSQ
	uyODd
X-Gm-Gg: AYBFou2N83OyzgmdHm0pKC+8GPIt7GLAFymUlP+dd1W5cD4XKuDMdvO8nOthqS97/rn
	hoew9a7JpcTw9sNfP8i9/bG0atdGXgGti1NGMcctbF5pkhbtbWfZ797el859MqAWLvfc26xerze
	lU3byY8M+ttCrAfbSw1mXTUUHlqQ+dmqNLvYI/e6bbmI7LwXLDqoTNgaly4LEvdKN8+65ISAQTw
	mYFb1FChiwTXl73IiWs/u0VPoagpJaoKNzQZo4X0YeSz4eWNflIKFYsTiu0uM0BgvAEi2czgjuj
	K1/WoVrD3firc/ZO6dKYKSRgPtBZkrHvOqZX5ErxhFfofEFJHW1Hn6otOX33CQNFxALVyar7YlU
	3Emyhhh5xXa9YVaSS8t4PMDVfGdFx5TaV6EgMEbWax4Fb6jh06GWcKs/RK2nwTdwF3xoitMJMf2
	aUT7YTwkcjftD6gb3JneNFUNnLEcKfV9xYWn282BjUm9+FBAixG+8CrV9SdwvxYdneSpDO8c8tw
	LkvMBiw9XGuEQ==
X-Received: by 2002:a17:902:ecc5:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2dd2a1dda3emr159639995ad.7.1789213500063;
        Sat, 12 Sep 2026 04:45:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:2919:ff34:c674:1b5:9893])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm15044987eec.15.2026.09.12.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:44:59 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 4/4] libxfont: Fix CVE-2026-56003
Date: Sat, 12 Sep 2026 17:14:30 +0530
Message-ID: <20260912114431.357816-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912114431.357816-1-vanusuri@mvista.com>
References: <20260912114431.357816-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 11:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245699

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 114 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
new file mode 100644
index 0000000000..0092c712d4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
@@ -0,0 +1,114 @@
+From dff957a5158da038a282a59a31fe736702732939 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 16:49:55 +1000
+Subject: [PATCH] bitscale: add bounds check to computeProps for property
+ buffer
+
+ComputeScaledProperties allocates a fixed-size property buffer of 70
+slots. computeProps iterates the source font's properties and writes 1
+slot for unscaled properties or 2 slots for scaledX/scaledY properties,
+with no bounds check. A malicious font with many duplicate properties
+matching fontPropTable entries can overflow the allocated buffer.
+
+Fix this by passing the remaining buffer capacity to computeProps and
+checking it before each write. Properties that would exceed the buffer
+are silently skipped.
+
+The function is also restructured to handle the buffer writes for
+scaledX/scaledY inside the switch cases directly, rather than in a
+separate block after the switch. This makes the control flow clearer and
+ensures the bounds check covers all writes.
+
+This vulnerability was discovered by:
+Anonymous working with TrendAI Zero Day Initiative
+
+CVE-2026-56003/ZDI-CAN-30560
+
+Assisted-by: Claude:claude-opus-4-6
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/34>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/dff957a5158da038a282a59a31fe736702732939]
+CVE: CVE-2026-56003
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/bitscale.c | 39 ++++++++++++++++++++-------------------
+ 1 file changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
+index 32144d6..2affc11 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -513,7 +513,8 @@ static int
+ computeProps(FontPropPtr pf, char *wasStringProp,
+ 	     FontPropPtr npf, char *isStringProp,
+ 	     unsigned int nprops, double xfactor, double yfactor,
+-	     double sXfactor, double sYfactor)
++	     double sXfactor, double sYfactor,
++	     int maxprops)
+ {
+     int         n;
+     int         count;
+@@ -528,14 +529,26 @@ computeProps(FontPropPtr pf, char *wasStringProp,
+ 
+ 	switch (t->type) {
+ 	case scaledX:
+-	    npf->value = doround(xfactor * (double)pf->value);
+-	    rawfactor = sXfactor;
+-	    break;
+ 	case scaledY:
+-	    npf->value = doround(yfactor * (double)pf->value);
+-	    rawfactor = sYfactor;
++	    if (count + 2 > maxprops)
++		continue;
++	    npf->value = (t->type == scaledX)
++		? doround(xfactor * (double)pf->value)
++		: doround(yfactor * (double)pf->value);
++	    rawfactor = (t->type == scaledX) ? sXfactor : sYfactor;
++	    npf->name = pf->name;
++	    npf++;
++	    count++;
++	    npf->value = doround(rawfactor * (double)pf->value);
++	    npf->name = rawFontPropTable[t - fontPropTable].atom;
++	    npf++;
++	    count++;
++	    *isStringProp++ = *wasStringProp;
++	    *isStringProp++ = *wasStringProp;
+ 	    break;
+ 	case unscaled:
++	    if (count + 1 > maxprops)
++		continue;
+ 	    npf->value = pf->value;
+ 	    npf->name = pf->name;
+ 	    npf++;
+@@ -545,18 +558,6 @@ computeProps(FontPropPtr pf, char *wasStringProp,
+ 	default:
+ 	    break;
+ 	}
+-	if (t->type != unscaled)
+-	{
+-	    npf->name = pf->name;
+-	    npf++;
+-	    count++;
+-	    npf->value = doround(rawfactor * (double)pf->value);
+-	    npf->name = rawFontPropTable[t - fontPropTable].atom;
+-	    npf++;
+-	    count++;
+-	    *isStringProp++ = *wasStringProp;
+-	    *isStringProp++ = *wasStringProp;
+-	}
+     }
+     return count;
+ }
+@@ -671,7 +672,7 @@ ComputeScaledProperties(FontInfoPtr sourceFontInfo, /* the font to be scaled */
+     n = NPROPS;
+     n += computeProps(sourceFontInfo->props, sourceFontInfo->isStringProp,
+ 		      fp, isStringProp, sourceFontInfo->nprops, dx, dy,
+-		      sdx, sdy);
++		      sdx, sdy, nProps - NPROPS);
+     return n;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 08c96fdac8..e254516fcf 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -21,6 +21,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
-- 
2.43.0


