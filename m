Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id F31256022F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:56:24 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b14so142753350lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=onxC7kPkkfghB5a4DMxWD46Is6Gy/18E8DapyOuAkCc=;
	b=p1uhXjViIFFnFNZV63r5GJ8ivm851cZtv7VzuUJN6z3RxZmmcbJ1JKzNl9zZDmZ59A
	PuMwGXOjigMXNytjTOYsWsSzmylvvULpNMp4SNZv9PyMzYAzBgNOQIf+U5vcdh/tI64R
	o2b5DNH+5Ha5XzbtxvyDYJeoGEkeVWRrp8Qxw7dVK/GPyUOz6uASMsBlGILZHxeRW3ox
	asN/d3aw8eyQ7Kvv+bb6o9ZUD2WZTKVirvfViqBXZ5vOwzhMzd03d5Ht2e333JYSdYPu
	+K92SSYeA7iPhvWwITSUvJJNQx9VAm1DwAvciHnHapW2vOyrFZi+GjATZddCszHTke95
	Wfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=onxC7kPkkfghB5a4DMxWD46Is6Gy/18E8DapyOuAkCc=;
	b=VFikfXRK1kmR8K+pKNN8ddD/wNPQS3EeuWEsnyhy/RgaHl5/B2uCs4XtU1gb8uIYka
	GB6nZFDvVT8Q+Ijv3Hx/UVkLrvCF1RLhrsCQzJeJT1JwbzggMeHBbkelTueuryvC5hbn
	6INDcBLEc7GiofXjKf6ThG8kt0C1mFEbsXHs4Fum8Au47dJdbDupZyqNxMVSaLmwWj8q
	kfdK7rnemPZFeCkpwodxC/g01proWd98kfmlSRHkP0JdRtLZVb+JSeCMSleA2v9L9dhO
	ZstrG8azU9LKrc+/ZLtfynNE/kcGToGODcGk+W1w2JKnykxGSO0j2vHd1lwIiACPkE/H
	gBKQ==
X-Gm-Message-State: ABUngvdnaOSyymZON6akpX3je/InQ7nxz23jKBjWiC2CK0ACQzGcJRujVpWAFgzoROyRRg==
X-Received: by 10.25.130.149 with SMTP id e143mr7402594lfd.87.1478620585767;
	Tue, 08 Nov 2016 07:56:25 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h95sm2976939ljh.13.2016.11.08.07.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:56:25 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:56:07 +0100
Message-Id: <1fc1bb97bb79facb8b22a7da4ed7b5c752ea5e14.1478619682.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/5] wic: make sure that partition size is always an integer in internal processing
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
X-List-Received-Date: Tue, 08 Nov 2016 15:56:26 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 89c33ab8b7d54bb14678b2e07e706e3feb6ae57a..4b8d769437120adadb5dba2f3919d4eb96141292 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -157,7 +157,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
-        self.size = rootfs_size
+        self.size = int(rootfs_size)
         self.source_file = rootfs
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
@@ -194,7 +194,7 @@ class Partition():
                 # get the rootfs size in the right units for kickstart (kB)
                 du_cmd = "du -Lbks %s" % rootfs
                 out = exec_cmd(du_cmd)
-                self.size = out.split()[0]
+                self.size = int(out.split()[0])
 
                 break
 
@@ -379,7 +379,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         fs_size = out.split()[0]
 
-        self.size = fs_size
+        self.size = int(fs_size)
 
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
-- 
2.5.0


