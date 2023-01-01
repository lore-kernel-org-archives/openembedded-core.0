Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDFC46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.16000.1672594691078816412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6op6fnkn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id x26so11205065pfq.10
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=6op6fnknMFat1rD2rlyFQae54MfuMD6O4myBEhmv4OXyF82Ij7LXtpefYLoZmbVP99
         Ll1FbDEi3VtRYtr0+/twJbg2hLX2uOrarwx/ZswqBQSqhBGaRsx9SgH1RHCfw7g9/ub5
         6C8G/sr4EYHBdRUo0yjUKOfebDa+62O3o/Pf0tvJ8yfgAVLy/o7gGMI4P3G64R7p4jwZ
         llEKv1v3kRV7irlF3DsCyPBWos6rS2530057sbebAPe4FCJmwszUdFOF9k9PWHB0lKS2
         ABIWwYSeAl2UzSimtgoyGNisdNJRKwyS7pg+4omLMhv4CeZIHozGu8YLvh1lieRlvu4x
         m1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=rv6vbTyRM8xGn0uENwTxRzuNV4ozBGVXTQMLowoaHF94z83YXXKLQ/g5BIAtkhYhKL
         nu9NPfLKuPaZGmV8BKGCoOGtXtf32cNgK+v3C+GL8tdPpFPlxvRUIujokICvBkCSa47S
         ZigdzV3YXmVcXtgaYcmFRM3GzPzXObFTNMxO0lHcYdDAr3N3RuwdgQi8yqMXE0hNZ8SE
         kVOHMeFwiPYOOhgOKgFIeYcXz48HtniYxaK351I6QBgsbhhsPQPQ7vtSKDHx0yShmyKK
         AlUTv6SMGyp0snlBc3JDk1efZM1UA812QZ8oXBNaIUpKwxHgOD7++pEONv6K+XGjaecm
         l/gg==
X-Gm-Message-State: AFqh2koh5jicJ75t17j5u/brO9P70ZFeUsok8iuCu4v5pmEjD6i+fI/J
	iViI7I2KkVRaDh/yZTUTiINdG6YMCFiqUKpkXHQ=
X-Google-Smtp-Source: AMrXdXs5/S3UqsD2D1XFoYeLsgl0y9PCCnozheontNeSgvSIf+fMc/4m/j/xvo/T3Q0VbTQHcrSO2g==
X-Received: by 2002:aa7:8d09:0:b0:577:3944:aa78 with SMTP id j9-20020aa78d09000000b005773944aa78mr35431033pfe.0.1672594690097;
        Sun, 01 Jan 2023 09:38:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/29] cairo: update patch for CVE-2019-6461 with upstream solution
Date: Sun,  1 Jan 2023 07:37:29 -1000
Message-Id: <dc76fde0661a308a70c4b93d3d8c100b28b5e6c6.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175195

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


