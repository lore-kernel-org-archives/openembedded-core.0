Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8541EC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.13304.1668953803963534975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vn01awqU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id h14so8357728pjv.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYMWADDF66VgYP9QsEG6Hudh9GELIONym5Fs2OSC8NE=;
        b=Vn01awqUuBRfWVfD9tK/lP8c6wNiIDraWHDz1rM792jv+6Rvv9jGMRh+3XCjLwXarR
         LihPdKMJGM7RmxywuTBP/yQnVeKHZWgs6vbxxRYGczWrBXHLQliBQrLEzxOPoSiifBto
         4ZV3TtQNv1mJkbJZV0A6c9T0GWlbqLgpCj2Xodj526B7IXvdgxKWLQvbMaEVWxK1MdfF
         znvG22/091+llLTUIkM/HTyvi2RkCwWxYyC95bHF23He0ftizYLURamXiF2l0MT2xDOO
         Pztop1KnEMPGT9IDRQxTPajpLVk2lz5mdqkGNPKVFgjFNJKGXSrYIPPhuyZfZYI4Cq3O
         D8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYMWADDF66VgYP9QsEG6Hudh9GELIONym5Fs2OSC8NE=;
        b=I42px3gVd/wOVhDUGDwFPftENtwbtg6A+o7GyeVLUJVuvtDx3VKCBGXQzvC8J6CsyN
         KvI+8IC9xLyC4+4K0n3ygMJobE1AdjzC6tEgplp9mSUsNNlLPQVL3NVlKMTn3Y8JF9VO
         7E13naKLSriSlIescD2IBHg8vi0KtyCopmNwN7GsB6r/6zwfXY2z3EPkWhJMXkFLqJ+F
         LbH9jBbtGIpGTHZufIzOtTdcU54oEmBEwUvZDdLBFCdnYnJfQSmuzo8AdhXi9X2RAbWU
         I73ktVBi9lu9jE4Pey6yegKwooOg2psk4fXP0+olgrFMrYxJK10Eu3lG0j3wp/K4p5/6
         DpqA==
X-Gm-Message-State: ANoB5pkkDdW/EXmiz33i9mOLXoa893cxs98gchyt1ySITo+s6VMY50za
	eDuTotaprXCHgN+mfa58HHmFdgohRK2rPRvzhVg=
X-Google-Smtp-Source: AA0mqf7PJiKEeGhXG2sYD9TOgqAaQe3DPj4JUXuTZi71qV3llnNEUgPJfz6L0Iu1mTQHsxxPQsAQjw==
X-Received: by 2002:a17:90b:2810:b0:213:ecb6:b690 with SMTP id qb16-20020a17090b281000b00213ecb6b690mr22622596pjb.244.1668953802929;
        Sun, 20 Nov 2022 06:16:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/35] wic: make ext2/3/4 images reproducible
Date: Sun, 20 Nov 2022 04:15:24 -1000
Message-Id: <da2c64b3158c58eb0a484d3acbdf0419df2d34e8.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173635

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Ext2/3/4 FS contains not only mtime, but also ctime, atime and crtime.
Currently, all the files are being added into the rootfs image using
mkfs -d functionality which affects all the timestamps excluding mtime.
This patch ensures these timestamps inside the FS image equal to
the SOURCE_DATE_EPOCH if it is set.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 75d2dd0ea7790db2e8ee921784ca373abff2df65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 7c288d2958..5563f4448a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -293,17 +293,36 @@ class Partition():
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
-                if os.getenv('SOURCE_DATE_EPOCH'):
-                    fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
-                    for time in ["atime", "mtime", "ctime"]:
-                        f.write("set_inode_field fstab %s %s\n" % (time, hex(fstab_time)))
-                        f.write("set_inode_field fstab %s_extra 0\n" % (time))
             debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
             exec_native_cmd(debugfs_cmd, native_sysroot)
 
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            sde_time = hex(int(os.getenv('SOURCE_DATE_EPOCH')))
+            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
+            files = []
+            for root, dirs, others in os.walk(rootfs_dir):
+                base = root.replace(rootfs_dir, "").rstrip(os.sep)
+                files += [ "/" if base == "" else base ]
+                files += [ base + "/" + n for n in dirs + others ]
+            with open(debugfs_script_path, "w") as f:
+                f.write("set_current_time %s\n" % (sde_time))
+                if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
+                    f.write("set_inode_field /etc/fstab mtime %s\n" % (sde_time))
+                    f.write("set_inode_field /etc/fstab mtime_extra 0\n")
+                for file in set(files):
+                    for time in ["atime", "ctime", "crtime"]:
+                        f.write("set_inode_field \"%s\" %s %s\n" % (file, time, sde_time))
+                        f.write("set_inode_field \"%s\" %s_extra 0\n" % (file, time))
+                for time in ["wtime", "mkfs_time", "lastcheck"]:
+                    f.write("set_super_value %s %s\n" % (time, sde_time))
+                for time in ["mtime", "first_error_time", "last_error_time"]:
+                    f.write("set_super_value %s 0\n" % (time))
+            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
+            exec_native_cmd(debugfs_cmd, native_sysroot)
+
         self.check_for_Y2038_problem(rootfs, native_sysroot)
 
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
-- 
2.25.1


