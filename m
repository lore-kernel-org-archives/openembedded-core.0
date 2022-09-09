Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CCAC54EE9
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 00:07:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.732.1662682025638079788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 17:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com
 [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 81493204A5AF;
	Thu,  8 Sep 2022 17:07:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 81493204A5AF
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v2] rootfs.py: dont try to list installed packages for
 baremetal images
Date: Thu,  8 Sep 2022 18:06:55 -0600
Message-Id: <20220909000655.1512857-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 00:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170476

Theres not a rootfs for baremetal images, hence we should avoid
trying to list rootfs packages for them.

This fixes an issue where some classes (e.g. license_image) rely on
rootfs functionality when included for baremetal images even if its
nonexistent

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0b9911e3a6..ad2a4c1441 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -386,6 +386,10 @@ def create_rootfs(d, manifest_dir=3DNone, progress_r=
eporter=3DNone, logcatcher=3DNone)
=20
=20
 def image_list_installed_packages(d, rootfs_dir=3DNone):
+    # Theres no rootfs for baremetal images
+    if bb.data.inherits_class('baremetal-image', d):
+        return ""
+
     if not rootfs_dir:
         rootfs_dir =3D d.getVar('IMAGE_ROOTFS')
=20
--=20
2.25.1


