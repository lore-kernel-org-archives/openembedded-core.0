Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E334377F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 11:04:31 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r196so9903289wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 03:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M+a+ZvfJvLJ75IaFykr4kn5YHooRLNqrLO0SBxpgKkg=;
	b=i5i8k7ebvMB36u/w1LOMmvMWIvfLYn5TJ3H8KMYxWxwnb0Rss0zFpkPi3dmVAxI0C1
	BQufCo66KxBkzJbRpui+ONqcU6Ga3aJLyFwWjDNhtJ10veIzQym1geKsWb6wiug9w/Is
	8dur7ZTrazdHb7HU5NCc5JllKzRfxOVCBVpvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M+a+ZvfJvLJ75IaFykr4kn5YHooRLNqrLO0SBxpgKkg=;
	b=ST854fhvpy80vVMoEgeoPzC2pvu6jnEgorKZutIlM6wTeoNPin/Uoe9xAJO+Ymg7IU
	rW0d5PDO7vzwAJyJOAGw22KT518BqgKGDYnsU1kE9uxY6zVcK7YworxcBrTwtflza23w
	tQsJnSnQw6aGNanP7h49lfpklvEAS0BDPBRiPmHBBYSF11En0MRHjRlOAZaLdXFJy5DV
	/GN/U6V8piX6sFEaw1efAb/oSkLReg5AfC3IfNmLn8FPwgZBfpnWaRFc+/spVJuO3C/w
	iXqAsym3UGkMW1zN6oZMRgzO66ZSx7Ty6SnyYUMurRy8sKo7BygQ/fQztorXMjpVWS4Q
	yoJg==
X-Gm-Message-State: AJaThX7V21aID8ex2PBw5tX61YoTMOw2Y69d0FNYuehXTeRe2DT+kUU9
	bwtfrGpQojpNhj2rP/WEka99Mubrl/k=
X-Google-Smtp-Source: ABhQp+TWY+YM4nt39C5ePNlCLy28mKzFE5E7svTf6B8AP7bl2PjWtrTOY2hUg7eosmzpbmTLFM5mBA==
X-Received: by 10.28.181.2 with SMTP id e2mr77226wmf.81.1510139072491;
	Wed, 08 Nov 2017 03:04:32 -0800 (PST)
Received: from localhost.localdomain
	(LStLambert-656-1-43-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	t43sm2271421wrc.74.2017.11.08.03.04.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 03:04:31 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed,  8 Nov 2017 12:04:09 +0100
Message-Id: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [rocko][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Wed, 08 Nov 2017 11:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artur Mądrzak <artur@madrzak.eu>

The WIC's 'part' can now give a name for GPT partition in WKS file.
It's similar to '--label', but is naming partintions instead file systems.
It's required by some bootloaders to partitions have specified names.

Backport from master, without it WIC cannot be used on Qualcomm based machines.

Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b60e3466ed7cff0cea10815851eb1304002eb52)
---
 scripts/lib/wic/help.py                  |  2 ++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
 4 files changed, 15 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bd9c62e2e8..2ac45e052e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -970,6 +970,8 @@ DESCRIPTION
                             This option cannot be used with --fixed-size
                             option.
 
+         --part-name: This option is specific to wic. It specifies name for GPT partitions.
+
          --part-type: This option is specific to wic. It specifies partition
                       type GUID for GPT partitions.
                       List of partition type GUIDS can be found here:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 99b66eebc5..7850e81d2f 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -144,6 +144,7 @@ class KickStart():
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
         part.add_argument("--overhead-factor", type=overheadtype)
+        part.add_argument('--part-name')
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..66e61ba70c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -51,6 +51,7 @@ class Partition():
         self.no_table = args.no_table
         self.num = None
         self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 60317eed22..bdb8385620 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -366,6 +366,10 @@ class PartitionedImage():
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
+            if self.ptable_format == 'msdos' and part.part_name:
+                raise WicError("setting custom partition name is not " \
+                               "implemented for msdos partitions")
+
             if self.ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
@@ -519,6 +523,13 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
+            if part.part_name:
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.part_name)
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part.num, part.part_name,
+                                          self.path), self.native_sysroot)
+
             if part.part_type:
                 logger.debug("partition %d: set type UID to %s",
                              part.num, part.part_type)
-- 
2.15.0


