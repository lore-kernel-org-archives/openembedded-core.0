Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F52C5DF93
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:53:15 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9144.1787323985370059936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 07:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JROrUMjN;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1311035a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787323985; x=1787928785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYJu27qUpUpyUHXEBDveX5NhH4iADzw4PmMN9M6nUh0=;
        b=JROrUMjNvHCXJYpYnIHXTxo9XTz0Cvht+wjH5t6ssgx03EnExTLPQ1VRSBs0Ao1kRY
         bkiKQvkozk7xtGCx13dPhMb9LOJ16xpgFeg3A0q+iihTz3EWXpsyDW7ugexqE3Yepmhw
         oUWqekux2I+SF/yqION1rs1C6vtfsWmjbE+0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323985; x=1787928785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYJu27qUpUpyUHXEBDveX5NhH4iADzw4PmMN9M6nUh0=;
        b=rflOFhMfnu7/pUEAIp7ztZm5gYdMU7rUDSPo3/yEgAWThC5jpDMoqwQ7u0airrXMa5
         N7UKLoPqDF/J4/kx9ErKIJvvapWCTywDH2SPpNmZ7oWILklzwh97EpgzDfZsbq23XlO/
         y89X24AvVyNfciYRgt7MdD2JR6mGWQVpQIBeumObP1QYeFBsOLdaxYzOKYBt9vGSsUN2
         s9mHt81DsJtZMGd4I/CaJ16q+jkRO5OTfGfml1ibjsTo7LlKZodlFbsHEAg8wFnFWfcR
         ZHpYLaif3yzA9q/kbsRxco51rEJkOwqg1xdxpd0aandMzOFrSj8DIdnVF/D/jMJkZ8g8
         nnkA==
X-Gm-Message-State: AFuF++l/fZmcqhovflJzTAePb5Ua1k1uNc7W7fv0vsYyZ1UqgElq8NUF
	jV9tnSVDDBypEX7GJ0KsKAny9qRqE+kZhCo0ZjTYdaUYgHBXRb5I/mXOJ2VzDNGFU3lkAQcmXPg
	Vz12E
X-Gm-Gg: AR+sD11Ur2Whv+FDE9MTcPQACk/L6aKfEm5Z0ExH2Zcfvk+3MDK3vLEGGQ2cVW/0CRN
	QDZmsyYgTj/bQQ4Wu6tOXiCSRVko9vwBDAhuv/CSHyLCB8hvNYMboWgHm+urVwH6vYB+4hzUDHz
	zV/Z1n3Hguqvm8QJ9+o/5YSI7WgWZCO8SkE1sSe9kTatfKqsef5u/+6lMkJMtgyle+bhfIU12JD
	ZZOmWoGM5sTAKoD3C8q4zTWeFvDerMnfye9bsGaT6O5FqIorqDcR9Zf172h1Pdk+48AfZoZph4C
	It2qqQGgwx4roRO1FmwnlyHFiRdpdcjCaRZrQnmzQEKeqzHTI/cK/e1yvJcswwyyjRdDv/E4L/V
	AAEoTMduEyaWfxuiR2hHWa855CpWsuF90KvF1HgL8Vs6vMg3A0xmBSLSIorUE5JFN6OyS7luP/F
	uKpYo9XSsLq/jydJUh+Fey4gkcn3D34OPQS2l20sMUwgQIO2RQPNt1zHmvSCrQkGtYJ5qsJwyjT
	l8k
X-Received: by 2002:a17:90b:164e:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-395c3733afdmr11382799a91.13.1787323984663;
        Fri, 21 Aug 2026 07:53:04 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:9dd5:5a04:5eb2:4372])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm29820194eec.7.2026.08.21.07.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:53:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 3/3] libxfont2: Fix CVE-2026-56003
Date: Fri, 21 Aug 2026 20:22:40 +0530
Message-ID: <20260821145240.137814-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821145240.137814-1-vanusuri@mvista.com>
References: <20260821145240.137814-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243945

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
new file mode 100644
index 0000000000..dacfa9d638
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
+index 5f465d1..ec57f55 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -507,7 +507,8 @@ static int
+ computeProps(FontPropPtr pf, char *wasStringProp,
+ 	     FontPropPtr npf, char *isStringProp,
+ 	     unsigned int nprops, double xfactor, double yfactor,
+-	     double sXfactor, double sYfactor)
++	     double sXfactor, double sYfactor,
++	     int maxprops)
+ {
+     int         n;
+     int         count;
+@@ -522,14 +523,26 @@ computeProps(FontPropPtr pf, char *wasStringProp,
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
+@@ -539,18 +552,6 @@ computeProps(FontPropPtr pf, char *wasStringProp,
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
+@@ -667,7 +668,7 @@ ComputeScaledProperties(FontInfoPtr sourceFontInfo, /* the font to be scaled */
+     n = NPROPS;
+     n += computeProps(sourceFontInfo->props, sourceFontInfo->isStringProp,
+ 		      fp, isStringProp, sourceFontInfo->nprops, dx, dy,
+-		      sdx, sdy);
++		      sdx, sdy, nProps - NPROPS);
+     return n;
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index e004ac044c..de6418b11a 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -17,6 +17,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
-- 
2.43.0


