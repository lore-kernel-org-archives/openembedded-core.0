Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D54C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 06:50:14 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11021.1787554205554294378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 23:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XiHQrztA;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca80d708489so1980932a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787554205; x=1788159005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfbAPIjNfsIhPeDmShubKQoSzGJPWF3c5R9YFuAaFqU=;
        b=XiHQrztArgDWJElzaRWKnBOzIU/j/H5cG3kNHVxPsMH3hT2KeSlQDbspAi2kpDG0Lx
         cIJmgs6czwqNjDX/TuMIolAD3WclyqEbNXOhrGb6zjemFPiX9YrfzlPnDTo0Ii/mMyzT
         OWr/fQuQp8siJ8tRD41qZGS5FK/41BfwGgV/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554205; x=1788159005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KfbAPIjNfsIhPeDmShubKQoSzGJPWF3c5R9YFuAaFqU=;
        b=CtfNyf6bWAANa9AqJlwHvuEl2KyaW/ctNui+3W+dNdcQ4yRS8cQSn1AVHaksT0hH12
         xWw5ZZRL1b87orlkfRPNdj+jIkZeLWMO7bRsnlJk7aVCpBaBciplqltSGyWIYOUWQX9u
         zr6OpYxevmZ4PlechTdPS8Y2q41ot3vZlBJS7RfIHDBwVFAdlOXmOjVzbhqLMl3CAs6i
         kYNinIiOWDnUoVfw5R6vZEfT640sUWNT3QJfer05gXbUp2oOSt0rXTH83qyoMCp0LR8i
         WoKwIXUf+GIyCEBVx/pPglqitsc1EKK4b/O2HjVcl3yJDxohRp2jqUygydXxi87EinUc
         fW0Q==
X-Gm-Message-State: AFuF++nmlUhQJswYHcK/7sCU7yFL4cP+ITrP0ohI/xtgkK8/CNWz+spX
	6gKbw7HqX/ig86qycgmgJxB4pnKAJXj+8OS9kvYF/84NCYPDz51TS1cY06HxUL/UrGElPMoRIdu
	V/v3R
X-Gm-Gg: AR+sD12+4fL1Bjr26hEVAR4DQVucPpDB0Td9EHizqDVIJqtnkGhgnhCHOQ9Kxnns0EN
	aoqRcYR77IR8jx3Wa8Gg6/cEPEHxbVVomPVx3JcjBI0qVauynf6MzMKxmUHz8b2ZlmMXhFBlwjg
	lVDByQiHP3jqWluOwzs6QpLD7Hwmhardg2vl9w5uMK8U1AE3qtxGFDpTJb1SZSC4bQkYlKFxbo4
	OW6zyboPumeT0bdAWJlPw7J900/TEetQBt9D0lE5Wrj1SFiACDsPS6jGuGufIOdYe4ikI9+AixZ
	1q4BrjxGKSn/QwgjWsLMKULAD2A5zdRP9zH4LK1GUy28RKMQ57+jUWngws6kkYdZpJeC9tPClGV
	KCJhNcR0k35J2CqGPzZm3myhZSxZqYGDA44yRkk6xoNsxDKbCLi3ufmx463tTYuaj1DW3pC8Z3v
	Aw9OpZyF2KGV2dl6o6Kod2uAH4q5mknMKzpGfasub2+uzTkxK6IF5D1JqTRCDYifBP6xUoW/Q1T
	KEQtZXOEzcbwiY=
X-Received: by 2002:a17:90b:2646:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-395a04e6e66mr38128980a91.6.1787554204676;
        Sun, 23 Aug 2026 23:50:04 -0700 (PDT)
Received: from MVIN00352.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm21780215c88.7.2026.08.23.23.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:50:03 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 3/3] libxfont: Fix CVE-2026-56003
Date: Mon, 24 Aug 2026 12:19:44 +0530
Message-ID: <20260824064944.29802-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824064944.29802-1-vanusuri@mvista.com>
References: <20260824064944.29802-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244068

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 115 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
new file mode 100644
index 0000000000..4a9a72e152
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
@@ -0,0 +1,115 @@
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
+Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u1
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/dff957a5158da038a282a59a31fe736702732939]
+CVE: CVE-2026-56003
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/bitscale.c | 39 ++++++++++++++++++++-------------------
+ 1 file changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
+index c87fa96..012b207 100644
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


