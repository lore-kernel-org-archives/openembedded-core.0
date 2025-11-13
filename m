Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DEACD98F0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4347.1763070464406527042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bksTDlio;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2953e415b27so12467975ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070464; x=1763675264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo2gFvEOv7KZxrlI+YHt5hjpd9QW6vT0VeOtMWDIhv8=;
        b=bksTDlioeNDR7hq+mw+vh0ToGDzRJGq/o2Q8XXHcJZIQ8cCDeh7yXvSAU/Px8SK5ZX
         KuZjtyW3oq0P7KKccAIyHK9o2fHvJi5hlDrMSsYKNNkL+aJlScREtOZe/vwFWH3zazvM
         X4PxvhMFzlegdfL9MUbRF+7vFbibLNnDHhH6cXatwHjLDYLzlQ4EhIkCVXrM7iCU4Mpu
         oSk9RUE2RhdSq1gXXop+QynWUL8Sp88/2FXriXkaiCHchkQQQqKPL2x7m/fI4rK4XH8z
         9TH6CcSDUQkikSknQo6jxdssiTAwzjHZVyzlhRDVAeGhV2+XoEKOLB2ci6LY6HYf54pR
         9vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070464; x=1763675264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo2gFvEOv7KZxrlI+YHt5hjpd9QW6vT0VeOtMWDIhv8=;
        b=xFDrtqq4Qn5K0MlZHl+MDi4JVH9QlySDU9wxXBoI+7reoNh3eZhUyPD6rnt9JyyJYJ
         iGqvGV6Uw3+E2dCuVlC5qqmaf3suCnw04dh1feV4PKO+EWTy2F2u9tOem8wrtjMWxO9Y
         hRW5e9KEHCMUV7uSoEjWzauye01+L+cGxoEcbNONix4pB8hPFer0l66vylVUNF7acS8Z
         ZDd6nQD+tPt2aWGBeLRL/2+GpqhzJJXkUZTDXIOaV+kDAcysxbSq4ugjs//KnOEuDexd
         6b4rgUyulZaaCIZBobg0TsrzbJgEOtOo6DBi+1mVXrJKWlf1OpcTevonLscFVcEIf76P
         Ijuw==
X-Gm-Message-State: AOJu0YzD+XoopDW1AdwfFuI7hqQr7DXWm3HAR/FsStlKITW4q7q0hDAC
	1CS/ZpxpkUL9SWVW61zo7zZWz5ezsg0jg6Idg5AmrkwkUdNayrMtUtlFZqaJ56kCP3MNy0IrM8r
	6z5uQ
X-Gm-Gg: ASbGnctzfOQOX9d0NofI9+jLPcadidOxJaywb4O4dXYB6UVI7GXduwy4XpD2PJbewAz
	ZkH9uITe51rpc6EfFzqagw2DJur+kQPZ5FHMPPxDtEdJYSGAontZDg7tF2GBQvjao0CdzWSV68m
	E/8qnyyxPwfXENP+fzzOzPsjnhbtVDLmDu8KIXzXOUERp8IfdCPr68KklsMwtnRHJTlusJ9rOIq
	2i9rzxzRAZi8DUWPsF1tdjvikPf2448yhzg92egBsU90YbAdjsNd5Aq5BxF11rypdnjXb0zlYmP
	PDPhN2vVl7j7FI+FuSQ8bzVywdPCBGRgHm2cY5CDSPHcjPI0mlgSj8MOO6ksR9qy4WNGvPAxEd8
	QgVHAO4si05jDLafWyRwed7K4btd1tGi1itMMHEyEFcoRWeOXFIq1CrH6ceOIcBvmcQ==
X-Google-Smtp-Source: AGHT+IGic5bvbdYbQquTKb/8Hd3X5ounvb7aUieWMUW6qH458eX2GgWaTfClXT48jisZdiStf2dx5w==
X-Received: by 2002:a17:902:cf42:b0:297:c4b0:8d53 with SMTP id d9443c01a7336-2986a76a2d7mr5821425ad.54.1763070463677;
        Thu, 13 Nov 2025 13:47:43 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] xserver-xorg: Fix for CVE-2025-62231
Date: Thu, 13 Nov 2025 13:47:24 -0800
Message-ID: <05fe08caa0d4bd30510b496a300731a9754f24b8.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226277

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-62231.patch         | 53 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch
new file mode 100644
index 0000000000..4bcf362531
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-62231.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index ed543f6270..1d486fc0bc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -47,6 +47,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-1.patch \
            file://CVE-2025-62230-2.patch \
+           file://CVE-2025-62231.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


