Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1279EC54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.16165.1672594970310984035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gpYtn2Kt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so26308027pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=gpYtn2KtWBy/AQV9Cv0wrbiDpzDjZSrwAjQ8AZpj1bkF2Enu1GKk7VYorXT75FbchU
         6GfmuI1trQKhVF0ZAiad9NAhjlta32hOL4znkKKtxICXr61r64eTOH9hg70tPtyEccuq
         5wcUpn3yV0UMiidjYuI+PFyAkddPvFNUljs1LVfbuSe5ULGMeNpY38qvYVrx5ngANdxL
         Gidov0pC0IseRUJxzIMx1Quxug1NzXhHwwSdXqav0ttoOP23rdYgp5Wnh1KEkD/FOpBq
         pQbqz9mSos4iQG3cIeXlsOnHJGqTkrhEcY6lzGiMvN//XBZRN5v4lgBUEQra7gqq1ATR
         5EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=2zqpwncOxA5LD30J9VMfIR6jBTVet+O+OLJR/asMRl7gRr0PbOtFCUAxDJO/TKgU4q
         RFv/CKG3VN32rvpw0XDd5BETHtFzQFlamDm6UZgzQ3yziD6zPGyNx//ZZ2eCKuaLro/l
         JVjhsO/Kz00TCDBO+ezJcve3qGctzIhwCHExwH7scTzSZnhNBLM7KzgO4+xkixKAbuEs
         3oN8X4/l7j4XZME3fY0AsDsGgYQJGpPQPLSDjOPE+4WE0Zo/XE55GahfhpR8cNcCP008
         yNNdyko1voBN6t/X1ZLU0hmsuyv0WjtarmdYeix+rZJQ0MNB/d32by8J2VCqKRzqOiGr
         zCww==
X-Gm-Message-State: AFqh2kqQ3ANuGcps6b6FbTRz6eF41p+0Qz81rRhxGCPec1+VxUQo16+m
	FMMmJitZfFq8b8RjZG8+3e8sUWC1r8/oqsrfuoY=
X-Google-Smtp-Source: AMrXdXuTH9hVAo/g7AyT1j/ksZfP7nevTIWBpwHj3vwA1a8r1CMvoVRSiAkJjn/efQTEmztf/wzWZg==
X-Received: by 2002:a17:902:aa8a:b0:192:c930:a7e2 with SMTP id d10-20020a170902aa8a00b00192c930a7e2mr2007819plr.58.1672594979262;
        Sun, 01 Jan 2023 09:42:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] cairo: update patch for CVE-2019-6461 with upstream solution
Date: Sun,  1 Jan 2023 07:42:23 -1000
Message-Id: <a7a1659785513bf9b796a83992d68f4d1ebca76e.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175225

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Upstream went with something slightly different so let's update the
patch so we don't have to carry a patch that isn't going to be merged.

This patch is part of snapshot 1.17.6.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19eb1e388fbbe5bfb8462710c745f2bb5446b5b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cairo/cairo/CVE-2019-6461.patch           | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
index 5232cf70c6..0b7d9a0c36 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -1,19 +1,40 @@
-There is a potential infinite-loop in function _arc_error_normalized().
-
 CVE: CVE-2019-6461
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
-index 390397bae..f9249dbeb 100644
+index 390397bae..1c891d1a0 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+ 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
+     };
+     int table_size = ARRAY_LENGTH (table);
++    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
+ 
+     for (i = 0; i < table_size; i++)
+ 	if (table[i].error < tolerance)
+ 	    return table[i].angle;
+ 
+     ++i;
++
      do {
  	angle = M_PI / i++;
  	error = _arc_error_normalized (angle);
 -    } while (error > tolerance);
-+    } while (error > tolerance && error > __DBL_EPSILON__);
++    } while (error > tolerance && i < max_segments);
  
      return angle;
  }
+-- 
+2.38.1
+
-- 
2.25.1


