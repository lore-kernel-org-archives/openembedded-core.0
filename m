Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9120CC25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:56 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.34079.1674440514739677708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gagtShIP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r18so7937832pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu2jxwjnbBNvjgssPJZykZk5DYyM7ZeC8PG8LR+LcrU=;
        b=gagtShIP5JaSOMRbbEPH6kn+Ye5SxMFKAhThgZjuAcdWgc3nVdeav7i9YKQrKpYUrz
         WmxTBXe6RFmoMDtW/BF3He11SfLsfyzWGWsT+E7R8BPVJ/11fESrM/w4m8cjKSXK/4Ts
         s8NIk3R+Wux7rkZdxOUMRSqbXVgCPo8Uw5gmA5oyDaF5YSE/RxK3oDCwdHcSKktZY8aP
         QtJUv1B6tyAN4haYIAmw9RkWY49diFLd8DJV21PXBRUWfQ9hMkuj1QqXt0buO/Ui4yA8
         FDlvEF9JULNNxHApcZYbe2Da+ZSLyUzjF1IHtGm3LU8WCBljCG79HJjstiQnFxYb5yB8
         QA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu2jxwjnbBNvjgssPJZykZk5DYyM7ZeC8PG8LR+LcrU=;
        b=oFYV9J1LdiRt4zd2+DrfxmhBLEWMnI6UWP86Lrv6SWAMaNoVXY7OdaA8+F8QJJ6TR2
         m+YkTu61D+x/CzodN6G+sfO+I9HkQdSeVd4NF/QLIu5zBNTxdsfRJuowS+F4Q1BFfsCL
         PPgtUmBcsuBi1rCztosCcojlPxH7VxMskY8TG7eejVCDLFtUzb93Yep5UpUAWbpoPW1R
         HDFvqQvo9giy2uLle7RuL7tSYdzSqOA/zxOC2iDMvM/3GqeLFLmxLJrm7hDifxfkuutG
         GyxHoImYkem1KxVrLHcru1mbeL6ooLfS+rvLb+UuyDQBlEsjkhbm++u1/pSf7kY5LBV7
         HSmw==
X-Gm-Message-State: AFqh2kpMIW94kdahMbFmL/R6IVeY+oXm5cZTBhAGkW90Y6DzGAuJNV0P
	3A8bV1PC6Gwnhq7BNCpKNzOvZk2vtykYYBZhOec=
X-Google-Smtp-Source: AMrXdXskcc/iN8gZqFcCj14HSC7FwiQDphXdBmXeF2G370PvOospP3MS1ZMNYpq5cMeYH8AEnnoEbA==
X-Received: by 2002:a05:6a00:190e:b0:58b:c1a1:4006 with SMTP id y14-20020a056a00190e00b0058bc1a14006mr28752644pfi.18.1674440513797;
        Sun, 22 Jan 2023 18:21:53 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/32] cairo: fix CVE patches assigned wrong CVE number
Date: Sun, 22 Jan 2023 16:21:00 -1000
Message-Id: <960f9a9243282da838da655d03bb34261e300498.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176270

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

CVE-2019-6461 and CVE-2019-6462 are fixed, but the reporting is
incorrect as the patch for CVE-2019-6461 is actually for CVE-2019-6462
and vice-versa.

This swaps both files and edit the CVE field to report the correct
identifier.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f12c2a5ac94cb29f473f3c7e335463c7fb6d8a6e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cairo/cairo/CVE-2019-6461.patch           | 46 ++++++-------------
 .../cairo/cairo/CVE-2019-6462.patch           | 46 +++++++++++++------
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
index 0b7d9a0c36..a2dba6cb20 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -1,40 +1,20 @@
-CVE: CVE-2019-6461
-Upstream-Status: Backport
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
-
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
+There is an assertion in function _cairo_arc_in_direction().
 
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
+index 390397bae..1bde774a4 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
  
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
  
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
index 4e4598c5b5..7c3209291b 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -1,20 +1,40 @@
-There is an assertion in function _cairo_arc_in_direction().
-
 CVE: CVE-2019-6462
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Backport
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+
+From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <hlewin@gmx.de>
+Date: Sun, 1 Aug 2021 11:16:03 +0000
+Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
+
+---
+ src/cairo-arc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1bde774a4 100644
+index 390397bae..1c891d1a0 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
-     if (cairo_status (cr))
-         return;
+@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+ 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
+     };
+     int table_size = ARRAY_LENGTH (table);
++    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
  
--    assert (angle_max >= angle_min);
-+    if (angle_max < angle_min)
-+       return;
+     for (i = 0; i < table_size; i++)
+ 	if (table[i].error < tolerance)
+ 	    return table[i].angle;
  
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
- 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+     ++i;
++
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && i < max_segments);
+ 
+     return angle;
+ }
+-- 
+2.38.1
+
-- 
2.25.1


