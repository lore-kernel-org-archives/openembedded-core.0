Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D4EC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 15:17:43 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.58079.1681744658445081488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 08:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yadro.com header.s=mta-01 header.b=Zfh3HOjv;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id AE079342406
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 18:17:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=bbU03DYTBbBVT4f+79/d3yoXyQa7sVqa/d4oWtuOIDQ=; b=
	Zfh3HOjvBhfpbEPzCCpVBdp3heQCId4Md1f9DBrL85Cc525Z2PxK5ofnV+5HLzX4
	efmP1NyI/y1xdd+nYOHvCVxr+0rDUO/pKF76KqTjzBxuNDxybNP8YNblOBNyu8wP
	kB6kK0iWf3m7SmXvMt6uIB5YLVRVgyQstiSAp6I+S3Q=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id A284F3422C3
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 18:17:34 +0300 (MSK)
Received: from localhost.localdomain (172.22.2.137) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Mon, 17 Apr 2023 18:17:33 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] wic: add support for proper kernel name to bootimg-pcbios
Date: Mon, 17 Apr 2023 18:17:19 +0300
Message-ID: <20230417151719.22388-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.2.137]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 15:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180158

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Use appropriate kernel image name instead of hard-coded vmlinuz for booti=
mg-pcbios plugin.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/l=
ib/wic/plugins/source/bootimg-pcbios.py
index 32e47f1831..a207a83530 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -122,7 +122,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf +=3D "DEFAULT boot\n"
             syslinux_conf +=3D "LABEL boot\n"
=20
-            kernel =3D "/vmlinuz"
+            kernel =3D "/" + get_bitbake_var("KERNEL_IMAGETYPE")
             syslinux_conf +=3D "KERNEL " + kernel + "\n"
=20
             syslinux_conf +=3D "APPEND label=3Dboot root=3D%s %s\n" % \
@@ -155,8 +155,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
                 kernel =3D "%s-%s.bin" % \
                     (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_va=
r("INITRAMFS_LINK_NAME"))
=20
-        cmds =3D ("install -m 0644 %s/%s %s/vmlinuz" %
-                (staging_kernel_dir, kernel, hdddir),
+        cmds =3D ("install -m 0644 %s/%s %s/%s" %
+                (staging_kernel_dir, kernel, hdddir, get_bitbake_var("KE=
RNEL_IMAGETYPE")),
                 "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" =
%
                 (bootimg_dir, hdddir),
                 "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c3=
2" %
--=20
2.40.0



