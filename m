Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554CAC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 16:56:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13478.1664297790485913503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE7A1042;
	Tue, 27 Sep 2022 09:56:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69EB03F792;
	Tue, 27 Sep 2022 09:56:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] Revert "wic/plugins/images/direct: Allow changes in fstab on
 rootfs"
Date: Tue, 27 Sep 2022 17:56:27 +0100
Message-Id: <20220927165627.3350359-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 16:56:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171113

Commit 20d43a2 allows changes in fstab for the / mount. However, if the
fstab contains / already then this results in two entries for / in the
fstab, which is confusing and results in systemd producing errors on
boot:

  systemd-fstab-generator[11101]: Failed to create unit file
  /run/systemd/generator/-.mount, as it already exists. Duplicate entry
  in /etc/fstab?

Wic should be extended to support merging mount points in fstab, but as
we're about to release revert the patch that introduced this change as
it hasn't been in a release yet, and the issue which prompted the patch
in the first place can be revisited post-release.

[ YOCTO #14865 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index c44159b2357..da483daed5f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or not part.mountpoint.startswith('/'):
+               or part.mountpoint =3D=3D "/" or not part.mountpoint.star=
tswith('/'):
                 continue
=20
             if part.use_uuid:
--=20
2.34.1


