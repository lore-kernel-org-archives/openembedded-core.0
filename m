Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.44938.1629231114631852490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 13:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=UmhQsB69;
 spf=pass (domain: qtec.com, ip: 209.85.167.49, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f49.google.com with SMTP id d4so43604114lfk.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4tPPUXih/pm+lxWXMYDPFWVkKXwt+N5E9r7VhxS1Og=;
        b=UmhQsB69EkXZ1IZwmjtqLA0h9xG4IT7vVYUh+wesq2Bb6Q6fsgya+DzlbDmuPcscWs
         n3Py8bAAHc3DHb4aY/D94u53SBWaGYqhVQmT/odwtCrk7AK12B4FpXLSuaYcmc8qRbKr
         grMLiKZOQ6DCo8dgF1Omu56AujY/DvCNHB3O1ZTsIJb9JmmLFxqnYlBBMkzEUoID9TXf
         cAGvXPjdvAnQAX4J7LBGCowzdp7x8Lr7DhEb4K1zhVqTj+/ds0HH01T8umiycoUEqxq7
         qIv0Wf3rQdlXVXwmOzgWyw/y5JwshZUbv9LnsJZ/vR+mpmk3KxSLU+dcxgOtBHfpTOg5
         MM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4tPPUXih/pm+lxWXMYDPFWVkKXwt+N5E9r7VhxS1Og=;
        b=L/fdjGpqHR7wJhRL6G8aQh+47VoaU7az+4ejXRq16Ef9aVtpf0baptaPRB5YaU8znc
         IZKCpX5mqfjY4trLgr7EL8F6YvJHJ6g0tkMeU9LDDN62As3G4L3QE2Oh81N9GWSbFb3f
         wTsMIPW1KW69BgB0oNCjC4RgHwQBzodtmGdeFoZh+zWF1rTD3NaCGttmlVQDC0n7wvhY
         cIjO3fWv/3VJarPGrrcbi9k3oDid1Tt/o4u9IZkAYWASf88ked/rYiKckTbyhEJFm3y3
         9IUmgkeB3SdS1BRNHfngESMhNWbw5CPtMiwLOJSRp5rHWG+6kzaju2B8xzv7juXb1KFs
         h76Q==
X-Gm-Message-State: AOAM533YvrmdCmbKZn48whINp5qi1Zk9ZuvC1LGLoufbBwCa66pos1i+
	0nd2Ipq87C+1PiFEbMFnIPGwTmgfZWj9atU9GAjdqo2fSdemYv9icUu/7DmO24jFl8hxmTn7lU5
	KL8K/edU7j5U3BQnIm9X5Owdxh7jdCx1tBzRk/LRR4UjQtgoZtPTxMYaE7RUgWLO7WLfBg9sQUs
	cBsw8k5Gfc6WB2
X-Google-Smtp-Source: ABdhPJzzzb3FAuxTL6Y3JGfR5auxoR+UYi01xyMC2uMeO/vnzfftcIciJ0YYtNd8a9bx0zEFTFY27A==
X-Received: by 2002:a05:6512:904:: with SMTP id e4mr3546843lft.170.1629231111495;
        Tue, 17 Aug 2021 13:11:51 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id t142sm278013lff.269.2021.08.17.13.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 13:11:51 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH v3 1/2] wic: Add --no-fstab-update part option
Date: Tue, 17 Aug 2021 22:11:14 +0200
Message-Id: <20210817201115.89609-1-daniel@qtec.com>
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
index 41451d1cb0..991907d3f5 100644
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

