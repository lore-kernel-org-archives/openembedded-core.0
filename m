Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F88C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:14:26 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9834.1788513257635710230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PEXmLa4X;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso8213975ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788513257; x=1789118057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mwRbOG4QfQ6ffFbg3rxgn/ypSlSKdmtay4w52zhy0c=;
        b=PEXmLa4XSFyo5169ONQdq3w1MJezbLFCXkn9sQajYgpEDepmE23GKrZziYLN1kKASh
         2rCbNhLhWk52c6m3LbPllDMYTuE+C4LFJXx9Q8Z5i/Hi32xU4I9aBc7aG9G1f4U/A9bG
         Ga1AIqY0hsd83fBv8Be7XiPyO+veTOFTmbSR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513257; x=1789118057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mwRbOG4QfQ6ffFbg3rxgn/ypSlSKdmtay4w52zhy0c=;
        b=Vjp1ejAsU0FmGBfPOeTIUn5cF1N/RjS3HEfwQZYNu5TC7rOX55BarT/5b6duMEIztV
         ssT1n3xJcQOx9XJJiDPZzWe+vr7fQ4sJZ45YPAWJQzKJsArBbCtXwr9wzXU80XEyFB2F
         ZPOd0o0xwnbX+TY/KYOFb26+zNIeCCrG/9iPZOUinx5oiog4R3gZAcvBJoSeKU2ZYgHc
         EvbtAGNzV09T8fKbvWjKlsInpC1nUnyL79LSZ0OZMx1etqfdaComChcmPtnBG88+pJAD
         kkRhNxoMZqb9twW0OFJB835YY9BKJD415BIl9Ko85y3W3WkyS52OF6fBxpB0xBrjmwmT
         CW8w==
X-Gm-Message-State: AFuF++m1gQ4sdINXUOlQmDKu7vc4ymt6CvyO4BKgg2SuKKaW+6Ym+geW
	4oi6akp3FAXIrwq6DBYK4wAt3XTiL68ipKN0tAigGSNnCVxjig1O5FAf8c0K8jxplvTySWk94mx
	2XQPi
X-Gm-Gg: AYBFou0b8IoW0JCzBU789rLxt470idSAIjnARA5dKf/hOaylIURfifGTGR74yiRfZJh
	rB5YTRsr3r1Rpm7peQWUyG4526lPwzc9k8BQvnMJtUnVKHLiEE/Yizr7k3q54URPZ7lDa9W+Mtt
	cabN+yMCjDiWIfPKXbbjFlBqUotr94oTsEFJEWUeCDx66NUMsAqTyKFQlsYcpWP7UYz0RVDx5vW
	vSGTiARS1dZ1xXzcPMZVVvlmRVhJi4+PwlwEAUHFMoHbSwvEGgxTDdUnfloWZa1vg8MgXq3pF0p
	d667mZqw5lUSNaLg70ADD4Mq5/M7V47QkBPb7fJu8G7ayxhIPuDJG5zuiPrD0M3hv20KuICYK3P
	ynkwvP7XB8CzAMA1ffCH76iXqA9UNuZGWDVRJ1W7oWKDtY+RJIoA90+hhTmGL2R35oodqGzNsW1
	hd4qQXzQg53DKok+NCAweKYNuCojq4dHfP1qbT1y3xrzTKGVgbcTCuaRppx9j14uDfQdA0ELhuX
	sI=
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4cf:fe4a with SMTP id d9443c01a7336-2db15bd9addmr32721975ad.16.1788513256960;
        Fri, 04 Sep 2026 02:14:16 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:eea0:5fcc:f172:c715:c73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b40esm7138205ad.22.2026.09.04.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:14:15 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch v2 3/3] libxfont: Fix CVE-2026-56003
Date: Fri,  4 Sep 2026 14:43:52 +0530
Message-ID: <20260904091352.93933-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904091352.93933-1-vanusuri@mvista.com>
References: <20260904091352.93933-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245083

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


