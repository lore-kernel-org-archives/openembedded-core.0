Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4246EC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 21:31:48 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3768.1661290303224252775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 14:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5A1382125977;
	Tue, 23 Aug 2022 14:31:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5A1382125977
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-image.bbclass: Emulate image.bbclass to handle new
 classes scope
Date: Tue, 23 Aug 2022 15:31:24 -0600
Message-Id: <20220823213124.4185070-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 21:31:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169728

The new classes scope implemented on commit 7bd328f9d
made testimage.bbclass (and perhaps others) stop working
for baremetal-images, the expected way to run testimage
is no longer to use INHERIT but to use IMAGE_CLASSES
instead, however this functionality was not implemented in the
baremetal-image class until now.

Emulate image.bbclass allowing the baremetal-image class to
use IMAGE_CLASSES to fix this issue.

Set defaults for IMAGE_FEATURES to allow bitbake checks to
pass properly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/baremetal-image.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index 3a979f2ed1..d3377a92fa 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -15,6 +15,15 @@
 #
 # See meta-skeleton for a working example.
=20
+## Emulate image.bbclass
+# Handle inherits of any of the image classes we need
+IMAGE_CLASSES ??=3D ""
+IMGCLASSES =3D " ${IMAGE_CLASSES}"
+inherit ${IMGCLASSES}
+# Set defaults to satisfy IMAGE_FEATURES check
+IMAGE_FEATURES ?=3D ""
+IMAGE_FEATURES[type] =3D "list"
+IMAGE_FEATURES[validitems] +=3D ""
=20
 # Toolchain should be baremetal or newlib based.
 # TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
--=20
2.25.1


