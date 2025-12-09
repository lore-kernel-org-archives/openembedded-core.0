Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F824D3B7ED
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:48:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10833.1765295311376673162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TfoJpEzN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E516B1A2069
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Dec 2025 15:48:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7158606E2
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Dec 2025 15:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61E4711930642;
	Tue,  9 Dec 2025 16:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765295308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=53fzm6xrjOlJyFlTpHOmfebBzvgU7HvzwqGvfIVvBw8=;
	b=TfoJpEzNdcuBLULf5GfxiSz96V8k/2ohYB8Ghh1NssQoc3Z7M2NZ1ahDg0PIA3tk2wBEbC
	X5giO0HqXrbab1EHB7AsgYAbqgOJD080zc1GEWwIbtS3HTEB3ToHkEaVhJYFlRmKYLJSJD
	zbUOC4h3j7GRKsPYWSelDdwNsXlCtPZsbRTnoIsKVn4yDon0KSsjfKa4Hg9pbGCPwMdJjB
	MiZbojn1CLgMiTkKK8EMDQ9VmR3uec6L3nf7J6QeWVvlnyY7EHEb3zknQO+QCIDpl0N+EF
	K8rHZqtsKf37ctGbN3NDUmXUI1XJh3HNuOHK4TQ67tw5lZ6Yzk7rzzNOe9hEtA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 09 Dec 2025 16:48:02 +0100
Subject: [PATCH] wic: Remove more conflicting du parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mathieu-more-du-params-v1-1-ec76bd1345be@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALFEOGkC/x3MQQ5AQAxA0atI15qYYjGuIhZF0cUgHUQi7m5i+
 Rb/PxDFVCI02QMml0bd1gSXZzAsvM6COiYDFVQ7KjwGPhaVE8NmguOJOxuHiJ6kJx5Kx5WHFO8
 mk97/uO3e9wMbU5+CaAAAAA==
X-Change-ID: 20251209-mathieu-more-du-params-92eb2ac31a49
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765295307; l=3201;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=YTXiC5qSilV3WJioqzfwPeVVD2GDklt4ethn0y6FaoE=;
 b=1WLVsGhus3Pe96TGgAOuHsURAaX0c/QrEpISUfAvFmeBfLLaxGybkZSAHMgKvfcN42eASry/j
 D/BA53xcnamBeAPFebs8HKiZqS7EYeVaWDAfGNZR9oNPHJ+OwG1OZ23
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 15:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227443

Fix builds on Ubuntu 25.10 by making sure to use parameters that are
correctly understood by core-utils and uutils. Most of these were
already removed by a previous commit, but some occurrences were missed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/wic/partition.py                         | 2 +-
 scripts/lib/wic/plugins/source/bootimg_efi.py        | 2 +-
 scripts/lib/wic/plugins/source/bootimg_pcbios.py     | 2 +-
 scripts/lib/wic/plugins/source/isoimage_isohybrid.py | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 9c09816e5d35..8fed686e903e 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -389,7 +389,7 @@ class Partition():
         """
         Prepare content for a msdos/vfat rootfs partition.
         """
-        du_cmd = "du -bks %s" % rootfs_dir
+        du_cmd = "du --apparent-size -ks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index 99cc34454cad..430b0a4b023a 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -389,7 +389,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 out = exec_cmd(cp_cmd, True)
                 logger.debug("include_path files:\n%s" % out)
 
-        du_cmd = "du -bks %s" % hdddir
+        du_cmd = "du --apparent-size -ks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 8f34c926ebbb..a7cc5d12c620 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -273,7 +273,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         for install_cmd in cmds:
             exec_cmd(install_cmd)
 
-        du_cmd = "du -bks %s" % hdddir
+        du_cmd = "du --apparent-size -ks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
index 40018dc7eacf..fdab188db1f8 100644
--- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
@@ -355,7 +355,7 @@ class IsoImagePlugin(SourcePlugin):
             # Default to 100 blocks of extra space for file system overhead
             esp_extra_blocks = int(source_params.get('esp_extra_blocks', '100'))
 
-            du_cmd = "du -bks %s/EFI" % isodir
+            du_cmd = "du --apparent-size -ks %s/EFI" % isodir
             out = exec_cmd(du_cmd)
             blocks = int(out.split()[0])
             blocks += esp_extra_blocks

---
base-commit: 6145837147dc2a6d54a221f9cd7fe90d6895ff90
change-id: 20251209-mathieu-more-du-params-92eb2ac31a49

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


