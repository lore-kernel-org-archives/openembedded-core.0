Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0936C79FAD
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34918.1788788156754088617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wu5gj1Jp;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48442ea8f59so3816707f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788155; x=1789392955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g7ejarHAFUsiH/iFGCoSR1x4CDnbVT2akNuYnbPDIcE=;
        b=wu5gj1Jpn3b61S54OQ0/YLRSE2VjKdB5Mhbyef22d55rP4Y/ivVmtVt9+CrXA8LiBd
         kR3yGYxEixBzvV9p2tkCuxpkksE/Madmsas9UipUzr9vIRvh7eEJ1clXSXTZgOguILdj
         9hejTBJnbSDBUqXmC3afvXUQGiypSs0XqBefE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788155; x=1789392955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g7ejarHAFUsiH/iFGCoSR1x4CDnbVT2akNuYnbPDIcE=;
        b=AzuVViNwcnB6tOhTR5y7nvIvijx3WLUoR4St5e1/xvd8VU+7clnEOa9cvCk4SpOWeh
         +3rKkeC8InxWsxy/EsDnPTK7dIh+KyVBb/cB4KY15AlF1JXWGhckxl7Xq/m4Q3uOfF3R
         ccN0CyCSEHFveRNjIcdA2Qq4YwsY7Uu2xt4ldyrsjGHiT8NyKITFqm6YWolbowLmyxIQ
         FKk7nPbkKVORLLfdcRD6zztocLxDQqU0rs/hgoxDDIGzTl5Rqls3oAJE+b1Yqig+3H4E
         tigK3KLQgKVnkUWXaXrsDT/OemuW7WSSj1JqdTYeYpUNblvXbwJQXUJQgKs2s0s8KNaG
         Jj1g==
X-Gm-Message-State: AFuF++lsP+1GDNBE62X9z/dqQxKvfYS0WwvaIUlIEGM2gXezwwhWA1vR
	fyMFaou/CpaYrpG+zUG1ShMyiTBnAWrBtYwfKg/JgPABcvTddQsPs7jGzLXnCtsum4gB2q62N2O
	/UdYqLKA=
X-Gm-Gg: AYBFou0d3dyolI/5N828Ucz2vQpEXaac1gGlnToywY8nli0AAt5sKhrRAUajGYJiQXn
	pIFrQ2v+66m4x2m7iD0JCzxPWcRw60NK8vSvQ39XQQUNkFp4tkTSZ7nJSVC7AkpWidXzY3U43ly
	G4wAxyHHgsjZT6nxnu2BBUq2g6LO38RvW9O01uleHiGvPnYmCkZSOANJT83OwcLhEiOio8FXprX
	8FbRS5bL80+o2o9BybdUaM7AfU2CkNQ3e5jWq1bqkz/XNkYNh6HT6vlrwq+IJGlZ/erKSzgm5Lx
	w9gM8E8pRoOSxnJ3XGlQDWer5NGRUU8/J2nZav/TBB+lX1wqOCe+OQKriWloD940Ic9zp2xCmK9
	vJDg5YqNTo14V30nqA+CIOCInQq3A3uaPDPAU2OVkf/RJ3In2D9lFCJv8dFzNJu6IgqCf3YIHYW
	RKgpifAIXZ/5Lq/C9ttd5zBPZOuQahkG2UN5wd2LHM/Iu5sOtUpYzNfPyQuqlSZQfusYtnvQ1k8
	j+huJdbTQvdidTgnREGRl3qag/0SJI6QyteVkRsW0fhX9a3DdKZzDkyc4TNLCub
X-Received: by 2002:adf:edc8:0:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-4857e5171femr25364922f8f.11.1788788154948;
        Mon, 07 Sep 2026 06:35:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/35] libxfont2: Fix CVE-2026-56003
Date: Mon,  7 Sep 2026 15:35:03 +0200
Message-ID: <0590e69f65ec1da5d545faec44fdfa8be8a03631.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245265

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
new file mode 100644
index 00000000000..63208116d9b
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
index 29e4d3298f0..e0a951c3a4f 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -17,6 +17,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"

