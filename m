Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2A0CFC26D
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 07:25:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8791.1763882710322675581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 23:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WZ0r/Zvm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 094F61A1CD0
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 07:25:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEB6F606FC
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 07:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19DF110371C52;
	Sun, 23 Nov 2025 08:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763882707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bMup/SsQFDqZofdlFyDk709aWFa4Fb2fjI198aMvIjY=;
	b=WZ0r/ZvmObUEXHeSXuuBpsDwhXosFzv+be356QrBGEzg7dty+EksUV+e3ulCDFvLKkoYMa
	ng9aD6a29vG1II/WDZdXbiXz/b3JhmpxwqUBw/g/JBbmE5D+aA3kDLvkVNYsWrqM0+l2Dc
	7ovblhSORimZYT+dRLFi/oOuoaHEbqU7iGzQ/N3XY2qkMgrn9NSMm3HJOI1xlpr50UyGdj
	Cd3gPkpjsQIujt7v5vftDRLgvJnCL7Xht9U4MUQmz5e7pqckWc5FT6j1XpaeXq6TI/QftB
	wblafJ89M0lEzcmHf2KxT2gONtXHZleWoDgdeTLq5sqQGVxMyvCIE/lU6ILrnQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 23 Nov 2025 08:24:47 +0100
Subject: [PATCH] wic: Remove conflicting du parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-mathieu-master-next-whinlatter-success-v1-1-150572b798b3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL62ImkC/x3NywqDMBCF4VeRWXfABLS2r1K6iOnRDNi0ZOIFx
 Hc37erwbc6/kyIJlO7VTgmLqHxigblU5IOLI1hexWRr2xhjLb9dDoK5rGYkjtgyr0Hi5PLPOns
 PVb7e+rarm64dekfl7JswyPYPPZ7HcQKrayt4eAAAAA==
X-Change-ID: 20251122-mathieu-master-next-whinlatter-success-79b680586fba
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763882706; l=3837;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=gwk4ow/71gwLy71+IAVzdRlmtW3nxUV9/9EklssVXjY=;
 b=PWSK7NrVs+fBeSpled4A/1rFMPbNeYbToWE3ygft80tuxLxvO6Lqx+8qH5ZHrMpDM/nZl/LG3
 zzBWP0D4S8SAU/GVhInoYreRZxSZBFo9n/JVGWV/cc36hVxtDxErXoT
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 07:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226723

Current du parameters used in wic scripts are conflicting: -b implies
--block-size=1 while -k implies --block-size=1K. When both parameters
are used, coreutils du and uutils du do not react similarly, leading to
failures on Ubuntu 25.10.

As we do want to use the 1K block size, remove -b and add
--apparent-size that was implied by it, so we have a predictable
behaviour.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/wic/partition.py                         | 2 +-
 scripts/lib/wic/plugins/source/bootimg_efi.py        | 2 +-
 scripts/lib/wic/plugins/source/bootimg_pcbios.py     | 2 +-
 scripts/lib/wic/plugins/source/isoimage_isohybrid.py | 2 +-
 scripts/lib/wic/plugins/source/rawcopy.py            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 531ac6eb3d4a..9c09816e5d35 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -275,7 +275,7 @@ class Partition():
         self.source_file = rootfs
 
         # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
+        du_cmd = "du --apparent-size -Lks %s" % rootfs
         out = exec_cmd(du_cmd)
         self.size = int(out.split()[0])
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index ba520cd78b06..99cc34454cad 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -427,7 +427,7 @@ class BootimgEFIPlugin(SourcePlugin):
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
 
-        du_cmd = "du -Lbks %s" % bootimg
+        du_cmd = "du --apparent-size -Lks %s" % bootimg
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index caabda6318d0..8f34c926ebbb 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -305,7 +305,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
 
-        du_cmd = "du -Lbks %s" % bootimg
+        du_cmd = "du --apparent-size -Lks %s" % bootimg
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
index 5d42eb5d3e86..40018dc7eacf 100644
--- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
@@ -429,7 +429,7 @@ class IsoImagePlugin(SourcePlugin):
 
         shutil.rmtree(isodir)
 
-        du_cmd = "du -Lbks %s" % iso_img
+        du_cmd = "du --apparent-size -Lks %s" % iso_img
         out = exec_cmd(du_cmd)
         isoimg_size = int(out.split()[0])
 
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 21903c2f23df..698413b2215a 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -102,7 +102,7 @@ class RawCopyPlugin(SourcePlugin):
             sparse_copy(src, dst)
 
         # get the size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % dst
+        du_cmd = "du --apparent-size -Lks %s" % dst
         out = exec_cmd(du_cmd)
         filesize = int(out.split()[0])
 

---
base-commit: 94d95bea4edec883f3ae2fd89c32b4438ebf015a
change-id: 20251122-mathieu-master-next-whinlatter-success-79b680586fba

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


