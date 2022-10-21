Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F23C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 14:56:48 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.10804.1666364200932972773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 07:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=j2IQBA5M;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id B021041228
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1666364197; x=
	1668178598; bh=fKXoE8obw5ZjK6m5dLEPluELyvELexxi0CJZXt+SoZs=; b=j
	2IQBA5MigucQlgUADAlLy88rIZip+sRHmjIJH46Ob6CTvcEAMeUnN5Z8XePZRvlI
	B84jgF/aaUH5/H3A4O/T62dWzAsWSIvG5hDY0oHTzQ7PVBO+a0YXR6cxrynkcofU
	3AnDHHd+GLXxeVH+QaMctynMlfYEHlINvI6+q4h5oQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nI89P7Gb6JcY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2022 17:56:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 574CB404AD
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 17:56:37 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 21 Oct 2022 17:56:37 +0300
Received: from localhost.localdomain (172.22.0.75) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Fri, 21 Oct
 2022 17:56:36 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH v3] wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
Date: Fri, 21 Oct 2022 17:56:22 +0300
Message-ID: <20221021145622.4124726-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.0.75]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172022

From: Sergei Zhmylev <s.zhmylev@yadro.com>

In case user requested to build a binary repeatable package,
it's required to honor the SOURCE_DATE_EPOCH environment
variable. So forcefully set mtime inside all the routines
which modify fstab in case it is updated.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/partition.py             | 7 ++++++-
 scripts/lib/wic/plugins/imager/direct.py | 3 +++
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e50871b8d7..bc889bdeb9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -294,6 +294,11 @@ class Partition():
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
+                if os.getenv('SOURCE_DATE_EPOCH'):
+                    fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
+                    for time in ["atime", "mtime", "ctime"]:
+                        f.write("set_inode_field fstab %s %s\n" % (time,=
 hex(fstab_time)))
+                        f.write("set_inode_field fstab %s_extra 0\n" % (=
time))
             debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
             exec_native_cmd(debugfs_cmd, native_sysroot)
=20
@@ -353,7 +358,7 @@ class Partition():
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
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index da483daed5..3e766972b4 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -149,6 +149,9 @@ class DirectPlugin(ImagerPlugin):
             self.updated_fstab_path =3D os.path.join(self.workdir, "fsta=
b")
             with open(self.updated_fstab_path, "w") as f:
                 f.writelines(fstab_lines)
+            if os.getenv('SOURCE_DATE_EPOCH'):
+                fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
+                os.utime(self.updated_fstab_path, (fstab_time, fstab_tim=
e))
=20
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/p=
lugins/source/rootfs.py
index fc06312ee4..e29f3a4c2f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -224,7 +224,7 @@ class RootfsPlugin(SourcePlugin):
             if part.update_fstab_in_rootfs and part.has_fstab and not pa=
rt.no_fstab_update:
                 fstab_path =3D os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with =
fixed permissions
-                install_cmd =3D "install -m 0644 %s %s" % (part.updated_=
fstab_path, fstab_path)
+                install_cmd =3D "install -m 0644 -p %s %s" % (part.updat=
ed_fstab_path, fstab_path)
                 if new_pseudo:
                     pseudo =3D cls.__get_pseudo(native_sysroot, new_root=
fs, new_pseudo)
                 else:
--=20
2.37.2


