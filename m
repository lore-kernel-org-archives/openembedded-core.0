Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD01C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.22289.1672418662218409591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aRg65V3j;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id f3so14518072pgc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=aRg65V3j+p9kmtfI/3T9y4IQ/blAogw5gQsfPjKiI4qsnJRyeNwDg8lyBCtUh3Tpi0
         p4LEz+OAXDXOFz7DSpDifzsXMPJtAKRL7gOA2hphbxa5RssfCwBhOQGlBTwPWXolsTfF
         grqBAJz4WiYg8PgBW0vYZc3CDiCmcga8itzSMnXE99AJyvnMgiF9dxAz9HqpMZBtY0fb
         jVPx15V21a5Ni4wId8EiJuLI3Nb/AyswAvuj+fP+WJls4F41CL6uQrSSp5ufapBhefTS
         nk34oQx3nkvSitffCTC41SSrYgOa5SwmLjIEwaZElaVxCpxc6k3M/PAGixverW6AugOv
         Ho7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ny8jaNAXEgOtAtPWVTdaKFy3PZUp5k7WQYQjXrAddA=;
        b=lfXzowPj7doFD3Ray+nUiZNFJdUl4PFdD0M2m/ictBDMWbnk9KRXU0ha5cQmEh8wPv
         svPvfd1TtRoBU26xaDX/oXpGbFyzeKmX1CluhIJ+FufZYwJ+mJjFV+g0a/jjB/8p+XJB
         hx0IKi9RrRZlodwpbJROd9Ysta/v0ROHXgORjAltL9+sUpNOdcpiliZNXHdU21nucCAv
         XqHH4YliQCd+X0/k6ybv4ggbk+IuQHXtT/AUexiXKW+mtceydGcCTNF2QO/gd8P3e0JV
         iZvs5XsB9QudbANdtvPmOJcVrVFrzhbf5HxBAKbm+jaWnB+qNfCD4xZMr7AbwR1auih1
         wneA==
X-Gm-Message-State: AFqh2koRXfUDYgICkibLi+sCXas4/mjBwRr16hulAT67wPTRiWGw7jfI
	JpqjU7l7R4DuRryLdHyDxdhJ1H/k9iwINWu1QMo=
X-Google-Smtp-Source: AMrXdXtEgAuNcGUiYziOFLbqilVIW93YifswmUaj5QCkZZt7YxQgUXQirnrekWMs3DOGivj/A4UJkA==
X-Received: by 2002:a62:1704:0:b0:581:e3db:3b56 with SMTP id 4-20020a621704000000b00581e3db3b56mr4683925pfx.32.1672418660945;
        Fri, 30 Dec 2022 08:44:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/22] cairo: update patch for CVE-2019-6461 with upstream solution
Date: Fri, 30 Dec 2022 06:43:51 -1000
Message-Id: <042a08fbd7613539b3cfc9d8e337f275dec75583.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175142

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


