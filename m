Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982E9C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 15:54:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.77096.1670946854844241378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 07:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: theobroma-systems.com, ip: 217.70.183.200, mailfrom: quentin.schulz@theobroma-systems.com)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 2756020013;
	Tue, 13 Dec 2022 15:54:10 +0000 (UTC)
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: ross.burton@arm.com
Subject: [PATCH] cairo: update patch for CVE-2019-6461 with upstream solution
Date: Tue, 13 Dec 2022 16:53:52 +0100
Message-Id: <20221213-cairo-cve-2019-6461-v1-0-f3cf17911e84@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 15:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174538

Upstream went with something slightly different so let's update the
patch so we don't have to carry a patch that isn't going to be merged.

This patch is part of snapshot 1.17.6.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
---
 .../cairo/cairo/CVE-2019-6461.patch                | 35 +++++++++++++++++-----
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

---
base-commit: cc05bc04156122fd6f918191a9cec7bc0392415e
change-id: 20221213-cairo-cve-2019-6461-77eaa8fdeb06

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

