Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10591C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:27:04 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.151.1667489213323124097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=JGMwqVR8;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 02937404CB
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1667489208; x=
	1669303609; bh=KHrG7XicxtV8hSvMfSKLdVMG5PAEVuQknIP9HVdaEWY=; b=J
	GMwqVR8uSlNx9qnCc24q7DvmrsWP8t3DERh4zyBiLpX7+EnucFkMdEebej2FDFLY
	O7PQsONw44WJH7lmlAQFM8sWgRyMYSYitQcPnusrWTPNs4QInM41rJkU0S4WAf2S
	nxb9KsJC0vzWYHZWfPgp8eclpq8gft+U3rYkM/Tqk0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1CAsI8aGdqE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2022 18:26:48 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (T-EXCH-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 99FE441223
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 18:26:20 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 3 Nov 2022 18:26:20 +0300
Received: from localhost.localdomain (172.22.3.32) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 3 Nov 2022
 18:26:20 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] wic: make ext2/3/4 images reproducible
Date: Thu, 3 Nov 2022 18:26:07 +0300
Message-ID: <20221103152607.3940380-1-s.zhmylev@yadro.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172638

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Ext2/3/4 FS contains not only mtime, but also ctime, atime and crtime.
Currently, all the files are being added into the rootfs image using
mkfs -d functionality which affects all the timestamps excluding mtime.
This patch ensures all the timestamps inside the FS image equal to
the SOURCE_DATE_EPOCH if it is set.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/partition.py | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index bc889bdeb9..b7965267cb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -294,17 +294,34 @@ class Partition():
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
-                if os.getenv('SOURCE_DATE_EPOCH'):
-                    fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
-                    for time in ["atime", "mtime", "ctime"]:
-                        f.write("set_inode_field fstab %s %s\n" % (time,=
 hex(fstab_time)))
-                        f.write("set_inode_field fstab %s_extra 0\n" % (=
time))
             debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
             exec_native_cmd(debugfs_cmd, native_sysroot)
=20
         mkfs_cmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
=20
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            sde_time =3D hex(int(os.getenv('SOURCE_DATE_EPOCH')))
+            debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
+            files =3D []
+            for root, dirs, others in os.walk(rootfs_dir):
+                base =3D root.replace(rootfs_dir, "").rstrip(os.sep)
+                files +=3D [ "/" if base =3D=3D "" else base ]
+                files +=3D [ base + "/" + n for n in dirs + others ]
+            with open(debugfs_script_path, "w") as f:
+                f.write("set_current_time %s\n" % (sde_time))
+                f.write("set_super_value hash_seed %s\n" % (self.fsuuid)=
)
+                for file in set(files):
+                    for time in ["atime", "mtime", "ctime", "crtime"]:
+                        f.write("set_inode_field \"%s\" %s %s\n" % (file=
, time, sde_time))
+                        f.write("set_inode_field \"%s\" %s_extra 0\n" % =
(file, time))
+                for time in ["wtime", "mkfs_time", "lastcheck"]:
+                    f.write("set_super_value %s %s\n" % (time, sde_time)=
)
+                for time in ["mtime", "first_error_time", "last_error_ti=
me"]:
+                    f.write("set_super_value %s 0\n" % (time))
+            debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
+            exec_native_cmd(debugfs_cmd, native_sysroot)
+
         self.check_for_Y2038_problem(rootfs, native_sysroot)
=20
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, root=
fs_dir,
--=20
2.37.2


