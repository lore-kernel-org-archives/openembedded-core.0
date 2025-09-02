Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D975CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 11:38:02 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.86151.1756840434936739164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 12:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wh5GyTIA;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: dani.barra25@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f6abcd26bso258674e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756840432; x=1757445232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L72C59+cnnkis9AfDWyAsp1u/toGn7s0hOgULRYSDw=;
        b=Wh5GyTIAVYPkCvbkg3Q8LjHrYg3a4snXJ3dyLgE+ngfCCgWimpP1FbdB5Ez5HCbqbo
         bwSwvDyx3vM/VcOzpipqE9bw13bXWVebY9yawZK/D/ls+7oHwy2dlGwhkx7iTYALmc5x
         2NNWoaE5Pd87hhyVvHB3LoRrnIQkSPNpRSifvcdp51+47Vboi8wkMWcimTXJr8S828uD
         an77VaqaPsAmXLsWkNlv2yPmGbAWY1x/G4CHDFpMPFz8+CDHnzTg0vXNmZynqvzsiFX4
         EerFqqvtpTMsKmMwt7yEYNQgFMBF1pw9GltE13ZRbeRN8C67K1uliZ+o0HRlBX+QavnI
         xJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756840432; x=1757445232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L72C59+cnnkis9AfDWyAsp1u/toGn7s0hOgULRYSDw=;
        b=YouIvBJc5l8rGeQG0vzn4pUJOqyZHv7GNzz2Z2jULAo3cWsj45SMhydisTHxKQM61X
         HPF3FSWsLSAmRu8tCPB6aJcRXNzybdt2Xav8TCMtSAP+wMdWOqoMiz5HNC0sq3psezGT
         kMPDVSsKJFCDevWnCw5a70tsYDOjKz1UOHd8fGJbRU1cYM6E7Prco1+614EgED+VYJms
         bMcr/gABb9WJv6G/nXIaLhskpCmi/aO5RTjH41U1h70KteSRF4yZ8yb8ZFTWe+2e2iDD
         gjbrcD1nSvu8EeKqCzyxOsH4oANWWDLyMcv9yw4UK15wVHOUahJO59I4ctXgn80r30cS
         qPbw==
X-Gm-Message-State: AOJu0Yzrp0d87VQSYqT2ezCJxEoUUpLQjOdCWxO45l1aZHDk1C5p7Vt8
	3UsAr9r+xpoH2XrdUX5y6D35R5rjGntnwd70zrcTIEvFmd5Op+CAbR+J6oi9tnBCaT4=
X-Gm-Gg: ASbGnctoPCDSa7Nb2wAf/z+scddDn3QF7lOnDvMp8R+c0+HO054GvdwOJoReTnBSjiY
	Yj4IiaEbjzUVojCILEN9Ki/7/9rtYzuePEi/zxZ7hFEhjFOrmSGbPE6RG/3nD5b3sQQYuOqGJGF
	/XXsGPNauP8ImKPeZhR/PmT0w08NUiyCakd7hJJiNABjkl4E7QAivZq1j4qezwWMmqqIur1Jspg
	DCd4dkhjDoA1VNDE+5tzBX4lZQz2uXuRydtkU8N9Ev8+5+Eh9qntXLThglRqhjICqSZ97Gn7Yg0
	klCvOCHnj9w6rOjt981lqqz9RAGV7BNtPvVKfqGcfpMiP9PmrsV2PeqVTfhtt3sKvYsZ3XmgTad
	PCBEUrg+sm//qxr25bZBs5V3OLcDncUZm/yojkRDzdxNy8bW1ue1APSWKvNX7RfBKXTLXPm44
X-Google-Smtp-Source: AGHT+IGij7WTgiEZ6+0ZD8U2xJNLND/Ph4OVkcvmzfaryWP5C3LDinycIVgZvS7ZXbTXH6Hhr6EZzg==
X-Received: by 2002:a05:600c:6210:b0:45b:8d2a:cd07 with SMTP id 5b1f17b1804b1-45b8d2acf12mr59982955e9.5.1756839961689;
        Tue, 02 Sep 2025 12:06:01 -0700 (PDT)
Received: from dani.lan (a109-51-235-13.cpe.netcabo.pt. [109.51.235.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm7371741f8f.54.2025.09.02.12.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:00 -0700 (PDT)
From: dani.barra25@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: hongxu.jia@windriver.com,
	trevor.woerner@linaro.org,
	Daniel Andrade <dani.barra25@gmail.com>
Subject: [PATCH 1/1] wic: Content of the temporary updated fstab should be copied into the original not replacing it entirely.
Date: Tue,  2 Sep 2025 20:05:55 +0100
Message-ID: <20250902190555.7929-2-dani.barra25@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250902190555.7929-1-dani.barra25@gmail.com>
References: <20250902190555.7929-1-dani.barra25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 11:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222855

From: Daniel Andrade <dani.barra25@gmail.com>

Fixes [15947]
The current functionality to update fstab generates a new temporary fstab with the new partition configuration.
However, this file does not retain any metadata being it a completely new file.
Because of this, when the rootfs plugin under `poky/scripts/lib/wic/plugins/source/rootfs.py` copies the file, it overrides the original fstab metadata.
The patch removes implementation of msdos/ext code for fstab since it is not possible to append content without rewriting the file to preserve metadata.

The timestamp applied to fstab is not the same as every other file.
It seems like the `SOURCE_DATE_EPOCH` variable goes to the fallback timestamp SOURCE_DATE_EPOCH_FALLBACK.
Since that variable is used everywhere, it is not the same value as REPRODUCIBLE_TIMESTAMP_ROOTFS under poky/meta/conf/bitbake.conf that is applied in every other file.

Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
---
 meta/conf/bitbake.conf                   |  4 +++-
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acf4e2d153..0581fc3564 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -684,8 +684,10 @@ export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
+# If these 2 are misaligned, when generating fstab later on wic, the timestamps will never match because
+# The repeatibility uses the REPRODUCIBLE_TIMESTAMP_ROOTFS while wic uses SOURCE_DATE_EPOCH (therefore its fallback)
 SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
-REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1302044400"
 
 ##################################################################
 # Settings used by bitbake-layers.
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index bf2c34d594..82d754835c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -131,7 +131,7 @@ class Partition():
         partition command parameters.
         """
         self.updated_fstab_path = updated_fstab_path
-        if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
+        if self.updated_fstab_path:
             self.update_fstab_in_rootfs = True
 
         if not self.source:
@@ -295,15 +295,6 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
-            with open(debugfs_script_path, "w") as f:
-                f.write("cd etc\n")
-                f.write("rm fstab\n")
-                f.write("write %s fstab\n" % (self.updated_fstab_path))
-            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
-            exec_native_cmd(debugfs_cmd, native_sysroot)
-
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
@@ -400,10 +391,6 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
-        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            mcopy_cmd = "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
-            exec_native_cmd(mcopy_cmd, native_sysroot)
-
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index e29f3a4c2f..3848af2a91 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -223,8 +223,8 @@ class RootfsPlugin(SourcePlugin):
             part.has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
             if part.update_fstab_in_rootfs and part.has_fstab and not part.no_fstab_update:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
-                # Assume that fstab should always be owned by root with fixed permissions
-                install_cmd = "install -m 0644 -p %s %s" % (part.updated_fstab_path, fstab_path)
+                # We dont want any metadata of the updated fstab, just the one that already existed
+                install_cmd = "cp --no-preserve=all %s %s" % (part.updated_fstab_path, fstab_path)
                 if new_pseudo:
                     pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
                 else:

