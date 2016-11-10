Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id CC3B671A67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:48 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b14so187823514lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zU8muSdpbaKUSThqRVQzh2i1a5/6B1BRVfW8fdXmj4g=;
	b=ZSJWrlNke7IK3YGVllj0sKVBK0ZPeVkJv6NtEH0Tw1fWUssBUPJQiZ600+Y2h4K5Qv
	Om9/Kchdj6r+7q4YN0dejX8Sem3Vru6uyK1c1IrjTWIK+YcYVlGvRNsQ0CjqsMiDTclV
	LwwIABa7yFgsu8TwYgyXegXDIIKYClSQraYJMCkPLSIdQlifFWB1O/VgFjOeP9lAhBh2
	b1nc8kIygoZCaRatA2q0WhLrQD7XZRk5gWySh91J9Hz66AmPFDSYM6echjcHhfH+WZQt
	t5ygYm7FEaZiKi/1gfvs/zdtdwCwldB2gZ1T7txM30OSCh1/4gTlRGSsc4vp9aZEFusw
	N1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zU8muSdpbaKUSThqRVQzh2i1a5/6B1BRVfW8fdXmj4g=;
	b=iqd8YtnuyuDUK9xxs9PyZtbiZxgLYABx0m5OwR1NjXCdGAuAOCAwsqBsX7CgfWGqG6
	NnfWD3XMDLL21sffNvzPsTANUneL5aHv9nytAZH0BBIDTFz7lDgb8sbzJ1SlXfwbMw0n
	zEPONBgDidrjNAI9pKifWMvbRIhA4VvxugRYVqZW7DlTij0xDBzYCwWUeNvIaQxA5CM0
	YOV7T2ddIp6lPv9zevg4AMy1zECHwdI2Xn/PuXGwZ/0wOB5LOM/MK4Uz4nrrJIzE2MNm
	htGnmARp96gN2J2S6PftomYbCUn+41OKFRKJVep/oKZmqowfBF7cY11gHaaQGJp7KPWW
	usBQ==
X-Gm-Message-State: ABUngvcksFamtOAdYq41SA/QD+Q4WRaFVUDizobufc1GVjGbE33kZ1B9sD5UOMiHKIG8ww==
X-Received: by 10.25.212.77 with SMTP id l74mr2579563lfg.103.1478780329368;
	Thu, 10 Nov 2016 04:18:49 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:48 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:32 +0100
Message-Id: <dcceca643ce61b670b0b33663d0145c714c30fa5.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 01/10] wic: make sure that partition size is always an integer in internal processing
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:49 -0000

The size field of Partition class is expected to be an integer and ought
to be set inside prepare_*() method. Make sure that this is always the
case.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py                  | 12 +++++++++---
 scripts/lib/wic/plugins/source/bootimg-efi.py |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py     |  4 ++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 89c33ab8b7d54bb14678b2e07e706e3feb6ae57a..959035a97110244ffe56e95a886e122c400d4779 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -146,6 +146,12 @@ class Partition():
                                                      oe_builddir,
                                                      bootimg_dir, kernel_dir, rootfs_dir,
                                                      native_sysroot)
+        # further processing required Partition.size to be an integer, make
+        # sure that it is one
+        if type(self.size) is not int:
+            msger.error("Partition %s internal size is not an integer. " \
+                          "This a bug in source plugin %s and needs to be fixed." \
+                          % (self.mountpoint, self.source))
 
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
@@ -157,7 +163,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
-        self.size = rootfs_size
+        self.size = int(rootfs_size)
         self.source_file = rootfs
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
@@ -194,7 +200,7 @@ class Partition():
                 # get the rootfs size in the right units for kickstart (kB)
                 du_cmd = "du -Lbks %s" % rootfs
                 out = exec_cmd(du_cmd)
-                self.size = out.split()[0]
+                self.size = int(out.split()[0])
 
                 break
 
@@ -379,7 +385,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         fs_size = out.split()[0]
 
-        self.size = fs_size
+        self.size = int(fs_size)
 
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 8bc362254d8c06511aa2cf0d5e1bf6f5aa93804b..4adb80becc11a6d30ffeae64ff87ebeb959dde86 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -234,5 +234,5 @@ class BootimgEFIPlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.size = bootimg_size
+        part.size = int(bootimg_size)
         part.source_file = bootimg
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index e0b11f95adb5a2c55fdc3b5e3ff1f4b463e2be9d..5bd22fdeb55bc2f0b38ffcc2a46cf18ade5425ef 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -78,9 +78,9 @@ class RawCopyPlugin(SourcePlugin):
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
         out = exec_cmd(du_cmd)
-        filesize = out.split()[0]
+        filesize = int(out.split()[0])
 
-        if int(filesize) > int(part.size):
+        if filesize > part.size:
             part.size = filesize
 
         part.source_file = dst
-- 
2.5.0


