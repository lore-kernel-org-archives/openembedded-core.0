Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.178.1628626286112284618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 13:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=bSBdz9/c;
 spf=pass (domain: qtec.com, ip: 209.85.167.47, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f47.google.com with SMTP id c24so270494lfi.11
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HI6th4nqdCZXu3+bxersQef7NB82cUv4tUKzS2980XM=;
        b=bSBdz9/cF+ECyT14B8kVyamO28qgvl6lIbMUVaEr/dgsAC8yrEw/VoAqeAHWtZKUH+
         S3Q/jtCDJ7+VUo8GiJH/u0/tSJKHGv/VvbUGnTCG23pyE/gf6QEVO3bSiy1PgvwrPpND
         QnJqff1tJFrSEP9FEOKOqPvBUmskUMNSmyS3fksT5GpQ0jT0DSacJwFZdQeT9vW6Z3db
         39FufqvKXi5OmNzTYHCUHU/eNGGKe3yO8xNZ3446fuuflP/JOkvJ26JMKs7l15ijcda6
         1wK7D2oWKWoumx4vEju0huWkB88+OXcwf67scSOvH4ZkIgIQ3b6cl/r+LHmZtsfwXeat
         OvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HI6th4nqdCZXu3+bxersQef7NB82cUv4tUKzS2980XM=;
        b=GBJcX2o6g0/+zw62X+OQxQPYQkYsoSpsV5V4oP3TH4VqJwzl7ZXmQ/g8jNsPjAVz0w
         jtQ4mkdZlu1QADppAG+E6wXO5r2ejBk4q1FzuTo+1tlU56bB8iScldw695t4esM0Ka4K
         31O7YjDk/LFakciqZummKOeEKZP9+igoWzbN9UZG5PpNwQkAakDzDlqpzlWaapomKKLS
         wBizzhKXsznyoV/rJfrMZmkdmCQGWJOQipsD8IjGyzcE03KX8Fui8Am2TuCPVZ8tnctj
         puZ7bWtMF70qnzQI3td6RWxyHYtmzfkGYE7T+kADaW6nzHy9ykHCTcA4tfu2qgH0NTiB
         m6PA==
X-Gm-Message-State: AOAM532jZtQYkPZ/Lazb7Kb1zPAVxhcLMgUJsNwhR54lzTTYkryB/nca
	YztQE/reKGip9OtuwBHeeq5jx8FB/L/UvY9ea/4HwHsEMXFrjTGaUcnFgIekzFZE4uOFV3cRY1Z
	cOltf2vCIo048zHkQ2JxAeoSZ71HMZNkKS8ywX3rynYruqWQwwtxhwFo4nvN9PSCia1VPpnFGr3
	8DDmB9s05XnuYBRKA=
X-Google-Smtp-Source: ABdhPJzx8CpppcG6L2ysPQSUjp3hR/77vD55Nl6RU/cPqpGgFj+nQXhO9IvvEp3KevBpboHXZfvcpg==
X-Received: by 2002:a05:6512:3f9f:: with SMTP id x31mr8854213lfa.245.1628626283507;
        Tue, 10 Aug 2021 13:11:23 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id j14sm454338lfc.207.2021.08.10.13.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 13:11:23 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH v2 1/2] wic: Add --no-fstab-update part option
Date: Tue, 10 Aug 2021 22:11:00 +0200
Message-Id: <20210810201101.261132-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When embedding a rootfs image (e.g. 'rootfs-dir') as a partition we
might want to keep the stock fstab for that image. In such a case, use
this option to not update the fstab and use the stock one instead.

This option allows you to specify which partitions get the fstab
updated and which get the stock fstab.

The option matches the argument you can pass to wic itself where the
same action is performed but for all the partitions.

Example:
    part /export --source rootfs --rootfs-dir=hockeycam-image
--fstype=ext4 --label export --align 1024 --no-fstab-update

    part / --source rootfs --fstype=ext4 --label rootfs --align 1024

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 scripts/lib/wic/help.py                  | 3 +++
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 5 +++--
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991e5094bb..5c3d278d4e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -991,6 +991,9 @@ DESCRIPTION
                              multiple partitions and we want to keep the right
                              permissions and usernames in all the partitions.
 
+         --no-fstab-update: This option is specific to wic. It does not update the
+                            '/etc/fstab' stock file for the given partition.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7a4cc83af5..0df9eb0d05 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -185,6 +185,7 @@ class KickStart():
         part.add_argument('--use-uuid', action='store_true')
         part.add_argument('--uuid')
         part.add_argument('--fsuuid')
+        part.add_argument('--no-fstab-update', action='store_true')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e0b2c5bdf2..ab304f1b2a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.uuid = args.uuid
         self.fsuuid = args.fsuuid
         self.type = args.type
+        self.no_fstab_update = args.no_fstab_update
         self.updated_fstab_path = None
         self.has_fstab = False
         self.update_fstab_in_rootfs = False
@@ -286,7 +287,7 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-        if self.updated_fstab_path and self.has_fstab:
+        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
             debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
             with open(debugfs_script_path, "w") as f:
                 f.write("cd etc\n")
@@ -350,7 +351,7 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
-        if self.updated_fstab_path and self.has_fstab:
+        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
             mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
             exec_native_cmd(mcopy_cmd, native_sysroot)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 96d940a91d..2e34e715ca 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -218,7 +218,7 @@ class RootfsPlugin(SourcePlugin):
             # Update part.has_fstab here as fstab may have been added or
             # removed by the above modifications.
             part.has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
-            if part.update_fstab_in_rootfs and part.has_fstab:
+            if part.update_fstab_in_rootfs and part.has_fstab and not part.no_fstab_update:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
                 install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
-- 
2.30.2

