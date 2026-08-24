Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884E6C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:57:15 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16062.1787576232358111679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 05:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Mez3CFh2;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3900e39d935so3450828a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787576232; x=1788181032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RUfWUgx7bq/X/azuFA46Ns/KRfd9aFYuDiVxssmL2c=;
        b=Mez3CFh2RXK+D5Aoh8jsPt5yajLW1V/cf9cfBwwN/uFX8YlZN9BuSJulCkMohTZAIf
         EQEHWU0inn7NxYgFuWQnjsJGYUC92UqpEj4/cOLkeDF4HOUs0a016BWl02dhG3f+MJ9W
         tgDUInoTBMeB1EaYAp33bOOXtPo5/rqRjSPgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576232; x=1788181032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RUfWUgx7bq/X/azuFA46Ns/KRfd9aFYuDiVxssmL2c=;
        b=qLhodYuMAyUvFwdTIAc40re9VboIUxh+YoPXWlrpeNCRrbEWhFx7OyK2zS39uF6GW0
         EQ3k/d2hh4kfZo2fOGkGkszYmHkg1AZ4xjTxxD5XVcUi8h2aBmnihaNFoxHjVcNprkDX
         nBy3mL9IPWt5H2+RGw+1hvPWNWcXhVqZoFn5crmF4mIunMrJ0jB6YaxxdEoYtFsa2yJI
         /73o4bz80AHZaJbT523a0UcTiTtkyxgJTrY4nyvDt+H0f40/AwHwxYqx108xE6ep/fvv
         PqB3wCwuXBTG9WKMSaGG4YoNFXQWNjENeTn+1SRMKQoPzMae6j641IXZtwxfDk3RYhEt
         FHmw==
X-Gm-Message-State: AFuF++mQJdxPN8miLq34V5HUwIbeuEzplwCngXo3DlEF/6y0FGOTh/Si
	xTu3aXBRvI52zP4601Cl9vsCifrN+xQIRuiFVF3J9po5g/1ve5nQsiZcRKA3+JaLu8sW9jkXtlC
	b9Qlw
X-Gm-Gg: AR+sD13f39AAfNL0kIWbtn8cN1uB5zyzgJJD1u34jmG5pZMGV7uZcVQh79nxc4oZBqJ
	fHbjAPiqesgjCzCQWd+IDXKzYMi8cACxcB/qJcqU4XpOtRud3enelIcJbcDgaFVJTZXdPQ48izT
	i2eVjiZtGexenonebGmGe5uut3d0Mbuv7cbTibdE7fqYgRIXP+ikepBXC+wAOWiiWMRgZ/dfEkE
	LriO+PG2s/SGxT80ujJzVl9zSDIgc87aRMlju3fP+1WacoVKWLix/llI4hLtvGAT3Z9m/Qg9KRE
	Di0Lb5ELYsPluujy/0aAXi0pK03ubSw4SRnGVNoiEZ4oY+J0/eALRtjlrxosW3VBQGxC2w92INi
	mcEdA06YYUF7g2A8s6gyNNiLq47YxgX6X/BR+4qzcqkIZv11zkh5XcNKWszGwYFI0fhQLIOFIl9
	G20lehKcf3g96vStsZZjNOMlSMpeLleCwkS5iv9xlUWDEwUbc6riSQysd35ny7dpUI
X-Received: by 2002:a17:90b:580d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395df24e757mr35576246a91.9.1787576231646;
        Mon, 24 Aug 2026 05:57:11 -0700 (PDT)
Received: from MVIN00352.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860df1dcsm22623583c88.4.2026.08.24.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:57:10 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/3] libxfont2: Fix CVE-2026-56003
Date: Mon, 24 Aug 2026 18:26:53 +0530
Message-ID: <20260824125653.97525-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125653.97525-1-vanusuri@mvista.com>
References: <20260824125653.97525-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 12:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244098

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
new file mode 100644
index 0000000000..63208116d9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
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
+index 7100138..1fd15be 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -511,7 +511,8 @@ static int
+ computeProps(FontPropPtr pf, char *wasStringProp,
+ 	     FontPropPtr npf, char *isStringProp,
+ 	     unsigned int nprops, double xfactor, double yfactor,
+-	     double sXfactor, double sYfactor)
++	     double sXfactor, double sYfactor,
++	     int maxprops)
+ {
+     int         n;
+     int         count;
+@@ -526,14 +527,26 @@ computeProps(FontPropPtr pf, char *wasStringProp,
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
+@@ -543,18 +556,6 @@ computeProps(FontPropPtr pf, char *wasStringProp,
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
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 29e4d3298f..e0a951c3a4 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -17,6 +17,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
-- 
2.43.0


