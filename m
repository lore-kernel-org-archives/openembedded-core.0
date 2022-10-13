Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2D8C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:41:50 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web09.32.1665679300673138027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=bmdxSTb0;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 7D133412C8
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1665679297; x=
	1667493698; bh=CcRKUWatv81ipL6cYgDRlUQb+hwAHmwpsfBPgacomS0=; b=b
	mdxSTb08O/D0zsch8ldKTcLN94ApBgt91nrZqPrCRRM9F/ZTzRdhMUXlQN4IdkX3
	r8yzYU0xT/kB1fsHQdleBZCadERMGs0ugFLfzj/kFvFwh/yLf6xuhX7s1cvBHjqE
	gv7EvEa1M2aR4fuH37YYHS8pG3NHZlkgga0DJn9iYo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTFm6u3zjTKT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2022 19:41:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 827E54122E
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 19:40:49 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 13 Oct 2022 19:40:49 +0300
Received: from localhost.localdomain (172.22.3.32) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 13 Oct
 2022 19:40:49 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH v2] wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
Date: Thu, 13 Oct 2022 19:40:20 +0300
Message-ID: <20221013164020.4125847-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.3.32]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171718

From: Sergei Zhmylev <s.zhmylev@yadro.com>

In case user requested to build a binary repeatable package,
it's required to honor the SOURCE_DATE_EPOCH environment
variable. So forcefully set mtime inside all the routines
which modify fstab in case it is updated.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/partition.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e50871b8d7..cac1bab4dd 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -291,6 +291,9 @@ class Partition():
         if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
             debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
             with open(debugfs_script_path, "w") as f:
+                if os.getenv('SOURCE_DATE_EPOCH'):
+                    fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
+                    f.write("set_current_time %s\n" % (fstab_time))
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
@@ -353,7 +356,7 @@ class Partition():
         exec_native_cmd(mcopy_cmd, native_sysroot)
=20
         if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
-            mcopy_cmd =3D "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.=
updated_fstab_path)
+            mcopy_cmd =3D "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, se=
lf.updated_fstab_path)
             exec_native_cmd(mcopy_cmd, native_sysroot)
=20
         chmod_cmd =3D "chmod 644 %s" % rootfs
--=20
2.37.2


