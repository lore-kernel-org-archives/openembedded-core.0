Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26BFCD5858
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:41:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3177.1767782473177390189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HBxcwDj7;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B3C04196E;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AD21C19422;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782472;
	bh=fKvmEuBYNmi/msZ8MxYLh6f9z5V+f/tgm1qG7r0qC5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HBxcwDj7//3THoPWq+sHLanml58csXg3Cc8+ujXrJ6ramwgA6EN2pvRuLoWW+oHxi
	 wxnuQ3MXpof8cmSDWAqy7FD5Sn1plY1vA29ON9ucE2sYJFU0mrvZSZ5Zl7JYQ8/jvw
	 szNYpWJsV664z3pIcFOXrb2FfFVChWqLpLCnTsARXdYIhxaK3kF8pQ+zhCvfyZHvsq
	 xlnEX53SxSouaG41z6Kbcj6Wib/M2GbSeukGCWWIDV2dPI1qEgDF7MPcAU2EKm0/s/
	 nUOZ08OnUZKL1WDxR8KAXofw8G6wypojgvFC3M83LSvWYgL4HF/Mu5S+0U1aP7LnFM
	 tUGyNC4Qp0eaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD0BCD584D;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Wed, 07 Jan 2026 11:40:51 +0100
Subject: [PATCH 2/2] wic: extra-partition: introduce variable matching
 sourceparams
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-extrafiles-v1-2-a4ddd07df231@non.se.com>
References: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com>
In-Reply-To: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, pierre-loup.gosse@smile.fr
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767782471; l=6487;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=PxP/iGyA+FBBNJVqSCLAa1FOO75GmgKMvgC8QKTAJIg=;
 b=i8XnUjYbtg7nI+e9npWwdXD3S/JHlEew020OnY9Ome0ztFAUytDn9M+zR+9Bt0+CKMjWe8SIB
 /bPqa+FIVfAARg5IEILNIs+j8LxTEEzKJwhMpujpX1IbMBKC0UCOqgz
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228986

From: Louis Rannou <louis.rannou@non.se.com>

The current extra_partition plugin uses predictable variable names (the
configuration must predict the image partition label or uuid). This has two
inconveniences:

- an extra partition that has a specific label (or uuid) is doomed with the
  associated variable. The partition cannot be configured unless the label
  (or uuid) is changed.
- two partitions with same label from distincts .wks cannot have different
  content.

This allows the new suffix _sourceparams_foo to be appended to
IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever the
.wks specifies a name in the --sourceparams option.

For example:
  an image may define:
    IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo = "bar.conf"
  and the .wks line have line:
    part --source extra_partition --sourceparams "name=foo"

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/lib/oeqa/selftest/cases/wic.py               | 16 ++++++++++-----
 scripts/lib/wic/plugins/source/extra_partition.py | 24 +++++++++++++++++------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 55fb8dfd1b..542ce6fb05 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1657,6 +1657,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_extra_partition_plugin(self):
         """Test extra partition plugin"""
         config = dedent("""\
+        IMAGE_EXTRA_PARTITION_FILES_sourceparams-foo = "bar.conf"
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf bar2.conf;foobar2.conf bar3.conf bar4.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
@@ -1688,9 +1689,13 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
 
         try:
             with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines(['part / --source extra_partition --ondisk sda --label foo --align 4 --size 5M\n',
-                                'part / --source extra_partition --ondisk sda --fstype=vfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
-                                'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
+                wks.writelines([
+                    'part / --source extra_partition --ondisk sda --sourceparams "name=foo" --align 4 --size 5M\n',
+                    'part / --source extra_partition --ondisk sda --label foo --align 4 --size 5M\n',
+                    'part / --source extra_partition --ondisk sda --fstype=vfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                    'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n',
+                    'bootloader --ptable gpt\n',
+                ])
                 wks.flush()
                 _, wicimg = self._get_wic(wks.name)
 
@@ -1698,14 +1703,15 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             partls = result.output.split('\n')[1:]
 
             # Assert the number of partitions is correct
-            self.assertEqual(3, len(partls), msg="Expect 3 partitions, not %s" % result.output)
+            self.assertEqual(4, len(partls), msg="Expect 4 partitions, not %s" % result.output)
 
             # Fstype column from 'wic ls' should be fstype as given in the part command
-            for part_id, part_fs in enumerate(["fat16", "fat16", "ext4"]):
+            for part_id, part_fs in enumerate(["fat16", "fat16", "fat16", "ext4"]):
                 self.assertIn(part_fs, partls[part_id])
 
             # For each partition, assert expected files exist
             for part, part_glob in enumerate([
+                ["bar.conf"],
                 ["foo.conf"],
                 ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.conf"],
                 ["bar.conf", "bar2.conf"],
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index d370b0107e..f9410388fa 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -18,15 +18,17 @@ class ExtraPartitionPlugin(SourcePlugin):
     The plugin supports:
     - Glob pattern matching for file selection.
     - File renaming.
-    - Suffixes to specify the target partition (by label, UUID, or partname),
-      enabling multiple extra partitions to coexist.
+    - Suffixes to specify the target partition (by params-name, label, UUID,
+      or partname), enabling multiple extra partitions to coexist.
 
     For example:
 
+        IMAGE_EXTRA_PARTITION_FILES_sourceparams-name = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
         WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_FILES_sourceparams-name \
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
             IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
         "
@@ -53,11 +55,21 @@ class ExtraPartitionPlugin(SourcePlugin):
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         extra_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
+        for (fmt, part_id) in (
+                ("_sourceparams-%s", source_params.get("name")),
+                ("_uuid-%s", part.uuid),
+                ("_label-%s", part.label),
+                ("_part-name-%s", part.part_name),
+                (None, None)
+        ):
+            if fmt is None:
                 var = ""
+            elif part_id is not None:
+                var = fmt % part_id
+            else:
+                continue
+
+            logger.debug("Looking for extra files in %s" % cls.image_extra_partition_files_var_name + var)
             extra_files = get_bitbake_var(cls.image_extra_partition_files_var_name + var)
             if extra_files is not None:
                 break

-- 
2.43.0



