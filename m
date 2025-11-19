Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A0CF2594
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:44:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1780.1763538265313242284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y9wTuCnt;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2957850c63bso7212495ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763538264; x=1764143064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYges/d2wIhSjZ82cPNVo91dMlZpQwLWC4edfXk+nPc=;
        b=Y9wTuCnt9EXH4sgI/jvNM7W970I6bGRZV8GrNhM3lhrRWVvBAwxSwoJ2sFEjMfdcUC
         JhaEbHVO33VIOwnJcU1Cfp7QERwY8falyJJidVCH2/alHbEL26VP4qQVgAceIspLNRmU
         IRDAb/rzB+dCedzURgTS4cVPcO1NEZeBA6/H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538264; x=1764143064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYges/d2wIhSjZ82cPNVo91dMlZpQwLWC4edfXk+nPc=;
        b=YWAdGaGcVcbUm2X2A5Ms5KS3Gwq2UomRl9Iq2Dxfb20x2k4wMznYA8elV9wxgOV1d2
         oquePTGJbjg0rO8jBL08B0D9R2392KgSaNHFbCUwJs9G9FQ5sIGaCVLNG7ejh7Hc7MuK
         pzEKqbGzmftXTLu1uGmG79E3il2OLlJBQTR/rt88QBnz315Lmj3kNO1bRyq2DW2xkKNg
         wMY/jwrf67CHGgrXJGYK1PQwbF1ekz+Keovdg+mO0FTWSCIzZtqZubsTKh9snbZQaHhL
         196cEvnyHr6j2u+c6tISV4AKEtR7VpZz6P7y2O4KS54KM7LFCmnC4UfLcJ7Wo+PRojFG
         INEA==
X-Gm-Message-State: AOJu0Yxz5yfjM8/xbOMyXAi7VcCbA9G2lKicaS6kC9i6PcGeOAZszGVt
	7qJeM53yeBnT8+2TrAHaUyCQXDDg4BHbteDFepr0Gx9TZuAw5OvSe9rtojh5qECrix/7JAT5szN
	80e/G
X-Gm-Gg: ASbGncsLMyFM6MF27lhVp/fbzCz9Tj/728ihYLkjyJfvfyPCxFFf/itz2bH/QowWucg
	QkB+MwWUPpe3IsIWC7mcUlnoA+m6ZeXxctwS0hd/uyOCv4TWhaDPSmKFG2yper/e+ANmK0+Ob2B
	QGEsa1Z6CPio8vdvsSArbGsKTc9Kf3JznoKd1543jWWQq0yjmYK56Rd+wngoRskF91Sjy+gzcoO
	0gQTnZfLXPQlJpYJjZueCL2SC1y4sGBzyiXQhKa+c3BQ7YfxuM1b19XpG8LcnRVoBUUDzSqHMsL
	P7D85HJOPF34Vk/eAqpi5tGv7axD84vKLhMsqOUpu+SquFrFlSVB0wKDbmNh7ipidn5o0TWPSGm
	bcu0FZ/GFzpAScwmCc/29kSWfuGDGluSwjvy3f1F6ZCHP+KmthJ1PI/h2t9LuSYiOS0h0GO8jg2
	z/riQrZZlk7cm9Adg0SHmmSpoFHg==
X-Google-Smtp-Source: AGHT+IFsniigDA23Z2a9dUeBLMqmPqCpr1i6wckcw+HQL0Gz/h9HxVQ3ctNSZ3bp4fa0JyTY3sp98g==
X-Received: by 2002:a17:902:ebca:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29a06017d5bmr18460145ad.0.1763538264234;
        Tue, 18 Nov 2025 23:44:24 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcd:b4d5:5829:5269:5ea2:a966])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c23487esm194541685ad.20.2025.11.18.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:44:23 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] xwayland: Fix for CVE-2025-62231
Date: Wed, 19 Nov 2025 13:14:08 +0530
Message-Id: <20251119074408.51461-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119074408.51461-1-vanusuri@mvista.com>
References: <20251119074408.51461-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226541

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-62231.patch    | 53 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
new file mode 100644
index 0000000000..4bcf362531
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
@@ -0,0 +1,53 @@
+From 3baad99f9c15028ed8c3e3d8408e5ec35db155aa Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH] xkb: Prevent overflow in XkbSetCompatMap()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa]
+CVE: CVE-2025-62231
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 26d965d482..137d70da27 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+ 
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 4fa88fbcff..745a2dd2ef 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-1.patch \
            file://CVE-2025-62230-2.patch \
+           file://CVE-2025-62231.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


