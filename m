Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5666022F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:56:26 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id c13so142837640lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Y1K+blAXP5kAwGOjagjZCGMWzsEeTQGq9KxRnTGtr+w=;
	b=VSiasE+J3A0SF0Gh8dqPhnVsCC4qj0e8JDTbmhAqyB1hr1LpzEqmmKafZlB8jR8Lq6
	PJd68LkUQUGD390EibE4oqFRUkgdS0uME6QQSYF6c32Fc6nciFBCqjLGdT5/AvzAbcoZ
	Gd/NU/ls6YS0CAECD5xvRT8q9Cxy2cdb6B2Dhd3aQuZh6MhVDK91kCgqDPd5wc3SMTWL
	QA1ctPJ4KrV1kk4uo4VFlCxdINUEoN2bTmiURTFxqY5mK7h5croWCO0H8l5KguMpwkVD
	SYb8O3zft87v/5Hkjiln/ci8IvzzxFsbBbdMNcsjVTJVj2tc2j7jQljg2vREfYzQ/g0N
	G3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Y1K+blAXP5kAwGOjagjZCGMWzsEeTQGq9KxRnTGtr+w=;
	b=XpNEdIXf2B4bDKGUhJPHq4e1GEKQyOH4DcQ33nh0lRzqxoSraUAZ2OY95llaYp0+N0
	DH/otYBtRSJjWtwt5U6ptM0tv0QfFG5AQ1TISfOHnp9OfxuiPSPAZOHdxAbMntHhFfzp
	Ald4Oj0k4+eHnDGSHfc6I4WkyCA97n2CWKnjZVlNe4dL/yr2ZTDbne+yH6mn/NTz/bMk
	xkGNVEf/dFC0PzbY5Xm+vCfie4dtLPkQpf41j7XEunR9cDiIZOjrAStZ6sQLlu6DIP6h
	N7YBVazjZGsZeTcNvAO2HiFkYCYQcV+kTswAZ5f7QVNKPC3ni/YMzxrQJu3hepYHwJ7f
	MZ9g==
X-Gm-Message-State: ABUngvcx7EK8qo/XsFuf+AcR99kTfJv6xkpMI5dvDxMzF9fVHd2PgimqzWKx44ZvaD0ZIA==
X-Received: by 10.25.203.139 with SMTP id b133mr7247091lfg.169.1478620586858; 
	Tue, 08 Nov 2016 07:56:26 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h95sm2976939ljh.13.2016.11.08.07.56.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:56:26 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:56:08 +0100
Message-Id: <927e5e94d6d20caf9b59e8e57895742f9ebebff8.1478619682.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/5] wic: use partition size when creating empty partition files
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
X-List-Received-Date: Tue, 08 Nov 2016 15:56:28 -0000

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
index 4b8d769437120adadb5dba2f3919d4eb96141292..8adc698240c8e3bd9f4118663a5d7a167e0bb4a4 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -308,7 +308,7 @@ class Partition():
         Prepare an empty ext2/3/4 partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -326,7 +326,7 @@ class Partition():
         Prepare an empty btrfs partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         label_str = ""
         if self.label:
-- 
2.5.0


