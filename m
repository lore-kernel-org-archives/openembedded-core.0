Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9BBECAAD2
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 23:42:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.582.1662075733218228386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 16:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9B2442045E5F;
	Thu,  1 Sep 2022 16:42:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9B2442045E5F
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-image.bbclass: avoid inheriting incompatible
 IMAGE_CLASSES
Date: Thu,  1 Sep 2022 17:42:06 -0600
Message-Id: <20220901234206.419429-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 23:42:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170231

There could be IMAGE_CLASSES designed to work on images which arent
necessarily compatible with baremetal-images, one example is the
license_image class which relies on the package managers functionality
during do_rootfs, for baremetal images no rootfs is created hence the
package manager shouldnt be invoked, we need to avoid inheriting such
class to fix this behavior.

inherit BAREMETAL_IMAGE_CLASSES for baremetal images but set the default
to IMAGE_CLASSES, whilst removing undesired classes in an intermediate
step to avoid incompatibilities.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/baremetal-image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index d3377a92fa..2f07dec4ac 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -18,8 +18,15 @@
 ## Emulate image.bbclass
 # Handle inherits of any of the image classes we need
 IMAGE_CLASSES ??=3D ""
-IMGCLASSES =3D " ${IMAGE_CLASSES}"
+BAREMETAL_IMAGE_CLASSES ?=3D " ${IMAGE_CLASSES}"
+
+# The license_image class relies on package managers used on do_rootfs
+# these dont exist for baremetal images since no rootfs is created.
+BAREMETAL_IMAGE_CLASSES:remove =3D "license_image"
+
+IMGCLASSES =3D " ${BAREMETAL_IMAGE_CLASSES}"
 inherit ${IMGCLASSES}
+
 # Set defaults to satisfy IMAGE_FEATURES check
 IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
--=20
2.25.1


