Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A78C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:55 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2924.1790154709045105077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jjGx+N0R;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so3850435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154707; x=1790759507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJfDTy5m+36UU8CokyU12u5ANhhkfWhV2hCnYJeRjN0=;
        b=jjGx+N0Rp5lP1kHxFYYDQEw1LXANc2o6vvcmTXIjZm91wKP3CbWfjysUTjeuAFKKBN
         g5XuzV1G/z81ppAdj3DdM/tTwS+NbOCInRk+nUggxXDp4FQ/OQsStl0Y+nl00PaqqWx0
         6IkK2yU0icXo2HxPnNkZEf2UuaZfw4kECn8tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154707; x=1790759507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kJfDTy5m+36UU8CokyU12u5ANhhkfWhV2hCnYJeRjN0=;
        b=nEn6+zahV7Pm8GKJHo+5Azt7fDXx3Zzodin1OqRzqH0J/WFR49wbBmZz0mQ/LaRTaf
         51kEOUnokdCNE0jAfjPyOU3ImSmdsmYKCpLqSz+88TQplUMwSlKtc6Uq9FpSpr15OLUc
         pxy8pWBaG3TRJ7EThgZLHH2pKQjLsgsM3FiMaJfXkRRgEc87h5pt+NPuYN/Yg0mrA3b+
         5OwFmeHf61klsuU2dRDbZYueECR3mCqFHX2+/xG7NvBvECwBpe0kpZ0mZ/WpXxE5Opc8
         cBbo6jBD0eL6eIFlv6/iyGKg0ubJvcOyQS42nypfXwjWQFwXblkfmYrWYF4cXXZD2rma
         +Z7A==
X-Gm-Message-State: AFuF++l5voWTsLIsgENhphoQwxI2Sca6g2ZiDqu0ASymqUTUqt6PIhjA
	wWktsxWzpFpbbSQhaBYiKq5G2Wd3FhvFn/JhmNA8r88/n8/s68rqw+lhG8F5yt/LFCohczaspNY
	LdXPsjbQ=
X-Gm-Gg: AYBFou1s08hsDy9jNT5b9S9UF355PkNewXO+ndLcqFI6QXllSjqrHRLBomKhsw4tGYh
	r023Rx4lELrc5XdR0ms4rIRQSyZ4rhmFSG6YhTMi2RSzQh3IS1eFKp2A5RnsHIW76bsvMtoj1H/
	HRuSSAj7YEwUMQu5WiPnR5Ar/mSy80kRVwe1Qu0Cs2hSnKjf9KRLNS2CoDroBIdoptuxx1iJ2cH
	q0wux2k6/jvRZdZO0l5p1ztgel5ByQXCnh/oN8PYC1TBnjc1Emt8o/+l7rBBYNvbDt++NhHzlVR
	l5AAikd57jNDMJYG9eoCwmwLdbvVrz2Bxe4vbnXlvtcWdtG9vq+It223oirfO8IF3aBZG3EaeGT
	8nK30txNZ0aRrHq9RE6Dvj1pR6xvAz4jMGheO7VZHCH8aVg+KznXTix55Aag+9V1TDUh3wBMG39
	MXJzEc5IJEfD07fs2/G74rn8PbIaniqd+db0gHuhQ4lhQPQjnNv4ZfzkmVI6mF01yQtCvAR8iDK
	OqHv3x5v9Y9texoxqYagirUPK0ZxBwcdcaRf4zbnQ2YFYtyF1zg7Lh1Z5C7OePeu1tIzL9yT6Du
	d8hBEqQ=
X-Received: by 2002:a05:600c:4743:b0:49f:bd0d:59f5 with SMTP id 5b1f17b1804b1-49fdf13542cmr24037145e9.18.1790154707189;
        Wed, 23 Sep 2026 02:11:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/48] libxfont: Fix CVE-2026-56003
Date: Wed, 23 Sep 2026 11:10:28 +0200
Message-ID: <8a7e8d6249d0c0669d9ec6034317cf1e7ce96cc7.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246488

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 114 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
new file mode 100644
index 00000000000..0092c712d44
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
index e7a426c32a9..5f1af82ac4b 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -21,6 +21,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"

