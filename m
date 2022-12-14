Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2210EC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 10:42:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.100088.1671014548221234418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 02:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 55C6BFF804;
	Wed, 14 Dec 2022 10:42:24 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Ross Burton <ross.burton@arm.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] cairo: fix CVE patches assigned wrong CVE number
Date: Wed, 14 Dec 2022 11:42:16 +0100
Message-Id: <20221214-cairo-cve-typo-v1-1-8ecb1bf8f9df@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-141d4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 10:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174552

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
CVE-2019-6461 and CVE-2019-6462 are fixed, but the reporting is=0D
incorrect as the patch for CVE-2019-6461 is actually for CVE-2019-6462=0D
and vice-versa.=0D
=0D
This swaps both files and edit the CVE field to report the correct=0D
identifier.=0D
=0D
Cc: Quentin Schulz <foss+yocto@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
 .../cairo/cairo/CVE-2019-6461.patch                 | 21 +++++++++++------=
----=0D
 .../cairo/cairo/CVE-2019-6462.patch                 | 21 ++++++++++-------=
----=0D
 2 files changed, 21 insertions(+), 21 deletions(-)=0D
=0D
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/r=
ecipes-graphics/cairo/cairo/CVE-2019-6461.patch=0D
index 5232cf70c6..a2dba6cb20 100644=0D
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch=0D
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch=0D
@@ -1,19 +1,20 @@=0D
-There is a potential infinite-loop in function _arc_error_normalized().=0D
+There is an assertion in function _cairo_arc_in_direction().=0D
 =0D
 CVE: CVE-2019-6461=0D
 Upstream-Status: Pending=0D
 Signed-off-by: Ross Burton <ross.burton@intel.com>=0D
 =0D
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c=0D
-index 390397bae..f9249dbeb 100644=0D
+index 390397bae..1bde774a4 100644=0D
 --- a/src/cairo-arc.c=0D
 +++ b/src/cairo-arc.c=0D
-@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double toleranc=
e)=0D
-     do {=0D
- 	angle =3D M_PI / i++;=0D
- 	error =3D _arc_error_normalized (angle);=0D
--    } while (error > tolerance);=0D
-+    } while (error > tolerance && error > __DBL_EPSILON__);=0D
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,=0D
+     if (cairo_status (cr))=0D
+         return;=0D
  =0D
-     return angle;=0D
- }=0D
+-    assert (angle_max >=3D angle_min);=0D
++    if (angle_max < angle_min)=0D
++       return;=0D
+ =0D
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {=0D
+ 	angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);=0D
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/r=
ecipes-graphics/cairo/cairo/CVE-2019-6462.patch=0D
index 4e4598c5b5..e3a8d5a219 100644=0D
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch=0D
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch=0D
@@ -1,20 +1,19 @@=0D
-There is an assertion in function _cairo_arc_in_direction().=0D
+There is a potential infinite-loop in function _arc_error_normalized().=0D
 =0D
 CVE: CVE-2019-6462=0D
 Upstream-Status: Pending=0D
 Signed-off-by: Ross Burton <ross.burton@intel.com>=0D
 =0D
 diff --git a/src/cairo-arc.c b/src/cairo-arc.c=0D
-index 390397bae..1bde774a4 100644=0D
+index 390397bae..f9249dbeb 100644=0D
 --- a/src/cairo-arc.c=0D
 +++ b/src/cairo-arc.c=0D
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,=0D
-     if (cairo_status (cr))=0D
-         return;=0D
+@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double toleranc=
e)=0D
+     do {=0D
+ 	angle =3D M_PI / i++;=0D
+ 	error =3D _arc_error_normalized (angle);=0D
+-    } while (error > tolerance);=0D
++    } while (error > tolerance && error > __DBL_EPSILON__);=0D
  =0D
--    assert (angle_max >=3D angle_min);=0D
-+    if (angle_max < angle_min)=0D
-+       return;=0D
- =0D
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {=0D
- 	angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);=0D
+     return angle;=0D
+ }=0D
=0D
---=0D
base-commit: a89bea9fed0005bc7d820a1fc6a9d6dd7c246c22=0D
change-id: 20221214-cairo-cve-typo-fd0d89835d77=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D

