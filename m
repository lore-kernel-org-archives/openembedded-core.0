Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84C94719A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:33 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id q130so128845819qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I9khZ+1cOrJJ21R3M9tbk/g4SAb0OsP9HBdU48sCSDc=;
	b=b+PMOTJF4Xwm/ljm3Vj8Letnu1XO+V6pUAe/EEKv8fGbBJ5vRlOTCfiIQqwhYsyKQD
	GTay80EHQ5vDMOaOi9KG3SseYxmGydjPKjQD3sZQRl3mvXHf74VnsgAZvyoK8IFakV2K
	d7lrLyi4d6vruUaGY4Mka2ErT+bxEuUFGNdKEnBl4aqKWGK3BS3MkzoucM8dwME6hVmI
	GHUawjpp82JpHhHgbmw3VClbs20uk6xkcZdH8PRJtW9HRn/0M5P8cC4kRFBkElwi7eKq
	1ZTmZhB0WBRtY/otK/908dVgfmtUKf0D8kA/8UCRcXmRJ3aUuq9kRjzhj91aO8apfXnC
	X0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=I9khZ+1cOrJJ21R3M9tbk/g4SAb0OsP9HBdU48sCSDc=;
	b=m9I9OruRLqNCzFNC5OfyhcVptygGFquORhdyVH3+BwBTOOOKW9nzyj31Qbaf+p5Zu8
	yWBB9FmvghanOIfeJiAQu3nf3NGdVCqv8nZG1woKRdNjD4Kv+m0CQXxRZxhXwmApScM7
	CknHA+Obpx1hv+yCmr+BYy1PeZNH/0d3SYg62dsT6qi7DgJ6JgRBRHnXay/7WHLkuLLv
	5xU0u/qZ4QH5lq83XHPW5kKAM3UXdhNzWyFJTyQjqZnQ0EJ81y30zcgkT0BD09S3Nd6v
	eJUs+FVeAK9yxzxoegh6S6To7tSw6S1FNgncOQKwW1Z0U7jvbd9bQANe6n0rjMle8yik
	ZM2Q==
X-Gm-Message-State: ABUngvc3uz50rF1vemjp5sTXQFgw68HxQ3Urmzj0T5WQTeT5kqKBcmZwzVVqNmDlFiHebw==
X-Received: by 10.25.208.203 with SMTP id h194mr8593196lfg.26.1479203554579;
	Tue, 15 Nov 2016 01:52:34 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:33 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:02 +0100
Message-Id: <a616f7b0489ef3a9389e79fb8af60a8a02cc1db2.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 02/11] wic: use partition size when creating empty partition files
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:33 -0000

It seems that prepare_empty_partition_ext() and
prepare_empty_partition_btrfs() got broken in commit
c8669749e37fe865c197c98d5671d9de176ff4dd, thus one could observe the
following backtrace:

Backtrace:
  File "<snip>/poky/scripts/lib/wic/plugins/imager/direct_plugin.py", line 93, in do_create
    creator.create()
  File "<snip>/poky/scripts/lib/wic/imager/baseimager.py", line 159, in create
    self._create()
  File "<snip>/poky/scripts/lib/wic/imager/direct.py", line 290, in _create
    self.bootimg_dir, self.kernel_dir, self.native_sysroot)
  File "<snip>/poky/scripts/lib/wic/partition.py", line 146, in prepare
    method(rootfs, oe_builddir, native_sysroot)
  File "<snip>/poky/scripts/lib/wic/partition.py", line 325, in prepare_empty_partition_ext
    os.ftruncate(sparse.fileno(), rootfs_size * 1024)
NameError: name 'rootfs_size' is not defined

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 959035a97110244ffe56e95a886e122c400d4779..f3835339afc5091604ffd7f0d0acf1d1ad4351cc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -314,7 +314,7 @@ class Partition():
         Prepare an empty ext2/3/4 partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -332,7 +332,7 @@ class Partition():
         Prepare an empty btrfs partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         label_str = ""
         if self.label:
-- 
2.5.0


