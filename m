Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2902EC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:39 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.30692.1668892590415421333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VK3/PxAL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id n17so7910198pgh.9
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BBw3dIaQRql9OqPVGwh23nFjJ572GDlNoHLgwLOQnU=;
        b=VK3/PxALphx1bnPVervbvAFIt2nz7JJM8JSr8/EFFYfXttRe9YlDYEi2luOL5NbaTt
         vnUc680U2nN0XDAvHhszBeJMp1GHg5oBsFlnj9OwsY93lJmGZrntvcL5wyYrC+RTrPGp
         IGCHgBnCukGzaSq17FKE9JOoV/MmXQRaj499fxtj9ZV82KB2StGCu3xmJkeBUFaTb5ju
         pglwbpn2/xkrMLoOjqwhqm8tr+jo70znSfpwKtzoKtsCTLQTO3ruNXGmkJLnhou4Z7Q0
         5TVBo7DxIY5XpKeAF0ixjkZ4uof01bOMzt7VJblgy40VbYGnPSE2AGLlrjNGdyDUdQlc
         M8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BBw3dIaQRql9OqPVGwh23nFjJ572GDlNoHLgwLOQnU=;
        b=iFwgYeTLaMyhXzjdRRjufNewwQcFZ9+8kQRlg84ex35mKEcHo6C5aIxm6wVih+yIn+
         v5qCQb/yNCkk0JAuYvH+wDvAZD0NID7TjgYIRuTMZa9Ugui4myLV0FygPutCFhx/RNYj
         NjRrmxGKaZsMzbCYJKh/6kqQyjD7wg0ts16vJOH54H7ZBFnHZQqx3Z7CR/iEbn+DgCtW
         AAs4O2K1ArebnbVjF0VhrPTrgtgT3aY6z7TRaOCPu9+sGuilWMB17AyBF40x+OQMH1W+
         WkTCBNZwil8Q5iUKFYOv1wwmJIy2Dj//aUAIMAypMksHQB/c2coTt3Nf/FMKC/RnKNnI
         NALg==
X-Gm-Message-State: ANoB5pmdmUWSBuRqn+JPDvcCOUL7H9wydSwKNy0j28xu+ZJhQFBKUG8C
	9kgdMVJjyXrB44WIbMC3FsbA2j8dM7RZsau2Vh0=
X-Google-Smtp-Source: AA0mqf69ULxeQLmuZ2ATn8XKzVjiDJnXVWq9mDaO4mzjFALgwHH36ejgzg3y70E/z3wk8niCd6mUMw==
X-Received: by 2002:a62:17ca:0:b0:572:9681:102b with SMTP id 193-20020a6217ca000000b005729681102bmr13563868pfx.27.1668892589320;
        Sat, 19 Nov 2022 13:16:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 35/35] wic: make ext2/3/4 images reproducible
Date: Sat, 19 Nov 2022 11:15:14 -1000
Message-Id: <e0dc0f4a153f75d14d50d5bc91edb93fac93cd25.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173575

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
index bc889bdeb9..2a916e077c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -294,17 +294,36 @@ class Partition():
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


