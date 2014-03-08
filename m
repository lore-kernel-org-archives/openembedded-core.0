Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 747836B5D9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 22:24:07 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so14994283ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Mar 2014 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=zBeOJMERXzEwIh2WBw3u7BQU0l0+a5rZwxVYl7mBviY=;
	b=XVfnVLQYGK7LxkVBHYfeNPt4inH2cF7zh7zqJ+Gh5tQiTZgu2ga3f9teZsYEB98CAG
	lli6/2UzD1dlRGL6OvY2vYA2wT3DE6AhvxcKY8BfGJdqu25i64XDA4TzU7+vrNCStw45
	IEsVC82tI7KLVr99fera26luWLa2MohGVHf6Dr/kDY2s1w+s1uprK7wLb0SuX+w5yUMr
	fEEY2qsov+YoJmvY0VQH1n0iPQxI30g5wmCVqGTicw5Z4qhn896Kux7AX42oL0ulIXge
	T/eZxgailpQ2RCfFjz2Kyd2dXECtq6YAfvFQqwf4UJf7QLzbWbZpQ5ioTGh2Qs9ZiUb9
	zQwQ==
X-Received: by 10.236.147.107 with SMTP id s71mr32845951yhj.45.1394317448589; 
	Sat, 08 Mar 2014 14:24:08 -0800 (PST)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	q69sm41642890yhd.22.2014.03.08.14.24.07 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Mar 2014 14:24:08 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Mar 2014 19:23:57 -0300
Message-Id: <1394317437-6551-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wic: Use mke2fs to create the ext2/3/4 image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Mar 2014 22:24:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OE-core commit f3a95ca6886b55e5819b068bdbd2cceb882d91a6 removed the
populate-extfs.sh. So mke2fs should be used to create ext2/3/4 image.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 91d751e..e0a82f5 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -174,7 +174,6 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
 
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
@@ -199,11 +198,10 @@ class Wic_PartData(Mic_PartData):
 
         extra_imagecmd = "-i 8192"
 
-        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, rootfs)
+        mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
+            (self.fstype, extra_imagecmd, rootfs, image_rootfs)
         rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
 
-        populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
-        rc, out = exec_native_cmd(pseudo + populate_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-- 
1.8.3.2


