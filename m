Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE6AC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 16:17:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78131.1670948261029083913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 08:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4990C2F4;
	Tue, 13 Dec 2022 08:18:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 455FB3F71E;
	Tue, 13 Dec 2022 08:17:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/4] cairo: update patch for CVE-2019-6461
Date: Tue, 13 Dec 2022 16:17:32 +0000
Message-Id: <20221213161732.865885-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213161732.865885-1-ross.burton@arm.com>
References: <20221213161732.865885-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 16:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174543

Update the patch to reflect the fix merged into 1.17.6.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cairo/cairo/CVE-2019-6461.patch           | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta=
/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
index 5232cf70c69..b5fd915b826 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -1,19 +1,41 @@
 There is a potential infinite-loop in function _arc_error_normalized().
=20
 CVE: CVE-2019-6461
-Upstream-Status: Pending
+Upstream-Status: Backport [ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
=20
+From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <hlewin@gmx.de>
+Date: Sun, 1 Aug 2021 11:16:03 +0000
+Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite l=
oop
+
+---
+ src/cairo-arc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..f9249dbeb 100644
+index 390397bae..1c891d1a0 100644
 --- a/src/cairo-arc.c
 +++ b/src/cairo-arc.c
-@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolera=
nce)
+@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tole=
rance)
+ 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
+     };
+     int table_size =3D ARRAY_LENGTH (table);
++    const int max_segments =3D 1000; /* this value is chosen arbitraril=
y. this gives an error of about 1.74909e-20 */
+=20
+     for (i =3D 0; i < table_size; i++)
+ 	if (table[i].error < tolerance)
+ 	    return table[i].angle;
+=20
+     ++i;
++
      do {
  	angle =3D M_PI / i++;
  	error =3D _arc_error_normalized (angle);
 -    } while (error > tolerance);
-+    } while (error > tolerance && error > __DBL_EPSILON__);
++    } while (error > tolerance && i < max_segments);
 =20
      return angle;
  }
+--=20
+GitLab
--=20
2.34.1


