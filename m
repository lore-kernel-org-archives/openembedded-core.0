Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79370C5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:20:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15931.1787638841118746339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LZZkqzGI;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6b5aa7535so16978395ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787638840; x=1788243640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEpS0LghRbcRCGc4VGRr1894xvr0IXB9+rZ8lzC5Aj8=;
        b=LZZkqzGI0F94kGfx/6IKB2EElg3HMIL1ax2+J/4wIvJ3ogC/h5nHnx54ziSMocqaSi
         oFhvlwH1tGiZ2D1pjiVUISYqwVdXXh8c2OVoOYXRW06+TobwXBYctCi0WdTdwhTlk7Km
         oBPairf/kscENY4V19nB2zcYsO2kDEEAFnMzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638840; x=1788243640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEpS0LghRbcRCGc4VGRr1894xvr0IXB9+rZ8lzC5Aj8=;
        b=PBhA9GFoVj5MG5LKRAk+GJAo5h5tTZGOMVeP2ZOFFG/33ig8jCTfudO6KipLIUcNVv
         OpicsgKLPPrIeopsRdF5z7MWyVB7tRCpCA/DleYrBjSqzJA9nVqKnbfaiKruR6tOuCnD
         lPLMxQxXGBJyrF2lbY124mCJ/zaEc/v/NjEbIci+Kr2v8xGtK3VTMpZmCdQiDWBm9XQd
         q0c2BHR43yZG3i+VHyEUnAgkqdrPS0YTXKmf29kGzEYLY1o33t+GIUImsUnj9oIfZhsr
         yffXsvzRscGZMrtRBctJaYUuuElkejnLfYSQwrjQELNO9FEgtkW/Mfz5ds8eKB7s6fyi
         0ROw==
X-Gm-Message-State: AFuF++l+Fq2OLW++o3jGjoMhpS9Fy63D0gGK+AE+gYoVHTRmnV9W1FLT
	12ZWTXl6BobWc43g9Z8yBTp06/aJadxjSqZxj1r3FsddUfPCMwZ98hmxWiMx6N6HlNAvlXFmSPb
	OFm+x
X-Gm-Gg: AR+sD10djyQurwunsC99V9McQB6C/+LuOVLiurFLwBtv5C2fWFHn/DfPPmUcJT8QreQ
	TOzaLAIoEECAWpD/P/CHvplWb8endStrjf+I+v2b8Sn2LuIkcZ4RIPxNINa1EBUcQ2Ei4i9zfQj
	tCiadbm3WJZTcNODpYLv/nQ91lnVbmHYmjQzYedzYwFcWCkYnqB7Mg/8S6t87TmtOJUNHBreJau
	kBxS//M9WuKWsldZPngYI0w8ctTw+i6xgFjg12Tc1yp2RG6LOqSqL2/a//T1JXvXLVHcWyZ4dWI
	H9ltLD7zwkSQguwoj2zuoe56ciwp7xiNK5aG5CGZdSJe5ltXavUpfutdwmNe5ZmffvrsfzIBsNc
	jUxCkTCvmXuKFL3x475QdxkZZpSU5Af8cXeAmtZ6jNYjTha4vgTq8JxFy3JBI8qlsFw8stgvNF5
	fZf6T30NtzZ54QppWj3pCQjqemRflYMU0GemO5F/x5HI3umHQsBqVjqE5fZ4fz+ttgNJdMiTEeW
	FkXBE6gVEmVSIA=
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr612420795ad.6.1787638840553;
        Mon, 24 Aug 2026 23:20:40 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:a2bd:b8ae:b7dd:5272])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm30844589eec.5.2026.08.24.23.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:20:39 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/3] libxfont: Fix CVE-2026-56003
Date: Tue, 25 Aug 2026 11:50:12 +0530
Message-ID: <20260825062012.39336-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825062012.39336-1-vanusuri@mvista.com>
References: <20260825062012.39336-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244202

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
index e7a426c32a..5f1af82ac4 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -21,6 +21,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
-- 
2.43.0


