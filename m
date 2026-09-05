Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE05BC79F99
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2486.1788641125713735317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s5m8D7TF;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e067e908so1906861f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641124; x=1789245924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ou8UrQDyHYN6DIZguPWnk/xvJIGs7s20t5LrRsbfaWo=;
        b=s5m8D7TF/4lZMz5od450EBMvoU6s0nV4I5CvvPX+xRShoHGlFdPITHdeN54jcKaSEc
         OawH4RLbfE9AG8PSivl7A0bRtIXkyiC5H1jruDaeYqlja7nvJYGQ/c0AmET+HYaQVapX
         fCeRHSj0wjA62mrniUl0QHCsqMv8jkwid3Jzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641124; x=1789245924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ou8UrQDyHYN6DIZguPWnk/xvJIGs7s20t5LrRsbfaWo=;
        b=RdqY+A3sYBR9xVdCYSMtL+O+Ab5S2gprD/1nTK93wKIuqpzErWEy7IcIUEBdOzn5lM
         XVTQtBKKqNnJcQNisTRpNwCsuwe+0FLiKR01xO4MnS8CwjYN9A3BcVPnVCrftbK3EXNI
         zTjxEkXKwqDzuZuFfX4ZwsvCtMXjsMOtEMD8Bfv9FRz0KRebCOATjP0PqJiOiw0habOR
         GXYaXGY1teW2R42hrykHamfJd7JJxIZ2MIfXU7y99ouHbBuHTW4y2efCB7BllMRUG3Lu
         LSJh/cl9pyx4g8x8v00bet4G/xv3L2GIscdbmiYZzTUW+0KTqmWNhg/Fp933zh8Kobjv
         0Vkg==
X-Gm-Message-State: AFuF++lGKrJ3uJ4opUOskIs2ZOs8sauuPky+cz1QSqzSPs4ZPDfXjWj0
	fAYTAwzYuRYZvs24Wx4imNwqa/jBBvlnMsRzuwPGbsdscgbrSbCrA9vno30AwEMHd9W92eWf7T3
	mWfQ0uho=
X-Gm-Gg: AYBFou1fsdAP9ih70EMfOAcRZCmicGgjzjXKfWBuH2xSFL9dn6KQcvVLfsdMtQxb7cp
	ho+EGMumvGA8VhlxoaIXgRyD5nrfkZd2nBWBhXAOih+IWvHza9TCZlIQhf1t51CJAlin8CghARe
	W/eSIBEvJ6yEBXXXYNGCiZlwnocdY8D+X1sjJFvKx5boIPt7tLjGvKeHD4S/PKs2bTW/R14d9O9
	YEeAbsNMOG8nBjLqEClpA4ilembrA1M4IOS2Ml/UEm7iMXCAAi6oROkLcrN+Vf/rPHophqZwlaK
	EgFQG/DgYv8uKS5+gVjzKbgJXlA4VMQDwuOPV1QnmAXC/tAbyT31FUHdBnKZDLwmAgmFxgJnlyp
	id5CIV2b2kjN9mSn+uTr/TGmZOS14TCElZo/ujEBS67ofq/9e1/nueAcpVqMNlv3UBkFS5ReUNN
	97F3iT+ZK5bFaRqDyZpcWeHP33M1gFZ/Tt1LO93DMQgk+HsVHJtKgQ4l9BLiaN/gKCbrZhBLUFd
	+sjS9ShGbOH6WYvnSbgJ4O/hsIfN02v7gtTA+8nn8UdSUcg3F0NLztM2EvQthZAcYiOzVGwyGxL
X-Received: by 2002:a5d:64e1:0:b0:485:8f42:e8cd with SMTP id ffacd0b85a97d-4858f42ec28mr7294915f8f.3.1788641123888;
        Sat, 05 Sep 2026 13:45:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/40] libxfont2: Fix CVE-2026-56003
Date: Sat,  5 Sep 2026 22:44:24 +0200
Message-ID: <2dc809afdf8105a87f6cd9c2f1bf8dfab01426bc.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245175

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56003
[2] https://security-tracker.debian.org/tracker/CVE-2026-56003

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
new file mode 100644
index 00000000000..dacfa9d638b
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
index e004ac044c2..de6418b11a5 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -17,6 +17,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
+            file://CVE-2026-56003.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"

